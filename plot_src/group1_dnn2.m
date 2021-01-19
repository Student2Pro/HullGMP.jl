x=1:1:5;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
a=[0.00471,0.05139,0.52105,3.86892,29.7023]; %a数据y值
b=[0.00326,0.04577,0.41940,2.64940,19.2064]; %b数据y值
plot(x,a,'-^b',x,b,'-vr','linewidth',2); %线性，颜色，标记
axis([1,5,0,30])  %确定x轴与y轴框图大小
set(gca,'FontSize',20);%设置坐标轴的数字大小，包括legend文字大小
set(gca,'XTick',[1:1:5]) %x轴范围1-6，间隔1
set(gca,'YTick',[0:5:30]) %y轴范围0-700，间隔100
legend('MaxSens','HullReach','Location','NorthWest');   %右上角标注
xlabel('Width Constraint')  %x轴坐标描述
ylabel('running time (s)') %y轴坐标描述
set(gca,'Ygrid','on')