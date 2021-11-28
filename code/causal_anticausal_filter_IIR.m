function y2=causal_anticausal_filter_IIR(s,ind_offset,N,riza)
% prefilter for generalized interpolation
% Unser et al IEEE TSP, 1993, part II
% eq. (2.5)

% [N1,M1]=size(s);
% if N1>1
%     s=s';
% end

% forward filtering
k0=9;
cc=0;
y1=zeros(size(s)); y1=s;
for j=1:k0
    cc=cc+s(j)*riza^(j-1);
end
y1(1+ind_offset)=cc;
% y1(1+ind_offset)=sum(s(1:k0).*riza.^[0:k0-1]);
for i=2:N
    y1(i+ind_offset)=s(i+ind_offset)+riza*y1(i+ind_offset-1);
end
% anticausal filter
y2=y1;
c=-riza/(1-riza^2);
y2(N+ind_offset)=c*(2*y1(N+ind_offset)-s(N+ind_offset));
for i=N-1:-1:1
    y2(i+ind_offset)=riza*(y2(i+1+ind_offset)-y1(i+ind_offset));
end