% Open Day.mat for all day_num and generate weekly time series plots

% clear all 
% close all 

option.preciptation_frequency=0;
option.timeseries_rainfall = 0;
option.boxplot_BC = 0;
option.boxplot_CO = 0;
option.boxplot_SO2 = 0;
option.timeseries_SO2 = 0;
option.boxplot_tracegas = 0;
option.NPF_events_counts = 0;
option.corr_prec_NP = 0;
option.scatter_plots = 1;
option.N30_boxplots = 0;
option.cloud_Base_height = 0;
option.CPC_monthly = 0;
option.AAE_monthly = 0;
option.statistical_test = 0;
option.SDF_monthly = 0;
option.manuscript_boxplots = 0;


 SDF = [];
for month_num = 1:17 %Adjust for the number of weeks necessary to be loaded to generate the plots. 
 set(0, 'DefaultAxesFontName', 'Arial');
    filename=strcat('C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\LASIC\LASIC_Matlab_Code\Monthly_data_files_Marcus\Month',num2str(month_num)); %Desktop path
    % filename=strcat('/Users/marcusbatista/Library/CloudStorage/OneDrive-UniversityofMiami/University_of_Miami/Thesis/DOE_Projects/LASIC/LASIC_Matlab_Code/Monthly_data_files_Marcus/Month',num2str(month_num)); %Macbook path
    load(filename);

    struct_name_array={'month_num', 'SMPS_temp','CPC_temp','MET_temp','CO_temp','PSAP_temp','SKYRAD_temp','SP2_temp','DL_temp','SO2_temp','MWRP_temp','ACSM_temp','RAINTB_temp','SO2a1_temp','UFCPC_temp'};

    for i=1:1:length(struct_name_array)
        struct_name=struct_name_array{i};
        eval([struct_name,'=ground_monthly.',struct_name]);
    end

   
    Prec_rate= MET_temp.pwd_precip_rate_mean_1min;
    for j =1:1:length(Prec_rate)
        if Prec_rate(j,1) >= 1000
            Prec_rate(j,1) = NaN;
        end

    end

        Prec(month_num,1) = nansum(Prec_rate);
        m = max(Prec);
        normalized_prec = Prec./m;
        a = isnan(Prec);
        Prec(a) = 0;

        a = length(MWRP_temp.lwp);
        lwp(1:a,month_num)= MWRP_temp.lwp;

        a= lwp <= 0.001;
        lwp(a) = NaN;

        a = length(RAINTB_temp.precip);
        raintb(1:a,month_num) = RAINTB_temp.precip;
        raintb=nansum(raintb);
        
        a = length(RAINTB_temp.rain_rate);
        rainrate_tb(1:a,month_num) = RAINTB_temp.rain_rate;
        rainrate_tb=nansum(rainrate_tb);
        

        a = length(PSAP_temp.absorbance_red_raw);
        AbsR(1:a,month_num) = PSAP_temp.absorbance_red_raw;
        AbsG(1:a,month_num) = PSAP_temp.absorbance_green_raw;
        AbsB(1:a,month_num) = PSAP_temp.absorbance_blue_raw;  

        a = length(SO2_temp.concentration);
        SO2(1:a,month_num) = SO2_temp.concentration;

        a = length(SO2a1_temp.concentration);
        SO2a1(1:a,month_num) = SO2a1_temp.concentration;

         a = length(ACSM_temp.sulfate);
        sulfate(1:a,month_num) = ACSM_temp.sulfate;

         a = length(ACSM_temp.ammonium);
        ammonium(1:a,month_num) = ACSM_temp.ammonium;

        a = length(ACSM_temp.nitrate);
        nitrate(1:a,month_num) = ACSM_temp.nitrate;

        a = length(ACSM_temp.total_organics);
        total_organics(1:a,month_num) = ACSM_temp.total_organics;
        
        a = length(ACSM_temp.chloride);
        chloride(1:a,month_num) = ACSM_temp.chloride;

        a = length(SMPS_temp.total_concentration);
        NTotal(1:a,month_num) = SMPS_temp.total_concentration;
      
        a = length(SMPS_temp.CN30_NTotal);
        CN30_NTotal(1:a,month_num) = SMPS_temp.CN30_NTotal;

        a = length(SMPS_temp.N_nuc30);
        CN_30nm(1:a,month_num) = SMPS_temp.N_nuc30;

        a = length(SMPS_temp.S_SMPS);
        CN_Sarea(1:a,month_num) = SMPS_temp.S_SMPS;

        a = length(MWRP_temp.cloudBaseHeight);
        CBH(1:a,month_num) = MWRP_temp.cloudBaseHeight;

         a = length(MET_temp.temp_mean);
        temp(1:a,month_num) = MET_temp.temp_mean;

        a = length(UFCPC_temp.concentration);
        UFCPC(1:a,month_num) = UFCPC_temp.concentration;

        a = length(CPC_temp.concentration);
        CPC(1:a,month_num) = CPC_temp.concentration;

        a = length(CO_temp.co);
        CO(1:a,month_num) = CO_temp.co;

        a = length(PSAP_temp.date_time);
        Abs_date(1:a,month_num) = PSAP_temp.date_time;

        
        SDF=[SDF,SMPS_temp.number_size_distribution];

        a = length(SP2_temp.date_time);
        BC_SP2_date_time(1:a,month_num) = SP2_temp.date_time;

        a = length(SP2_temp.rBC_conc);
        BC_SP2(1:a,month_num) = SP2_temp.rBC_conc;

end
    
if  option.preciptation_frequency
    
    
    figure
    yyaxis left
    bar(Prec,'LineWidth',2)
    ylabel('Precipitation rate PWD (mm/h)')
    yyaxis right
     ax = gca
     ax.YColor = 'r';
    plot (nanmean(lwp),'-r','LineWidth', 2)
    set(gca, 'FontSize',20, 'LineWidth',2)
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
    ylabel('Liquid water path (g/m^{2})')
    xlabel('Months 2016 2017')
    set(gcf,'Position',[90 20 1486 842]);

%            saveas(gcf,strcat(strcat('LASIC_Monthly Precicipation rates PWD'),'.jpg')); %save figure as .jpg

    figure
    yyaxis left
    bar(normalized_prec,'LineWidth',2)
     ylabel('Normalized Precipitation PWD (mm)')
    yyaxis right
     ax = gca
     ax.YColor = 'r';
    plot (nanmean(lwp),'-r','LineWidth', 2)
    set(gca, 'FontSize',20, 'LineWidth',2)
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
    ylabel('Liquid water path (g/m^{2})')
    xlabel('Months 2016 2017')
    set(gcf,'Position',[90 20 1486 842]);


%     saveas(gcf,strcat(strcat('LASIC_Monthly Normalized Precicipation PWD'),'.jpg')); %save figure as .jpg

    figure 
     
    yyaxis left
    bar(raintb,'LineWidth',2)
    ylabel('Precipitation TB (mm)')
    yyaxis right
     ax = gca
                ax.YColor = 'r';
    plot (nanmean(lwp),'-r','LineWidth', 2)
    set(gca, 'FontSize',20, 'LineWidth',2)
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
    ylabel('Liquid water path (g/m^{2})')
    xlabel('Months 2016 2017')
    set(gcf,'Position',[90 20 1486 842]);
    
