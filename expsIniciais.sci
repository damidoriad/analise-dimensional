// -- 29/04/2024 10:55:36 -- //
cd('C:\Meu Drive\Doutorado Unicamp\Projeto\Scilab\Pêndulo');
Da = csvRead('Dados\DaPredv0.csv');
Db = csvRead('Dados\DbPredv0.csv');
Dc = csvRead('Dados\DcPredv0.csv');
Dd = csvRead('Dados\DdPredv0.csv');
plot(Da(1,:))
Da(1,$-3:$)
plot(Da(1,:))
plot(Da(100,:))
plot(Da(300,:))
plot(Dd(1,:))
plot(Da(1,:)/6,'r')
x = Dd(1,1:500);
plot(x)
J = 50;
X = zeros(500-J,J);
for i = 1:(500-J), X(i,1:J)= x(i:i+J-1); end
size(X)
plot(X(400,:))
C=mean(X,'r');
R=(X-C)'*(X-C);
R=(X-ones(450,1)*C)'*(X-ones(450,1)*C);
[Vet,Val]=eig(R);
[Vet,Val]=spec(R);
plot(diag(Val))
plot(log10(diag(Val)))
plot(log10(diag(Val)),'*')
W=Vet(:,1:6)';
W=Vet(:,1:6);
Z=X*W;
size(Z)
P=inv(Z(1:$-1,:)'*Z(1:$-1,:))*Z(1:$-1,:)*Z(2:$,:);
A=inv(Z(1:$-1,:)'*Z(1:$-1,:))
P=inv(Z(1:$-1,:)'*Z(1:$-1,:))*Z(1:$-1,:)'*Z(2:$,:);
size(W)
A=X(1,:)*W
A*P
A=X(2,:)*W
z1=X(1,:)*W;
z2=X(2,:)*W;
z2h = z1*P;
x2h = z2h*W';
x2 = X(2,:);
plot(x2)
plot(x2h,'r')
Z=X*W;
Z2 = Z*P;
Xh = Z2*W';
plot(Xh(:,$))
plot(X(:,$),'r')
plot(Xh(:,$)-X(:,$))
plot(-Xh(:,$)+X(:,$))
xi = X(1,:);
xp = xi*W*P*W';
xt = xi;
for i = 1:450; xi = xi*W*P*W'; xt(i+50) = xi($); end
plot(xt)
plot(Dd(1,:),'r')
plot(xt)
plot(xi,'r')
xi = X(1,:);
xt = xi;
for i = 1:450; xi = xi*W*P*W'; xt(i+50) = xi($); end
plot(xt)
plot(xi,'r')
x = Dd(1,1:500);
plot(x,'m')
size(Z)
plot(Z(:,1),Z(:,2),'.')
xd = Dd(1,1:500);
xc = Dc(1,1:500);
xb = Db(1,1:500);
xa = Da(1,1:500);
Xa = zeros(500-J,J);
Xb = zeros(500-J,J);
Xc = zeros(500-J,J);
Xd = zeros(500-J,J);
for i = 1:(500-J), Xa(i,1:J)= xa(i:i+J-1); end
for i = 1:(500-J), Xb(i,1:J)= xb(i:i+J-1); end
for i = 1:(500-J), Xc(i,1:J)= xc(i:i+J-1); end
for i = 1:(500-J), Xd(i,1:J)= xd(i:i+J-1); end
Ca=mean(Xa,'r'); Cb=mean(Xb,'r'); Cc=mean(Xc,'r'); Cd=mean(Xd,'r');
Ra=(Xa-ones(450,1)*Ca)'*(Xa-ones(450,1)*Ca);
Rb=(Xb-ones(450,1)*Cb)'*(Xb-ones(450,1)*Cb);
Rc=(Xc-ones(450,1)*Cc)'*(Xc-ones(450,1)*Cc);
Rd=(Xd-ones(450,1)*Cd)'*(Xd-ones(450,1)*Cd);
[Veta,Vala]=spec(Ra); [Vetb,Valb]=spec(Rb); [Vetc,Valc]=spec(Rc); [Vetd,Vald]=spec(Rd); 
Wa=Veta(:,1:6); Wb=Vetb(:,1:6); Wc=Vetc(:,1:6); Wd=Vetd(:,1:6); 
Za=Xa*Wa; Zb=Xb*Wb; Zc=Xc*Wc; Zd=Xd*Wd; 
plot(Za(:,1),Za(:,2),'.')
plot(Zb(:,1),Zb(:,2),'r.')
plot(Zc(:,1),Zc(:,2),'k.')
figure(2)
subplot(1,2,1), plot(Zb(:,1),Zb(:,2),'.')
subplot(1,2,2), plot(Zc(:,1),Zc(:,2),'.')
clf
subplot(1,2,2), plot(Zc(:,1),Zc(:,2),'.')
subplot(1,2,1), plot(-Zb(:,1),Zb(:,2),'.')
clf
subplot(1,2,2), plot(Zc(:,1),Zc(:,2),'.')
subplot(1,2,1), plot(Zb(:,1),Zb(:,3),'.')
clf
subplot(1,2,1), plot(Zb(:,1),Zb(:,3),'.')
subplot(1,2,2), plot(Zd(:,1),Zd(:,2),'.')
