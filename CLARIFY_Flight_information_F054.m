if 1
    clear all
    close all
% cd('/Users/marcusbatista/Library/CloudStorage/OneDrive-UniversityofMiami/University_of_Miami/Thesis/DOE_Projects/LASIC/CLARIFY/Zuidema_clarify_data')
 cd('C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\LASIC\CLARIFY\Zuidema_clarify_data')

filename='core_faam_20170906_v004_r1_c054_1hz.nc';
f_number = filename(29:31);
f_date = filename(11:18);
Latitude=ncread(filename,'LAT_GIN');
CPC_Time=ncread(filename,'Time'); %units= 'seconds since 2017-09-05 00:00:00 +0000'
Longitude=ncread(filename,'LON_GIN');
Altitude=ncread(filename,'ALT_GIN');
CN_CPC=ncread(filename,'CPC_CNTS'); %TSI 3786  Ultra FIne water-based CPC
CN_CPC(CN_CPC==-9999)=nan;
CN_CPC(CN_CPC<0) = NaN;
CO_conc = ncread(filename,'CO_AERO');
Temperature= ncread(filename,'TAT_DI_R'); %true air temperature from the Rosemount deiced temperature sensor
Pressure = ncread(filename,'PS_RVSM'); %Static pressure from the aircraft RVSM (air data) system'
Pressure(Pressure<=0) = NaN;
Pot_temp = Temperature.*(1000./Pressure).^0.286;
LWC = ncread(filename,'NV_LWC1_C'); %g m-3
LWC(LWC==-9999)=NaN;

filename='core-cloud-phy_faam_20170906_v501_r0_c054_pcasp1.nc';
PCASP_Time =  ncread(filename,'Time');
CN_PCASP = ncread(filename,'CDP_CONC');
CN_PCASP(CN_PCASP<0) = NaN;
CN_PCASP(CN_PCASP==3) = NaN;

% filename='core-cloud-phy_faam_20170906_v600_r0_c054.nc';
% PCASP_altitude_time= ncread(filename,'Time');
% PCASP_Latitude=ncread(filename,'latitude');
% PCASP_Longitude=ncread(filename,'longitude');
% PCASP_Altitude=ncread(filename,'altitude');

tempdate=[2017,09,06];
s = seconds(PCASP_Time);  
s.Format = 'hh:mm:ss';
s=datevec(s);
s=s(:,4:6);
PCASP_Time_x=datenum(tempdate(:,1),tempdate(:,2),tempdate(:,3),s(:,1),s(:,2),s(:,3));  


PCASP_Time_treated = PCASP_Time(1:16720,1);
CN_PCASP_Treated = CN_PCASP(1:16720,1);
end

option.location_tracking =1;
option.boxplot_altitude_CPC =0;
option.boxplot_altitude_CO = 0;
option.boxplot_altitude_PCASP =0;
option.boxplot_potential_temp = 0;
option.plot_CN_CPC =0;
option.plot_CO = 0;
option.plot_CN_PCASP = 0;
option.plot_potential_temp = 0;
option.correction_PCASP = 0;

if option.location_tracking

figure('Name','N_CPC concentrations_map');
rgb = imread('Figure_location_054.png');
imshow(rgb);
hold on
M = size(rgb,1);
N = size(rgb,2);
bleft=[-28.2887 -47.3796];
tright=[20.6143 27.1764];
dist=tright-bleft;

hold on
long=Longitude;
lat=Latitude;
alt=Altitude;
scatter3((long-bleft(1))/dist(1)*N,(tright(2)-lat)/dist(2)*M,alt,3,CN_CPC);
caxis([0 1000]);
c = colorbar;
c.Label.String = {'{\itN}_{CPC} (cm^{-3})'};
axis on

xlabel('Longitude (^{o})');
ylabel('Latitude (^{o})');
zlabel('Altitude (m)');
set(gca,'FontSize',18);

