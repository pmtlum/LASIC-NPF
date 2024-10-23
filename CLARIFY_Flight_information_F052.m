if 1
cd('C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\LASIC\CLARIFY\Zuidema_clarify_data')
% cd('/Users/marcusbatista/Library/CloudStorage/OneDrive-UniversityofMiami/University_of_Miami/Thesis/DOE_Projects/LASIC/CLARIFY/Zuidema_clarify_data')
filename='core_faam_20170905_v004_r2_c052_1hz.nc';
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

filename='core-cloud-phy_faam_20170905_v501_r0_c052_pcasp1.nc';
PCASP1_Time =  ncread(filename,'Time');
CN_PCASP1 = ncread(filename,'CDP_CONC');
CN_PCASP1(CN_PCASP1<0) = NaN;
CN_PCASP1(CN_PCASP1==3) = NaN;

filename='core-cloud-phy_faam_20170905_v501_r0_c052_pcasp2.nc';
PCASP2_Time =  ncread(filename,'Time');
CN_PCASP2 = ncread(filename,'CDP_CONC');
CN_PCASP2(CN_PCASP2<0) = NaN;
CN_PCASP2(CN_PCASP2==3) = NaN;

filename='core-cloud-phy_faam_20170905_v600_r0_c052.nc';
PCASP_altitude_time= ncread(filename,'time');
PCASP_Latitude=ncread(filename,'latitude');
PCASP_Longitude=ncread(filename,'longitude');
PCASP_Altitude=ncread(filename,'altitude');

tempdate=[2017,09,05];
s = seconds(PCASP1_Time);  
s.Format = 'hh:mm:ss';
s=datevec(s);
s=s(:,4:6);
PCASP1_Time_x=datenum(tempdate(:,1),tempdate(:,2),tempdate(:,3),s(:,1),s(:,2),s(:,3));  

PCASP_Altitude_treated = PCASP_Altitude(4358:16898,1);
PCASP1_Time_treated = PCASP1_Time_x(1100:13640,1);
CN_PCASP_Treated = CN_PCASP1(32748:45288,1);
set(0, 'DefaultAxesFontName', 'Times New Roman');
end

option.location_tracking =0;
option.boxplot_altitude_CPC =0;
option.boxplot_altitude_CO = 0;
option.boxplot_altitude_PCASP =0;
option.temporal_CN_CPC = 0;
option.temporal_CO = 0;
option.temporal_CN_PCASP = 0;
option.correction_PCASP = 0;
option.potential_temp =1;



if option.location_tracking
figure('Name','N_CPC concentrations_map');
rgb = imread('Figure_location.png');
imshow(rgb);
hold on
M = size(rgb,1);
N = size(rgb,2);
bleft=[-19.961927 -43.650888];
tright=[21.970193 25.001502];
dist=tright-bleft;

hold on
long=Longitude;
lat=Latitude;
alt=Altitude;
scatter3((long-bleft(1))/dist(1)*N,(tright(2)-lat)/dist(2)*M,alt,3,CN_CPC);
caxis([0 1000]);
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

saveas(gcf,strcat('N_CPC concentrations during flight_', strcat(f_number),'_on_', strcat(f_date),'.jpg')); %save figure as .jpg

%% 
figure('Name','N_PCASP concentrations_map');
rgb = imread('Figure_location.png');
imshow(rgb);
hold on
M = size(rgb,1);
N = size(rgb,2);
bleft=[-19.961927 -43.650888];
tright=[21.970193 25.001502];
dist=tright-bleft;

hold on
long=Longitude(1:12541,1);
lat=Latitude(1:12541,1);
alt=PCASP_Altitude_treated(1:12541,1);;
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

saveas(gcf,strcat('N_PCASP concentrations during flight_', strcat(f_number),'_on_', strcat(f_date),'.jpg')); %save figure as .jpg

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
P95 = prctile(CN_alt,90);
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
xlabel('N_{CPC} (cm^{-3})')
ylabel('Altitude (km)')
xlim([0 2000])
yticks(0:5:20)
yticklabels([0 1 2 3 4])
xlim padded
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gcf,'Position',[90 20 1486 842]);
JW_figure_style(gcf,'paper2');
saveas(gcf,strcat('CLARIFY_boxplot_NCPC_', strcat(f_number), '_altitude_4km_',strcat(f_date),'.jpg')); %save figure as .jpg


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
saveas(gcf,strcat('CLARIFY_boxplot_NCPC_flight_', strcat(f_number), '_altitude_2.5km_',strcat(f_date),'.jpg')); %save figure as .jpg
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
saveas(gcf,strcat('CLARIFY_boxplot_CO_', strcat(f_number),'_altitude_selected_areas_4km_',strcat(f_date),'.jpg')); %save figure as .jpg


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
saveas(gcf,strcat('CLARIFY_boxplot_CO_', strcat(f_number),'_altitude_selected_areas_',strcat(f_date),'.jpg')); %save figure as .jpg

