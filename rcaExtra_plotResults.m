function gcfHandles = rcaExtra_plotResults(varargin, plotSettings)
% plotting results of RC analysis
% Alexandra Yakovleva, Stanford University 2020
% varargin: cell array of dataStructures

% dataStructure has different fields depending on the time/frequency domain
% analysis. 
% For time domain the required fields are: 
% dataStructure.mean (timepoints x nRCs x conditions/groups)
% dataStructure.std (timepoints x nRCs x conditions/groups)
% dataStructure.labels
% dataStructure.stats


% plotSettings describes HOW to plot and what exactly to plot
% plotSettings.domain = freq plots lolliplots, amplitude and latency 
% plotSettings.domain = time plots waveforms
% plotSettings.conditionsToPlot = [] vector of conditions plot empty plots everything
% plotSettings.rcToPlot = [] vector of RCs to plot, empty plots everything

    switch plotSettings.domain
        
        case 'time'
            
        case 'freq'
            
            
        otherwise
    end
end