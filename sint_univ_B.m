function B=sint_univ_B(A)
[x,y]=size(A);
B=zeros(x,y);
B(2,1)=1;   B(2,2)=1;   B(1,2)=1;
B(end,1)=1; B(end,2)=1;
B(1,end)=1; B(2,end)=1;
B(end,end)=1;