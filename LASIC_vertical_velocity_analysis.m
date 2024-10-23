 clear all
 close all

option.correlationplot_velocity_particles_CN20=0;
option.correlationplot_velocity_particles_CN30=0;
option.correlationplot_multiple_vvelocity_particles = 0;
option.colorplot.v_velocityv_DL = 0;
option.colorplot.v_velocityv_DL_VAP = 0;
option.save_image = 0;
option.vvelocity.DL_VAP = 1;
option.colorplot.v_velocityv_DL_VAP_corrected = 1;


set(0, 'DefaultAxesFontName', 'Arial');
if option.correlationplot_velocity_particles_CN20

%Creating variables for each fraction bin.
CN_20_P25=[];
CN_20_P50=[];
CN_20_P75=[];
CN_20_P100=[];



for week_num=1:74 %Extracting the size distribution function for each week number   
    % load (strcat('C:\Users\mxb2517\OneDrive - University of  Miami\University_of_Miami\Thesis\DOE_Projects\LASIC\LASIC_Matlab_Code\Weekly_data_files_Marcus\Week',num2str(week_num)));
    % %Desktop
    load (strcat('/Users/marcusbatista/Library/CloudStorage/OneDrive-UniversityofMiami/University_of_Miami/Thesis/DOE_Projects/LASIC/LASIC_Matlab_Code/Weekly_data_files_Marcus/Week',num2str(week_num))); %Macbook
    struct_name_array={'week_num','SMPS_temp','CPC_temp','MET_temp','CO_temp','PSAP_temp','SKYRAD_temp','SP2_temp','DL_temp'};
    for i=1:1:length(struct_name_array)
        struct_name=struct_name_array{i};
        eval([struct_name,'=ground_weekly.',struct_name]);
    end

    DL_check=~isempty(SMPS_temp.CN_ratio.CN20_NTotal_combined.V_velocity_combined); % We are missing SMPS data from flight 13, so this is checking if SMPS variable is double or struct

    if DL_check==1 % If we have DL data, it will load all variable in for all weeks
        CN_20_P25=[CN_20_P25; SMPS_temp.CN_ratio.CN20_NTotal_combined.V_velocity_combined.P25]; %repeat the P25 so we don`t need to jump lines
        CN_20_P50=[CN_20_P50; SMPS_temp.CN_ratio.CN20_NTotal_combined.V_velocity_combined.P50];
        CN_20_P75=[CN_20_P75; SMPS_temp.CN_ratio.CN20_NTotal_combined.V_velocity_combined.P75];
        CN_20_P100=[CN_20_P100; SMPS_temp.CN_ratio.CN20_NTotal_combined.V_velocity_combined.P100];
        
    else
        
        CN_20_P25(week_num,1)=nan; %If we do not have DL data, insert NAN in all size columns
        CN_20_P50(week_num,1)=nan;
        CN_20_P75(week_num,1)=nan;
        CN_20_P100(week_num,1)=nan;
    end
end


    %CN_20 fraction
    boxp_velocity20(1:100504,1:4)=NaN ;
    boxp_velocity20(:,1) = CN_20_P25;
    boxp_velocity20(1:1156,2) = CN_20_P50;
    boxp_velocity20(1:72,3) = CN_20_P75;
    boxp_velocity20(1:61,4) = CN_20_P100;
    
    
    figure (1)
    boxplot(boxp_velocity20)
    xlabel('CN20/CNtotal Ratio')
    ylabel('Vertical Velocity(m/s)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({0.25, 0.50, 0.75, 1})
    set(gca, 'FontSize',16)
end

if option.correlationplot_velocity_particles_CN30

    %Creating variables for each fraction bin.

CN_30_P20=[];
CN_30_P40=[];
CN_30_P60=[];
CN_30_P80=[];

for week_num=50 %Extracting the size distribution function for each week number   
    load (strcat('C:\Users\Marcus\OneDrive - University of Miami\University of Miami\Thesis\DOE Projects\LASIC\LASIC Matlab Code\Weekly_data_files_Marcus\Week',num2str(week_num)));
    
    struct_name_array={'week_num','SMPS_temp','MET_temp','DL_temp'};
    for i=1:1:length(struct_name_array)
        struct_name=struct_name_array{i};
        eval([struct_name,'=ground_weekly.',struct_name]);
    end

    DL_check=~isempty(SMPS_temp.CN_ratio.CN30_NTotal_combined.V_velocity_combined); % We are missing SMPS data from flight 13, so this is checking if SMPS variable is double or struct

    if DL_check==1 % If we have DL data, it will load all variable in for all weeks

        CN_30_P20=[CN_30_P20; SMPS_temp.CN_ratio.CN30_NTotal_combined.V_velocity_combined.P20]; %repeat the P25 so we don`t need to jump lines
        CN_30_P40=[CN_30_P40; SMPS_temp.CN_ratio.CN30_NTotal_combined.V_velocity_combined.P40];
        CN_30_P60=[CN_30_P60; SMPS_temp.CN_ratio.CN30_NTotal_combined.V_velocity_combined.P60];
        CN_30_P80=[CN_30_P80; SMPS_temp.CN_ratio.CN30_NTotal_combined.V_velocity_combined.P80];
        
    else
       

        CN_30_P20(week_num,1)=nan; %If we do not have DL data, insert NAN in all size columns
        CN_30_P40(week_num,1)=nan;
        CN_30_P60(week_num,1)=nan;
        CN_30_P80(week_num,1)=nan;
    end

   
