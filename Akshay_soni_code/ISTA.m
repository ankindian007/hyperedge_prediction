function [A] = ISTA(D, A, P, PY, opts) 
    k = opts.k;% # iterations 
    t = opts.t; % step size 
    lam = opts.lam; % sparsity parameter 
    % err = []; 
    for i = 1:k 
        temp1 = D*A; 
        temp1(P == 0) = 0; 
        temp = A - t*D'*(temp1 - PY); 
        A = thresh(temp, lam*t); 
        % err = [err norm(P.*(D*A) - PY,'fro')^2]; 
        % plot(err);         
        % drawnow; 
    end
end

function [X] = thresh(X, a) 
    temp = (abs(X) - a); 
    temp(temp < 0) = 0; 
    X = temp.*sign(X); 
end