zlim([0 2000]);
hold off
colormap(jet);
set(gca, 'Layer', 'top');
ax = gca;
ax.LineWidth = 1.5;
set(gca,'TickDir','in');
view(1,76);
% view(9,75);
%     view(0,0);
box on
grid on

reference_date = datetime(2017, 9, 6, 0, 0, 0); 
time_in_HH_mm = reference_date + seconds(PCASP_Time_treated);

reference_date = datetime(2017, 9, 6, 0, 0, 0); 
CPC_time_in_HH_mm = reference_date + seconds(CPC_Time);

figure 
subplot(3,1,1)
yyaxis left
ax = gca; ax.YColor = 'k';
plot(time_in_HH_mm(6750:14909,1), Altitude(6750:14909,1),'k','LineWidth',2)
% plot(time_in_HH_mm, Altitude)
ylabel('Altitude (m)')
ylim([0 2500]);
yticks([0,1000,2000]); yticklabels([0,1000,2000]); 
xlim1 = datetime('06-Sep-2017 15:44:00', 'InputFormat', 'dd-MMM-yyyy HH:mm:ss');
xlim2 = datetime('06-Sep-2017 16:59:00', 'InputFormat', 'dd-MMM-yyyy HH:mm:ss');
xlim([xlim1 xlim2]);
xticklabels([])

yyaxis right 
ax = gca; ax.YColor = 'b';
plot(time_in_HH_mm(6750:14909,1),LWC(6750:14909,1),'b','LineWidth',2)
ylabel('LWC (g m^{-3})')
ylim([0 0.6]);

subplot(3,1,2)
plot(CPC_time_in_HH_mm(6750:14909,1), CN_CPC(6750:14909,1),'k')
ylim([0 10000]);
% plot(time_in_HH_mm, CN_PCASP_Treated)

ylabel('N (cm^{-3})')
xlim([xlim1 xlim2]);
xticklabels([])

subplot(3,1,3)
plot(time_in_HH_mm(6750:14909,1), CO_conc(6750:14909,1),'k')

% plot(time_in_HH_mm, CO_conc)
xlim([xlim1 xlim2]);
ylabel('CO (ppb)')
xlabel('Time (UTC)')

JW_figure_style(gcf,'PT_land3');
set(gcf,'Position',[50 20 842 842]);




saveas(gcf,strcat('N_CPC concentrations during flight_', strcat(f_number),'_on_', strcat(f_date),'.jpg')); %save figure as .jpg

%% 
figure('Name','N_PCASP concentrations_map');
rgb = imread('Figure_location_054.png');
imshow(rgb);
hold on
M = size(rgb,1);
N = size(rgb,2);
bleft=[-25.4050 -44.4358];
tright=[11.2422 9.7539];
dist=tright-bleft;

hold on
scatter3((long-bleft(1))/dist(1)*N,(tright(2)-lat)/dist(2)*M,alt,3,CN_PCASP_Treated);
caxis([0 300]);
colorbar
axis on

xlabel('Longitude (^{o})');
ylabel('Latitude (^{o})');
zlabel('Altitude (m)');
zlim([0 2000]);
hold off
colormap(jet);
view(1,76);
% view(9,75);
%     view(0,0);
box on
grid on

saveas(gcf,strcat('N_PCASP concentrations during flight_', strcat(f_number),'_on_', strcat(f_date),'.jpg')); 

end

if option.boxplot_altitude_CPC %Boxplot for altitudes from CPC 
CN_CPC(CN_CPC>=10000) = NaN;
CN_CPC(CN_CPC<0) = NaN;
Altitude_CN = Altitude;
CN_alt=[];
b=1;
for i = 200:200:4000
c = i-200;  
tmpidx = Altitude_CN>c & Altitude_CN<i;
a = length(Altitude_CN(tmpidx));
CN_alt(1:a,b) = CN_CPC(tmpidx);
b=b+1;
end
CN_alt(CN_alt==0) = NaN;
P95 = prctile(CN_alt,95);
CN_alt(CN_alt>=P95) = NaN;
CN_alt_mean= nanmean(CN_alt);