%     saveas(gcf,strcat(strcat('LASIC_Monthly Precicipation TB'),'.jpg')); %save figure as .jpg

    figure

    yyaxis left
    bar(rainrate_tb,'LineWidth',2)
    ylabel('Precipitation rate TB (mm/h)')
    yyaxis right
    ax = gca
    ax.YColor = 'r';
    plot (nanmean(lwp),'-r','LineWidth', 2)
    set(gca, 'FontSize',20, 'LineWidth',2)
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
    ylabel('Liquid water path (g/m^{2})')
    xlabel('Months 2016 2017')
    set(gcf,'Position',[90 20 1486 842]);
    
%     saveas(gcf,strcat(strcat('LASIC_Monthly Precicipation rate TB'),'.jpg')); %save figure as .jpg

figure

yyaxis left
bar(raintb,'LineWidth',2)
ylabel('Precipitation TB (mm)')
yyaxis right
ax = gca
ax.YColor = 'r';
plot (nanmean(lwp),'-r','LineWidth', 2)
set(gca, 'FontSize',20, 'LineWidth',2)
xticks([1:1:17])
xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
ylabel('Liquid water path (g/m^{2})')
xlabel('Months 2016 2017')
set(gcf,'Position',[90 20 1486 842]);

%     saveas(gcf,strcat(strcat('LASIC_Monthly Precicipation rate TB'),'.jpg')); %save figure as .jpg

end

if option.corr_prec_NP

    figure

    yyaxis left
    bar(raintb,'LineWidth',2)
    ylabel('Precipitation TB (mm)')
    yyaxis right
    ax = gca
    ax.YColor = 'k';
    plot (nanmean(NTotal),'-r','LineWidth', 2)
    hold on
    plot (nanmean(CN30_NTotal),'-k','LineWidth', 2)
    set(gca, 'FontSize',20, 'LineWidth',2)
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
    ylabel('Particle concentration (cm^{-3})')
    xlabel('Months 2016 2017')
    set(gcf,'Position',[90 20 1486 842]);
    legend('', 'CN Total','CN<30 nm')

    saveas(gcf,strcat(strcat('LASIC_Correlation Precicipation TB and CN Total'),'.jpg')); %save figure as .jpg

    figure

    yyaxis left
    ax = gca
    ax.YColor = 'k';
    bar(raintb,'LineWidth',2)
    ylabel('Precipitation (mm)')
    yyaxis right
    ax = gca
    ax.YColor = 'r';
    hold on
    plot (nanmean(CN_30nm),'-k','LineWidth', 2)
    ylabel('N_{<30 nm} (cm^{-3})')
    set(gca, 'FontSize',20, 'LineWidth',2)
    xticks([1:1:17])
    xticklabels({'6','7','8','9','10','11', '12', '1','2','3','4','5','6','7','8','9','10'})
    xtickangle(0)
    xlabel('Months 2016 2017')
    set(gcf,'Position',[90 20 1486 842]);
    JW_figure_style(gcf,'paper_square');

    saveas(gcf,strcat(strcat('LASIC_Correlation Precicipation TB and CN30 monthly'),'.jpg')); %save figure as .jpg

end

if option.scatter_plots
    
    %Plot of Precipitation vs. Fraction of 30 nm 
    month=[6:1:12,1:10];
    CN_frac = nanmean(CN30_NTotal);
    std_CN30fraction = std(CN_frac);
    err_prec = 0.05*(raintb);
    b = [ones(size(raintb,1),1) raintb]\CN_frac;
    RegressionLine = [ones(size(raintb,1),1) raintb]*b;
    SS_X = sum((RegressionLine-mean(RegressionLine)).^2);
    SS_Y = sum((CN_frac-mean(CN_frac)).^2);
    SS_XY = sum((RegressionLine-mean(RegressionLine)).*(CN_frac-mean(CN_frac)));
    R_squared = SS_XY/sqrt(SS_X*SS_Y);
    yneg = std_CN30fraction;
    ypos = std_CN30fraction;
    xneg = err_prec;
    xpos = err_prec;
    sz = 200;
    avg_temp = nanmean(temp);



    tmpidx=CN_Sarea>prctile(CN_Sarea,99,'all');
    CN_Sarea(tmpidx)=nan;
    S_area = nanmean(CN_Sarea);
    S_error =  nanstd(CN_Sarea);

    err_prec = 0.05*(raintb);
  
    yneg = S_error;
    ypos = S_error;
    xneg = err_prec;
    xpos = err_prec;

    b = [ones(size(raintb,1),1) raintb]\S_area;
    RegressionLine = [ones(size(raintb,1),1) raintb]*b;
    SS_X = sum((RegressionLine-mean(RegressionLine)).^2);
    SS_Y = sum((S_area-mean(S_area)).^2);
    SS_XY = sum((RegressionLine-mean(RegressionLine)).*(CN_frac-mean(S_area)));
    R_squared = SS_XY/sqrt(SS_X*SS_Y);

    %Figure to the manuscript:

    figure %Precipitation vs. Surface area
    % errorbar(raintb,S_area,yneg,ypos,xneg,xpos,'k','LineStyle','none','LineWidth',0.5)
    hold on
    scatter(raintb,S_area,sz,avg_temp,"filled")
    p = polyfit(raintb, S_area, 1);px = [min(raintb) max(raintb)];
    py = polyval(p, px);
    plot(px,py,'--k', 'LineWidth', 2);
    p1 =  0.4503; p2=57.135;  r = 0.-0.4;
    equation=['R=' num2str(r,2)];

    ylabel({'{\itS}_{tot} (μm^{2} cm^{-3})'});
    xlabel({'Monthly cummulative' ;'precipitation (mm)'})
    set(gca, 'FontSize',20, 'LineWidth',1)
    set(gcf,'Position',[90 20 1486 842]);
    c=colorbar;
    caxis([20 27])
    xlim([0 50]);
    xlim([0 50]);
    c.Label.String = {'{\itT} (°C)'};
    box on
    JW_figure_style(gcf,'paper_square');
    text(30,97,equation,'Color','k','Fontsize',18)

    % saveas(gcf,strcat(strcat('LASIC_Correlation Precicipation TB and S_area_scatter_temperature color'),'.jpg')); %save figure as .jpg

    % Correlation between Precipitation and CN<30nm - We should use this!

    month=[6:1:12,1:10];
    NFP = nanmean(CN_30nm); %NFP - new freshly particles
    std_CN30fraction = nanstd(CN_30nm);
    err_prec = 0.05*(raintb);
    b = [ones(size(raintb,1),1) raintb]\NFP;
    RegressionLine = [ones(size(raintb,1),1) raintb]*b;
    SS_X = sum((RegressionLine-mean(RegressionLine)).^2);
    SS_Y = sum((NFP-mean(NFP)).^2);
    SS_XY = sum((RegressionLine-mean(RegressionLine)).*(NFP-mean(NFP)));
    R_squared = SS_XY/sqrt(SS_X*SS_Y);
    yneg = std_CN30fraction;
    ypos = std_CN30fraction;
    xneg = err_prec;
    xpos = err_prec;
    sz = 200;

    figure
    % errorbar(raintb,NFP,yneg,ypos,xneg,xpos,'k','LineStyle','none','LineWidth',0.5)
    hold on
    scatter(raintb,NFP,sz,avg_temp,"filled")
    p = polyfit(raintb, NFP, 1);px = [min(raintb) max(raintb)];
    py = polyval(p, px);
    plot(px,py,'--k', 'LineWidth', 2);
    p1 =  0.9557; p2=4.7491;  r = 0.74; x_nu = 1;
    equation=['R=' num2str(r,2)];
    % hold on
    % plot(raintb,RegressionLine,'displayname',sprintf('Regression line (y = %0.2f*x + %0.2f)',b(2),b(1)))
    % legend('location','nw')
    ylabel({'{\itN}_{<30} (cm^{-3})'});
    xlabel({'Monthly cummulative' ;'precipitation (mm)'})
    c=colorbar;
    caxis([20 27]);
    xlim([0 60]);
    ylim([0 65]);
    c.Label.String = {'{\itT} (°C)'};
    set(gca, 'FontSize',35, 'LineWidth',2)
    set(gcf,'Position',[90 20 1486 842]);
    box on
    JW_figure_style(gcf,'paper_square');
    text(42,63,equation,'Color','k','Fontsize',18)

    % saveas(gcf,strcat(strcat('LASIC_Correlation Precicipation TB and CN30nm_scatter_temperature color_2'),'.jpg')); %save figure as .jpg
    
    %Figure to the manuscript_revised:
    figure
    subplot(1,2,1)
    hold on
    scatter(raintb,NFP,sz,avg_temp,"filled")
    p = polyfit(raintb, NFP, 1);px = [min(raintb) max(raintb)];
    py = polyval(p, px);
    plot(px,py,'--k', 'LineWidth', 2);
    p1 =  0.9557; p2=4.7491;  r = 0.74; x_nu = 1;
    equation=['R=' num2str(r,2)];
    % hold on
    % plot(raintb,RegressionLine,'displayname',sprintf('Regression line (y = %0.2f*x + %0.2f)',b(2),b(1)))
    % legend('location','nw')
    ylabel({'{\itN}_{<30} (cm^{-3})'});
    xlabel({'Monthly cummulative' ;'precipitation (mm)'})
    c=colorbar;
    caxis([20 27]);
    xlim([0 60]);
    ylim([0 65]);
    c.Label.String = {'{\itT} (°C)'};
    set(gca, 'FontSize',35, 'LineWidth',2)
    % set(gcf,'Position',[90 20 1486 842]);
    box on
    % JW_figure_style(gcf,'paper_square');
    text(42,63,equation,'Color','k','Fontsize',18)
       box on
    ax = gca;
    ax.LineWidth = 1.5;

    subplot(1,2,2)
    hold on 
    scatter(raintb,S_area,sz,avg_temp,"filled")
    p = polyfit(raintb, S_area, 1);px = [min(raintb) max(raintb)];
    py = polyval(p, px);
    plot(px,py,'--k', 'LineWidth', 2);
    p1 =  0.4503; p2=57.135;  r = -0.24;
    equation=['R=' num2str(r,2)];

    ylabel({'{\itS}_{tot} (μm^{2} cm^{-3})'});
    xlabel({'Monthly cummulative' ;'precipitation (mm)'})
    set(gca, 'FontSize',20, 'LineWidth',1)
    set(gcf,'Position',[90 20 1486 842]);
    c=colorbar;
    caxis([20 27])
    xlim([0 50]);
    xlim([0 50]);
    c.Label.String = {'{\itT} (°C)'};
    box on
    % JW_figure_style(gcf,'paper_square');
    text(30,97,equation,'Color','k','Fontsize',18)

    JW_figure_style(gcf,'paper_marcus');
    set(gcf,'Position',[90 20 700 842]);
    box on
    ax = gca;
    ax.LineWidth = 1.5;
    %0.11,0.187,0.32,0.78
    %0.55,0.187,0.32,0.78
    %fontsize 35
    %LineWidth = 3;


