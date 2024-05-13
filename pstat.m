clear all
close all
%system("./read_stat.sh xy.stat stat_bud.in  stat_vel.data");

stat1=load('stat_vel.data');
stat2=load('stat_bud.data');%budget term 

y=stat1(:,1);
ny=size(y,1);
[yy D]=chebdif(ny,1);
re=4200;

dudy = D*stat1(:,2);
utau =  sqrt((dudy(end)-dudy(1))/2/re);
lstar = 1/utau/re;


figure(1)
plot(y,stat1(:,2))
xlabel('y/h')
ylabel('u/u_{cl}')

figure(2)
hold on
yp=linspace(0,10,20);
semilogx(yp,yp,'g')

yp = linspace(5,300,20);
semilogx(yp,1/0.41*log(yp)+5.2,'g')

yy = y(1:(end+1)/2)+1;
uu = ( stat1(1:(ny+1)/2,2) + stat1(ny:-1:(ny+1)/2,2) )/2;
semilogx(yy/lstar,uu/utau);
xlabel('y^+')
ylabel('U^+')





  