figure('Name',' Boxplot CN from CPC for each 200 meters 4 km');
b=boxplot((CN_alt),'symbol','*','outliersize',3,'color','k','orientation', 'horizontal');
h=findobj(gca,'tag','Outliers');
delete(h)
set(findobj(gca,'type','line'),'linew',1.5)
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),'y','FaceAlpha',.2,'FaceColor',[100/255,149/255,237/255])
end
hold on
plot(CN_alt_mean,1:20,'ok','MarkerSize',10,'markerfacecolor','w')
xlabel({'\it{N_{CPC}} (cm^{-3})'});
ylabel('Altitude (km)')
xlim([0 2000])
yticks(0:5:20)
yticklabels([0 1 2 3 4])
xlim padded
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gcf,'Position',[90 20 1486 842]);
JW_figure_style(gcf,'paper2');
saveas(gcf,strcat('CLARIFY_boxplot_NCPC_', strcat(f_number),'_altitude_4km',strcat(f_date),'.jpg')); %save figure as .jpg


CN_CPC_selected = CN_CPC(13250:end,1); %This is the selected area Dr. Wang requested boxplot information
Altitude_CN = Altitude(13250:end,1);
CN_alt=[];
b=1;
for i = 200:200:4000
c = i-200;  
tmpidx = Altitude_CN>c & Altitude_CN<i;
a = length(Altitude_CN(tmpidx));
CN_alt(1:a,b) = CN_CPC_selected(tmpidx);
b=b+1;
end
CN_alt(CN_alt<=0) = NaN;
CN_alt_mean= nanmean(CN_alt);

CN_alt(:,1)=NaN; %Excluding 200m boxplot
CN_alt(:,13:end)=NaN; %Excluding boxplots above 2.5 km 
CN_alt_mean(:,1)=NaN;
CN_alt_mean(:,13:end)=NaN;

figure('Name',' Boxplot CN from NCPC for each 200 meters 2.5 km');
b=boxplot((CN_alt(:,1:15)),'symbol','*','outliersize',3,'color','k','orientation', 'horizontal');
h=findobj(gca,'tag','Outliers');
delete(h)
set(findobj(gca,'type','line'),'linew',1.5)
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),'y','FaceAlpha',.2,'FaceColor',[100/255,149/255,237/255])
end
hold on
plot(CN_alt_mean(:,1:15),1:15,'ok','MarkerSize',10,'markerfacecolor','w')
xlabel('N_{CPC} (cm^{-3})')
ylabel('Altitude (km)')
yticks([0 3 5 7 10 13])
yticklabels([0 0.5 1 1.5 2 2.5])
ylim([1 13])
xlim padded
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gcf,'Position',[90 20 1486 842]);
JW_figure_style(gcf,'paper2');
saveas(gcf,strcat('CLARIFY_boxplot_NCPC_', strcat(f_number),'altitude_2.5km',strcat(f_date),'.jpg')); %save figure as .jpg
end

if option.boxplot_altitude_CO
 
CO_alt=[];
b=1;
for i = 200:200:4000
c = i-200;  
tmpidx = Altitude>c & Altitude<i;
a = length(Altitude(tmpidx));
CO_alt(1:a,b) = CO_conc(tmpidx);
b=b+1;
end
CO_alt(CO_alt<=0) = NaN;
CO_alt_mean= nanmean(CO_alt);