end

if option.timeseries_rainfall

% monthnum = 4 (September 16 and 12 = May 17
    %September 2016
    plot (MET_temp.date_time,MET_temp.pwd_precip_rate_mean_1min)
    set(gca, 'FontSize',14)
    xlim([93 123])
    xticks([93, 98, 103, 108, 113, 118, 123])
    xticklabels({'09/01','09/06','09/11','09/16','09/21','09/26','09/30'})
    ylabel('Precipitation (mm/h)')
    xlabel('September 2016')

    plot(MET_temp.pwd_cumul_rain)
    plot(MET_temp.date_time,MET_temp.pwd_cumul_rain)
    xlim([93 123])
    xticks([93, 98, 103, 108, 113, 118, 123])
    xticklabels({'09/01','09/06','09/11','09/16','09/21','09/26','09/30'})
    ylabel('Precipitation (mm)')
    set(gca, 'FontSize',14)
    xlabel('September 2016')


    %May 2017
    figure(1)
    plot (MET_temp.date_time,MET_temp.pwd_precip_rate_mean_1min)
    set(gca, 'FontSize',14)
    xlim([335 366])
    xticks([335, 340, 345, 350, 355, 360, 365])
    xticklabels({'05/01','05/06','05/11','05/16','05/21','05/26','05/31'})
    ylabel('Precipitation (mm/h)')
    xlabel('May 2017')

    figure(2)
    plot(MET_temp.pwd_cumul_rain)
    plot(MET_temp.date_time,MET_temp.pwd_cumul_rain)
    xlim([335 366])
    xticks([335, 340, 345, 350, 355, 360, 365])
    xticklabels({'05/01','05/06','05/11','05/16','05/21','05/26','05/31'})
    ylabel('Precipitation (mm)')
    set(gca, 'FontSize',14)
    xlabel('May 2017')

end

if option.boxplot_BC

%SP2

 a = BC_SP2 <=0;
    BC_SP2(a) = NaN;

    figure

    boxplot(BC_SP2,'symbol','*','outliersize',1,'color','k')
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[0,250/255,154/255]);
    end

    hold on
    plot(nanmean(BC_SP2),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    ylim([-0.2 2000])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    ylabel({'BC concentration (ng m^{-3})'});
    xlabel('Months 2016 2017')
    set(gca, 'FontSize',20, 'LineWidth',2)
    xtickangle(0)
    set(gcf,'Position',[90 20 1486 842]);




    a = AbsR <=0;
    AbsR(a) = NaN;

    a = AbsG <=0;
    AbsG(a) = NaN;

    a = AbsB <=0;
    AbsB(a) = NaN;

    Abs_NPF_events_month_indices  = [3 4 4 6 6 14 15 15 16 16 16 16 16 16 16 16 16 16 16 17 17 17 17 17];
    Abs_NPF_events_median = [0.182958200573921	0.230144202709198	0.236864097416401	0.0649822950363159	0.0456987395882607	1.49397134780884	0.0571116730570793	0.115043275058270	0.0807635039091110	0.102402918040752	0.177005045115948	0.736522257328033	1.01711767911911	0.268270552158356	1.21052634716034	0.0978845357894898	0.409814417362213	2.14923596382141	0.324720442295074	0.0447678454220295	0.0640833526849747	0.0385142453014851	0.549798846244812	0.0353765487670898];
    figure
    yyaxis left
    ax = gca;
    ax.YColor = 'k';
    boxplot(AbsG,'symbol','*','outliersize',1,'color','k')
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[0,250/255,154/255]);
    end

    hold on
    plot(nanmean(AbsG),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    ylim([-0.2 25])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    ylabel({'Green Abs. coeff.';'(mm^{-1})'});
    xlabel('Months 2016 2017')
    set(gca, 'FontSize',20, 'LineWidth',2)
    xtickangle(0)
    % set(gcf,'Position',[90 20 1486 842]);
    set(gcf,'Position',[5 620 1321 318]); %slides

   
    yyaxis right
    ax = gca
    ax.YColor = 'r';
    hold on
    plot (nanmean(CN30_NTotal),'-r','LineWidth', 2)
    set(gca, 'FontSize',20, 'LineWidth',2)
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
    ylabel('f_{<30 nm} (%)')
    xlabel('Months 2016 2017')
    set(gcf,'Position',[5 620 1321 318]); %slides
    % set(gcf,'Position',[90 20 1486 842]);

    saveas(gcf,strcat(strcat('LASIC_Green_abs_boxplots(2)'),'.jpg')); %save figure as .jpg

    figure
    yyaxis left
    ax = gca
    ax.YColor = 'k';
    boxplot(AbsB,'symbol','*','outliersize',1,'color','k')
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    end

    hold on
    plot(nanmean(AbsB),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    ylim([-0.2 25])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    ylabel({'Blue Abs. coeff.';'(mm^{-1})'});
    xlabel('Months 2016 2017')
    set(gca, 'FontSize',20, 'LineWidth',2)
    xtickangle(0)
    % set(gcf,'Position',[90 20 1486 842]);
    set(gcf,'Position',[5 620 1321 318]); %slides
    

    yyaxis right
    ax = gca
    ax.YColor = 'r';
    hold on
    plot (nanmean(CN30_NTotal),'-r','LineWidth', 2)
    set(gca, 'FontSize',20, 'LineWidth',2)
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
    ylabel('f_{<30 nm} (%)')
    xlabel('Months 2016 2017')
    set(gcf,'Position',[5 620 1321 318]); %slides
    % set(gcf,'Position',[90 20 1486 842]);
    saveas(gcf,strcat(strcat('LASIC_Blue_abs_boxplots(2)'),'.jpg')); %save figure as .jpg

  

    figure

    yyaxis left
    ax = gca
    ax.YColor = 'k';
    boxplot(AbsR,'symbol','*','outliersize',1,'color','k')
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[250/255,128/255,114/255]);
    end

    hold on
    plot(nanmean(AbsR),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    ylim([-0.2 25])
    ylabel({'Red Abs. coeff.';'(mm^{-1})'});
    xlabel('Months 2016 2017')
    set(gca, 'FontSize',20, 'LineWidth',2)
    xtickangle(0)
    % set(gcf,'Position',[90 20 1486 842]);
    set(gcf,'Position',[5 620 1321 318]); %slides

    yyaxis right
    ax = gca
    ax.YColor = 'r';
    hold on
    plot (nanmean(CN30_NTotal),'-r','LineWidth', 2)
    set(gca, 'FontSize',20, 'LineWidth',2)
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
    ylabel('f_{<30 nm} (%)')
    xlabel('Months 2016 2017')
    set(gcf,'Position',[5 620 1321 318]); %slides
    % set(gcf,'Position',[90 20 1486 842]);
    saveas(gcf,strcat(strcat('LASIC_Red_abs_boxplots(2)'),'.jpg')); 
    
    
    figure %Red absorption for manuscript
    ax = gca;
    ax.YColor = 'k';
    boxplot(AbsR,'symbol','*','outliersize',1,'color','k')
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor', [100/255,149/255,237/255]);
    end
    hold on
    plot(nanmean(AbsR),'ok','MarkerSize',10,'markerfacecolor','w');
    plot (Abs_NPF_events_month_indices, Abs_NPF_events_median,'*r','MarkerSize',10)
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
    ylim([-0.2 20])
    ylabel({'Absoprtion coefficient (mm^{-1})'});
    xlabel('Months 2016 2017')
    set(gca, 'FontSize',20, 'LineWidth',2)
    xtickangle(0)
    set(gcf,'Position',[90 20 1486 842]);
    % set(gcf,'Position',[5 620 1321 318]); %slides
    legend('Monthly data','','','','','','','','','','','','','','','','','', 'NPF median')


    saveas(gcf,strcat(strcat('LASIC_Red_abs_boxplots(paper)'),'.jpg')); 
end

if option.boxplot_CO
    
    
    saveas(gcf,strcat(strcat('LASIC_CO_boxplots(3)'),'.jpg')); %save figure as .jpg

    figure 
    boxplot(CO)
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    end

    hold on
    plot(nanmean(CO),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    xtickangle(0)
    ylabel('CO (ppmv)');
    ylim([0 0.25])
    xlabel('Months')
    JW_figure_style(gcf,'paper_square');


    saveas(gcf,strcat(strcat('LASIC_CO_boxplots(paper)'),'.jpg')); %save figure as .jpg
end

if option.boxplot_SO2

      SO2(SO2<0)= NaN; %Excluding negative values. Comment this line to generate figures without negative values. 
      P95 = prctile(SO2,95);
      SO2(SO2>P95) = NaN; %Excluding values above P95
      

      figure %With CN concentrations and excluding negative values and higher than P95

      yyaxis left
      ax = gca;
      ax.YColor = 'k';
      boxplot(SO2)
      h=findobj(gca,'tag','Outliers');
      delete(h)
      set(findobj(gca,'type','line'),'linew',1.5)
      h = findobj(gca,'Tag','Box');

      for i = 1:length(h)
          patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[60/255,179/255,113/255]);
      end

      hold on
      plot(nanmean(SO2),'ok','MarkerSize',10,'markerfacecolor','w');
      xticks(1:1:17)
      xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
      xtickangle(0)
      ylabel('SO_{2} B1 (ppbv)');
      ylim([-0.1 0.6])
      xlabel('Months')
      set(gca, 'FontSize',20, 'LineWidth',2)
      set(gcf,'Position',[90 20 1486 842]);

       yyaxis right
     ax = gca;
     ax.YColor = 'k';
     plot (nanmean(NTotal),'-r','LineWidth', 2)
       hold on 
     plot (nanmean(CN30_NTotal),'-k','LineWidth', 2)
    set(gca, 'FontSize',20, 'LineWidth',2)
    xticks(1:1:17)
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
    ylabel('Particle concentration (cm^{-3})')
    xlabel('Months 2016 2017')
    set(gcf,'Position',[90 20 1486 842]);
    legend('','','','','','','','','','','','','','','','','','', 'CN Total','CN<30 nm')
    
    % saveas(gcf,strcat(strcat('LASIC_SO2_B1_boxplots_CN_without_neg_values'),'.jpg')); %save figure as .jpg


      figure %with negative values and excluding concentrations > P95 - check line 374 

      yyaxis left
      ax = gca;
      ax.YColor = 'k';
      boxplot(SO2)
      h=findobj(gca,'tag','Outliers');
      delete(h)
      set(findobj(gca,'type','line'),'linew',1.5)
      h = findobj(gca,'Tag','Box');

      for i = 1:length(h)
          patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[60/255,179/255,113/255]);
      end

      hold on
      plot(nanmean(SO2),'ok','MarkerSize',10,'markerfacecolor','w');
      xticks(1:1:17)
      xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
      xtickangle(0)
      ylabel('SO_{2} (ppbv)');
      ylim([-0.01 0.6])
      xlabel('Months')
      set(gca, 'FontSize',20, 'LineWidth',2)
      set(gcf,'Position',[90 20 1486 842]);

      yyaxis right
      ax = gca
      ax.YColor = 'r';
      hold on
      plot (nanmean(CN30_NTotal),'-r','LineWidth', 2)
      set(gca, 'FontSize',20, 'LineWidth',2)
      xticks([1:1:17])
      xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
      ylabel('f_{<30 nm} (%)')
      xlabel('Months 2016 2017')
      % set(gcf,'Position',[5 620 1321 318]); %slides
      set(gcf,'Position',[90 20 1486 842]);

      saveas(gcf,strcat(strcat('LASIC_SO2_B1_boxplots_with_neg_values'),'.jpg')); %save figure as .jpg

       % SO2a1(SO2a1==0)= NaN;
       % SO2a1(SO2a1<0) = NaN;
       % 
       % P5= percentile(SO2a1,5);
       % P95= percentile(SO2a1,95);
       % 
       % SO2a1() 

       figure
      boxplot(SO2a1)
      h=findobj(gca,'tag','Outliers');
      delete(h)
      set(findobj(gca,'type','line'),'linew',1.5)
      h = findobj(gca,'Tag','Box');

      for i = 1:length(h)
          patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[60/255,179/255,113/255]);
      end

      hold on
      plot(nanmean(SO2a1),'ok','MarkerSize',10,'markerfacecolor','w');
      xticks([1:1:17])
      xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
      xtickangle(0)
      ylabel('SO_{2} A1 (ppbv)');
      ylim([-0.5 50])
      xlabel('Months')
      set(gca, 'FontSize',20, 'LineWidth',2)
      set(gcf,'Position',[90 20 1486 842]);
  
        
      % saveas(gcf,strcat(strcat('LASIC_SO2_A1_boxplots'),'.jpg')); %save figure as .jpg
