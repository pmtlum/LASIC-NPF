function RunThroughLASICNPFGrowth

event_list=[1,2,3,4,6,9,11,12,13,15,18,19,20,22];
% event_list=[18];
for i=1:length(event_list)
    event_list(i)
    [a,b]=LASIC_growth(event_list(i));
    result(i,:)=[a,b];
end

figure
p=plot(result(:,1),result(:,2)*100,'o','MarkerFaceColor',[0.5 0.5 0.5],'Color',[0.5 0.5 0.5],'MarkerSize',10);
ylabel({'Potential contibution of';'NPF to total CCN (%)'});
xlabel('Existing CCN concentration (cm^{-3})');
JW_figure_style(gcf,'paper_marcus');
ylim([0 100]);
p.MarkerSize= 10;
set(gcf,'Position',[90 20 700 842]);
box on
ax = gca;
ax.LineWidth = 1.5;
1+1;