figure('Name','CO_altitude_selected_areas_4km');
b=boxplot((CO_alt(:,1:15)),'symbol','*','outliersize',3,'color','k','orientation', 'horizontal');
h=findobj(gca,'tag','Outliers');
delete(h)
set(findobj(gca,'type','line'),'linew',1.5)
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),'y','FaceAlpha',.2,'FaceColor',[100/255,149/255,237/255])
end
hold on
plot(CO_alt_mean(:,1:15),1:15,'ok','MarkerSize',10,'markerfacecolor','w')
xlabel('CO (ppb)')
ylabel('Altitude (km)')
xlim([0 2000])
yticks(0:5:15)
yticklabels([0 1 2 3])
xlim padded
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gcf,'Position',[90 20 1486 842]);
JW_figure_style(gcf,'paper2');
saveas(gcf,strcat('CLARIFY_boxplot_CO_altitude_', strcat(f_number),'_selected_areas_4km',strcat(f_date),'.jpg')); %save figure as .jpg


CO_conc_selected = CO_conc(13250:end,1); %CO values in the region Dr. Wang requested
Altitude_CO = Altitude(13250:end,1);
CO_alt=[];
b=1;
for i = 200:200:4000
c = i-200;  
tmpidx = Altitude_CO>c & Altitude_CO<i;
a = length(Altitude_CO(tmpidx));
CO_alt(1:a,b) = CO_conc_selected(tmpidx);
b=b+1;
end
CO_alt(CO_alt<=0) = NaN;
CO_alt_mean= nanmean(CO_alt);


CO_alt(:,1)=NaN;
CO_alt(:,13:end)=NaN;
CO_alt_mean(:,1)=NaN;
CO_alt_mean(:,13:end)=NaN;

figure('Name','CO_altitude_selected_areas_2.5km');
b=boxplot((CO_alt(:,1:15)),'symbol','*','outliersize',3,'color','k','orientation', 'horizontal');
h=findobj(gca,'tag','Outliers');
delete(h)
set(findobj(gca,'type','line'),'linew',1.5)
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),'y','FaceAlpha',.2,'FaceColor',[100/255,149/255,237/255])
end
hold on
plot(CO_alt_mean(:,1:15),1:15,'ok','MarkerSize',10,'markerfacecolor','w')
xlabel('CO (ppb)')
ylabel('Altitude (km)')
yticks([0 3 5 7 10 13])
yticklabels([0 0.5 1 1.5 2 2.5])
ylim([1 13])
xlim padded
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gcf,'Position',[90 20 1486 842]);
JW_figure_style(gcf,'paper2');
saveas(gcf,strcat('CLARIFY_boxplot_CO_', strcat(f_number),'_altitude_selected_areas',strcat(f_date),'.jpg')); %save figure as .jpg

end

if option.boxplot_altitude_PCASP
CN_PCASP_alt=[];
b=1;
for i = 200:200:4000
c = i-200;  
tmpidx = Altitude>c & Altitude<i;
a = length(Altitude(tmpidx));
CN_PCASP_alt(1:a,b) = CN_PCASP_Treated(tmpidx);
b=b+1;
end
CN_PCASP_alt(CN_PCASP_alt==0) = NaN;
P95 = prctile(CN_PCASP_alt,90);
CN_PCASP_alt(CN_PCASP_alt>=P95) = NaN;
CN_PCASP_alt_mean= nanmean(CN_PCASP_alt);

%% 
figure %1- Boxplot CN from PCASP for each 200 meters
b=boxplot(CN_PCASP_alt,'symbol','*','outliersize',3,'color','k','orientation', 'horizontal');
h=findobj(gca,'tag','Outliers');
delete(h)
set(findobj(gca,'type','line'),'linew',1.5)
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),'y','FaceAlpha',.2,'FaceColor',[100/255,149/255,237/255])
end
hold on
plot(CN_PCASP_alt_mean,1:20,'ok','MarkerSize',10,'markerfacecolor','w')
xlabel({'\it{N_{PCASP}} (cm^{-3})'});
ylabel('Altitude (km)')
yticks(0:5:20)
yticklabels([0 1 2 3 4])
xlim padded
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gcf,'Position',[90 20 1486 842]);
JW_figure_style(gcf,'paper2');
saveas(gcf,strcat('CLARIFY_boxplot_NPCASP_', strcat(f_number), '_altitude_4km',strcat(f_date),'.jpg')); %save figure as .jpg


