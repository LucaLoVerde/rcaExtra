function groups = plotFrequencyComponents(varargin)
%% Function will lolliplot multiple components pairwise
%% INPUT:
    % varargin -- groups + labels: {group1, group2,..., groupN, groupLabels}
    % groupX -- cell array with 3 elements: 
    % groupX{1} = values amp, 
    % groupX{2} = values phase, 
    % groupX{3} = error ellipses
    
    % groupX = {Values(nCnd x nComp x nFreq) Errors (nCnd x nComp x nFreq)}
%% OUTPUT
    % groups -- Figure handle of by group pliots 
          
    groupTitles = varargin{end};
    componentTitles =  varargin{end - 2};
    conditionTitles =  varargin{end - 1};
    
    
    nGroups = numel(groupTitles);
    
    linestyles = {'-', ':', '-.', '--', '-*', '-o', '-+', '.'};
    
    % close all figures
    %close all;

    nFreq = size(varargin{1}.amp, 1);
    nComp = size(varargin{1}.amp, 2);
    nCnd = size(varargin{1}.amp, 3);
    
    load('colorbrewer.mat'); 
    PaletteN = 7;
    
    blues = colorbrewer.seq.YlGnBu{PaletteN}/255;
    reds = colorbrewer.seq.YlOrRd{PaletteN}/255;
    
    freqLabels = cellfun( @(x) strcat('F', num2str(x)), num2cell(1:1:nFreq), 'uni', false);
    nComp = 1;
    for cp = 1:nComp
        for nf = 1:nFreq
            %linearInd = sub2ind([nFreq nComp], nf, cp);
            %ax = subplot(nComp, nFreq, linearInd, 'Parent', projFig);
            for cnd = 1:nCnd
                figure;
                ax = gca;
                
                for g = 1:nGroups
                    if (nCnd <= 2*g)
                        colorGroup = cat(1, blues(end - g, :), reds(end - g, :));
                    else
                        colorGroup = cat(1, blues(end:-1:1, :), reds(end:-1:1, :));
                    end
                    currGroupProj = varargin{g};
                
                    groupstyle = linestyles{g};
                    amp = currGroupProj.amp;
                    phase = currGroupProj.phase;
                    try
                        ellipseCalc = currGroupProj.ellipseErr;
                    catch
                        ellipseCalc = currGroupProj.err;
                    end
                
                    
                    %L is the length
                    %angle is alpha
                    L = squeeze(amp(nf, cp, cnd));
                    alpha = squeeze(phase(nf, cp, cnd));
                    x = L.*cos(alpha);
                    y = L.*sin(alpha);
                    e_x = 0;
                    e_y = 0;
                    try
                        e0 = ellipseCalc{cnd}{nf, cp};
                    catch
                        
                        e0 = ellipseCalc(nf);
                    end
                    if (~isempty(e0))
                        e_x = e0(:, 1) + x;
                        e_y = e0(:, 2) + y;
                    end
                
                    props = { 'linewidth', 8, 'color', colorGroup(cnd, :), 'linestyle', groupstyle};
                    %plot(ax, [0, x], [0, y], props{:}); hold on;
                    %e = ellipse(maxAmpDiff, maxAngleDiff, alpha, x, y, c_rg(cnd,:)); hold on;
                    % plot the output ellipse?
                    patchSaturation = 0.5;
                    patchColor =  colorGroup(cnd,:) + (1 - colorGroup(cnd,:))*(1-patchSaturation);
                    %p.patch = patch(e_x, e_y, patchColor); hold on;
                    errLine = line(e_x, e_y, 'LineWidth', 5); hold on;
                    %edgeColor = colorGroup(cnd,:);
                    set(errLine,'color', patchColor);
                    p = plot(ax, [0, x], [0, y], props{:}); hold on;
                    legendRef{g} = p;
                    cndLabel{g} = sprintf('%s %s', groupTitles{g}, conditionTitles{cnd});
                end
                setAxisAtTheOrigin(ax);
                
                descr = [componentTitles{cp} ' ' freqLabels{nf}];
                legend(ax, [legendRef{:}], cndLabel(:));
                title(descr, 'Interpreter', 'none', 'FontSize', 30);
               
                %descr = [componentTitles{cp} '_' freqLabels{nf}];
                %title(descr, 'Interpreter', 'none');
            end
            
            % font size           
%             setAxisAtTheOrigin(ax);
%             
%             descr = [componentTitles{cp} ' ' freqLabels{nf}];
%             legend(ax, [legendRef{:}], cndLabel(:));
%             title(descr, 'Interpreter', 'none');

        end
    end
end