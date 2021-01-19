x=1:1:5;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
a=[0.00058,0.00184,0.01101,0.04326,0.25627]; %a数据y值
b=[0.00029,0.00085,0.00382,0.00489,0.00768]; %b数据y值
plot(x,a,'-^b',x,b,'-vr','linewidth',2); %线性，颜色，标记
axis([1,5,0,0.3])  %确定x轴与y轴框图大小
set(gca,'FontSize',20);%设置坐标轴的数字大小，包括legend文字大小
set(gca,'XTick',[1:1:5]) %x轴范围1-6，间隔1
set(gca,'YTick',[0:0.05:0.3]) %y轴范围0-700，间隔100
legend('SpeGuid','HullSearch','Location','NorthWest');   %右上角标注
xlabel('Width Constraint')  %x轴坐标描述
ylabel('running time (s)') %y轴坐标描述
set(gca,'Ygrid','on')