CN_PCASP_alt(:,1)=NaN;
CN_PCASP_alt(:,13:end)=NaN;
CN_PCASP_alt_mean(:,1)=NaN;
CN_PCASP_alt_mean(:,13:end)=NaN;

figure %1- Boxplot CN from PCASP for each 200 meters
b=boxplot((CN_PCASP_alt(:,1:15)),'symbol','*','outliersize',3,'color','k','orientation', 'horizontal');
h=findobj(gca,'tag','Outliers');
delete(h)
set(findobj(gca,'type','line'),'linew',1.5)
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),'y','FaceAlpha',.2,'FaceColor',[100/255,149/255,237/255])
end
hold on
plot(CN_PCASP_alt_mean(:,1:15),1:15,'ok','MarkerSize',10,'markerfacecolor','w')
xlabel('N_{PCASP} (cm^{-3})')
ylabel('Altitude (km)')
yticks([0 3 5 7 10 13])
yticklabels([0 0.5 1 1.5 2 2.5])
ylim([1 13])
xlim padded
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gcf,'Position',[90 20 1486 842]);
JW_figure_style(gcf,'paper2');
saveas(gcf,strcat('CLARIFY_boxplot_NPCASP_', strcat(f_number), '_altitude_2.5km',strcat(f_date),'.jpg')); %save figure as .jpg

end

if option.plot_CN_CPC
CN_CPC(CN_CPC<0) = NaN;
CN_alt=[];
b=1;
for i = 100:100:4000
c = i-100;  
tmpidx = Altitude>c & Altitude<i;
a = length(Altitude(tmpidx));
CN_alt(1:a,b) = CN_CPC(tmpidx);
b=b+1;
end

CN_alt(CN_alt==0) = NaN;
P5 = prctile(CN_alt,5);
P90 = prctile(CN_alt,90);
CN_alt(CN_alt>=P90) = NaN;
CN_alt(CN_alt<=P5) = NaN;

figure ('Name','Mean N_CPC per each 100m up to altitude_4km') 
p=plot(nanmean(CN_alt),1:40,'.');
xlim([0 1200])
yticks(0:5:40)
ylim([0 40])
yticklabels(0:0.5:4)
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel('N_{CPC} (cm^{-3})')
ylabel('Altitude (km)')
set(gca,'TickDir','out');
JW_figure_style(gcf,'paper2');
p(1).MarkerSize = 30;

saveas(gcf,strcat('CLARIFY_N_CPC_', strcat(f_number),'_altitude_scatter_4km',strcat(f_date),'.jpg')); %save figure as .jpg


figure('Name','Mean N_CPC per each 100m in altitude_2.5km') 
p=plot(nanmean(CN_alt),1:40,'.','MarkerSize',20);
xlim([0 1200])
ylim([0 25])
yticks(0:5:40)
yticklabels(0:0.5:4)
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel({'\it{N_{CPC}} (cm^{-3})'});
ylabel('Altitude (km)')
set(gca,'TickDir','out');
JW_figure_style(gcf,'paper2');
p(1).MarkerSize = 30;

saveas(gcf,strcat('CLARIFY_N_CPC_scatter_', strcat(f_number),'_altitude_2.5km',strcat(f_date),'.jpg')); %save figure as .jpg

figure('Name','Median N_CPC per each 100m in altitude_2.5km') 
p=plot(nanmedian(CN_alt),1:40,'.','MarkerSize',20);
xlim([0 1200])
ylim([0 25])
yticks(0:5:40)
yticklabels(0:0.5:4)
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel({'\it{N_{CPC}} (cm^{-3})'});
ylabel('Altitude (km)')
set(gca,'TickDir','in');
JW_figure_style(gcf,'paper2');
p(1).MarkerSize = 30;
box on
ax = gca;
ax.LineWidth = 1.5;

saveas(gcf,strcat('CLARIFY_N_CPC_median_', strcat(f_number),'_altitude_2.5km',strcat(f_date),'.jpg')); %save figure as .jpg


