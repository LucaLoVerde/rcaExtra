<<<<<<< HEAD
<<<<<<< HEAD:frequency/averageProject.m
function [proj, subj, weights] = averageProject(dataIn, nBins)
=======
function [proj, subj, w] = averageProjectSweep(dataIn, nBins)
>>>>>>> 2945b11f042701b145f8107655314553962aec17:sweep/averageProjectSweep.m
=======
function [proj, subj, weights] = averageProject(dataIn, nBins)
>>>>>>> 2945b11f042701b145f8107655314553962aec17
% Alexandra Yakovleva, Stanford University 2012-1020
    nCnd = size(dataIn, 2);
    proj = cell(nCnd, 1);
    subj = cell(size(dataIn));
    weights = cell(size(dataIn));
    % pool all subjects together
    if (nBins > 1)
        catDim = 4;
    else
        catDim = 4;
    end
    % cat together all subjects's trials 
    for c = 1:nCnd
        [proj{c}, ~] = averageBinsTrials(cat(catDim, dataIn{:, c}));
<<<<<<< HEAD
<<<<<<< HEAD:frequency/averageProject.m
        [subj(:, c), weights(:, c)] = cellfun(@(x) averageBinsTrials(x), dataIn(:, c), 'uni', false);
=======
        [s, w] = cellfun(@(x) averageBinsTrials(x), dataIn(:, c), 'uni', false);
        subj(:, c) = s;
        weights(:, c) = w;
>>>>>>> 2945b11f042701b145f8107655314553962aec17:sweep/averageProjectSweep.m
=======
        [subj(:, c), weights(:, c)] = cellfun(@(x) averageBinsTrials(x), dataIn(:, c), 'uni', false);
>>>>>>> 2945b11f042701b145f8107655314553962aec17
    end   
end