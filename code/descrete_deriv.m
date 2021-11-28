function d=descrete_deriv(ord,n)
% clear all;
% ord=2; % order of deriv
% n=3;   % number of points
% d the mask in the following order [f(n),...f(1),f(0),f(-1),...f(-n)]
 
if mod(ord,2)~=0
    i=(ord+1)/2; 
    [P1,P2]=meshgrid(1:n,1:2:2*n-1);
else
    i=ord/2;
    [P1,P2]=meshgrid(1:n,2:2:2*n);
end
P0=P1.^P2;

for k=1:n
    Ptemp=P0;
    Ptemp(i,:)=[];
    Ptemp(:,k)=Ptemp(:,end);
    Ptemp(:,end)=[];
    d(k)=det(Ptemp);
end
d(end)=-d(end);

if mod(ord,2)~=0
   % (1/2)*factorial(2*i-1)*d
   % fprintf('paronom: %d', sum(([1:n].^(2*i-1)).*d))
    d=(1/2)*factorial(2*i-1)*d./sum(([1:n].^(2*i-1)).*d);
    d=[fliplr(d),0,-d];
else
   % (1/2)*factorial(2*i)*d
   % fprintf('paronom: %d', sum(([1:n].^(2*i)).*d))
    d=(1/2)*factorial(2*i)*d./sum(([1:n].^(2*i)).*d);
    d=[fliplr(d),-2*sum(d),d];
end