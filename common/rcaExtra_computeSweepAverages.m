function out = rcaExtra_computeSweepAverages(rcaResult)
% function will compute supplemental mean and error values used for plotting and stats
% Alexandra Yakovleva, Stanford University 2020
% LLV temporary high-level averaging function for sweeps data, treated in
% frequency domain for now. Will allow to average sweep data both in time-
% and frequency-domain in the future

    % copy structure
    out = rcaResult;
    
    switch(rcaResult.rcaSettings.domain)
        
%         case 'time'
%             % average each subject's response
%             subjMean_cell = cellfun(@(x) nanmean(x, 3), rcaResult.projectedData', 'uni', false)';
%             nCnd = size(subjMean_cell, 2);
%             subjMean_bycnd = cell(1, nCnd);
%             for nc = 1:nCnd
%                 cndData = cat(3, subjMean_cell{:, nc});
%                 % baseline
%                 subjMean_bycnd{nc} = cndData - repmat(cndData(1, :, :), [size(cndData, 1) 1 1]);
%             end
%             
%             % for joint projection, compute mean/std
%             subjMean = squeeze(cat(3, subjMean_bycnd{:}));
%             out.mu = nanmean(subjMean, 3);
%             out.s = nanstd(subjMean, [], 3)/(sqrt(size(subjMean, 3)));
%             
%             % for each condition, compute individual mean/std
%             mu_cnd = cellfun(@(x) nanmean(x, 3), subjMean_bycnd, 'uni', false);
%             s_cnd = cellfun(@(x) nanstd(x, [], 3)/(sqrt(size(x, 3))), subjMean_bycnd, 'uni', false);
%             out.mu_cnd = cat(3, mu_cnd{:});
%             out.s_cnd = cat(3, s_cnd{:}); 
        case 'sweep'
            % compute average data
            [projAvg, subjAvg, subjProjected] = averageSweepData(rcaResult.projectedData, ...
                numel(rcaResult.rcaSettings.useBins), numel(rcaResult.rcaSettings.useFrequencies));
            out.projAvg = projAvg;
            out.subjAvg = subjAvg;
            out.subjProj = subjProjected;

            % add noise averaging, old structures might not have the field
            if (isfield(rcaResult, 'noiseData'))
                try
                    [noiseLowAvg, ~, ~] = averageSweepData(rcaResult.noiseData.lowerSideBand, ...
                        numel(rcaResult.rcaSettings.useBins), numel(rcaResult.rcaSettings.useFrequencies));
            
                    [noiseHighAvg, ~, ~] = averageSweepData(rcaResult.noiseData.higherSideBand, ...
                        numel(rcaResult.rcaSettings.useBins), numel(rcaResult.rcaSettings.useFrequencies));
                catch err
                    rcaExtra_displayError(err);
                    noiseLowAvg = projAvg;
                    noiseHighAvg = projAvg;                    
                end
                out.noiseLowAvg = noiseLowAvg;
                out.noiseHighAvg = noiseHighAvg;
            end
        otherwise
            error('not implemented. check your rcaRes.rcaSettings.domain flag.');
    end
end