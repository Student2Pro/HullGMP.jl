x=1:1:5;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
a=[0.00999,0.11984,0.99644,9.72432,202.679]; %a数据y值
b=[0.00520,0.03248,0.15164,0.77392,3.36930]; %b数据y值
plot(x,a,'-^b',x,b,'-vr','linewidth',2); %线性，颜色，标记
axis([1,5,0,250])  %确定x轴与y轴框图大小
set(gca,'FontSize',20);%设置坐标轴的数字大小，包括legend文字大小
set(gca,'XTick',[1:1:5]) %x轴范围1-6，间隔1
set(gca,'YTick',[0:50:250]) %y轴范围0-700，间隔100
legend('SpeGuid','HullSearch','Location','NorthWest');   %右上角标注
xlabel('Width Constraint')  %x轴坐标描述
ylabel('running time (s)') %y轴坐标描述
set(gca,'Ygrid','on')