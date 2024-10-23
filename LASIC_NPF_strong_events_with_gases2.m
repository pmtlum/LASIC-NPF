% Open Day.mat for all day_num and generate weekly time series plots including N, Stotal, Precipitation, CO, and absorption coefficient.
function LASIC_NPF_strong_events_with_gases2=LASIC_NPF_strong_events_with_gases2(NPF)

switch NPF

    case 1 %NPF on 08/01/2016
        option.weeklyplot=      1;

        weekly_array=[9] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        data1 = datenum(2016,08,01,03,05,00);
        data2 = datenum(2016,08,03,23,59,59);
        step = datenum(0,0,0,0,240,0);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        days = [61 64];
        % NPF_time = [62.1389 62.685]; %Spreadsheet values
        NPF_time = [62.0451 62.2743]; %2 hours before and after

    case 2 %NPF on 09/12/2016
        option.weeklyplot=      1;

        weekly_array=[15] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [104 105.5];
        a = days(2)-days(1) ;
        if a== 3
            step = datenum(0,0,0,1,0,0);
        else
            step = datenum(0,0,0,1,0,0);
        end
        data1 = datenum(2016,09,12,19,05,00);
        data2 = datenum(2016,09,12,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        NPF_time2 = [104.795 105];%Spreadsheet values
        NPF_time = [104.7118 105.0833]; %2 hours before and after

    case 3 %NPF on 09/20/2016
        option.weeklyplot=      1;

        weekly_array=[16] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [110 113];
        a = days(2)-days(1) ;

        step = datenum(0,0,0,6,0,0);

        data1 = datenum(2016,09,20,00,00,00);
        data2 = datenum(2016,09,21,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        % NPF_time = [112.0 112.460]; %Spreadsheet values
        NPF_time = [111.9167 112.5556]; %2 hours before and after




    case 4 %NPF on 11/18/2016 and 11/20/2016
        option.weeklyplot=      1;

        weekly_array=[25] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [171 173.5];
        a = days(2)-days(1) ;
        if a== 3
            step = datenum(0,0,0,6,0,0);
        else
            step = datenum(0,0,0,6,0,0);
        end
        data1 = datenum(2016,11,18,09,25,00);
        data2 = datenum(2016,11,20,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');

        % NPF_time = [171.469 171.985]; %Spreadsheet values
        NPF_time = [171.3090 172.0933]; %2 hours before and after


    case 5 %NPF on 7/24/2017 and 7/25/2017
        option.weeklyplot=      1;

        weekly_array= 60; %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [419.5 420.5];
        a = days(2)-days(1) ;
        step = datenum(0,0,0,6,0,0);

        data1 = datenum(2017,07,25,04,15,00);
        data2 = datenum(2017,07,25,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        % NPF_time = [420.177 420.431];%Spreadsheet values
        NPF_time = [420.0938 420.5174]; %2 hours before and after



    case 6 %NPF on 8/04/2017
        option.weeklyplot=      1;

        weekly_array=[62] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [429 431];
        a = days(2)-days(1) ;
        if a== 3
            step = datenum(0,0,0,12,0,0);
        else
            step = datenum(0,0,0,0,288,0);
        end
        data1 = datenum(2017,08,04,00,00,00);
        data2 = datenum(2017,11,20,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');


    case 7 %NPF on 8/23/2017
        option.weeklyplot=      1;

        weekly_array=[65] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [449 451];
        a = days(2)-days(1) ;
        if a== 3
            step = datenum(0,0,0,12,0,0);
        else
            step = datenum(0,0,0,6,00,0);
        end
        data1 = datenum(2017,08,23,00,00,00);
        data2 = datenum(2017,11,20,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        NPF_time = [449.8577 450.1840];%Spreadsheet values
        % NPF_time = [449.7743 450.2778]; %2 hours before and after






    case 8 %NPF on 9/13/2017
        option.weeklyplot=      1;

        weekly_array=[68] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [470 473];
        a = days(2)-days(1) ;
        if a== 3
            step = datenum(0,0,0,6,0,0);
        else
            step = datenum(0,0,0,6,00,0);
        end
        data1 = datenum(2017,09,13,00,00,00);
        data2 = datenum(2017,09,15,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        % NPF_time = [470.5485 470.729];%Spreadsheet values
        NPF_time = [470.4583 470.8125]; %2 hours before and after

    case 9 %NPF on 9/15/2017
        option.weeklyplot=      1;

        weekly_array=[68] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [471 474];
        a = days(2)-days(1) ;
        if a== 3
            step = datenum(0,0,0,6,0,0);
        else
            step = datenum(0,0,0,6,00,0);
        end
        data1 = datenum(2017,09,15,00,00,00);
        data2 = datenum(2017,09,16,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        % NPF_time = [473.715 474]; %Spreadsheet values
        NPF_time = [473.6250 474.0833]; %2 hours before and after

    case 10 %NPF on 9/18/2017
        option.weeklyplot=      1;

        weekly_array=[68] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [474.5 476];
        a = days(2)-days(1) ;
        step = datenum(0,0,0,6,0,0);
        data1 = datenum(2017,09,18,11,00,00);
        data2 = datenum(2017,09,19,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        % NPF_time = [475.465 475.618]; %Spreadsheet values
        NPF_time = [475.3889 475.6979]; %2 hours before and after

    case 11 %NPF on 9/20/2017
        option.weeklyplot=      1;

        weekly_array=[69] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [477.5 478.5];
        a = days(2)-days(1) ;

        step = datenum(0,0,0,12,0,0);

        data1 = datenum(2017,09,20,19,40,00);
        data2 = datenum(2017,09,21,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        % NPF_time = [477.8195 477.917];%Spreadsheet values
        NPF_time = [477.7361 477.9965]; %2 hours before and after

    case 12; %NPF on 9/23/2017
        option.weeklyplot=      1;

        weekly_array=[69] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [479 482];
        a = days(2)-days(1) ;
        if a== 3
            step = datenum(0,0,0,6,0,0);
        else
            step = datenum(0,0,0,6,0,0);
        end
        data1 = datenum(2017,09,23,22,45,00);
        data2 = datenum(2017,09,25,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        % NPF_time = [479.948 479.999]; %according to the table
        NPF_time = [479.8646 480.1458];  % 2 hours before and after





    case 13 %NPF on 9/25/2017
        option.weeklyplot=      1;

        weekly_array=[69] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [482 484];
        a = days(2)-days(1) ;
        if a== 3
            step = datenum(0,0,0,12,0,0);
        else
            step = datenum(0,0,0,0,240,0);
        end
        data1 = datenum(2017,09,25,09,00,00);
        data2 = datenum(2017,11,20,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        NPF_time = [482.3819 482.7743]; %according to the table
        % NPF_time = [482.2986 482.8576];  % 2 hours before and after


    case 14; %NPF on 9/27/2017 and 09/28/2017
        option.weeklyplot=      1;

        weekly_array=[69] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [483 485.5];
        a = days(2)-days(1) ;

        step = datenum(0,0,0,12,0,0);

        data1 = datenum(2017,09,26,00,00,00);
        data2 = datenum(2017,09,28,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        % NPF_time = [483.8264 484.3056]; %according to the table
        NPF_time = [483.7431 484.222];  % 2 hours before and after

    case 15; %NPF on 9/29/2017 and 09/30/2017
        option.weeklyplot=      1;

        weekly_array=[70] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [487 487.5];
        a = days(2)-days(1) ;
        step = datenum(0,0,0,12,0,0);
        data1 = datenum(2017,09,30,00,00,00);
        data2 = datenum(2017,09,30,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        % NPF_time = [483.8264 484.3056]; %according to the table September 27, 2017.
        % NPF_time = [483.7431 484.222];  % 2 hours before and after September 27, 2017.

        % NPF_time = [486.1875 486.8611]; %according to the table September 29, 2017.
        % NPF_time = [486.1042 486.9444];  % 2 hours before and after September 29, 2017.

        % NPF_time = [486.1910 486.5660]; %according to the table September 30, 2017.
        NPF_time = [486.1077 486.6493];  % 2 hours before and after September 30, 2017.




    case 16; %NPF on 10/04/2017 and 10/05/2017
        option.weeklyplot=      1;

        weekly_array=[71] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [491 494];
        a = days(2)-days(1) ;
        if a== 3
            step = datenum(0,0,0,6,0,0);
        else
            step = datenum(0,0,0,6,0,0);
        end
        data1 = datenum(2017,10,04,00,00,00);
        data2 = datenum(2017,10,07,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');

    case 17; %NPF on 10/07/2017 and 10/10/2017
        option.weeklyplot=      1;

        weekly_array=[71] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [494 498];
        a = days(2)-days(1) ;
        if a== 3
            step = datenum(0,0,0,12,0,0);
        else
            step = datenum(0,0,0,6,0,0);
        end
        data1 = datenum(2017,10,07,00,00,00);
        data2 = datenum(2017,10,11,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');

        % NPF_time = [494.6736 494.7639]; %according to the table
        NPF_time = [494.5903 494.8472];  % 2 hours before and after events



    case 18; %NPF on 10/15/2017 to 10/19/2017
        option.weeklyplot=      1;

        weekly_array=[72] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [502 505];
        a = days(2)-days(1) ;
        if a== 3
            step = datenum(0,0,0,12,0,0);
        else
            step = datenum(0,0,0,0,288,0);
        end
        data1 = datenum(2017,10,16,00,00,00);
        data2 = datenum(2017,10,17,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        % NPF_time = [502.1597 502.4965]; %according to the table Oct 15
        % NPF_time = [502.0764 502.5799];  % 2 hours before and after events Oct 15

        % NPF_time = [503.3785 503.4896]; %according to the table Oct 16
        NPF_time = [503.2951 503.5729];  % 2 hours before and after events Oct 16


    case 19; %NPF on 10/18/2017 to 10/20/2017
        option.weeklyplot=      1;

        weekly_array=[73] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [505 508];
        a = days(2)-days(1) ;
        if a== 3
            step = datenum(0,0,0,12,0,0);
        else
            step = datenum(0,0,0,0,288,0);
        end
        data1 = datenum(2017,10,20,00,00,00);
        data2 = datenum(2017,10,20,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');
        % NPF_time = [505.1354 505.7708]; %according to the table Oct 18
        % NPF_time = [505.0521 505.8542];  % 2 hours before and after events Oct 18

        % NPF_time = [507.0243 507.3472]; %according to the table Oct 20
        NPF_time = [506.9410 507.4306];  % 2 hours before and after events Oct 20



    case 20; % WAST poster figure NPFevent from on 10/18/2017 to 10/20/2017


        weekly_array=[73] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [505 507.5];
        a = days(2)-days(1) ;
        step = datenum(0,0,0,12,0,0);


        data1 = datenum(2017,10,18,00,00,00);
        data2 = datenum(2017,10,20,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');

        for week_num=weekly_array
            week_num

            filename=strcat('C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\LASIC\LASIC_Matlab_Code\Weekly_data_files_Marcus\Week',num2str(week_num));
            load(filename);

            if 1
                option.save_image = 1; % 0 doesn't save the figure, 1 saves the figure to the current directory
            end

            struct_name_array={'week_num','SMPS_temp','CPC_temp','MET_temp','CO_temp','PSAP_temp','SKYRAD_temp','SP2_temp','DL_temp','SO2_temp','O3_temp'};
            for i=1:1:length(struct_name_array)
                struct_name=struct_name_array{i};
                eval([struct_name,'=ground_weekly.',struct_name]);
            end
            Ntotal=interp1(CPC_temp.date_time,CPC_temp.concentration,SMPS_temp.date_time); %Interpolating CPC (1sec) and SMPS(5min)
            CN20_NTotal = SMPS_temp.N_nuc./Ntotal'; %Extracting the fraction of CN20 in CNtotal
            flag=(CN20_NTotal>0.3);

        end
        option.weeklyplot=      1;
        figure
        sdfplot=subplot(6,1,1);
        H=pcolor(SMPS_temp.date_time',SMPS_temp.diameter_midpoint_nm,SMPS_temp.number_size_distribution);
        set(H,'EdgeColor','none');
        c=colorbar;
        colormap(sdfplot,jet);
        caxis([0 500]);
        c.Label.String = {'d{\itN}/dlog_{10}{\itD_p}';'(cm^{-3})'};
        ylabel('{\itD_p} (nm)');
        yticks([20 40 80 160 400]);
        set(gca,'TickDir','out');
        % title((strcat('NPF strong event on',{' '},(datestr(data1)))))
        set(gca,'Yscale','log');
        ylim([10 400]);
        xlim([week_num*7+1-7  week_num*7+1]); %This make sure that the xlim is aligned with other pannels
        xlim([days])
        xticklabels([])
        ax1 = get(gca,'Xtick');
        set(gca,'Fontsize',20)


        alignplot=subplot(6,1,2);
        subplot(6,1,2);

        a = length(CO_temp.co);
        for j =1:1:a
            if CO_temp.co(j,1) >= 0.09
                CO_temp.co(j,1) = NaN;
            else
                b=1+1;
            end
        end

        CO_conc = CO_temp.co;
        a = find (CO_temp.date_time>=507 & CO_temp.date_time<= 507.005);
        CO_conc(a) = NaN;

        b = min(CO_temp.co);

        plot(CO_temp.date_time,CO_conc,'.k');
        ax = gca;
        ax.YColor = 'k';
        ylabel({'CO' ; '(ppmv)'});
        ylim([b 0.09])

        yyaxis right
        plot(MET_temp.date_time,MET_temp.pwd_precip_rate_mean_1min,'-b');
        ylabel({'Precipitation';'(mm h^{-1})'});
        ax = gca;
        ax.YColor = 'b';
        xticklabels([])
        xlim([days])
        set(gca, 'Xtick',a,'Fontsize',20)



        alignplot2=subplot(6,1,3);
        subplot(6,1,3)
        yyaxis left
        plot(CPC_temp.date_time,movmean(CPC_temp.concentration,500),'.k');
        ax = gca
        ax.YColor = 'k';
        ylabel({'CN'  ; '(cm^{-3})'});
        yticks([0 250 500])
        yticklabels([0 250 500])
        yyaxis right

        hold on
        plot(SMPS_temp.date_time,SMPS_temp.N_nuc,'.b') %Nucleation concentration
        ylabel({'CN <20nm' ; '(cm^{-3})'});
        ax = gca;
        ax.YColor = 'b';
        y=xlim;
        set(gca,'Fontsize',20)
        ylim([0 80])
        yticks([0 40 80])
        yticklabels([0 40 80])
        ylim([0 inf])
        xlim([days])
        xticklabels([])



        alignplot3=subplot(6,1,4);
        subplot(6,1,4)
        yyaxis left

        a = length(O3_temp.concentration);
        for j =1:1:a
            if O3_temp.concentration(j,1) >= 50
                O3_temp.concentration(j,1) = NaN;
            else
                b=1+1;
            end
        end


        yyaxis left
        plot(O3_temp.date_time,movmean(O3_temp.concentration,500),'.k');
        ax = gca
        ax.YColor = 'k';
        xlim([days])
        xticklabels([])
        ylim([20 50])
        ylabel({'O_{3}' ; '(ppmv)'});

        N20_mean = movmean(CO_temp.n2o,500);
        a=  N20_mean <= 0.3255;
        N20_mean(a) = NaN;

        yyaxis right
        plot(CO_temp.date_time,N20_mean,'.b');
        ylabel({'N_{2}O' ; '(ppmv)'});
        ylim([0.32 0.33])
        set(H,'EdgeColor','none');
        set(gca,'Fontsize',20)
        ax = gca;
        ax.YColor = 'b';
        xlim([days])
        xticklabels([])



        alignplot4=subplot(6,1,5);

        H=pcolor(DL_temp.date_time,DL_temp.height,DL_temp.radial_velocity);
        set(H,'EdgeColor','none');
        c=colorbar;
        colormap(alignplot4,jet);
        c.Label.String = {'Radial velocity';'(m s^{-1})'};
        set(gca,'TickDir','out');
        xlabel('Time (UTC) Oct-18-2017 Oct-19-2017 Oct-20-2017');
        ylabel({'Altitude'  ; '(km)'});
        yticks([0 1000 2000])
        yticklabels([0 1 2])
        xlim([days])
        set(gca,'xticklabels', {labels},'Fontsize',20);
        caxis([-1 1]);
        ylim([0 2000])




        pos1=get(sdfplot,'Position');
        pos2=get(alignplot,'Position');
        pos3=get(alignplot2,'Position');
        pos4=get(alignplot3,'Position');
        pos5=get(alignplot4,'Position');

        pos1(3)=pos2(3);
        pos3(3)=pos2(3);
        pos4(3)=pos2(3);
        pos5(3)=pos2(3);
        set(sdfplot,'Position',pos1);
        set(alignplot2,'Position',pos3);
        set(alignplot3,'Position',pos4);
        set(alignplot4,'Position',pos5);

        JW_figure_style(gcf,'PT_land3');
        set(gcf,'Position',[90 20 1486 842]);


        % saveas(gcf,strcat(strcat('WAST poster figure NPFevent_', (datestr(data1)),'.jpg'))) %.jpg


    case 21; % WAST poster figure NPFevent from on 10/18/2017 to 10/20/2017


        weekly_array=[73] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [505 507.5];
        a = days(2)-days(1) ;
        step = datenum(0,0,0,12,0,0);



    case 22; % WAST poster figure NPFevent from on 10/18/2017 to 10/20/2017


        weekly_array=[15] %Adjust for the number of weeks necessary to be loaded to generate the plots. We have 74 weeks in LASIC. From week 1 to 19 there's no DL data. There's no SMPS data at week 74.

        days = [102 103.5];
        a = days(2)-days(1) ;
        step = datenum(0,0,0,6,0,0);

        data1 = datenum(2016,09,10,00,00,00);
        data2 = datenum(2016,09,11,23,59,59);
        dataset= data1:step:data2;
        labels= datestr(dataset,'HH:MM');

        option.weeklyplot=      1;
end
for week_num=weekly_array
    week_num

    % filename=strcat('/Users/marcusbatista/Library/CloudStorage/OneDrive-UniversityofMiami/University_of_Miami/Thesis/DOE_Projects/LASIC/LASIC_Matlab_Code/Weekly_data_files_Marcus/Week',num2str(week_num)); %Location of Day(num) files
    filename=strcat('C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\LASIC\LASIC_Matlab_Code\Weekly_data_files_Marcus\Week',num2str(week_num));
    load(filename);

    if 1
        option.save_image = 1; % 0 doesn't save the figure, 1 saves the figure to the current directory
    end

    struct_name_array={'week_num','SMPS_temp','CPC_temp','MET_temp','CO_temp','PSAP_temp','SKYRAD_temp','SP2_temp','DL_temp','SO2_temp','O3_temp','DL_VAP_temp','UFCPC_temp','MWRP_temp'};
    for i=1:1:length(struct_name_array)
        struct_name=struct_name_array{i};
        eval([struct_name,'=ground_weekly.',struct_name]);
    end
    Ntotal=interp1(CPC_temp.date_time,CPC_temp.concentration,SMPS_temp.date_time); %Interpolating CPC (1sec) and SMPS(5min)
    CN20_NTotal = SMPS_temp.N_nuc./Ntotal'; %Extracting the fraction of CN20 in CNtotal
    flag=(CN20_NTotal>0.3);

    N_UFCPC = movmean(UFCPC_temp.concentration,500);  N_UFCPC = N_UFCPC(500:500:end);
    N_CPC = movmean(CPC_temp.concentration,500); N_CPC = N_CPC(500:500:end);
    N_NPF =N_UFCPC-N_CPC;N_NPF(N_NPF<0)=NaN;
    N_NPF_time = UFCPC_temp.date_time(500:500:end);
    NPF_mean = mean(SMPS_temp.N_nuc30(1,1670:1728));


    %Finding Absorption median and mean for the NPF event n. #2.
    a = find(PSAP_temp.date_time>=NPF_time(1) & PSAP_temp.date_time <=NPF_time(2));
    Abs_NPF = PSAP_temp.absorbance_red_raw(a);
    Abs_NPF_time = PSAP_temp.date_time(a);
    Abs_NPF_time(:,2) = Abs_NPF_time(:,1)-floor(Abs_NPF_time(:,1));
    Abs_NPF_time(:,3)= Abs_NPF_time(:,2)*60*24;
    Abs_NPF_time(:,4) =  floor(Abs_NPF_time(:,3)/ 60);
    Abs_NPF_time(:,5) =  round(Abs_NPF_time(:,3)-Abs_NPF_time(:,4)* 60);
    Abs_NPF_mean = nanmean(Abs_NPF);
    Abs_NPF_median = median(Abs_NPF,"omitnan");


    a = datestr(Abs_NPF_time(:,3));
    a = datenum(2016,09,12,Abs_NPF_time(:,4),Abs_NPF_time(:,5),0);
    b = datestr(a);

     a = find(CO_temp.date_time>=NPF_time2(1) & CO_temp.date_time <=NPF_time2(2));
     CO_NPF = CO_temp.co(a);
     CO_NPF_time = CO_temp.date_time(a);

     %2 hours buffer NPF time
     a = find(CO_temp.date_time>=NPF_time(1) & CO_temp.date_time <=NPF_time(2));
     CO_NPF_buffer = CO_temp.co(a);
     CO_NPF_buffer_time = CO_temp.date_time(a);
     
     %Concentration 2 hours before NPF time
     CO_NPF_2hours = CO_NPF_buffer(1:7352);

     %BC concentrations after Manisha data treament
     cd 'C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\DOE ARM Data\LASIC\SP2_Manisha' %location of SP2 raw data
     d = pwd; % pwd: returns the path to the current folder.
     load('Lasic_SP2_BC_DATA_1Min')

     SP2_NPF_time = Lasic_SP2_BC_DATA(169626:169920,1); %7:05 PM to 11:59 PM on 09/12/2016
     SP2_NPF_conc = Lasic_SP2_BC_DATA(169626:169920,8);

     SP2_NPF_time_2h_buffer = Lasic_SP2_BC_DATA(169506:170040,1); %5:05 PM on 09/12/2016 to to 1:59 AM on 09/13/2016
     SP2_NPF_conc_2h_buffer = Lasic_SP2_BC_DATA(169506:170040,8);

     tmpidx = find(SP2_temp.date_time>=NPF_time(1) & SP2_temp.date_time <=NPF_time(2)); %2 hour buffer values for plotting
     SP2_NPF_time = SP2_temp.date_time(tmpidx);

     SP2_NPF_2hours = Lasic_SP2_BC_DATA(169506:169626,8);

     %Surface area during NPF event (2 hours buffer)
     tmpidx = find(SMPS_temp.date_time>=NPF_time(1) & SMPS_temp.date_time <=NPF_time(2));
     Sarea_NPF_time= SMPS_temp.S_SMPS(tmpidx);

     %Cloud Base Height during NPF event (2 hours buffer)
     a = find(MWRP_temp.date_time>=NPF_time2(1) & MWRP_temp.date_time <=NPF_time2(2));
     CBH_NPF = MWRP_temp.cloudBaseHeight(a);



end

if option.weeklyplot
    figure
    set(0, 'DefaultAxesFontName', 'Arial');

    sdfplot=subplot(4,1,1);
    H=pcolor(SMPS_temp.date_time',SMPS_temp.diameter_midpoint_nm,SMPS_temp.number_size_distribution);
    set(H,'EdgeColor','none');
    c=colorbar; colormap(sdfplot,parula);
    c.Label.String = {'d{\itN}/dlog_{10}{\itD_p} (cm^{-3})'};
    ylabel('{\itD_p} (nm)'); yticks([20 80 400]);
    set(gca,'TickDir','in','Yscale','log');
    ylim([11 400]);clim([0 500]); set(c,'YTick',[0 250 500])
    xlim([NPF_time(1) NPF_time(2)]);
    a = min(days):(1/25):max(days);
    xticklab = get(gca, 'XTickLabel');xticklab=string(xticklab);xticklab=str2double(xticklab);
    b =  xticklab-floor(xticklab);b = b * 24 * 60;

    % % Display the time in HH:mm format
    timeStrings = cell(length(b),1);
    for i = 1:length(b)
        hours = floor(b(i) / 60);
        minutes = round(b(i) - hours * 60);
        timeStrings{i} = sprintf('%02d:%02d', hours, minutes);  % Format as HH:mm
    end
    xticks(a)
    set(gca,'xticklabels',{})
    set(H,'EdgeColor','none');
    grid off
    set(gca, 'Layer', 'top');
    % title((strcat('NPF strong event on',{' '},(datestr(data1)))))
    set(gca,'XMinorTick','on')
    ax = gca;
    ax.LineWidth = 1.5;
    % pbaspect([1.5 1 1]);

    alignplot=subplot(4,1,2);
    % pbaspect([1.5 1 1]);
    % tmpidx = UFCPC_temp.concentration>prctile(UFCPC_temp.concentration,99.9);
    % UFCPC_temp.concentration(tmpidx)=NaN;    UFCPC_temp.concentration(UFCPC_temp.concentration<0) = NaN;

    yyaxis left
    plot(UFCPC_temp.date_time,movmean(UFCPC_temp.concentration,500),'-k','LineWidth',2);
    hold on
    plot(N_NPF_time,N_NPF,'--','LineWidth',2,'Color',[178/255,34/255,34/255])
    ax = gca; ax.YColor = 'k';
    ylabel({'{\itN} (cm^{-3})'});
    ylim([0 600]); yticks([0 300 600])
    yyaxis right
    plot(SMPS_temp.date_time,SMPS_temp.S_SMPS,':b','LineWidth',2); %Surface area concentration
    ylabel({'{\itS}_{tot}';'(μm^{2} cm^{-3})'});
    % yticks([0 30 60])
    legend ('{\itN}_{tot}', '{\itN}_{3-10}', '{\itS}_{tot}', 'orientation','horizontal')
    ax = gca; ax.YColor = 'b';
    xlim([NPF_time(1) NPF_time(2)]);
    a = min(days):(1/25):max(days);
    xticks(a);xticklabels([])

    set(gca,'XMinorTick','on')

    alignplot3=subplot(4,1,3);
    % pbaspect([1.5 1 1]);
    % tmpidx = (CO_temp.date_time>=487.418 & CO_temp.date_time<=487.422); %Case 15
    % CO_temp.co(tmpidx)= NaN;
    % tmpidx = CO_temp.co>prctile(CO_temp.co,50); %case 17
    tmpidx = CO_temp.co>prctile(CO_temp.co,99);
    CO_temp.co(tmpidx)=nan;
    tmpidx= (abs(CO_temp.date_time - round(CO_temp.date_time)) >= 0.000 & abs(CO_temp.date_time - round(CO_temp.date_time)) <= 0.005);
    CO_temp.co(tmpidx)=nan;
    b = min(CO_temp.co);
    yyaxis left
    ax = gca; ax.YColor = 'k';
    plot(CO_temp.date_time,CO_temp.co,'-k','LineWidth',2);
    ylim([0.05 0.08]);yticks([0.055 0.065 0.075]); yticklabels([55 65 75]);
    ylabel({'CO (ppbv)'}); xlim([NPF_time(1) NPF_time(2)]);
    
    yyaxis right
    plot(SP2_NPF_time,SP2_NPF_conc_2h_buffer,'-b','LineWidth',2);
    ax = gca; ax.YColor = 'b';
    ylabel({'rBC';'(ng m^{-3})'});
    ylim([0 100])
    xticks([0 50 100]);xticklabels([0 50 100])
    xticklabels([])
    set(gca,'XMinorTick','on')
  
    MET_temp.pwd_precip_rate_mean_1min(MET_temp.pwd_precip_rate_mean_1min<0)= NaN;
    alignplot2=subplot(4,1,4);
    subplot(4,1,4)
    yyaxis left
    plot(MET_temp.date_time,MET_temp.pwd_precip_rate_mean_1min,'-k','LineWidth',2);
    ylabel({'Precipitation';'(mm h^{-1})'});
    ax = gca; ax.YColor = 'k';
    a = max(MET_temp.pwd_precip_rate_mean_1min);
    ylim([0 6]);
    yticks([0 2 4 6]);yticklabels([0 2 4 6])
    xlim([NPF_time(1) NPF_time(2)])
    yyaxis right
    plot(DL_VAP_temp.date_time,DL_VAP_temp.radial_velocity(11,:),'-b','LineWidth',2);
    hold on
    plot(DL_VAP_temp.date_time,DL_VAP_temp.radial_velocity(16,:),'--','LineWidth',2,'Color',[178/255,34/255,34/255]);
    plot(DL_VAP_temp.date_time,DL_VAP_temp.radial_velocity(19,:),':b','LineWidth',2);
    ldg = legend ('', '315 m','465 m', '555 m', 'orientation','horizontal');
    lgd.Position = [0.85, 0.0, 0.1, 0.1];
    ylabel({'Vertical velocity';'(m s^{-1})'});
    ax = gca; ax.YColor = 'b';
    % yticks([-3 -2 -1 0 1 2 3]);yticklabels([-3 -2 -1 0 1 2 3]);
    xlim([NPF_time(1) NPF_time(2)]);
    set(gca,'XMinorTick','on')
    a = min(days):(1/20):max(days);
    xticklab = get(gca, 'XTickLabel');xticklab=string(xticklab);xticklab=str2double(xticklab);
    b =  xticklab-floor(xticklab);b = b * 24 * 60;

    % % Display the time in HH:mm format
    timeStrings = cell(length(b),1);
    labelInterval = 60;
    for i = 1:length(b)
        roundedTime = round(b(i) / labelInterval) * labelInterval;
        hours = floor(roundedTime / 60);
        minutes = round(roundedTime - hours * 60);
        timeStrings{i} = sprintf('%02d:%02d', hours, minutes);  % Format as HH:mm
    end


    xticklabels(timeStrings)
    xlabel('Time (UTC)')
    % pbaspect([1.5 1 1]);

    pos1=get(sdfplot,'Position');
    pos2=get(alignplot,'Position');
    pos3=get(alignplot2,'Position');
    pos4=get(alignplot3,'Position');
    pos1(3)=0.72;
    pos2(3)=0.72;
    pos3(3)=0.72;
    pos4(3)=0.72;
    set(sdfplot,'Position',pos1);
    set(alignplot,'Position',pos2);
    set(alignplot2,'Position',pos3);
    set(alignplot3,'Position',pos4);
    JW_figure_style(gcf,'paper_marcus');
    set(gcf,'Position',[90 20 700 842]);




    % saveas(gcf,strcat(strcat(num2str(NPF),'_NPF_strong_event on_', (datestr(data1))),'.jpg')) %.jpg
    % saveas(gcf,strcat(strcat(num2str(NPF),'_NPF_strong_event on_24-Jul-2017','.jpg'))) %.jpg
end