end

if option.plot_CO
CO_alt=[];
b=1;
for i = 100:100:4000
c = i-100;  
tmpidx = Altitude>c & Altitude<i;
a = length(Altitude(tmpidx));
CO_alt(1:a,b) = CO_conc(tmpidx);
b=b+1;
end
CO_alt(CO_alt==0) = NaN;


figure('Name','Mean CO mean concentration each 100 meters up to altitude_4km')  %3 CO mean concentration for each 10 meters
p = plot(nanmean(CO_alt),1:40,'.');
xlim([0 300])
yticks(0:5:40)
yticklabels([0 1 2 3])
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel('CO (ppb)')
ylabel('Altitude (km)')
set(gca,'TickDir','out');
JW_figure_style(gcf,'paper2');
saveas(gcf,strcat('CLARIFY_CO_', strcat(f_number),'_altitude_4km_',strcat(f_date),'.jpg')); %save figure as .jpg

figure('Name','Mean CO mean concentration each 100 meters up to altitude_2.5km')  %3 CO mean concentration for each 10 meters
p = plot(nanmean(CO_alt),1:40,'.');
yticks(0:5:40)
ylim([0 25])
yticklabels(0:0.5:4)
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel('CO (ppb)')
ylabel('Altitude (km)')
set(gca,'TickDir','out');
JW_figure_style(gcf,'paper2');
p(1).MarkerSize = 30;

saveas(gcf,strcat('CLARIFY_CO_', strcat(f_number),'_altitude_2.5km_',strcat(f_date),'.jpg')); %save figure as .jpg

figure('Name','Median CO mean concentration each 100 meters up to altitude_2.5km')  %3 CO mean concentration for each 10 meters
p = plot(nanmedian(CO_alt),1:40,'.');
yticks(0:5:40)
ylim([0 25])
yticklabels(0:0.5:4)
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel('CO (ppb)')
ylabel('Altitude (km)')
set(gca,'TickDir','in');
JW_figure_style(gcf,'paper2');
p(1).MarkerSize = 30;
box on
ax = gca;
ax.LineWidth = 1.5;


saveas(gcf,strcat('CLARIFY_CO_', strcat(f_number),'_altitude_2.5km_',strcat(f_date),'.jpg')); %save figure as .jpg


end

if option.plot_CN_PCASP

CN_PCASP_alt=[];
b=1;
for i = 100:100:4000 %gathering data for each 100m 
c = i-100;  
tmpidx = Altitude>c & Altitude<i;
a = length(CN_PCASP_Treated(tmpidx));
CN_PCASP_alt(1:a,b) = CN_PCASP_Treated(tmpidx);
b=b+1;
end
CN_PCASP_alt(CN_PCASP_alt==0) = NaN;


figure('Name','Mean PCASP concentration for each 100 meters up to altitude_4km')  %3 CO mean concentration for each 10 meters
p = plot(nanmean(CN_PCASP_alt),1:40,'.');
yticks(0:5:40)
ylim([0 40])
yticklabels(0:0.5:4)
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel('N_{PCASP} (cm^{-3})')
ylabel('Altitude (km)')
set(gca,'TickDir','out');
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
JW_figure_style(gcf,'paper2');
p(1).MarkerSize = 30;


saveas(gcf,strcat('CLARIFY_PCASP_', strcat(f_number),'_altitude_4km_',strcat(f_date),'.jpg')); %save figure as .jpg

figure('Name','Mean PCASP concentration for each 100 meters up to altitude_2.5km')  %3 CO mean concentration for each 10 meters
p = plot(nanmean(CN_PCASP_alt),1:40,'.');
ylim([0 25])
yticks(0:5:40)
yticklabels(0:0.5:4)
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel({'\it{N_{PCASP}} (cm^{-3})'});
ylabel('Altitude (km)')
set(gca,'TickDir','out');
JW_figure_style(gcf,'paper2');
p(1).MarkerSize = 30;
saveas(gcf,strcat('CLARIFY_PCASP_', strcat(f_number),'_altitude_2.5km_',strcat(f_date),'.jpg')); %save figure as .jpg

