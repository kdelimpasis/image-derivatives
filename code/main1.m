clear vars

% demo

%% Convolution Kernels for image derivatives

% Replace LIne 7 with the image of your choice
I=imread('cameraman.bmp');
[N,M]=size(I);
I=double(I);
% I=rgb2gray(I);
ord1=2;
ord2=1;
[J,K]=image_der1(I,1,1,3,5);


st=[];
for i=1:ord1
    st=[st,'x'];
end

for i=1:ord2
    st=[st,'y'];
end

figure; imagesc(K)
title(['Kernel for ',st,' image derivative'])

figure; imshow(J,[]);
title(['I_{',st,'} Central derivatives (FIR)'])



%% IIR compact derivatives

n1=6; n2=8;
[I10IIR,I01IIR,I11IIR,I20IIR,I02IIR,I12IIR,I21IIR,I22IIR]=image_der_IIR(I,n1,n2);
img_derIIR_1=[I10IIR,I01IIR];
img_derIIR_2=[I11IIR,I20IIR,I02IIR];


figure; imshow(img_derIIR_1,[]);
title('Compact derivatives (IIR)')
text(30,30,'I_x');
text(30+M,30,'I_y');

figure; imshow(img_derIIR_2,[]);
title('Compact derivatives (IIR)')
text(30,30,'I_{xx}');
text(30+M,30,'I_{yy}');
text(30+2*M,30,'I_{xy}');




