function s1=deriv_compact(s,n,m)
% n: order of deriv
% m: order of accuracy
% S. K. Lele, Compact Finite Deifference Schemes, 
% J of Comput Physics, vol.103, pp16-42, 1992
% s=(1:20).^2;

if n==1 & m==6
    ag=1/3;
    bg=(1/12)*(-1+3*ag);
    a=(2/9)*(8-3*ag);
    b=(1/18)*(-17+57*ag);
    c=0;
end
if n==1 & m==8
    ag=4/9;
    bg=1/36;
    a=40/27;
    b=25/54;
    c=0;
end
if n==1 & m==10
    ag=1/2;
    bg=1/20;
    a=17/12;
    b=101/150;
    c=1/100;
end

if n==1
    v=[bg,ag,1,ag,bg];
    vc=[c/6,b/4,a/2,0,-a/2,-b/4,-c/6];
end

% Eq. (2.2.7)
if n==2 & m==4
    ag=0;
    bg=0;
    a=4/3;
    b=-1/3;
    c=0;
end

% Eq. (2.2.7)
if n==2 & m==6
    ag=2/11;
    bg=0;
    a=12/11;
    b=3/11;
    c=0;
end

% Eq.(2.2.10)
if n==2 & m==8
    ag=344/1179;
    bg=(38*ag-9)/214;
    a=(696-1191*ag)/428;
    b=(2454*ag-294)/535;
    c=(1179*ag-334)/2140;
end

% Eq.(2.2.11)
if n==2 & m==10
    ag=334/899;
    bg=43/1798;
    a=1065/1798;
    b=1038/899;
    c=79/1798;
end


% Eq.(2.2)
if n==2 & m~=2
    v=[bg,ag,1,ag,bg]; 
    vc=[c/9,b/4,a,-(2*c/9 + 2*b/4 +2*a), +a,+b/4,+c/9];
end

if n==2 & m==2
    v=[1]; 
    vc=[1,-2,1];
end

s1=deriv1_IIR(s,v,vc);
if v(1)~=0 
    s1=s1/v(1);
elseif v(2)~=0 
    s1=s1/v(2);
else
    s1=s1/v(3);
end

% rizes=roots([bg,ag,1,ag,bg]);
% riza=rizes((abs(rizes)<1));