figure('Name','Median PCASP concentration for each 100 meters up to altitude_2.5km')  %3 CO mean concentration for each 10 meters
p = plot(nanmedian(CN_PCASP_alt),1:40,'.');
ylim([0 25])
yticks(0:5:40)
yticklabels(0:0.5:4)
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel({'\it{N_{PCASP}} (cm^{-3})'});
ylabel('Altitude (km)')
set(gca,'TickDir','in');
JW_figure_style(gcf,'paper2');
p(1).MarkerSize = 30;
box on
ax = gca;
ax.LineWidth = 1.5;

saveas(gcf,strcat('CLARIFY_PCASP_', strcat(f_number),'_altitude_2.5km_',strcat(f_date),'.jpg')); %save figure as .jpg

end

if option.correction_PCASP


figure %4 PCASP data 
DT= datetime(PCASP_Time_treated, 'ConvertFrom', 'posixtime', 'Format', 'HH:mm');
yyaxis left
ax = gca;
ax.YColor = 'k';
plot(DT,CN_PCASP_Treated,'k')
ylabel('N_{PCASP} (cm^{-3})')
yyaxis right
ax = gca;
ax.YColor = 'b';
plot(DT,Altitude,'b')
ylabel('Altitude (m)')
xlabel('Time (UTC)')
ax.XTick = datetime(PCASP_Time, 'ConvertFrom', 'epochtime', 'Epoch', '1970-01-01', 'Format', 'HH:mm');
ax.XTickLabel = datestr(datenum(ax.XTick), 'HH:MM');
saveas(gcf,strcat('CLARIFY_', strcat(f_number),'_NPCASP_',strcat(f_date),'.jpg')); %save figure as .jpg


figure
yyaxis left
ax = gca;
ax.YColor = 'k';
plot (PCASP_Time_treated,CN_PCASP_Treated,'k')
ylabel('N_{PCASP} (cm^{-3})')
datetick('x',13)
yyaxis right
ax = gca;
ax.YColor = 'b';
plot(PCASP_Time_x(1:43637,1),Altitude,'b')
ylabel('Altitude (m)')

saveas(gcf,strcat('CLARIFY_NPCASP_', strcat(f_number),'_combined_',strcat(f_date),'.jpg')); %save figure as .jpg

end

if option.plot_potential_temp
%Physically, the potential temperature of an air parcel is the temperature the parcel would have if it were brought adiabatically to the standard pressure p* ; generally we take p* = 1000mb.
%Equation from Bolton 1980.  The computation of equivalent potential temperature. Monthly weather review, 108(7), 1046-1053.
% Mixing ration (r) for dry air = 0.2854

    Pot_temp = Temperature.*(1000./Pressure).^0.2854;

    theta_alt=[];
    b=1;
    for i = 100:100:4000
        c = i-100;
        tmpidx = Altitude>c & Altitude<i;
        a = length(Altitude(tmpidx));
        theta_alt(1:a,b) = Pot_temp(tmpidx);
        b=b+1;
    end
    theta_alt(theta_alt==0) = NaN;
    P5 = prctile(theta_alt,5);
    P90 = prctile(theta_alt,90);
    theta_alt(theta_alt>=P90) = NaN;
    theta_alt(theta_alt<=P5) = NaN;
    theta_alt_mean= nanmean(theta_alt);
    theta_alt_median= nanmedian(theta_alt);

    figure ('Name','Mean Potential Temperature each 100m up to altitude_2.5 km')
    p = plot(theta_alt_mean,1:40,'.');
    yticks(0:5:40)
    ylim([0 25])
    yticklabels(0:0.5:2.5)
    xlabel('Potential Temperature (K)')
    ylabel('Altitude (km)')
    set(gca,'TickDir','out');
    JW_figure_style(gcf,'paper2');
    p(1).MarkerSize = 30;

    saveas(gcf,strcat('CLARIFY_Potential_Temperature_', strcat(f_number),'_altitude_2.5km_',strcat(f_date),'.jpg')); %save figure as .jpg

     figure ('Name','Median Potential Temperature each 100m up to altitude_2.5 km')
    p = plot(theta_alt_median,1:40,'.');
    yticks(0:5:40)
    ylim([0 25])
    yticklabels(0:0.5:2.5)
    xlabel('Potential Temperature (K)')
    ylabel('Altitude (km)')
    set(gca,'TickDir','in');
    JW_figure_style(gcf,'paper2');
    p(1).MarkerSize = 30;
    box on
    ax = gca;
    ax.LineWidth = 1.5;


    saveas(gcf,strcat('CLARIFY_Potential_Temperature_', strcat(f_number),'_altitude_2.5km_',strcat(f_date),'.jpg')); %save figure as .jpg