end

if option.boxplot_altitude_PCASP
CN_PCASP_alt=[];
b=1;
for i = 200:200:4000
c = i-200;  
tmpidx = PCASP_Altitude_treated>c & PCASP_Altitude_treated<i;
a = length(PCASP_Altitude_treated(tmpidx));
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
xlabel('N_{PCASP} (cm^{-3})')
ylabel('Altitude (km)')
yticks(0:5:20)
yticklabels([0 1 2 3 4])
xlim padded
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gcf,'Position',[90 20 1486 842]);
JW_figure_style(gcf,'paper2');
saveas(gcf,strcat('CLARIFY_boxplot_NPCASP_', strcat(f_number), '_altitude_4km_',strcat(f_date),'.jpg')); %save figure as .jpg


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
saveas(gcf,strcat('CLARIFY_boxplot_NPCASP_', strcat(f_number), '_altitude_2.5km_',strcat(f_date),'.jpg')); %save figure as .jpg

end

if option.temporal_CN_CPC
CN_CPC(CN_CPC<0) = NaN;
CN_alt=[];
b=1;
for i = 10:10:4000
c = i-10;  
tmpidx = Altitude>c & Altitude<i;
a = length(Altitude(tmpidx));
CN_alt(1:a,b) = CN_CPC(tmpidx);
b=b+1;
end

CN_alt(CN_alt==0) = NaN;
figure ('Name','Mean N_CPC per each 10m up to altitude_4km') 
plot(nanmean(CN_alt),1:400,'.','MarkerSize',20)
xlim([0 2000])
yticks([0 100 200 300 400])
yticklabels([0 1 2 3 4])
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel('N_{CPC} (cm^{-3})')
ylabel('Altitude (km)')
set(gca,'TickDir','out');
JW_figure_style(gcf,'paper2');

saveas(gcf,strcat('CLARIFY_N_CPC_', strcat(f_number),'_altitude_scatter_4km_',strcat(f_date),'.jpg')); %save figure as .jpg

CN_alt(:,1:20)=NaN; %Excluding 200m boxplot
CN_alt(:,250:end)=NaN; %Excluding boxplots above 2.5 km 

figure('Name','Mean N_CPC per each 10m in altitude_2.5km') 
plot(nanmean(CN_alt),1:400,'.','MarkerSize',20)
xlim([0 2000])
yticks(0:50:400)
yticklabels(0:0.5:4)
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel('N_{CPC} (cm^{-3})')
ylabel('Altitude (km)')
set(gca,'TickDir','out');
JW_figure_style(gcf,'paper2');

saveas(gcf,strcat('CLARIFY_N_CPC_scatter_', strcat(f_number),'_altitude_2.5km_',strcat(f_date),'.jpg')); %save figure as .jpg

end

if option.temporal_CO
CO_alt=[];
b=1;
for i = 10:10:4000;
c = i-10;  
tmpidx = Altitude>c & Altitude<i;
a = length(Altitude(tmpidx));
CO_alt(1:a,b) = CO_conc(tmpidx);
b=b+1;
end
CO_alt(CO_alt==0) = NaN;


figure('Name','Mean CO mean concentration for each 10 meters up to altitude_4km')  %3 CO mean concentration for each 10 meters
plot(nanmean(CO_alt),1:400,'.','MarkerSize',20)
xlim([0 300])
yticks([0 100 200 300 400])
yticklabels([0 1 2 3])
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel('CO (ppb)')
ylabel('Altitude (km)')
set(gca,'TickDir','out');
JW_figure_style(gcf,'paper2');
saveas(gcf,strcat('CLARIFY_CO_', strcat(f_number),'_altitude_4km_',strcat(f_date),'.jpg')); %save figure as .jpg

CO_alt(:,1:20)=NaN; %Excluding 200m boxplot
CO_alt(:,250:end)=NaN; %Excluding boxplots above 2.5 km 

figure('Name','Mean CO mean concentration for each 10 meters up to altitude_2.5km')  %3 CO mean concentration for each 10 meters
plot(nanmean(CO_alt),1:400,'.','MarkerSize',20)
yticks(0:50:400)
yticklabels(0:0.5:4)
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel('CO (ppb)')
ylabel('Altitude (km)')
set(gca,'TickDir','out');
JW_figure_style(gcf,'paper2');

saveas(gcf,strcat('CLARIFY_CO_', strcat(f_number),'_altitude_2.5km_',strcat(f_date),'.jpg')); %save figure as .jpg

end

if option.temporal_CN_PCASP