end
if option.timeseries_SO2
    
    %     % SO2a1(SO2a1<P5 & SO2a1>P95) = NaN;
    % SO2a1(SO2a1>P95) = NaN;
    % 
    % SO2a1(SO2a1>0.5) = NaN;
    % plot(SO2_temp.date_time,SO2a1)
    % SO2(SO2==0)= NaN;
    % P5= prctile(SO2,5);
    % P95= prctile(SO2,95);
    
    SO2 = SO2_temp.concentration;
    SO2(SO2<0) = NaN;
    SO2(SO2>1) = NaN;

    figure
    plot(SO2_temp.date_time,movmean(SO2,30))
    xticks([365 370 375 380 385 390 395 400])
    xticklabels({'05/31' '06/05' '06/10' '06/15' '06/20' '06/25' '06/30' '07/05'})
    ylabel('SO_{2} Concentration (b1) (ppbv)')
    xlabel('Days in 2017')
    set(gca, 'Fontsize', 16)
    JW_figure_style(gcf,'PT_land3');
    set(gcf,'Position',[90 20 1486 842]);
    saveas(gcf,strcat(strcat('LASIC_SO2_June 2017 (b1)'),'.jpg')); %save figure as .jpg
     
   
    % SO2a1(SO2a1==0)= NaN;
    % SO2a1(SO2a1<0) = NaN;
    % 
    % P5= prctile(SO2a1,5);
    % P95= prctile(SO2a1,95);
    SO2a1 = SO2a1_temp.concentration;
    SO2a1(SO2a1>0.5) = NaN;

    figure
    plot(SO2a1_temp.date_time,SO2a1)
    xticks([365 370 375 380 385 390 395 400])
    xticklabels({'05/31' '06/05' '06/10' '06/15' '06/20' '06/25' '06/30' '07/05'})
    ylabel('SO_{2} Concentration (a1) (ppbv)')
    xlabel('Days in 2017')
    set(gca, 'Fontsize', 16)
    JW_figure_style(gcf,'PT_land3');
    set(gcf,'Position',[90 20 1486 842]);
    saveas(gcf,strcat(strcat('LASIC_SO2_June 2017 (a1)'),'.jpg')); %save figure as .jpg
     
