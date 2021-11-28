function [I,kc]=image_der1(I,ord1, ord2, n1,n2)
% image derivation by multiple applications of 1D masks 
% ord1: order of derivative along lines
% ord2: order of derivative along columns
% n1: kernel length 2 * n1+1 along lines; 
% n2: kernel length 2 * n1+1 along columns
% Output
% I: derivative of input image
% kc: combined 2D kernel

kc=1;
I=double(I);
if ord1>0
    m1=1.0*descrete_deriv(ord1,n1);   %1.1
    I=imfilter(I , m1,'conv','replicate');
    kc=kc*m1;
end
if ord2>0
    m2=1.0*descrete_deriv(ord2,n2);
    I=imfilter(I , m2','conv','replicate');
    kc=m2'*kc;
end

if ord1>0 && ord2>0
    kc2=m1'*m2;
end



