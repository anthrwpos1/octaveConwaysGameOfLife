clear
A1=imread('~/pole.png');
A1=double(A1(:,:,:));
%A1=double(zeros(256,256)>0.5);
[x,y,z]=size(A1);
B=sint_univ_B(A1(:,:,1));
%image(uint8(RGB(A1*255)));
image(uint8(A1));
axis equal;
pause(3);
frm=0;
J=A1;
m=0;
for n=1:360
%    A1(127:129,127:129)=rand(3,3)>0.5;
    A1=sint_univ2(A1,B);
    A1(1,:,:)=0;
    A1(:,1,:)=0;
    J=J/(1+1/12)+A1/13;
    m=m+1;
    if m>0
    if (frm==12)
        F=circshift(fft2(J),[floor(x/2) floor(y/2) 0]);
        x1=513-floor(x/2);
        x2=x1+x-1;
        y1=513-floor(y/2);
        y2=y1+y-1;
        F1=zeros(1024,1024,3);
        F1(x1:x2,y1:y2,:)=F;
        F1=real(ifft2(circshift(F1,[-512 -512 0])));
        F1=F1/x^2*1024^2;
        image(uint8(F1));%F1
        %image(uint8(A1))
        %axis([80*4 140*4 120*4 150*4]);
        axis equal;
        title (n);
        pause(0.03);
        frm=0;
    else
        frm=frm+1;
    end
    end
        
end
imwrite(uint8(A1),'~/pole.png','png');