end

if option.boxplot_tracegas

    a = ammonium <=0;
    ammonium(a) = NaN;


    figure
    boxplot(ammonium)
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[60/255,179/255,113/255]);
    end

    hold on
    plot(nanmean(ammonium),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    xtickangle(0)
    ylabel('Ammonium (μg m^{-3})');
    ylim([-0.025 1])
    xlabel('Months')
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[90 20 1486 842]);


    % saveas(gcf,strcat(strcat('LASIC_ammonium_boxplots'),'.jpg')); %save figure as .jpg


    a = sulfate <=0;
    sulfate(a) = NaN;
    
    figure

    yyaxis left
    ax = gca;
    ax.YColor = 'k';
    boxplot(sulfate)
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[250/255,128/255,114/255]);
    end

    hold on
    plot(nanmean(sulfate),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    xtickangle(0)
    ylim([-0.1 4])
    ylabel('Sulfate (μg m^{-3})');
    xlabel('Months')
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[5 620 1321 318]); %slides
    % set(gcf,'Position',[90 20 1486 842]);
   
    yyaxis right
      ax = gca
      ax.YColor = 'r';
      hold on
      plot (nanmean(CN30_NTotal),'-r','LineWidth', 2)
      set(gca, 'FontSize',20, 'LineWidth',2)
      xticks([1:1:17])
      xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
      ylabel('f_{<30 nm} (%)')
      xlabel('Months 2016 2017')
      % set(gcf,'Position',[90 20 1486 842]);
      set(gcf,'Position',[5 620 1321 318]); %slides
    
    saveas(gcf,strcat(strcat('LASIC_sulfate_boxplots_CN'),'.jpg')); %save figure as .jpg

    a = nitrate <=0;
    nitrate(a) = NaN;
    figure
    boxplot(nitrate)
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[60/255,179/255,113/255]);
    end

    hold on
    plot(nanmean(nitrate),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    xtickangle(0)
    ylabel('Nitrate (μg m^{-3})');
    xlabel('Months')
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[90 20 1486 842]);


    %       saveas(gcf,strcat(strcat('LASIC_nitrate_boxplots'),'.jpg')); %save figure as .jpg


    a = total_organics <=0;
    total_organics(a) = NaN;


    figure 
     
    yyaxis left
    ax = gca
      ax.YColor = 'k';
    boxplot(total_organics)
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    end

    hold on
    plot(nanmean(total_organics),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    xtickangle(0)
    ylabel('Total organics (μg m^{-3})');
    xlabel('Months')
    ylim([-0.5 7])
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[90 20 1486 842]);

     yyaxis right
      ax = gca
      ax.YColor = 'r';
      hold on
      plot (nanmean(CN30_NTotal),'-r','LineWidth', 2)
      set(gca, 'FontSize',20, 'LineWidth',2)
      xticks([1:1:17])
      xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
      ylabel('f_{<30 nm} (%)')
      xlabel('Months 2016 2017')
      set(gcf,'Position',[5 620 1321 318]); %slides
      % set(gcf,'Position',[90 20 1486 842]);

      saveas(gcf,strcat(strcat('LASIC_total_organics_boxplots'),'.jpg')); %save figure as .jpg
 
    a = chloride <=0;
    chloride(a) = NaN;
    figure
    boxplot(chloride)
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[60/255,179/255,113/255]);
    end

    hold on
    plot(nanmean(chloride),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    xtickangle(0)
    ylabel('Chloride (μg m^{-3})');
    xlabel('Months')
    ylim([-0.019 0.7])
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[90 20 1486 842]);

    saveas(gcf,strcat(strcat('LASIC_chloride_boxplots'),'.jpg')); %save figure as .jpg

end

if option.NPF_events_counts

    x = 1:1:17;
    NPF = [0 0 1 2 0 1 0 0 0 0 0 0 0 1 1 10 5;0 0 0 2 0 4 2 5 3 2 0 0 0 4 2 1 4];

