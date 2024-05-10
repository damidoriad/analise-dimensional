// Vamos fazer uma exploração com PCA em alguns dados do RealWorld

cd('C:\Meu Drive\Doutorado Unicamp\Projeto\github\analise-dimensional')
dados = csvRead('acc_climbingup_forearm.csv');
s{1} = dados(2:$,3);
dados = csvRead('acc_climbingup_waist.csv');
s{2} = dados(2:$,3);
dados = csvRead('acc_walking_forearm.csv');
s{3} = dados(2:$,3);
dados = csvRead('acc_walking_waist.csv');
s{4} = dados(2:$,3);
N = min([length(s{1}), length(s{2}), length(s{3}), length(s{4})]);
s{1} = s{1}(1:N,:);
s{2} = s{2}(1:N,:);
s{3} = s{3}(1:N,:);
s{4} = s{4}(1:N,:);

J = 150;
Na = int(N/10);
X = zeros(Na-J,J);
cores = ['r', 'g', 'b', 'k', 'm'];
for j = 1:4,
    X = picotar(s{j}, J, Na);
    [l, Vet] = pca(X);
    plot(cumsum(l/sum(l)),cores(j)+'*')
end

function X = picotar(s, J, Na)
    X = zeros(Na-J,J);
    for i = 1:(Na-J),
        X(i,1:J) = s(i:i+J-1); 
    end
    C = mean(X,'r');
    X = X - ones(Na-J,1)*C;
endfunction

function [l, Vet] = pca(X)
    R = X'*X;
    [Vet,Val] = spec(R);
    l = diag(Val);
    [l, ind] = gsort(l);
    Vet = Vet(:,ind);
endfunction














