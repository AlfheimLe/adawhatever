function xMat = VanillaSGD(sg, x0, stepSize, idxSG, nIter)
%VANILLASGD Vanilla stochastic gradient descent solver
%
% Decision variable `x` is a column vector.
%
% Function handle `sg` to the stochastic gradient accepts the index of the
% stochastic gradient as the first argument and the value of the decision
% variable as the second argument, i.e. `sg(idx, x)`.
%
% Input:
%   sg       : function handle to the stochastic gradient
%   x0       : initial guess for the decision variables
%   stepSize : scalar step size
%   idxSG    : indices of the gradients to use
%   nIter    : number of iterations to perform
%
% Output:
%   xMat     : matrix with decision variables at each iteration step
%

% Allocate output
xMat = zeros(length(x0), nIter + 1);

% Set the initial guess
xMat(:, 1) = x0;

% Repeat `idxSG` if it has fewer than `nIter` elements
if length(idxSG) < nIter
    idxSG = repmat(idxSG(:), ceil(nIter/length(idxSG)), 1);
    idxSG(nIter + 1 : 1 : end) = [];
end

% Run optimisation
for i = 1 : 1 : nIter
    xMat(:, i + 1) = xMat(:, i) - stepSize.*sg(idxSG(i), xMat(:, i));
end

end