figure 
yyaxis left
ax = gca;
ax.YColor = 'k';
b = bar(x,NPF,'stacked','LineWidth',2);
set(b,{'FaceColor'},{[0 0.4470 0.7410];[0.8500 0.3250 0.0980]});
xticks(1:1:17)
xticklabels({'J','J','A','S','O','N', 'D', 'J','F','M','A','M','J','J','A','S','O'})
xtickangle(0)
xtips1 = b(1).XEndPoints;
ytips1 = b(1).YEndPoints;
labels1 = string(b(1).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',20)
xtips2 = b(2).XEndPoints;
ytips2 = b(2).YEndPoints;
labels2 = string(b(2).YData);
text(xtips2,ytips2,labels2,'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',20)
xlabel('Months')
ylabel('NPF counts')
set(gca, 'FontSize',20, 'LineWidth',2,'ticklength',[0.005 0.005])
set(gcf,'Position',[90 20 842 842]);
yyaxis right
ax = gca;
ax.YColor = 'k';
plot (nanmean(CN_30nm),'-k','LineWidth', 2)
ylabel({'\it{N_{<30nm}}'  ; '(cm^{-3})'});
set(gca, 'FontSize',20, 'LineWidth',2)
lgd = legend([b(1) b(2)],'Strong', 'Weak','orientation', 'horizontal');
lgd.Position = [0.479129469749286,0.932400897725046,0.361428564999785,0.054285712838173];
JW_figure_style(gcf,'paper_square');

 saveas(gcf,strcat(strcat('LASIC_NPF_monthly_counts'),'.jpg')); %save figure as .jpg

tmpidx=CN_Sarea>prctile(CN_Sarea,99,'all');
    CN_Sarea(tmpidx)=nan;
    S_area = nanmean(CN_Sarea);
 
 figure %Including Surface area
 yyaxis left
ax = gca;
ax.YColor = 'k';
b = bar(x,NPF,'stacked','LineWidth',2);
set(b,{'FaceColor'},{[0 0.4470 0.7410];[0.8500 0.3250 0.0980]});
xticks(1:1:17)
xticklabels({'J','J','A','S','O','N', 'D', 'J','F','M','A','M','J','J','A','S','O'})
xtickangle(0)
xtips1 = b(1).XEndPoints;
ytips1 = b(1).YEndPoints;
labels1 = string(b(1).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',20)
xtips2 = b(2).XEndPoints;
ytips2 = b(2).YEndPoints;
labels2 = string(b(2).YData);
text(xtips2,ytips2,labels2,'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',20)
xlabel('Months')
ylabel('NPF counts')
set(gca, 'FontSize',20, 'LineWidth',2,'ticklength',[0.005 0.005])
set(gcf,'Position',[90 20 842 842]);

yyaxis right
ax = gca
ax.YColor = 'k';
plot (S_area,'-k','LineWidth', 2)
ylabel({'\it{S_{total}}'  ; '(μm^{2} cm^{-3})'});   
set(gca, 'FontSize',20, 'LineWidth',2)
lgd = legend([b(1) b(2)],'Strong', 'Weak','orientation', 'horizontal');
lgd.Position = [0.479129469749286,0.932400897725046,0.361428564999785,0.054285712838173];
JW_figure_style(gcf,'paper_square');


 saveas(gcf,strcat(strcat('LASIC_NPF_monthly_counts_Sarea'),'.jpg')); %save figure as .jpg

end

if option.N30_boxplots
    a = CN30_NTotal <=0;
    CN30_NTotal(a) = NaN;

    figure
    boxplot(CN30_NTotal)
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    end

    hold on
    plot(nanmean(CN30_NTotal),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    xtickangle(0)
    ylabel('f_{<30 nm} (%)')
    % ylim([0 0.25])
    xlabel('Months')
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[90 20 1486 842]);
    


    % saveas(gcf,strcat(strcat('LASIC_fraction_CN30nm_monthlyboxplots'),'.jpg')); %save figure as .jpg


    %Figure to the manuscript:
    a = CN_30nm <=0;
    CN_30nm(a) = NaN;

    figure
    boxplot(CN_30nm)
    ax = gca;
    ax.YColor = 'k';
    lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    end
    set(lines, 'Color', 'k');
    hold on
    plot(nanmean(CN_30nm),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    xtickangle(0)
    ylabel('{\itN}_{<30} (cm^{-3})')
    ylim([-0.8 180])
    xlabel('Months 2016 2017')
    set(gca, 'FontSize',20, 'LineWidth',2)
    JW_figure_style(gcf,'paper_marcus');
    set(gcf,'Position',[90 20 700 842]);
    xticklabels({'6','7','8','9','10','11', '12', '1','2','3','4','5','6','7','8','9','10'})
    box on
    ax = gca;
    ax.LineWidth = 1.5;


    % saveas(gcf,strcat(strcat('LASIC_CN30nm_boxplots'),'.jpg')); %save figure as .jpg
end

if option.cloud_Base_height

    figure
    boxplot(CBH)
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    end

    hold on
    plot(nanmean(CBH),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    xtickangle(0)
    ylabel('Cloud Base Height');
    % ylim([0 0.25])
    xlabel('Months')
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[90 20 1486 842]);

    saveas(gcf,strcat(strcat('LASIC_Cloud base height'),'.jpg')); %save figure as .jpg

end
if option.CPC_monthly

    CPC(CPC<0) = NaN; 
    % tmpidx = CPC>prctile(CPC,99);
    % CPC(tmpidx)=NaN;
                
    
    figure %generating boxplots for the monthly particle number concentration from CPC
    boxplot(CPC)
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    end

    hold on
    plot(nanmean(CPC),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])

    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    xtickangle(0)
    ylabel({'{\itN} (cm^{-3})'});
    ylim([0 1000])
    xlabel('Months')
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[90 20 1486 842]);
    title('Monthly particle number concentration from CPC')

    % saveas(gcf,strcat(strcat('LASIC_Monthly CPCconcentration'),'.jpg'));
    % %save figure as .jpgend

%Testing for particles below 30 nm





    UFCPC(UFCPC<0) = NaN;
    % tmpidx = UFCPC>prctile(CPC,99);
    % UFCPC(tmpidx)=NaN;
                
    

    figure %generating boxplots for the monthly particle number concentration from UFCPC
    boxplot(UFCPC)
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    end

    hold on
    plot(nanmean(UFCPC),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    xtickangle(0)
    ylabel('Cloud Base Height');
    ylabel({'\it{N} (cm^{-3})'});
    ylim([0 1000])
    xlabel('Months')
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[90 20 1486 842]);
    title('Monthly particle number concentration from UFCPC')
    exportgraphics(gcf, strcat('LASIC_UFCPC_monthly_concentration.jpg'), 'Resolution', 300)


    % saveas(gcf,strcat(strcat('LASIC_Monthly UFCPC concentration'),'.jpg')); %save figure as .jpg

    CPC(2678049:2678058,:) = []; %excluding excess datasets
    NFP = movmean(UFCPC,10)*0.95-movmean(CPC,10); %newly formed particles should be the difference between the CPC and UFCPC and show only particles 3-10 nm
    % NFP(NFP<0) = NaN;

    figure
    boxplot(NFP)
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    end

    hold on
    plot(nanmean(NFP),'ok','MarkerSize',10,'markerfacecolor','w');
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    xtickangle(0)
    ylabel({'\it{N} (cm^{-3})'});
    ylim([0 300])
    xlabel('Months')
    set(gca, 'FontSize',20, 'LineWidth',2)
    set(gcf,'Position',[90 20 1486 842]);
    title('Difference between UFCPC and CPC')


    % saveas(gcf,strcat(strcat('LASIC_Monthly CPC difference concentration'),'.jpg')); %save figure as .jpg

  
    %Concerned that CN<30 nm and NPF values were not agreeing, I am plotting their mean monthly value for comparison:
    mean_NPF = nanmean(NFP);
    mean_CN30 = nanmean(CN_30nm);

    
  

    figure
    yyaxis left
    plot (mean_NPF)
    ylabel('N_{<10nm} (cm^{-3})');
    JW_figure_style(gcf,'paper_square');

    yyaxis right
    plot (mean_CN30)
    ylabel('N_{<30nm} (cm^{-3})');
    xticks(1:1:17)
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    JW_figure_style(gcf,'paper_square');
    
    
    
    median_NPF = nanmedian(NFP);
    median_CN30 = nanmedian(CN_30nm);

    figure
    yyaxis left
    plot (median_NPF)
    ylabel('N_{<10nm} (cm^{-3})');
    JW_figure_style(gcf,'paper_square');
    ylim([0 30])

    yyaxis right
    plot (median_CN30)
    ylabel('N_{<30nm} (cm^{-3})');
        ylim([0 30])
    xticks(1:1:17)
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    JW_figure_style(gcf,'paper_square');

    figure 
    plot(0.95*movmean(UFCPC(:,3),100))    
    hold on     
    plot(movmean(CPC(:,3),100))


    
    end
if option.AAE_monthly 
        
        for i =1:17
        x=[648,529,464]; %red, green, blue
        y_PSAP_data_Combined_EL= [AbsR(:,i),AbsG(:,i),AbsB(:,i)];
        % y_PSAP_data_Combined_EL = [Abs_date, AbsR, AbsG, AbsB];
        lx = log(x);
        ly_PSAP_combined = log(y_PSAP_data_Combined_EL);
        log_PSAP_combined = -[lx(:) ones(size(x(:)))] \ ly_PSAP_combined(:,:)';
        AAE_PSAP_combined_EL = log_PSAP_combined(1,:)';
        AAE_PSAP_combined_EL(AAE_PSAP_combined_EL > 5 | AAE_PSAP_combined_EL < 0.5)= NaN;
        % outdata_PSAPcombined=[y_PSAP_data_Combined_EL AAE_PSAP_combined_EL];
        clear x y_PSAP_data_Combined_EL lx ly_PSAP_combined log_PSAP_combined
        PSAP_data_Combined(:,i) = AAE_PSAP_combined_EL;

        end
        

    

        figure
        boxplot(CBH)
        h=findobj(gca,'tag','Outliers');
        delete(h)
        set(findobj(gca,'type','line'),'linew',1.5)
        h = findobj(gca,'Tag','Box');

        for i = 1:length(h)
            patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
        end

        hold on
        plot(nanmean(CBH),'ok','MarkerSize',10,'markerfacecolor','w');
        xticks([1:1:17])
        xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
        xtickangle(0)
        ylabel('Cloud Base Height');
        % ylim([0 0.25])
        xlabel('Months')
        set(gca, 'FontSize',20, 'LineWidth',2)
        set(gcf,'Position',[90 20 1486 842]);

        saveas(gcf,strcat(strcat('LASIC_Cloud base height'),'.jpg')); %save figure as .jpg

end

if option.statistical_test

    x = [CN_30nm(:,1);CN_30nm(:,2); CN_30nm(:,3);CN_30nm(:,4)]; %June to September in 2016
    x = double(x);

    x2= [CN_30nm(:,14);CN_30nm(:,15);CN_30nm(:,16);CN_30nm(:,17)]; %from July to October in 2017 
    x2 = double(x2);

    y = [CN_30nm(:,5);CN_30nm(:,6);CN_30nm(:,7);CN_30nm(:,8);CN_30nm(:,9);CN_30nm(:,10);CN_30nm(:,11);CN_30nm(:,12);CN_30nm(:,13)];
    alpha = 0.01;

    % [h, p, ci, stats] = ttest(x, y, 'Alpha', alpha);
    h = ttest(x,0,'Alpha',0.01);


end

if option.SDF_monthly

    SDP_size = SMPS_temp.diameter_midpoint_nm;
    SDF_median = median(SDF,2);
    SDF75= prctile(SDF,75,2);
    SDF75(isnan(SDF75)) = 0; %Shading won't show if NaN
    SDF25= prctile(SDF,25,2);
    SDF25(isnan(SDF25)) = 0; %Shading won't show if NaN
    
    figure('Name','Mean size distribution of all the NPF events')
    fill([SDP_size; flipud(SDP_size)],[SDF75; flipud(SDF25)], [0.2 0.6 1], 'FaceAlpha', 0.4, 'linestyle', 'none');

    hold on

    % Plot the median line
    plot(SMPS_temp.diameter_midpoint_nm, SDF_median, 'k', 'LineWidth', 1.5)

    % Labels
    ylabel({'d{\itN}/dlog_{10}{\itD_p} (cm^{-3})'});
    xlabel('{\itD_p} (nm)');

    % Set plot properties
    grid on
    box on

    set(gca, 'XScale', 'log')
    xlim([10 500]);
    ylim([0, 550]);

    % JW_figure_style(gcf,'paper_square');
    JW_figure_style(gcf,'paper_marcus');
    set(gca,'TickDir','in');
    box on
    ax = gca;
    ax.LineWidth = 1.5;
    set(gcf,'Position',[90 20 700 842]);

end
if option.manuscript_boxplots
% cd 'C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\DOE ARM Data\LASIC\SP2_Manisha' %location of SP2 raw data
cd '/Users/marcusbatista/Library/CloudStorage/OneDrive-UniversityofMiami/University_of_Miami/Thesis/DOE_Projects/DOE ARM Data/LASIC/SP2_Manisha'
d = pwd; % pwd: returns the path to the current folder.
load('Lasic_SP2_BC_DATA_1Min')


%Converting from ng/m³ to μg/m³
% Lasic_SP2_BC_DATA(:,8) = Lasic_SP2_BC_DATA(:,8)/1000;

% Initialize variables
startDate = datenum('01-May-2016 00:00:00'); % Starting date
endDate = datenum('31-Oct-2017 23:59:59');   % Ending date

% Create an empty cell array to store each month's BC data
BC_combined = [];
month_date=[];


% Loop through the months May 2016 to October 2017
max_rows=0;
currentDate = startDate;
while currentDate <= endDate
    % Get the year and month of the current date
    [year, month, ~] = datevec(currentDate);
   idx = Lasic_SP2_BC_DATA(:,2) == year & Lasic_SP2_BC_DATA(:,3) == month;  % Logical index for this month and year
    BC_month = Lasic_SP2_BC_DATA(idx, 8);  % Column 8 contains Black Carbon concentration
    max_rows = max(max_rows, length(BC_month));  % Track the maximum number of rows
    currentDate = addtodate(currentDate, 1, 'month');
end

currentDate = startDate;
while currentDate <= endDate
    [year, month, ~] = datevec(currentDate);

    % Select all rows that correspond to the current month and year
    idx = Lasic_SP2_BC_DATA(:,2) == year & Lasic_SP2_BC_DATA(:,3) == month;  % Logical index for this month and year

    % Extract the BC concentration for this month
    BC_month = Lasic_SP2_BC_DATA(idx, 8);  % Column 8 contains Black Carbon concentration

    % Pad the month's BC data with NaNs to match the max_rows
    BC_month_padded = NaN(max_rows, 1);  % Create a NaN-padded column
    BC_month_padded(1:length(BC_month)) = BC_month;  % Fill in the BC data

    % Store the BC concentration in the combined array
    BC_combined = [BC_combined, BC_month_padded];  % Append the month's BC data as a new column

    % Move to the next month
    currentDate = addtodate(currentDate, 1, 'month');
    month_date = [month_date;currentDate];
end
    BC_combined = BC_combined(:,2:18); %From June 2016 to Aug 2017
    BC_NPF = [19.7308200000000	21.6676235000000	18.0091440000000	1.33433760000000	2.02098250000000	111.437050000000	2.13616940000000	8.29547120000000];
    BC_NPF_events_month_indices  = [3 4 4 6 6 14 15 15 ];


    %Figure to the manuscript:
    a = CO <=0;
    CO(a) = NaN;

    CO_NPF_events_month_indices  = [3 4 4 6 6 14 15 15 16 16 16 16 16 16 16 16 16 16 16 17 17 17 17 17];
    CO_NPF_events_median = [0.0615323505985240	0.0636079998066028	0.0643128729114930	0.0553035994991660	0.0563547066723307	0.0710511764511466	0.0569451425845424	0.0586419266027709	0.0598784051214655	0.0580470147853096	0.0660933027664820	0.0688268655911088	0.0812974059333404	0.0702990092337132	0.0842387883613507	0.0650507013003031	0.0732359779377778	0.0906061804542939	0.0743368408953150	0.0615325567933420	0.0706486237545808	0.0678681115309397	0.0805260104437669	0.0707482006400824]*1000;
    % CO_Background = [70 70 70 70 70 70 70 70 70 70 70 70 70 70 70 70 70 70 70 70 70 70 70 70 70];


    a = AbsG <=0;
    AbsG(a) = NaN;

    Abs_NPF_events_month_indices  = [3 4 4 6 6 14 15 15 16 16 16 16 16 16 16 16 16 16 16 17 17 17 17 17];
    Abs_NPF_events_median = [0.182958200573921	0.230144202709198	0.236864097416401	0.0649822950363159	0.0456987395882607	1.49397134780884	0.0571116730570793	0.115043275058270	0.0807635039091110	0.102402918040752	0.177005045115948	0.736522257328033	1.01711767911911	0.268270552158356	1.21052634716034	0.0978845357894898	0.409814417362213	2.14923596382141	0.324720442295074	0.0447678454220295	0.0640833526849747	0.0385142453014851	0.549798846244812	0.0353765487670898];
    
    a = CN_30nm <=0;
    CN_30nm(a) = NaN;
    N_30_NPF_events_month_indices  = [3 4 4 6 6 14 15 15 16 16 16 16 16 16 16 16 16 16 16 17 17 17 17 17];
    N_30_median = [142.814468383789	69.8315734863281	86.6865692138672	27.9575939178467	27.9243545532227	125.827041625977	87.9826660156250	98.5561294555664	89.4482803344727	133.323036193848	134.881378173828	157.237731933594	120.496589660645	129.425323486328	102.592559814453	103.016036987305	100.293666839600	96.9067840576172	204.553314208984	67.8255004882813	96.8126525878906	26.4766464233398	43.0135002136231	107.835502624512];

    figure
    subplot(4,1,1);
    boxplot(CN_30nm)
    lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');set(lines, 'Color', 'k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    end

    hold on
    plot(nanmean(CN_30nm),'ok','MarkerSize',8,'markerfacecolor','w');
    plot (N_30_NPF_events_month_indices, N_30_median,'or','MarkerSize',8,'LineWidth',2)
    xticks([1:1:17])
    xticklabels([])    
    ylabel('{\itN}_{<30} (cm^{-3})')
    ylim([0 200])
    % yticks([0 50 100 150 200 250]);yticklabels([0 50 100 150 200 250])
    set(gca, 'FontSize',20, 'LineWidth',2)
    % set(gcf,'Position',[90 20 1486 842]);
    legend('Monthly data','','','','','','','','','','','','','','','','','', 'NPF median')
    % set(gcf,'Position',[0.145833333333333,0.117797695262484,0.775,0.248399487836108]);
    % set(gcf,'Position',[16,68.5,77.5,23.21]);
    
   
    
    subplot(4,1,2);
    boxplot(CO*1000,'symbol','*','color','k')
    lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');set(lines, 'Color', 'k');
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    end

    hold on
    plot(nanmean(CO)*1000,'ok','MarkerSize',8,'markerfacecolor','w');
    plot (CO_NPF_events_month_indices, CO_NPF_events_median,'or','MarkerSize',8,'LineWidth',2)
    % plot(0:24,CO_Background,'--m','Linewidth',2)
    xticks([1:1:17])
    xticklabels([])    
    ylabel('CO (ppbv)');
    ylim([0 250])
    % yticks([0 50 100 150 200 250]);yticklabels([0 50 100 150 200 250])
    % xlabel('Months')
    set(gca, 'FontSize',20, 'LineWidth',2)
    % set(gcf,'Position',[90 20 1486 842]);
    % set(gcf,'Position',[0.145833333333333,0.117797695262484,0.775,0.248399487836108]);
    % set(gcf,'Position',[16,68.5,77.5,23.21]);
    
    %SP2
    subplot(4,1,3);
    boxplot(BC_combined,'symbol','*','outliersize',1,'color','k')
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');

    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor',[100/255,149/255,237/255]);
    end

    hold on
    plot(nanmean(BC_combined),'ok','MarkerSize',10,'markerfacecolor','w');
    plot (BC_NPF_events_month_indices, BC_NPF,'or','MarkerSize',8,'LineWidth',2)
    xticks([1:1:17])
    % ylim([-0.2 25])
    % xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','April','May','Jun','Jul','Aug','Sep','Oct'})
    xticklabels([])
    % legend('Monthly data','','','','','','','','','','','','','','','','','','NPF median')
    ylabel({'rBC (ng m^{-3})'});
    set(gca, 'FontSize',20, 'LineWidth',2)
    xtickangle(0)
    % set(gcf,'Position',[90 20 1486 842]);
    % set(gcf,'Position',[5 620 1321 318]); %slides
    % set(gcf,'Position',[16,40,77.5,23.21]);

    subplot(4,1,4);
    %Red absorption for manuscript
    ax = gca;
    ax.YColor = 'k';
    boxplot(AbsR,'symbol','*','outliersize',1,'color','k')
    h=findobj(gca,'tag','Outliers');
    delete(h)
    set(findobj(gca,'type','line'),'linew',1.5)
    h = findobj(gca,'Tag','Box');
    for i = 1:length(h)
        patch(get(h(i),'XData'),get(h(i),'YData'),'y','FaceAlpha',.4,'FaceColor', [100/255,149/255,237/255]);
    end
    hold on
    plot(nanmean(AbsR),'ok','MarkerSize',10,'markerfacecolor','w');
    plot (Abs_NPF_events_month_indices, Abs_NPF_events_median,'or','MarkerSize',8,'LineWidth',2)
    xticks([1:1:17])
    xticklabels({'Jun','Jul','Aug','Sep','Oct','Nov', 'Dec', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct'})
    ylim([-0.2 20])
    ylabel({'Absoprtion' ;'coefficient (mm^{-1})'});
    xlabel('Months 2016 2017')
    set(gca, 'FontSize',20, 'LineWidth',2)
    xtickangle(0)
    % set(gcf,'Position',[16,12,77.5,23.21]);
    % set(gcf,'Position',[5 620 1321 318]); %slides
    % legend('Monthly data','','','','','','','','','','','','','','','','','', 'NPF median')

end