CN_PCASP_alt=[];
b=1;
for i = 10:10:4000
c = i-10;  
tmpidx = PCASP_Altitude_treated>c & PCASP_Altitude_treated<i;
a = length(CN_PCASP_Treated(tmpidx));
CN_PCASP_alt(1:a,b) = CN_PCASP_Treated(tmpidx);
b=b+1;
end
CN_PCASP_alt(CN_PCASP_alt==0) = NaN;


figure('Name','Mean PCASP concentration for each 10 meters up to altitude_4km')  %3 CO mean concentration for each 10 meters
plot(nanmean(CN_PCASP_alt),1:400,'.','MarkerSize',20)
yticks([0 100 200 300 400])
yticklabels([0 1 2 3])
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel('N_{PCASP} (cm^{-3})')
ylabel('Altitude (km)')
set(gca,'TickDir','out');
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
JW_figure_style(gcf,'paper2');

saveas(gcf,strcat('CLARIFY_PCASP_', strcat(f_number),'_altitude_4km_',strcat(f_date),'.jpg')); %save figure as .jpg

CN_PCASP_alt(:,1:20)=NaN; %Excluding 200m boxplot
CN_PCASP_alt(:,250:end)=NaN; %Excluding boxplots above 2.5 km 

figure('Name','Mean PCASP concentration for each 10 meters up to altitude_2.5km')  %3 CO mean concentration for each 10 meters
plot(nanmean(CN_PCASP_alt),1:400,'.','MarkerSize',20)
yticks(0:50:400)
yticklabels(0:0.5:4)
set(gca,'TickDir','out', 'XMinorTick','on','YMinorTick','on','FontSize',25, 'LineWidth',2);
set(gca, 'FontSize',25, 'LineWidth',2)
xlabel('N_{PCASP} (cm^{-3})')
ylabel('Altitude (km)')
set(gca,'TickDir','out');
JW_figure_style(gcf,'paper2');

saveas(gcf,strcat('CLARIFY_PCASP_', strcat(f_number),'_altitude_2.5km_',strcat(f_date),'.jpg')); %save figure as .jpg

end
if option.correction_PCASP

figure %4 PCASP data 
DT= datetime(PCASP1_Time, 'ConvertFrom', 'posixtime', 'Format', 'HH:mm');
yyaxis left
ax = gca;
ax.YColor = 'k';
plot(DT,CN_PCASP1,'k')
ylabel('N_{PCASP} (cm^{-3})')
yyaxis right
ax = gca;
ax.YColor = 'b';
plot(DT,PCASP_Altitude,'b')
ylabel('Altitude (m)')
xlabel('Time (UTC)')
ax.XTick = datetime(PCASP1_Time(1):3600:PCASP1_Time(end), 'ConvertFrom', 'epochtime', 'Epoch', '1970-01-01', 'Format', 'HH:mm');
ax.XTickLabel = datestr(datenum(ax.XTick), 'HH:MM');
saveas(gcf,strcat('CLARIFY_NPCASP_', strcat(f_number),'_',strcat(f_date),'.jpg')); %save figure as .jpg


figure
yyaxis left
ax = gca;
ax.YColor = 'k';
plot (PCASP1_Time_treated,CN_PCASP_Treated,'k')
ylabel('N_{PCASP} (cm^{-3})')
datetick('x',13)
yyaxis right
ax = gca;
ax.YColor = 'b';
plot(PCASP1_Time_x(1:43637,1),PCASP_Altitude_treated,'b')
ylabel('Altitude (m)')

saveas(gcf,strcat('CLARIFY_NPCASP_', strcat(f_number),'_combined_',strcat(f_date),'.jpg')); %save figure as .jpg

end

if option.potential_temp 

    Pot_temp = Temperature.*(1000./Pressure).^0.286;

    theta_alt=[];
    b=1;
    for i = 10:10:4000
        c = i-10;
        tmpidx = Altitude>c & Altitude<i;
        a = length(Altitude(tmpidx));
        theta_alt(1:a,b) = Pot_temp(tmpidx);
        b=b+1;
    end

    theta_alt(:,1:20)=NaN; %Excluding bata below 200m 
    theta_alt(:,250:end)=NaN; %Excluding data above 2.5 km
    theta_alt(theta_alt==0) = NaN;
    
    figure ('Name','Mean Potential Temperature per each 10m up to altitude_2.5 km')
    plot(nanmean(theta_alt),1:400,'.','MarkerSize',20)
    yticks(0:50:400)
    yticklabels(0:0.5:4)
    set(gca, 'FontSize',25, 'LineWidth',2)
    xlabel('Potential Temperature (K)')
    ylabel('Altitude (km)')
    set(gca,'TickDir','out');
    JW_figure_style(gcf,'paper2');

    saveas(gcf,strcat('CLARIFY_Potential_Temperature_', strcat(f_number),'_altitude_2.5km_',strcat(f_date),'.jpg')); %save figure as .jpg


end
