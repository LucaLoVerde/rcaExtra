function [weightedAvgPerBinPerFreq, ValidTrialsPerBinPerFreq] = averageBinsTrialsSweep(dataIn)
% Alexandra Yakovleva, Stanford University 2012-1020
% modified by LLV
    [nBins, nFreq, nCh, ~] = size(dataIn);

    ValidTrialsPerBinPerFreq = sum(~isnan(dataIn), 4);
    % nBins x nF x nChannels x nTrials
    meanBinsPerTrialPerFeq = nanmean(dataIn, 4);
    if (nBins > 1)
        try
            % weighted average per bin per trial
%             weightedAvgPerBinPerFreq = squeeze(wmean(meanBinsPerTrialPerFeq, ValidTrialsPerBinPerFreq));
            weightedAvgPerBinPerFreq = meanBinsPerTrialPerFeq;
            % DEBUG: possibly here is the culprit
        catch
            weightedAvgPerBinPerFreq = zeros(nBins, nFreq, nCh); 
        end
        weightedAvgPerBinPerFreq = reshape(weightedAvgPerBinPerFreq, [nBins nFreq nCh]);
    else
        % averaging bin 0 data TODO check if mean can/should be used 
        weightedAvgPerBinPerFreq = squeeze(wmean(meanBinsPerTrialPerFeq, ValidTrialsPerBinPerFreq, 4));
    end
end