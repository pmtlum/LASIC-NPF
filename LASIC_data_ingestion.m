clear all 
close all 

%This file create the Day(num).mat files for the days in day_array. The day
%files are needed to generate daily and weekly plots

day_array=[1:518]; %Adjust for the number of days necessary to be loaded and saved as Day(num).mat. We have 518 days in LASIC 

for day_num=day_array
    day_num 
    
     filename=strcat('C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\LASIC\LASIC_Matlab_Code\Daily_data_files_Marcus\Day',num2str(day_num)); %This shows the location and where the data will be loaded
      % filename=strcat('/Users/marcusbatista/Library/CloudStorage/OneDrive-UniversityofMiami/University_of_Miami/Thesis/DOE_Projects/LASIC/LASIC_Matlab_Code/Daily_data_files_Marcus/Day',num2str(day_num)); %This shows the location and where the data will be loaded
     load(filename); %Comment when it`s not necessary to load files. Only uncomment when needed to add a update some of the parameters. If commented, the Day files will be overwritten

    SMPS=SMPS_analysis_lasic(day_num); %This will load all the parameter files for all the campaign days from get_mission_paramt_ASI.m . Adjust if needed to add more instruments
    CPC=CPC_analysis_lasic(day_num);
    MET=MET_analysis_lasic(day_num);
    CO=CO_analysis_lasic(day_num);
    PSAP=PSAP_analysis_lasic(day_num);
    SKYRAD=SKYRAD_analysis_lasic(day_num);
    % SP2=SP2_analysis_lasic(day_num);
    DL=DL_analysis_lasic(day_num);
    SO2=SO2_analysis_lasic(day_num);
    O3=O3_analysis_lasic(day_num);
    ACSM=ACSM_analysis_lasic(day_num);
    MWRP=MWRP_analysis_lasic(day_num);
    RAINTB=RAINTB_analysis_lasic(day_num);
    SO2a1=SO2a1_analysis_lasic(day_num);
    DL_VAP=DL_VAP_analysis_lasic(day_num);
    UFCPC=UFCPC_analysis_lasic(day_num);
    CCN=CCN_analysis_lasic(day_num);
    TSI=TSI_analysis_lasic(day_num);
    date = get_mission_paramt_ASI(day_num);
    date = date.date;

    ground.day_num=day_num; %This line creates a struct called ground where all the instrument data will be stored for each day_num. Adjust if needed to add more instruments
    ground.date=date;
    ground.SMPS=SMPS;
    ground.CPC=CPC;
    ground.MET=MET;
    ground.CO=CO;
    ground.PSAP=PSAP;
    ground.SKYRAD=SKYRAD;
    % ground.SP2=SP2;
    ground.DL=DL;
    ground.SO2=SO2;
    ground.O3=O3;
    ground.ACSM=ACSM;
    ground.MWRP=MWRP;
    ground.RAINTB=RAINTB;
    ground.SO2a1=SO2a1;
    ground.DL_VAP=DL_VAP;
    ground.UFCPC=UFCPC;
    ground.CCN=CCN;
    ground.TSI=TSI;
 

    save(filename,'ground'); %This saves the struct ground 


1+1; %This will make the day_num move to the next number 


end 