end

 %CN_30 fraction
    boxp_velocity30(1:length(CN_30_P20),1:4)=NaN ;
    boxp_velocity30(1:length(CN_30_P20),1) = CN_30_P20;
    boxp_velocity30(1:length(CN_30_P40),2) = CN_30_P40;
    boxp_velocity30(1:length(CN_30_P60),3) = CN_30_P60;
    boxp_velocity30(1:length(CN_30_P80),4) = CN_30_P80;
  
    
    figure (2)
    b=boxplot(boxp_velocity30,'symbol','*','outliersize',1,'color','k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    patch(get(h(1),'XData'),get(h(1),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(2),'XData'),get(h(2),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(3),'XData'),get(h(3),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(4),'XData'),get(h(4),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    hold on
    plot(nanmean(boxp_velocity30),'ok','MarkerSize',10,'markerfacecolor','w');

    xlabel('CN30/CNtotal Ratio')
    ylabel('Vertical Velocity (m/s)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({0.2, 0.40, 0.6, 0.8})
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[90 20 1486 842]);


%     if option.save_image
%         saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_boxplots(2)'),'.jpg')); %save figure as .jpg
%     end

end

if option.correlationplot_multiple_vvelocity_particles 

    CN_30_P20=[];
    CN_30_P40=[];
    CN_30_P60=[];
    CN_30_P80=[];

    for week_num=14:73 %Extracting the size distribution function for each week number No DL data until 14 week. No SMPS data on week 74
    load (strcat('C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\LASIC\LASIC_Matlab_Code\Weekly_data_files_Marcus\Week',num2str(week_num)));
    
    struct_name_array={'week_num','SMPS_temp','MET_temp','DL_temp'};
    for i=1:1:length(struct_name_array)
        struct_name=struct_name_array{i};
        eval([struct_name,'=ground_weekly.',struct_name]);
    end

    DL_check=~isempty(SMPS_temp.CN_ratio.CN30_NTotal_combined.V_velocity_combined); % We are missing SMPS data from day 13, so this is checking if SMPS variable is double or struct

    if DL_check==1 % If we have DL data, it will load all variable in for all weeks

        CN_30_P20=[CN_30_P20; SMPS_temp.CN_ratio.CN30_NTotal_combined.V_velocity_combined.P20]; %repeat the P20 so we don`t need to jump lines
        CN_30_P40=[CN_30_P40; SMPS_temp.CN_ratio.CN30_NTotal_combined.V_velocity_combined.P40];
        CN_30_P60=[CN_30_P60; SMPS_temp.CN_ratio.CN30_NTotal_combined.V_velocity_combined.P60];
        CN_30_P80=[CN_30_P80; SMPS_temp.CN_ratio.CN30_NTotal_combined.V_velocity_combined.P80];
        
    else
    a = 1+1;    % 
        % 
        % CN_30_P20(week_num,1)=nan; %If we do not have DL data, insert NAN in all size columns
        % CN_30_P40(week_num,1)=nan;
        % CN_30_P60(week_num,1)=nan;
        % CN_30_P80(week_num,1)=nan;
    end

   
end

 % H = 105m
    boxp_velocity_105(1:length(CN_30_P20),1:4)=NaN ;
    boxp_velocity_105(1:length(CN_30_P20),1) = CN_30_P20(:,1);
    boxp_velocity_105(1:length(CN_30_P40),2) = CN_30_P40(:,1);
    boxp_velocity_105(1:length(CN_30_P60),3) = CN_30_P60(:,1);
    boxp_velocity_105(1:length(CN_30_P80),4) = CN_30_P80(:,1);

    % H = 225m
    boxp_velocity_225(1:length(CN_30_P20),1:4)=NaN ;
    boxp_velocity_225(1:length(CN_30_P20),1) = CN_30_P20(:,2);
    boxp_velocity_225(1:length(CN_30_P40),2) = CN_30_P40(:,2);
    boxp_velocity_225(1:length(CN_30_P60),3) = CN_30_P60(:,2);
    boxp_velocity_225(1:length(CN_30_P80),4) = CN_30_P80(:,2);


    % H = 315m
    boxp_velocity_315(1:length(CN_30_P20),1:4)=NaN ;
    boxp_velocity_315(1:length(CN_30_P20),1) = CN_30_P20(:,3);
    boxp_velocity_315(1:length(CN_30_P40),2) = CN_30_P40(:,3);
    boxp_velocity_315(1:length(CN_30_P60),3) = CN_30_P60(:,3);
    boxp_velocity_315(1:length(CN_30_P80),4) = CN_30_P80(:,3);

     % H = 405m
    boxp_velocity_405(1:length(CN_30_P20),1:4)=NaN ;
    boxp_velocity_405(1:length(CN_30_P20),1) = CN_30_P20(:,4);
    boxp_velocity_405(1:length(CN_30_P40),2) = CN_30_P40(:,4);
    boxp_velocity_405(1:length(CN_30_P60),3) = CN_30_P60(:,4);
    boxp_velocity_405(1:length(CN_30_P80),4) = CN_30_P80(:,4);

    % H = 525m
    boxp_velocity_525(1:length(CN_30_P20),1:4)=NaN ;
    boxp_velocity_525(1:length(CN_30_P20),1) = CN_30_P20(:,5);
    boxp_velocity_525(1:length(CN_30_P40),2) = CN_30_P40(:,5);
    boxp_velocity_525(1:length(CN_30_P60),3) = CN_30_P60(:,5);
    boxp_velocity_525(1:length(CN_30_P80),4) = CN_30_P80(:,5);

     % H = 615m
    boxp_velocity_615(1:length(CN_30_P20),1:4)=NaN ;
    boxp_velocity_615(1:length(CN_30_P20),1) = CN_30_P20(:,6);
    boxp_velocity_615(1:length(CN_30_P40),2) = CN_30_P40(:,6);
    boxp_velocity_615(1:length(CN_30_P60),3) = CN_30_P60(:,6);
    boxp_velocity_615(1:length(CN_30_P80),4) = CN_30_P80(:,6);

    % H = 705m
    boxp_velocity_705(1:length(CN_30_P20),1:4)=NaN ;
    boxp_velocity_705(1:length(CN_30_P20),1) = CN_30_P20(:,7);
    boxp_velocity_705(1:length(CN_30_P40),2) = CN_30_P40(:,7);
    boxp_velocity_705(1:length(CN_30_P60),3) = CN_30_P60(:,7);
    boxp_velocity_705(1:length(CN_30_P80),4) = CN_30_P80(:,7);

    % H = 825m
    boxp_velocity_825(1:length(CN_30_P20),1:4)=NaN ;
    boxp_velocity_825(1:length(CN_30_P20),1) = CN_30_P20(:,8);
    boxp_velocity_825(1:length(CN_30_P40),2) = CN_30_P40(:,8);
    boxp_velocity_825(1:length(CN_30_P60),3) = CN_30_P60(:,8);
    boxp_velocity_825(1:length(CN_30_P80),4) = CN_30_P80(:,8);

    % H = 915m
    boxp_velocity_915(1:length(CN_30_P20),1:4)=NaN ;
    boxp_velocity_915(1:length(CN_30_P20),1) = CN_30_P20(:,9);
    boxp_velocity_915(1:length(CN_30_P40),2) = CN_30_P40(:,9);
    boxp_velocity_915(1:length(CN_30_P60),3) = CN_30_P60(:,9);
    boxp_velocity_915(1:length(CN_30_P80),4) = CN_30_P80(:,9);

    % H = 1005m
    boxp_velocity_1005(1:length(CN_30_P20),1:4)=NaN ;
    boxp_velocity_1005(1:length(CN_30_P20),1) = CN_30_P20(:,10);
    boxp_velocity_1005(1:length(CN_30_P40),2) = CN_30_P40(:,10);
    boxp_velocity_1005(1:length(CN_30_P60),3) = CN_30_P60(:,10);
    boxp_velocity_1005(1:length(CN_30_P80),4) = CN_30_P80(:,10);


     figure (1)
    b=boxplot(boxp_velocity_105,'symbol','*','outliersize',1,'color','k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    patch(get(h(1),'XData'),get(h(1),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(2),'XData'),get(h(2),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(3),'XData'),get(h(3),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(4),'XData'),get(h(4),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    hold on
    plot(nanmean(boxp_velocity_105),'ok','MarkerSize',10,'markerfacecolor','w');

  xlabel('f_{<30 nm} (%)')
    ylabel('Vertical Velocity at 105m (m/s)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({0.2, 0.40, 0.6, 0.8})
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[231 311 684 623]);
    ylim([-4 4]);

     if option.save_image
        saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_boxplot_105'),'.jpg')); %save figure as .jpg
    end


     figure (2)
    b=boxplot(boxp_velocity_225,'symbol','*','outliersize',1,'color','k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    patch(get(h(1),'XData'),get(h(1),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(2),'XData'),get(h(2),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(3),'XData'),get(h(3),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(4),'XData'),get(h(4),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    hold on
    plot(nanmean(boxp_velocity_225),'ok','MarkerSize',10,'markerfacecolor','w');

    xlabel('f_{<30 nm} (%)')
    ylabel('Vertical Velocity at 225m (m/s)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({0.2, 0.40, 0.6, 0.8})
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[231 311 684 623]);
    ylim([-4 4]);

     if option.save_image
        saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_boxplot_225'),'.jpg')); %save figure as .jpg
     end
   
    figure (3)
    b=boxplot(boxp_velocity_315,'symbol','*','outliersize',1,'color','k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    patch(get(h(1),'XData'),get(h(1),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(2),'XData'),get(h(2),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(3),'XData'),get(h(3),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(4),'XData'),get(h(4),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    hold on
    plot(nanmean(boxp_velocity_315),'ok','MarkerSize',10,'markerfacecolor','w');

   xlabel('f_{<30 nm} (%)')
    ylabel('Vertical Velocity at 315m (m/s)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({0.2, 0.40, 0.6, 0.8})
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[231 311 684 623]);
    ylim([-4 4]);

    if option.save_image
        saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_boxplot_315'),'.jpg')); %save figure as .jpg
    end

      figure (4)
    b=boxplot(boxp_velocity_405,'symbol','*','outliersize',1,'color','k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    patch(get(h(1),'XData'),get(h(1),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(2),'XData'),get(h(2),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(3),'XData'),get(h(3),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(4),'XData'),get(h(4),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    hold on
    plot(nanmean(boxp_velocity_405),'ok','MarkerSize',10,'markerfacecolor','w');

   xlabel('f_{<30 nm} (%)')
    ylabel('Vertical Velocity at 405m (m/s)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({0.2, 0.40, 0.6, 0.8})
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[231 311 684 623]);
    ylim([-4 4]);

     if option.save_image
        saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_boxplot_405'),'.jpg')); %save figure as .jpg
     end

      figure (5)
    b=boxplot(boxp_velocity_525,'symbol','*','outliersize',1,'color','k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    patch(get(h(1),'XData'),get(h(1),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(2),'XData'),get(h(2),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(3),'XData'),get(h(3),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(4),'XData'),get(h(4),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    hold on
    plot(nanmean(boxp_velocity_525),'ok','MarkerSize',10,'markerfacecolor','w');

    xlabel('f_{<30 nm} (%)')
    ylabel('Vertical Velocity at 525m (m/s)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({0.2, 0.40, 0.6, 0.8})
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[231 311 684 623]);
    ylim([-4 4]);

     if option.save_image
        saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_boxplot_525'),'.jpg')); %save figure as .jpg
    end

figure (6)
    b=boxplot(boxp_velocity_615,'symbol','*','outliersize',1,'color','k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    patch(get(h(1),'XData'),get(h(1),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(2),'XData'),get(h(2),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(3),'XData'),get(h(3),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(4),'XData'),get(h(4),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    hold on
    plot(nanmean(boxp_velocity_615),'ok','MarkerSize',10,'markerfacecolor','w');

   xlabel('f_{<30 nm} (%)')
    ylabel('Vertical Velocity at 615m (m/s)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({0.2, 0.40, 0.6, 0.8})
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[231 311 684 623]);
    ylim([-4 4]);

    if option.save_image
        saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_boxplot_615'),'.jpg')); %save figure as .jpg
    end

figure (7)
    b=boxplot(boxp_velocity_705,'symbol','*','outliersize',1,'color','k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    patch(get(h(1),'XData'),get(h(1),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(2),'XData'),get(h(2),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(3),'XData'),get(h(3),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(4),'XData'),get(h(4),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    hold on
    plot(nanmean(boxp_velocity_705),'ok','MarkerSize',10,'markerfacecolor','w');

    xlabel('f_{<30 nm} (%)')
    ylabel('Vertical Velocity at 705m (m/s)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({0.2, 0.40, 0.6, 0.8})
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[231 311 684 623]);
    ylim([-4 4]);

    if option.save_image
        saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_boxplot_705'),'.jpg')); %save figure as .jpg
    end

figure (8)
    b=boxplot(boxp_velocity_825,'symbol','*','outliersize',1,'color','k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    patch(get(h(1),'XData'),get(h(1),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(2),'XData'),get(h(2),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(3),'XData'),get(h(3),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(4),'XData'),get(h(4),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    hold on
    plot(nanmean(boxp_velocity_825),'ok','MarkerSize',10,'markerfacecolor','w');

    xlabel('f_{<30 nm} (%)')
    ylabel('Vertical Velocity at 825m (m/s)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({0.2, 0.40, 0.6, 0.8})
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[231 311 684 623]);
    ylim([-4 4]);

    if option.save_image
        saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_boxplot_825'),'.jpg')); %save figure as .jpg
    end

    figure (9)
    b=boxplot(boxp_velocity_915,'symbol','*','outliersize',1,'color','k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    patch(get(h(1),'XData'),get(h(1),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(2),'XData'),get(h(2),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(3),'XData'),get(h(3),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(4),'XData'),get(h(4),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    hold on
    plot(nanmean(boxp_velocity_915),'ok','MarkerSize',10,'markerfacecolor','w');

    xlabel('f_{<30 nm} (%)')
    ylabel('Vertical Velocity at 915m (m/s)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({0.2, 0.40, 0.6, 0.8})
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[231 311 684 623]);
    ylim([-4 4]);

    if option.save_image
        saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_boxplot_915'),'.jpg')); %save figure as .jpg
    end

     figure (10)
    b=boxplot(boxp_velocity_1005,'symbol','*','outliersize',1,'color','k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    patch(get(h(1),'XData'),get(h(1),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(2),'XData'),get(h(2),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(3),'XData'),get(h(3),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(4),'XData'),get(h(4),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    hold on
    plot(nanmean(boxp_velocity_1005),'ok','MarkerSize',10,'markerfacecolor','w');

    xlabel('f_{<30 nm} (%)')
    ylabel('Vertical Velocity at 1005m (m/s)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({0.2, 0.40, 0.6, 0.8})
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[231 311 684 623]);
    ylim([-4 4]);;

    if option.save_image
        saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_boxplot_1005'),'.jpg')); %save figure as .jpg
    end
end

if option.colorplot.v_velocityv_DL

    CN_30_P20=[];
    CN_30_P40=[];
    CN_30_P60=[];
    CN_30_P80=[];
    VV_P20 = [];
    VV_P40 = [];
    VV_P60 = [];
    VV_P80 = [];
    V_vel= [];
    V_vel_total= [];

    for week_num=14:74 %Extracting the size distribution function for each week number
    load (strcat('C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\LASIC\LASIC_Matlab_Code\Weekly_data_files_Marcus\Week',num2str(week_num)));
    % load (strcat('/Users/marcusbatista/Library/CloudStorage/OneDrive-UniversityofMiami/University_of_Miami/Thesis/DOE_Projects/LASIC/LASIC_Matlab_Code/Weekly_data_files_Marcus/Week',num2str(week_num))); %Macbook

    struct_name_array={'week_num','SMPS_temp','MET_temp','DL_temp','DL_VAP_temp'};
    for i=1:1:length(struct_name_array)
        struct_name=struct_name_array{i};
        eval([struct_name,'=ground_weekly.',struct_name]);
    end

    DL_check=~isempty(DL_temp.radial_velocity); % We are missing SMPS data from day 13, so this is checking if SMPS variable is double or struct

    if DL_check==1 % If we have DL data, it will load all variable in for all weeks
 
        % V_vv =[4,88,11,14,18,21,24,28,31,34]; 
        % V_velocity = DL_temp.radial_velocity(V_vv,1:end);
       
        a = length(DL_temp.height); %Interpolation between DL(10 min) and SMPS data(5 min)
        for i = 1:a
            V_vel_interp(:,i) = interp1(DL_temp.date_time,DL_temp.radial_velocity(i,1:end),SMPS_temp.date_time);
        end
       
        V_vel = [V_vel; V_vel_interp]; %Storing the interpolated data for all heights
        
        tmpix_20= (SMPS_temp.CN30_NTotal <= 0.2); %Fraction of <=20% of CN<30 in CNtotal
        tmpix_40= (SMPS_temp.CN30_NTotal > 0.2 & SMPS_temp.CN30_NTotal <= 0.4);%Fraction of 20-40% of CN<30 in CNtotal
        tmpix_60= (SMPS_temp.CN30_NTotal > 0.4 & SMPS_temp.CN30_NTotal <= 0.6);%Fraction of 40-60% of CN<30 in CNtotal
        tmpix_80= (SMPS_temp.CN30_NTotal > 0.6 & SMPS_temp.CN30_NTotal <= 0.8);%Fraction of 60-80% of CN<30 in CNtotal. No much data >70%

        % CN_30_P20=[CN_30_P20; SMPS_temp.CN30_NTotal(tmpix_20)]; %repeat the P25 so we don`t need to jump lines
        % CN_30_P40=[CN_30_P40; SMPS_temp.CN30_NTotal(tmpix_40)];
        % CN_30_P60=[CN_30_P60; SMPS_temp.CN30_NTotal(tmpix_60)];
        % CN_30_P80=[CN_30_P80; SMPS_temp.CN30_NTotal(tmpix_80)];

        % VV_P20=[VV_P20; V_vel_total(tmpix_20'))];
        % VV_P40=[VV_P40; V_vel_total(tmpix_40')];
        % VV_P60=[VV_P60; V_vel_total(tmpix_60')];
        % VV_P80=[VV_P80; V_vel_total(tmpix_80')];

        for i = 1:a
        W_P20(:,i)=V_vel(tmpix_20',i); %weekly VV for each height
        W_P40(:,i)=V_vel(tmpix_40',i);
        W_P60(:,i)=V_vel(tmpix_60',i);
        W_P80(:,i)=V_vel(tmpix_80',i);
        end

        W_P80(isempty(W_P80))=NaN;
        
        if isnan(W_P80) 
            W_P80(1,1:133) = NaN;
        end

        VV_P20 = nanmean(W_P20); %mean per week for each height
        VV_P20(isinf(VV_P20)) = NaN; %switching inf values to NaN
        VV_P40 = nanmean(W_P40);
        VV_P40(isinf(VV_P40)) = NaN;
        VV_P60 = nanmean(W_P60);
        VV_P60(isinf(VV_P60)) = NaN;
        VV_P80(isempty(W_P80))=NaN ;
        VV_P80 = nanmean(W_P80);
        VV_P80(isinf(VV_P80)|VV_P80==0) = NaN;

        if length(VV_P20) == 1
            VV_P20(1,1:133) = NaN;
        end 
 
        if length(VV_P40) == 1
            VV_P40(1,1:133) = NaN;
        end 

        if length(VV_P60) == 1
            VV_P60(1,1:133) = NaN;
        end 

        if length(VV_P80) == 1
            VV_P80(1,1:133) = NaN;
         end 

         if isnan(VV_P20) 
            VV_P20(1,1:133) = NaN;
         end

        if isnan(VV_P40) 
            VV_P40(1,1:133) = NaN;
        end
        
        if isnan(VV_P60) 
            VV_P60(1,1:133) = NaN;
        end

        if isnan(VV_P80) 
            VV_P80(1,1:133) = NaN;
        end


        VV_total = [VV_P20',VV_P40',VV_P60',VV_P80']; %Storing all VV in one variable

        V_vel_total = [V_vel_total; VV_total]; %Storing several weeks in one variable
      
1+1;
        % clear W_P20 W_P40 W_P60 W_P80 V_vel_interp

    else
       

        CN_30_P20(week_num,1)=nan; %If we do not have DL data, insert NAN in all size columns
        CN_30_P40(week_num,1)=nan;
        CN_30_P60(week_num,1)=nan;
        CN_30_P80(week_num,1)=nan;
    end
CN_fraction = [0.2 0.4 0.6 0.8];

H=pcolor(CN_fraction',DL_temp.height,V_vel_total);
set(H,'EdgeColor','none');
c=colorbar;
colormap(sdfplot,jet);
% caxis([0 500]);
c.Label.String = {'d{\itN}/dlog_{10}{\itD_p}';'(cm^{-3})'};
ylabel('{\itD_p} (nm)');
% yticks([20 40 80 160 400]);
set(gca,'TickDir','out');
%             title(strcat(sprintf('Week%d',week_num),':',' Starting from',32,sprintf(ground_weekly.start_date)))
set(gca,'Yscale','log');
% ylim([10 400]);
xticklabels([])

  
    end
end

if option.colorplot.v_velocityv_DL_VAP

    if 1
    CN_30_P20=[];
    CN_30_P40=[];
    CN_30_P60=[];
    CN_30_P80=[];
    VV_P20 = [];
    VV_P20_total = [];
    VV_P40 = [];
    VV_P40_total = [];
    VV_P60 = [];
    VV_P60_total = [];
    VV_P80 = [];
    VV_P80_total = [];
    VV_P100 = [];
    VV_P100_total = [];
    V_vel= [];
    V_vel_total= [];
    V_vel_total2= [];
    W_P20_total = [];
    W_P40_total = [];
    W_P60_total = [];
    W_P80_total = [];
    end

    for week_num=14:73 %Extracting the size distribution function for each week number
        week_num
        load (strcat('C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\LASIC\LASIC_Matlab_Code\Weekly_data_files_Marcus\Week',num2str(week_num)));
        % load (strcat('/Users/marcusbatista/Library/CloudStorage/OneDrive-UniversityofMiami/University_of_Miami/Thesis/DOE_Projects/LASIC/LASIC_Matlab_Code/Weekly_data_files_Marcus/Week',num2str(week_num))); %Macbook

        struct_name_array={'week_num','SMPS_temp','MET_temp','DL_temp','DL_VAP_temp'};
        for i=1:1:length(struct_name_array)
            struct_name=struct_name_array{i};
            eval([struct_name,'=ground_weekly.',struct_name]);
        end

        DL_check=~isempty(DL_VAP_temp.radial_velocity); % We are missing SMPS data from day 13, so this is checking if SMPS variable is double or struct

        if DL_check==1 % If we have DL data, it will load all variable in for all weeks

            % V_vv =[4,88,11,14,18,21,24,28,31,34];
            % V_velocity = DL_VAP_temp.radial_velocity(V_vv,1:end);
            
            % tmpidx=(DL_VAP.ceil_cbh==-9999); 
            % DL_VAP.ceil_cbh(tmpidx)=nan;

            tmpidx=(DL_VAP_temp.ceil_cbh==-9999);
            DL_VAP_temp.ceil_cbh(tmpidx)=nan;
 
            for i=1:1:length(DL_VAP_temp.height)
                tmpidx=DL_VAP_temp.height>DL_VAP_temp.ceil_cbh(i);
                DL_VAP_temp.radial_velocity(tmpidx,i)=NaN;
            end


            a = length(DL_VAP_temp.height); %Interpolation between DL(10 min) and SMPS data(5 min)
            for i = 1:a
                V_vel_interp(:,i) = interp1(DL_VAP_temp.date_time,DL_VAP_temp.radial_velocity(i,1:end),SMPS_temp.date_time);
            end

            V_vel = [V_vel; V_vel_interp]; %Storing the interpolated data for all heights

            tmpix_20= (SMPS_temp.CN30_NTotal <= 0.2); %Fraction of <=20% of CN<30 in CNtotal
            tmpix_40= (SMPS_temp.CN30_NTotal > 0.2 & SMPS_temp.CN30_NTotal <= 0.4);%Fraction of 20-40% of CN<30 in CNtotal
            tmpix_60= (SMPS_temp.CN30_NTotal > 0.4 & SMPS_temp.CN30_NTotal <= 0.6);%Fraction of 40-60% of CN<30 in CNtotal
            tmpix_80= (SMPS_temp.CN30_NTotal > 0.6 & SMPS_temp.CN30_NTotal <= 0.8);%Fraction of 60-80% of CN<30 in CNtotal. No much data >70%
            % tmpix_100= (SMPS_temp.CN30_NTotal > 0.8);

            for i = 1:a
                W_P20(:,i)=V_vel(tmpix_20',i); %weekly Vertical Velocity for each height
                W_P40(:,i)=V_vel(tmpix_40',i);
                W_P60(:,i)=V_vel(tmpix_60',i);
                W_P80(:,i)=V_vel(tmpix_80',i);
                % W_P100(:,i)=V_vel(tmpix_100',i);
            end

            W_P80(isempty(W_P80))=NaN;
            % W_P100(isempty(W_P100))=NaN;

            if isnan(W_P80)
                W_P80(1,1:133) = NaN;
            end

            % if isnan(W_P100)
            %     W_P100(1,1:133) = NaN;
            % end

            VV_P20 = nanmean(W_P20); %mean per week for each height
            VV_P20(isinf(VV_P20)) = NaN; %switching inf values to NaN
            VV_P40 = nanmean(W_P40);
            VV_P40(isinf(VV_P40)) = NaN;
            VV_P60 = nanmean(W_P60);
            VV_P60(isinf(VV_P60)) = NaN;
            VV_P80(isempty(W_P80))=NaN ;
            VV_P80 = nanmean(W_P80);
            VV_P80(isinf(VV_P80)|VV_P80==0) = NaN;
            % VV_P100(isempty(W_P100))=NaN ;
            % VV_P100 = nanmean(W_P100);
            % VV_P100(isinf(VV_P100)|VV_P100==0) = NaN;


            if length(VV_P20) == 1
                VV_P20(1,1:133) = NaN;
            end

            if length(VV_P40) == 1
                VV_P40(1,1:133) = NaN;
            end

            if length(VV_P60) == 1
                VV_P60(1,1:133) = NaN;
            end

            if length(VV_P80) == 1
                VV_P80(1,1:133) = NaN;
            end

            if isnan(VV_P20)
                VV_P20(1,1:133) = NaN;
            end

            if isnan(VV_P40)
                VV_P40(1,1:133) = NaN;
            end

            if isnan(VV_P60)
                VV_P60(1,1:133) = NaN;
            end

            if isnan(VV_P80)
                VV_P80(1,1:133) = NaN;
            end
             % if isnan(VV_P100)
             %    VV_P100(1,1:133) = NaN;
            % end
            
            VV_P20_total = [VV_P20_total; VV_P20]; %mean for each week from 14 to 73
            VV_P40_total = [VV_P40_total;VV_P40];
            VV_P60_total = [VV_P60_total;VV_P60];
            VV_P80_total = [VV_P80_total;VV_P80];
            % VV_P100_total = [VV_P100_total;VV_P100];
            


            VV_total = [VV_P20',VV_P40',VV_P60',VV_P80']; %Storing all VV in one variable
            VV_total_2 = [VV_P20;VV_P40;VV_P60;VV_P80]; %Storing all VV in one variable

            V_vel_total = [V_vel_total, VV_total]; %Storing several weeks in one variable
            V_vel_total2 = [V_vel_total2; VV_total_2]; %Storing several weeks in one variable
            CN_fraction = [0.2 0.4 0.6 0.8];
            
            %1+1;
            % clear W_P20 W_P40 W_P60 W_P80 V_vel_interp

            W_P20_total = [W_P20_total;W_P20];
            W_P40_total = [W_P40_total;W_P40];
            W_P60_total = [W_P60_total;W_P60];
            W_P80_total = [W_P80_total;W_P80];

        else


            CN_30_P20(week_num,1)=nan; %If we do not have DL data, insert NAN in all size columns
            CN_30_P40(week_num,1)=nan;
            CN_30_P60(week_num,1)=nan;
            CN_30_P80(week_num,1)=nan;
        end
        if 1
    CN_30_P20=[];
    CN_30_P40=[];
    CN_30_P60=[];
    CN_30_P80=[];
    VV_P20 = [];
    % VV_P20_total = [];
    VV_P40 = [];
    % VV_P40_total = [];
    VV_P60 = [];
    % VV_P60_total = [];
    VV_P80 = [];
    % VV_P80_total = [];
    VV_P100 = [];
    % VV_P100_total = [];
    V_vel= [];
    V_vel_total= [];
    V_vel_total2= [];
    W_P20 = [];
    W_P40 = [];
    W_P60 = [];
    W_P80 = [];
    % W_P20_total = [];
    % W_P40_total = [];
    % W_P60_total = [];
    % W_P80_total = [];
    V_vel_interp = [];
    end

    end

    
    VV_P20_mean = nanmean(VV_P20_total);
    VV_P40_mean = nanmean(VV_P40_total);
    VV_P60_mean = nanmean(VV_P60_total);
    VV_P80_mean = nanmean(VV_P80_total);
    VV_P100_mean = nanmean(VV_P100_total);
 
    VV_total= [VV_P20_mean',VV_P40_mean',VV_P60_mean',VV_P80_mean',VV_P100_mean'];

    figure
    H=pcolor([0.2 0.4 0.6 0.8 1],DL_VAP_temp.height,[VV_total,VV_total(:,4)]);
    colormap(parula);
    set(H,'EdgeColor','none');
    c=colorbar;
    colormap jet;
    % clim([-0.2 0.2]);
    ylabel('Height (m)');
    xlabel('f_{<30 nm} (%)')
    % xticks([0.3 0.5 0.7 0.9])
    % xticklabels([0.2, 0.4, 0.6, 0.8])
    c.Label.String = {'Vertical Velocity (m s^{-1})'};
    ylim([0 2000]);
    set(gca,'TickDir','out');
    box on
% saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_colorplot'),'.jpg')); %save figure as .jpg
end


if option.colorplot.v_velocityv_DL_VAP_corrected

    if 1
    CN30_NTotal = [];
    CN30_datetime= [];
    DL_VAP_datetime= [];
    DL_VAP_VV = [];
    Prec_datetime = [];
    Prec= [];
    CBH= [];
    CBH_datetime = [];
    SNR = [];

    end

    for week_num=14:73 %Extracting the size distribution function for each week number
        week_num
        load (strcat('C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\LASIC\LASIC_Matlab_Code\Weekly_data_files_Marcus\Week',num2str(week_num)));
        % load (strcat('/Users/marcusbatista/Library/CloudStorage/OneDrive-UniversityofMiami/University_of_Miami/Thesis/DOE_Projects/LASIC/LASIC_Matlab_Code/Weekly_data_files_Marcus/Week',num2str(week_num))); %Macbook

        struct_name_array={'week_num','SMPS_temp','MET_temp','DL_temp','DL_VAP_temp','RAINTB_temp','MWRP_temp'};
        for i=1:1:length(struct_name_array)
            struct_name=struct_name_array{i};
            eval([struct_name,'=ground_weekly.',struct_name]);
        end

        DL_check=~isempty(DL_VAP_temp.radial_velocity); % We are missing SMPS data from day 13, so this is checking if SMPS variable is double or struct

        if DL_check==1 % If we have DL data, it will load all variable in for all weeks

            tmpidx=(DL_VAP_temp.ceil_cbh==-9999);
            DL_VAP_temp.ceil_cbh(tmpidx)=nan;

            for i=1:1:length(DL_VAP_temp.height)
                tmpidx=DL_VAP_temp.height>DL_VAP_temp.ceil_cbh(i);
                DL_VAP_temp.radial_velocity(tmpidx,i)=NaN;
            end

            CN30_NTotal=[CN30_NTotal; SMPS_temp.CN30_NTotal']; %storing all CN<30nm fraction for all days


            CN30_datetime = [CN30_datetime; SMPS_temp.date_time];%storing all CN<30nm fraction for all days


            DL_VAP_datetime = [DL_VAP_datetime; DL_VAP_temp.date_time];%storing all CN<30nm fraction for all days


            DL_VAP_VV = [DL_VAP_VV;DL_VAP_temp.radial_velocity'];

            Prec_datetime = [Prec_datetime; RAINTB_temp.date_time];
            Prec = [Prec; RAINTB_temp.precip];

            CBH = [CBH; MWRP_temp.cloudBaseHeight];
            CBH(CBH ==-1)= NaN;
            CBH_datetime = [CBH_datetime;MWRP_temp.date_time];

            SNR = [SNR; DL_VAP_temp.SNR'];

            if 1
                CN_30_P20=[];
                CN_30_P40=[];
                CN_30_P60=[];
                CN_30_P80=[];
                V_vel_interp = [];
                
            end

        end
    end

    SNR(SNR==-9999) = NaN; %Signal-to-noise ratio 
    tmpix = (SNR <=0.01);  %Removing data for periods when Signal-to-noise ratio was below 1%. 
    DL_VAP_VV(tmpix)= NaN;

    V_vel_interp(1:114921,1:133) = NaN;
    for i = 1:133
        V_vel_interp(:,i) = interp1(DL_VAP_datetime,DL_VAP_VV(1:end,i),CN30_datetime); %Interpolation between DL(10 min) and SMPS data(5 min)
    end

    CBH_interp(1:114921,1) = NaN;
    CBH_interp= interp1(CBH_datetime,CBH,CN30_datetime); %Interpolation between CBH(10 min) and SMPS data(5 min)


    Prec_interp(1:114921,1) = NaN;
    Prec_interp= interp1(Prec_datetime,Prec,CN30_datetime); %Interpolation between prec(10 min) and SMPS data(5 min)


    tmpix_20= (CN30_NTotal <= 0.2); %Fraction of <=20% of CN<30 in CNtotal
    tmpix_40= (CN30_NTotal > 0.2 & CN30_NTotal <= 0.4);%Fraction of 20-40% of CN<30 in CNtotal
    tmpix_60= (CN30_NTotal > 0.4 & CN30_NTotal <= 0.6);%Fraction of 40-60% of CN<30 in CNtotal
    tmpix_80= (CN30_NTotal > 0.6 & CN30_NTotal <= 0.8);%Fraction of 60-80% of CN<30 in CNtotal. No much data >70%
    tmpix_100= (SMPS_temp.CN30_NTotal > 0.8);
    

    for i = 1:133
        W_P20(:,i)=V_vel_interp(tmpix_20,i); %weekly Vertical Velocity for each height
        W_P40(:,i)=V_vel_interp(tmpix_40,i);
        W_P60(:,i)=V_vel_interp(tmpix_60,i);
        W_P80(:,i)=V_vel_interp(tmpix_80,i);
        W_P100(:,i)=V_vel_interp(tmpix_100,i);
    end
    
  
    CBH20(:,1) = CBH_interp(tmpix_20,1);
    CBH40(:,1) = CBH_interp(tmpix_40,1);
    CBH60(:,1) = CBH_interp(tmpix_60,1);
    CBH80(:,1) = CBH_interp(tmpix_80,1);

    CBHboxplot(1:101008,1:4)= NaN;
    CBHboxplot(1:length(CBH20),1)=CBH20;
    CBHboxplot(1:length(CBH40),2)= CBH40;
    CBHboxplot(1:length(CBH60),3)= CBH60;
    CBHboxplot(1:length(CBH80),4)= CBH80;

     CBHboxplot(CBHboxplot<prctile(CBHboxplot,5) & CBHboxplot>prctile(CBHboxplot,95)) = NaN;

    Prec20(:,1) = Prec_interp(tmpix_20,1);
    Prec40(:,1) = Prec_interp(tmpix_40,1);
    Prec60(:,1) = Prec_interp(tmpix_60,1);
    Prec80(:,1) = Prec_interp(tmpix_80,1);



    Prec_total(1:101008,1:4)= NaN;
    Prec_total(1:length(Prec20),1) = Prec20;
    Prec_total(1:length(Prec40),2) = Prec40;
    Prec_total(1:length(Prec60),3) = Prec60;
    Prec_total(1:length(Prec80),4) = Prec80;
    

   
    CBH20_mean = nanmean(CBH20);
    CBH40_mean = nanmean(CBH40);
    CBH60_mean = nanmean(CBH60);
    CBH80_mean = nanmean(CBH80);
    CBHtotal= [CBH20_mean,CBH40_mean,CBH60_mean,CBH80_mean];


    W_P20(W_P20<prctile(W_P20,5) & W_P20>prctile(W_P20,95)) = NaN;
    W_P40(W_P40<prctile(W_P40,5) & W_P40>prctile(W_P40,95)) = NaN;
    W_P60(W_P60<prctile(W_P60,5) & W_P60>prctile(W_P60,95)) = NaN;
    W_P80(W_P80<prctile(W_P80,5) & W_P80>prctile(W_P80,95)) = NaN;

    %Removing data for periods when it was raining. 

    W_P20(Prec20>0) = NaN;
    W_P40(Prec40>0) = NaN;
    W_P60(Prec60>0) = NaN;
    W_P80(Prec80>0) = NaN;


    VV_P20_mean = nanmean(W_P20);
    VV_P40_mean = nanmean(W_P40);
    VV_P60_mean = nanmean(W_P60);
    VV_P80_mean = nanmean(W_P80);
    VV_P100_mean = nanmean(W_P100);

   
    VV_total= [VV_P20_mean',VV_P40_mean',VV_P60_mean',VV_P80_mean',VV_P100_mean'];
    VV_total(isinf(VV_total)) = NaN;

    figure
    H=pcolor([0.2 0.4 0.6 0.8 1],DL_VAP_temp.height,[VV_total(:,1:4),VV_total(:,4)]);
    hold on
    plot ([0.2 0.4 0.6 0.8],CBHtotal)
    set(H,'EdgeColor','none');
    grid off
    set(gca, 'Layer', 'top');
    c=colorbar;
    colormap parula;
    clim([-0.8 0.2]);
    ylabel('Altitude (m)');
    xlabel('{\itN}_{<30}/{\itN}_{>10}')
    xlim([0.2 1])

    xticks([0 0.2 0.4 0.6 0.8 1])
    % xticklabels({'0-0.2', '0.2-0.4', '0.4-0.6', '>0.8'})
    xticklabels({'0','0', '0.2', '0.4', '0.6', '1'})
    c.Label.String = {'Vertical velocity (m s^{-1})'};
    set(gca, 'YDir','normal')
    ylim([75 800]);
    yticks([0 200 400 600 800]);yticklabels([0 200 400 600 800]);
    set(gca,'TickDir','out', 'FontSize', 35);
    set(gcf,'Position',[90 20 1486 842]);
    box on
    JW_figure_style(gcf,'paper_marcus');
    set(gca,'TickDir','in');
    box on
    ax = gca;
    ax.LineWidth = 1.5;
    set(gcf,'Position',[90 20 700 842]);


    %fontsize 35
    %LineWidth = 3;


         % saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_colorplot_SNRcorrected2'),'.jpg')); %save figure as .jpg

    figure 
    b=boxplot(CBHboxplot,'symbol','*','outliersize',1,'color','k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    patch(get(h(1),'XData'),get(h(1),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(2),'XData'),get(h(2),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(3),'XData'),get(h(3),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(4),'XData'),get(h(4),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    hold on
    plot(nanmean(CBHboxplot),'ok','MarkerSize',10,'markerfacecolor','w');
    xlabel('f_{<30 nm} (%)')
    ylabel('Cloud Base Height (m)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({'0-0.2', '0.2-0.4', '0.4-0.6', '>0.8'})
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[90 20 1486 842]);
    ylim([-100 10000]);
    xlim([0.5 4.5])
    JW_figure_style(gcf,'paper_square');


% saveas(gcf,strcat(strcat('LASIC_Cloud Base Height_boxplot'),'.jpg')); %save figure as .jpg

end


if option.vvelocity.DL_VAP
    
   

    boxp_velocity_315(1:length(W_P20),1:4)=NaN;
    boxp_velocity_315(1:length(W_P20),1) = W_P20(:,11);
    boxp_velocity_315(1:length(W_P40),2) = W_P40(:,11);
    boxp_velocity_315(1:length(W_P60),3) = W_P60(:,11);
    boxp_velocity_315(1:length(W_P80),4) = W_P80(:,11);

    figure 
    b=boxplot(boxp_velocity_315,'symbol','*','outliersize',1,'color','k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    patch(get(h(1),'XData'),get(h(1),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(2),'XData'),get(h(2),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(3),'XData'),get(h(3),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    patch(get(h(4),'XData'),get(h(4),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    hold on
    plot(nanmean(boxp_velocity_315),'ok','MarkerSize',10,'markerfacecolor','w');

   xlabel('f_{<30 nm} (%)')
    ylabel('Vertical Velocity at 315m (m/s)')
    xticks([1.5 2.5 3.5 4.5])
    xticklabels({0.2, 0.40, 0.6, 0.8})
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[90 20 1486 842]);
    ylim([-1 0.4]);

 saveas(gcf,strcat(strcat('LASIC_CN30fraction_vertical velocity_boxplot_315_DL_VAP_SNR_Corrected'),'.jpg')); %save figure as .jpg
end

