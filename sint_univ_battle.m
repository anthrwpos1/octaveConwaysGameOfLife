A1=zeros(128,128,3);
A1(32,96,3)=255;
A1(96,32,1)=255;
imwrite(uint8(A1),'~/pole.png','png');