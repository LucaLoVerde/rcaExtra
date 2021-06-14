function subj = projectSubjDataSweep(amp, phase, eAP)
% Alexandra Yakovleva, Stanford University 2012-2020.
% modified by LLV

    nCnd = size(amp, 1);    
    for c = 1:nCnd
        % LLV not sure at all what "conditions" would be here, since each
        % sub struct in rcRes are always relative to one condition at a
        % time. Attempting to fix dimensionality
        subj.amp(:, :, c, :, :) = permute((cat(5, amp{c, :})), [1, 2, 4, 3, 5]);
        subj.phase(:, :, c, :, :) = permute((cat(5, phase{c, :})), [1, 2, 4, 3, 5]);
        % subj Err is transposed
%         subj.err(:, :, c, :) = (cat(3, eAP{:, c}));
        subj.err(:, :, c, :) = permute((cat(5, eAP{c, :})), [1, 2, 4, 3, 5])';
    end
end