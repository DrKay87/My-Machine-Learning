load('dianxian.mat')

feature_set = [];
for i = 1:180
    x = dianxian(:,:,1);
    c = kmeans(x',30);          % Applying K-mean clustering
    C_matrix = [];
    for j = 1:90                % Making a community matix
        s = zeros(90,1);
        a = c(j);
        s( c == a ) = 1;
        C_matrix = [C_matrix s];
    end
%     figure;
%     imshow(C_matrix,[]);        % Community Matrix
    uperdiag = triu(C_matrix); 
%     figure;                     % Uper diagonal of community matrix
%     imshow(uperdiag,[]);
    feature_vect = [];
    for k = 1:90                % Making the feature vector
        b = uperdiag(k,k+1:end);
        feature_vect = [feature_vect b];
    end
    feature_set = [feature_set; feature_vect];
end
X = feature_set;
Y = [ones(80,1); zeros(100,1)];
save('Features_Healthy_Epileptic_Patients', 'X','Y');