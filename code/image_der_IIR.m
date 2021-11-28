function [I10,I01,I11,I20,I02,I12,I21,I22]=image_der_IIR(I,n1,n2)
% image derivation by 2 applications of 1D masks 
% for 1st order and 2nd order 
% n1: order of deriv 1, values: 6, 8, 10; 
% n2: order of deriv 2, values: 4, 6, 8, 10; 
% I10 deriv 1 across lines
% I01 deriv 1 across columns

[Nlin,Ncol]=size(I);
I10=zeros(size(I));
I01=zeros(size(I));
I20=zeros(size(I));
I02=zeros(size(I));
I11=zeros(size(I));
I12=zeros(size(I));
I21=zeros(size(I));
I22=zeros(size(I));

if (n1~=6 && n1~=8 && n1~=10) || (n2~=4 && n2~=6 && n2~=8 && n2~=10)
    fprintf('n1 should be 6 or 8 or 10 \n')
    fprintf('n2 should be 4 or 6 or 8 or 10 \n')
%     I10=[]; I01=[]; I11=[]; I20=[]; I02=[]; I12=[]; I21=[]; I22=[];
else

    for i=1:Nlin
        I10(i,:)=deriv_compact(I(i,:),1,n1);
        I20(i,:)=deriv_compact(I(i,:),2,n2);
    end
    
    for i=1:Ncol
        I01(:,i)=deriv_compact(I(:,i),1,n1);
        I02(:,i)=deriv_compact(I(:,i),2,n2);
    end
    
    for i=1:Ncol
        I11(:,i)=deriv_compact(I10(:,i),1,n1);
        I21(:,i)=deriv_compact(I20(:,i),1,n1);
        I22(:,i)=deriv_compact(I20(:,i),2,n2);
    end
    
    for i=1:Nlin
        I12(i,:)=deriv_compact(I02(i,:),1,n1);
    end

end



