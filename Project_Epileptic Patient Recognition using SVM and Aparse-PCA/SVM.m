
addpath('./spasm');
load('Features_Healthy_Epileptic_Patients.mat');
% coef = princomp(X);                                   % PCA
% PCs = coef(:,1:500);
% F = X*PCs;
K = 100;
delta = inf;
stop = -[250 125 100];
maxiter = 3000;
convergenceCriterion = 1e-9;
verbose = true;

[SL SD] = spca(X, [], K, delta, stop, maxiter, convergenceCriterion, verbose);  %Sparse PCA
% M = SL*SD;
% [xx ind] = sort(abs(M),'descend');
% F = X(:,ind(1:100));
% SS = ((SD*ones(1,4005))').*SL;
F = X*SL;

P = cvpartition(Y,'Holdout',0.50);                                              %Support Vector Machines
% Use a linear support vector machine classifier
svmStruct = svmtrain(F(P.training,:),Y(P.training),'showplot',true);
C = svmclassify(svmStruct,F(P.test,:),'showplot',true);
errRate = sum(Y(P.test)~= C)/P.TestSize;  %mis-classification rate
accuracy_Percentage = (1 - errRate)*100
conMat = confusionmat(Y(P.test),C) % the confusion matrix