end

if option.boxplot_potential_temp

    theta_alt=[];
    b=1;
    for i = 200:200:4000
        c = i-200;
        tmpidx = Altitude>c & Altitude<i;
        a = length(Altitude(tmpidx));
        theta_alt(1:a,b) = Pot_temp(tmpidx);
        b=b+1;
    end
    theta_alt(theta_alt==0) = NaN;
    P90 = prctile(theta_alt,90);
    theta_alt(theta_alt>=P90) = NaN;
    theta_alt_mean= nanmean(theta_alt);



    figure('Name',' Boxplot Potential Temperature for each 200 meters 4 km');
    b=boxplot((theta_alt),'symbol','*','outliersize',3,'color','k','orientation', 'horizontal');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    for j=1:length(h)
        patch(get(h(j),'XData'),get(h(j),'YData'),'y','FaceAlpha',.2,'FaceColor',[100/255,149/255,237/255])
    end
    hold on
    plot(theta_alt_mean,1:20,'ok','MarkerSize',10,'markerfacecolor','w')
    xlabel('Potential Temperature (K)')
    ylabel('Altitude (km)')
    % xlim([0 2000])
    yticks(0:5:20)
    yticklabels([0 1 2 3 4])
    xlim padded
    set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
    set(gcf,'Position',[90 20 1486 842]);
    JW_figure_style(gcf,'paper2');
    saveas(gcf,strcat('CLARIFY_Potential_Temperature_', strcat(f_number),'_altitude_4km',strcat(f_date),'.jpg')); %save figure as .jpg


    

    theta_alt(:,1)=NaN; %Excluding 200m boxplot
    theta_alt(:,13:end)=NaN; %Excluding boxplots above 2.5 km
    theta_alt_mean(:,1)=NaN;
    theta_alt_mean(:,13:end)=NaN;

    figure('Name',' Boxplot Potential Temperature for each 200 meters 2.5 km');
    b=boxplot((theta_alt(:,1:15)),'symbol','*','outliersize',3,'color','k','orientation', 'horizontal');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    for j=1:length(h)
        patch(get(h(j),'XData'),get(h(j),'YData'),'y','FaceAlpha',.2,'FaceColor',[100/255,149/255,237/255])
    end
    hold on
    plot(theta_alt_mean(:,1:15),1:15,'ok','MarkerSize',10,'markerfacecolor','w')
    xlabel('Potential Temperature (K)')
    ylabel('Altitude (km)')
    yticks([0 3 5 7 10 13])
    yticklabels([0 0.5 1 1.5 2 2.5])
    ylim([1 13])
    xlim padded
    set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
    set(gcf,'Position',[90 20 1486 842]);
    JW_figure_style(gcf,'paper2');
    saveas(gcf,strcat('CLARIFY_boxplot_Potential_temp_', strcat(f_number),'altitude_2.5km',strcat(f_date),'.jpg')); %save figure as .jpg

end
