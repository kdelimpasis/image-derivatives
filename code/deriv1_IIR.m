function s2=deriv1_IIR(s,v,vc)
% v: coefficients of the 1st derivative
% vc: coefficients for signal convolution

if size(s,1)>size(s,2)
    s=s';
end
s1=imfilter(s,vc,'symmetric','same','conv');

rizes=roots(v);
riza=rizes((abs(rizes)<1) & rizes~=0);

N=length(s);
% s2=[fliplr(s(1:end)),s,fliplr(s(1:end-1))];
% ind_offset=N;
s2=s1;
ind_offset=0;
for i=length(riza):-1:1
   % s2=filter_IIR(s2,ind_offset,N,riza(i));
    s2=causal_anticausal_filter_IIR(s2,ind_offset,N,riza(i));
end
% s2=s2';
% figure; plot(s2);
% s2=s2(N+1:2*N);

% M=diag(v(2)*ones(1,N)) + diag(v(1)*ones(1,N-1),-1) + diag(v(1)*ones(1,N-1),1);
% s2=inv(M)*s1';


function y2=filter_IIR(s,ind_offset,N,riza)
% forward filtering
k0=4;
y1=zeros(size(s)); y1=s;
y1(1+ind_offset)=sum(s(1:k0).*riza.^[0:k0-1]);
for i=2:N
    y1(i+ind_offset)=s(i+ind_offset)+riza*y1(i+ind_offset-1);
end
y2=y1;
c=-riza/(1-riza^2);
y2(N+ind_offset)=c*(2*y1(N+ind_offset)-s(N+ind_offset));
for i=N-1:-1:1
    y2(i+ind_offset)=riza*(y2(i+1+ind_offset)-y1(i+ind_offset));
end