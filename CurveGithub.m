% please input the x, y coordinates of the trace. x and y are two vectors.
ss=size(x);N=ss(1);   %Number of sampling points
Fs=2;   %Sampling frequency
theta1=0;dx=0;dy=0;dxn=0;dyn=0;Y1=0;P1_1=0;P1_2=0;  %Initialization 
for i=1:N-1   %Unit vector
   dx(i)=x(i+1)-x(i);
   dy(i)=y(i+1)-y(i);
   dxn(i)=dx(i)/sqrt(dx(i)*dx(i)+dy(i)*dy(i));  %x component of the unit vector  ni
   dyn(i)=dy(i)/sqrt(dx(i)*dx(i)+dy(i)*dy(i));  %y component of the unit vector
end
for j=2:N-1  %Calculate angle between ni and ni-1
    sint=(dxn(j-1)*dyn(j)-dxn(j)*dyn(j-1)); 
    cost=(dxn(j-1)*dxn(j)+dyn(j-1)*dyn(j));
    if(cost<0 && sint>0)
        theta1(j)=acos(cost); 
    else if(cost<0 && sint<0)
        theta1(j)=-acos(cost);
        else theta1(j)=asin(sint);
        end
    end
  %   theta1(j)= abs(theta1(j)); %You may try what happens using magnitude
end

M=N-1;
m=1:M;
Y1=fft(theta1);
p1_2=abs(Y1/M); 
p1_1=p1_2(1:M/2+1); 
p1_1(2:end-1)=2*p1_1(2:end-1);
f=Fs*(0:(M/2))/M;   %frequencies
f1=f;p1=p1_1;
figure;
plot(m/Fs,theta1*180.0/pi,'-');
xlabel('L*'); ylabel('d¦È');  %Deviation angle series
figure;
plot(f,p1_1,'r-.');  
xlabel('f*'); ylabel('A'); %frequency spectrum
YY=xcorr(theta1);
ss=1:100;
figure;
plot(ss,YY(M:M+99)/max(YY(M:M+99)),'r-'); 
xlabel('¦¤L*'); ylabel('R*');  %Autocorrelation

