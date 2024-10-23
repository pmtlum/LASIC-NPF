if 1 %only created to dock all the data below
    week_date = [];

    SMPS_temp.date= [];
    SMPS_temp.day_num= [];
    SMPS_temp.date_time=[]; %This cleans all the data from previous day_num.
    SMPS_temp.sample_temperature=[];
    SMPS_temp.sample_pressure=[];
    SMPS_temp.N_nuc=[];
    SMPS_temp.N_nuc30=[];
    SMPS_temp.N_ait=[];
    SMPS_temp.N_acc=[];
    SMPS_temp.S_SMPS=[];
    SMPS_temp.mean_free_path=[];
    SMPS_temp.gas_viscosity=[];
    SMPS_temp.diameter_midpoint_nm=[];
    SMPS_temp.diameter_midpoint_m=[];
    SMPS_temp.number_size_distribution=[];
    SMPS_temp.sheath_flow=[];
    SMPS_temp.aerosol_flow=[];
    SMPS_temp.cpc_inlet_flow=[];
    SMPS_temp.cpc_sample_flow=[];
    SMPS_temp.low_voltage=[];
    SMPS_temp.high_voltage=[];
    SMPS_temp.lower_size=[];
    SMPS_temp.status_flag=[];
    SMPS_temp.d50=[];
    SMPS_temp.median=[];
    SMPS_temp.mean=[];
    SMPS_temp.geometric_mean=[];
    SMPS_temp.geometric_mean_std=[];
    SMPS_temp.mode=[];
    SMPS_temp.total_concentration=[];
    SMPS_temp.down_scan_first=[];
    SMPS_temp.multiple_charge_correction=[];
    SMPS_temp.diffusion_correction=[];
    SMPS_temp.nanoparticle_agglomerate_mobility_analysis=[];
    SMPS_temp.DMA_inner_radius=[];
    SMPS_temp.DMA_outer_radius=[];
    SMPS_temp.DMA_characteristic_length=[];
    SMPS_temp.reference_mean_free_path=[];
    SMPS_temp.reference_gas_viscosity=[];
    SMPS_temp.reference_gas_temperature=[];
    SMPS_temp.reference_gass_pressure=[];
    SMPS_temp.particle_density=[];
    SMPS_temp.lat=[];
    SMPS_temp.lon=[];
    SMPS_temp.alt=[];
    SMPS_temp.CN30_NTotal = [];

    CPC_temp.date_time=[];
    CPC_temp.concentration=[];
    CPC_temp.saturation_temp=[];
    CPC_temp.condensation_temp=[];
    CPC_temp.optics_temp=[];
    CPC_temp.cabinet_temp=[];
    CPC_temp.ambient_pressure=[];
    CPC_temp.aerosol_flow=[];
    CPC_temp.orifice_pressure=[];
    CPC_temp.nozzle_pressure=[];
    CPC_temp.laser_current=[];
    CPC_temp.liquid_level=[];
    CPC_temp.fraction_full=[];
    CPC_temp.lat=[];
    CPC_temp.lon=[];
    CPC_temp.alt=[];

    MET_temp.date_time=[];
    MET_temp.atmos_pressure=[];
    MET_temp.temp_mean=[];
    MET_temp.temp_std=[];
    MET_temp.rh_mean=[];
    MET_temp.rh_std=[];
    MET_temp.theta_E=[];
    MET_temp.theta=[];
    MET_temp.vapor_pressure_mean=[];
    MET_temp.vapor_pressure_std=[];
    MET_temp.wspd_arith_mean=[];
    MET_temp.wspd_vec_mean=[];
    MET_temp.wdir_vec_mean=[];
    MET_temp.wdir_vec_std=[];
    MET_temp.org_precip_rate_mean=[];
    MET_temp.pwd_err_code=[];
    MET_temp.pwd_mean_vis_1min=[];
    MET_temp.pwd_mean_vis_10min=[];
    MET_temp.pwd_pw_code_inst=[];
    MET_temp.pwd_pw_code_15min=[];
    MET_temp.pwd_pw_code_1hr=[];
    MET_temp.pwd_precip_rate_mean_1min=[];
    MET_temp.pwd_cumul_rain=[];
    MET_temp.logger_volt=[];
    MET_temp.logger_temp=[];
    MET_temp.lat=[];
    MET_temp.lon=[];
    MET_temp.alt=[];

    CO_temp.date_time=[];
    CO_temp.co=[];
    CO_temp.n2o=[];
    CO_temp.h2o=[];
    CO_temp.co_dry=[];
    CO_temp.n2o_dry=[];
    CO_temp.gas_pressure=[];
    CO_temp.gas_temperature=[];
    CO_temp.ambient_temperature=[];
    CO_temp.set_point_for_MFC_1=[];
    CO_temp.mass_flow_through_MFC_1=[];
    CO_temp.valve_position_MFC_1=[];
    CO_temp.set_point_for_MFC_2=[];
    CO_temp.mass_flow_through_MFC_2=[];
    CO_temp.valve_position_MFC_2=[];
    CO_temp.lat=[];
    CO_temp.lon=[];
    CO_temp.alt=[];

    PSAP_temp.date_time=[];
    PSAP_temp.tr_blue=[];
    PSAP_temp.tr_green=[];
    PSAP_temp.tr_red=[];
    PSAP_temp.absorbance_blue_raw=[];
    PSAP_temp.absorbance_green_raw=[];
    PSAP_temp.absorbance_red_raw=[];
    PSAP_temp.filter_unstable=[];
    PSAP_temp.transmittance_blue=[];
    PSAP_temp.transmittance_green=[];
    PSAP_temp.transmittance_red=[];
    PSAP_temp.absorbance_blue=[];
    PSAP_temp.absorbance_green=[];
    PSAP_temp.absorbance_red=[];
    PSAP_temp.sample_flow_rate=[];
    PSAP_temp.dilution_flow_valve_position=[];
    PSAP_temp.dilution_flow_setpoint=[];
    PSAP_temp.dilution_flow=[];
    PSAP_temp.dilution_correction_factor=[];
    PSAP_temp.spot_size_area=[];
    PSAP_temp.seconds_after_transition=[];
    PSAP_temp.impactor_state=[];
    PSAP_temp.transmittance_blue_normalization_factor=[];
    PSAP_temp.transmittance_green_normalization_factor=[];
    PSAP_temp.transmittance_red_normalization_factor=[];
    PSAP_temp.lat=[];
    PSAP_temp.lon=[];
    PSAP_temp.alt=[];
    PSAP_temp.average_absorbance_blue=[];
    PSAP_temp.average_absorbance_green=[];
    PSAP_temp.average_absorbance_red=[];
    PSAP_temp.overall_average=[];

    SKYRAD_temp.date_time=[];
    SKYRAD_temp.down_long_hemisp1=[];
    SKYRAD_temp.down_long_hemisp2=[];
    SKYRAD_temp.down_short_diffuse_hemisp=[];
    SKYRAD_temp.short_direct_normal=[];
    SKYRAD_temp.down_short_hemisp=[];
    SKYRAD_temp.sky_ir_temp=[];
    SKYRAD_temp.down_long_hemisp1_std=[];
    SKYRAD_temp.down_long_hemisp2_std=[];
    SKYRAD_temp.down_short_diffuse_hemisp_std=[];
    SKYRAD_temp.short_direct_normal_std=[];
    SKYRAD_temp.down_short_hemisp_std=[];
    SKYRAD_temp.sky_ir_temp_std=[];
    SKYRAD_temp.down_long_hemisp1_max=[];
    SKYRAD_temp.down_long_hemisp2_max=[];
    SKYRAD_temp.down_short_diffuse_hemisp_max=[];
    SKYRAD_temp.short_direct_normal_max=[];
    SKYRAD_temp.down_short_hemisp_max=[];
    SKYRAD_temp.sky_ir_temp_max=[];
    SKYRAD_temp.down_long_hemisp1_min=[];
    SKYRAD_temp.down_long_hemisp2_min=[];
    SKYRAD_temp.down_short_diffuse_hemisp_min=[];
    SKYRAD_temp.short_direct_normal_min=[];
    SKYRAD_temp.down_short_hemisp_min=[];
    SKYRAD_temp.sky_ir_temp_min=[];
    SKYRAD_temp.vBatt=[];
    SKYRAD_temp.logger_temp=[];
    SKYRAD_temp.inst_down_long_hemisp1_dome_temp=[];
    SKYRAD_temp.inst_down_long_hemisp1_case_temp=[];
    SKYRAD_temp.inst_down_long_hemisp2_dome_temp=[];
    SKYRAD_temp.inst_down_long_hemisp2_case_temp=[];
    SKYRAD_temp.inst_down_long_hemisp1_tp=[];
    SKYRAD_temp.inst_down_long_hemisp2_tp=[];
    SKYRAD_temp.lat=[];
    SKYRAD_temp.lon=[];
    SKYRAD_temp.alt=[];

    SP2_temp.date_time=[];
    SP2_temp.time=[];
    SP2_temp.rBC_conc=[];

    DL_temp.date_time=[];
    DL_temp.time=[];
    DL_temp.radial_velocity=[];
    DL_temp.height=[];

    SO2_temp.date_time=[];
    SO2_temp.time_offset=[];
    SO2_temp.time=[];
    SO2_temp.concentration=[];
    SO2_temp.internal_temperature=[];
    SO2_temp.sample_pressure=[];
    SO2_temp.sample_flow=[];
    SO2_temp.averaging_time=[];
    SO2_temp.status_flag=[];
    SO2_temp.lat=[];
    SO2_temp.lon=[];
    SO2_temp.alt=[];

    O3_temp.date_time=[];
    O3_temp.time_offset=[];
    O3_temp.time=[];
    O3_temp.concentration=[];
    O3_temp.gas_pressure=[];
    O3_temp.bench_temperature=[];
    O3_temp.background=[];
    O3_temp.lamp_state=[];
    %     O3_temp.flags=[];
    O3_temp.lat=[];
    O3_temp.lon=[];
    O3_temp.alt=[];

    ACSM_temp.temp_date = [];
    ACSM_temp.time_offset=[];
    ACSM_temp.time=[];
    ACSM_temp.total_organics=[];
    ACSM_temp.sulfate=[];
    ACSM_temp.ammonium=[];
    ACSM_temp.nitrate=[];
    ACSM_temp.chloride=[];
    ACSM_temp.lat=[];
    ACSM_temp.lon=[];
    ACSM_temp.alt=[];

    MWRP_temp.temp_date=[];
    MWRP_temp.date_time = [];
    MWRP_temp.time_offset=[];
    MWRP_temp.time=[];
    MWRP_temp.height=[];
    MWRP_temp.lwp=[];
    MWRP_temp.RH=[];
    MWRP_temp.Prec_Water=[];
    MWRP_temp.cloudBaseHeight=[];
    MWRP_temp.lat=[];
    MWRP_temp.lon=[];
    MWRP_temp.alt=[];

    RAINTB_temp.temp_date=[];
    RAINTB_temp.date_time = [];
    RAINTB_temp.time_offset=[];
    RAINTB_temp.time=[];
    RAINTB_temp.time_hour=[];
    RAINTB_temp.precip=[];
    RAINTB_temp.rain_rate=[];
    RAINTB_temp.time_bounds=[];
    RAINTB_temp.lat=[];
    RAINTB_temp.lon=[];
    RAINTB_temp.alt=[];

    SO2a1_temp.date_time=[];
    SO2a1_temp.time_offset=[];
    SO2a1_temp.time=[];
    SO2a1_temp.concentration=[];
    SO2a1_temp.internal_temperature=[];
    SO2a1_temp.sample_pressure=[];
    SO2a1_temp.sample_flow=[];
    SO2a1_temp.averaging_time=[];
    SO2a1_temp.status_flag=[];
    SO2a1_temp.lat=[];
    SO2a1_temp.lon=[];
    SO2a1_temp.alt=[];

    DL_VAP_temp.day_time=[];
    DL_VAP_temp.date_time=[];
    DL_VAP_temp.time=[];
    DL_VAP_temp.radial_velocity=[];
    DL_VAP_temp.height=[];
    DL_VAP_temp.ceil_cbh = [];
    DL_VAP_temp.cbh_dl =[];
    DL_VAP_temp.SNR = [];

    UFCPC_temp.date_time=[];
    UFCPC_temp.concentration=[];
    UFCPC_temp.saturation_temp=[];
    UFCPC_temp.condensation_temp=[];
    UFCPC_temp.optics_temp=[];
    UFCPC_temp.cabinet_temp=[];
    UFCPC_temp.ambient_pressure=[];
    UFCPC_temp.aerosol_flow=[];
    UFCPC_temp.orifice_pressure=[];
    UFCPC_temp.nozzle_pressure=[];
    UFCPC_temp.laser_current=[];
    UFCPC_temp.liquid_level=[];
    UFCPC_temp.fraction_full=[];
    UFCPC_temp.lat=[];
    UFCPC_temp.lon=[];
    UFCPC_temp.alt=[];

    CCN_temp.date_time=[];
    CCN_temp.time_offset=[];
    CCN_temp.time=[];
    CCN_temp.diameter_mobility=[];
    CCN_temp.diameter_mobility_bounds=[];
    CCN_temp.droplet_size=[];
    CCN_temp.droplet_size_bounds=[];
    CCN_temp.SS_setpoint=[];
    CCN_temp.hygro_param_kappa=[];
    CCN_temp.supersaturation=[];
    CCN_temp.N_CCN=[];
    CCN_temp.N_CCN_dN=[];
    CCN_temp.dN_dlogDp=[];
    CCN_temp.lat=[];
    CCN_temp.lon=[];
    CCN_temp.alt=[];

    TSI_temp.date=[];
    TSI_temp.date_time=[];
    TSI_temp.time_offset=[];
    TSI_temp.time=[];
    TSI_temp.percent_thin=[];
    TSI_temp.percent_opaque=[];
    TSI_temp.sunny=[];
    TSI_temp.solar_altitude=[];
    TSI_temp.solar_azimuth=[];
    TSI_temp.lat=[];
    TSI_temp.lon=[];
    TSI_temp.alt=[];

end

temp1=1; %Initial day of the week; change to the values of day_array
temp2=7; %Final day of the week

day_array=[1:518]; %Adjust for the number of days necessary to be loaded and saved as Day(num).mat. We have 518 days in LASIC

for day_num=day_array
    day_num

    filename=strcat('C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\LASIC\LASIC_Matlab_Code\Daily_data_files_Marcus\Day',num2str(day_num)); %Location of Day(num) files
    % filename=strcat('/Users/marcusbatista/Library/CloudStorage/OneDrive-UniversityofMiami/University_of_Miami/Thesis/DOE_Projects/LASIC/LASIC_Matlab_Code/Daily_data_files_Marcus/Day',num2str(day_num)); %Location of Day(num) files in Mac
    load(filename); %Loading Day(num) files from the pathway above

    struct_name_array={'day_num','SMPS','CPC','MET','CO','PSAP','SKYRAD','SP2','DL','SO2','O3','MWRP','ACSM', 'RAINTB','SO2a1','DL_VAP','UFCPC','CCN','TSI'}; %Create a struct for all instruments. Include here if you have a new instrument
    for i=1:1:length(struct_name_array)
        struct_name=struct_name_array{i};
        eval([struct_name,'=ground.',struct_name]);
    end

    if (day_num>=temp1)&&(day_num<=temp2) %This will insert data from the initial to the final day of the month from the day_num

        if isstruct(CPC) %Create the struct for each instrument and correlate with the struct from the ingested data
            CPC_temp1=day_num+(ground.CPC.time_hour/24);
            CPC_temp.date_time=[CPC_temp.date_time; CPC_temp1];
            CPC_temp.concentration=[CPC_temp.concentration; ground.CPC.concentration];
            CPC_temp.saturation_temp=[CPC_temp.saturation_temp; ground.CPC.saturation_temp];
            CPC_temp.condensation_temp=[CPC_temp.condensation_temp; ground.CPC.condensation_temp];
            CPC_temp.optics_temp=[CPC_temp.optics_temp; ground.CPC.optics_temp];
            CPC_temp.cabinet_temp=[CPC_temp.cabinet_temp; ground.CPC.cabinet_temp];
            CPC_temp.ambient_pressure=[CPC_temp.ambient_pressure; ground.CPC.ambient_pressure];
            %CPC_temp.aerosol_flow=[CPC_temp.aerosol_flow; ground.CPC.aerosol_flow]; %comment if the data is not available in the ingested file
            CPC_temp.orifice_pressure=[CPC_temp.orifice_pressure; ground.CPC.orifice_pressure];
            CPC_temp.nozzle_pressure=[CPC_temp.nozzle_pressure; ground.CPC.nozzle_pressure];
            CPC_temp.laser_current=[CPC_temp.laser_current; ground.CPC.laser_current];
            CPC_temp.liquid_level=[CPC_temp.liquid_level; ground.CPC.liquid_level];
            CPC_temp.fraction_full=[CPC_temp.fraction_full; ground.CPC.fraction_full];
            CPC_temp.lat=[CPC_temp.lat; ground.CPC.lat];
            CPC_temp.lon=[CPC_temp.lon; ground.CPC.lon];
            CPC_temp.alt=[CPC_temp.alt; ground.CPC.alt];
             else 
        end

        if isstruct(SMPS)
            SMPS_temp.date= [SMPS_temp.date;ground.SMPS.date];
            SMPS_temp.day_num = [SMPS_temp.day_num; day_num];
            SMPS_temp1=day_num+(ground.SMPS.time_hour/24);
            SMPS_temp.date_time=[SMPS_temp.date_time; SMPS_temp1];
            SMPS_temp.sample_temperature=[SMPS_temp.sample_temperature; ground.SMPS.sample_temperature];
            SMPS_temp.sample_pressure=[SMPS_temp.sample_pressure; ground.SMPS.sample_pressure];
            SMPS_temp.mean_free_path=[SMPS_temp.mean_free_path; ground.SMPS.mean_free_path];
            SMPS_temp.gas_viscosity=[SMPS_temp.gas_viscosity; ground.SMPS.gas_viscosity];
            SMPS_temp.diameter_midpoint_nm=[ground.SMPS.diameter_midpoint_nm];
            SMPS_temp.diameter_midpoint_m=[ground.SMPS.diameter_midpoint_m];
            SMPS_temp.number_size_distribution=[SMPS_temp.number_size_distribution ground.SMPS.number_size_distribution];
            N_nuc=sd2N(SMPS.diameter_midpoint_m',SMPS.number_size_distribution'/log(10),20e-9,1); %This calculates the integral of size distribution to find nucleation mode particles <20 nm. The data is in DnLog(10)Dp
            N_nuc30=sd2N(SMPS.diameter_midpoint_m',SMPS.number_size_distribution'/log(10),30e-9,1); %This calculates the integral of size distribution to find nucleation mode particles <30 nm. The data is in DnLog(10)Dp
            N_ait=sd2N(SMPS.diameter_midpoint_m',SMPS.number_size_distribution'/log(10),100e-9,1)-N_nuc; %This calculates the integral of size distribution to find Aitken mode particles excluding nucleation mode particles. It converts from DnlnDP to DnLog(10)Dp
            N_acc=SMPS.total_concentration'-N_nuc-N_ait; %This calculates the size distribution to find accummulation mode particles from subtracting the nucleation and Aitken mode particles from the Total Size Distribution. It converts from DnlnDP to DnLog(10)Dp
            S_SMPS=sd2S(SMPS.diameter_midpoint_m',SMPS.number_size_distribution',600e-9,1); %Calculation of the integral of surface area concentration
            SMPS_temp.N_nuc=[SMPS_temp.N_nuc N_nuc];
            SMPS_temp.N_nuc30=[SMPS_temp.N_nuc30 N_nuc30];
            SMPS_temp.N_ait=[SMPS_temp.N_ait N_ait];
            SMPS_temp.N_acc=[SMPS_temp.N_acc N_acc];
            SMPS_temp.S_SMPS=[SMPS_temp.S_SMPS S_SMPS];
            SMPS_temp.sheath_flow=[SMPS_temp.sheath_flow; ground.SMPS.sheath_flow];
            SMPS_temp.aerosol_flow=[SMPS_temp.aerosol_flow; ground.SMPS.aerosol_flow];
            %             SMPS_temp.cpc_inlet_flow=[SMPS_temp.cpc_inlet_flow; ground.SMPS.cpc_inlet_flow];
            %             SMPS_temp.cpc_sample_flow=[SMPS_temp.cpc_sample_flow; ground.SMPS.cpc_sample_flow];
            %             SMPS_temp.low_voltage=[SMPS_temp.low_voltage; ground.SMPS.low_voltage];
            %             SMPS_temp.high_voltage=[SMPS_temp.high_voltage; ground.SMPS.high_voltage];
            %             SMPS_temp.lower_size=[SMPS_temp.lower_size; ground.SMPS.lower_size];
            SMPS_temp.status_flag=[SMPS_temp.status_flag; ground.SMPS.status_flag];
            %             SMPS_temp.d50=[SMPS_temp.d50; ground.SMPS.d50];
            SMPS_temp.median=[SMPS_temp.median; ground.SMPS.median];
            SMPS_temp.mean=[SMPS_temp.mean; ground.SMPS.mean];
            %             SMPS_temp.geometric_mean=[SMPS_temp.geometric_mean; ground.SMPS.geometric_mean];
            %             SMPS_temp.geometric_mean_std=[SMPS_temp.geometric_mean_std; ground.SMPS.geometric_mean_std];
            SMPS_temp.mode=[SMPS_temp.mode; ground.SMPS.mode];
            SMPS_temp.total_concentration=[SMPS_temp.total_concentration; ground.SMPS.total_concentration];
            %             SMPS_temp.down_scan_first=[SMPS_temp.down_scan_first; ground.SMPS.down_scan_first];
            %             SMPS_temp.multiple_charge_correction=[SMPS_temp.multiple_charge_correction; ground.SMPS.multiple_charge_correction];
            %             SMPS_temp.diffusion_correction=[SMPS_temp.diffusion_correction; ground.SMPS.diffusion_correction];
            %             SMPS_temp.nanoparticle_agglomerate_mobility_analysis=[SMPS_temp.nanoparticle_agglomerate_mobility_analysis; ground.SMPS.nanoparticle_agglomerate_mobility_analysis];
            %             SMPS_temp.DMA_inner_radius=[SMPS_temp.DMA_inner_radius; ground.SMPS.DMA_inner_radius];
            %             SMPS_temp.DMA_outer_radius=[SMPS_temp.DMA_outer_radius; ground.SMPS.DMA_outer_radius];
            %             SMPS_temp.DMA_characteristic_length=[SMPS_temp.DMA_characteristic_length; ground.SMPS.DMA_characteristic_length];
            %             SMPS_temp.reference_mean_free_path=[SMPS_temp.reference_mean_free_path; ground.SMPS.reference_mean_free_path];
            %             SMPS_temp.reference_gas_viscosity=[SMPS_temp.reference_gas_viscosity; ground.SMPS.reference_gas_viscosity];
            %             SMPS_temp.reference_gas_temperature=[SMPS_temp.reference_gas_temperature; ground.SMPS.reference_gas_temperature];
            %             SMPS_temp.reference_gass_pressure=[SMPS_temp.reference_gass_pressure; ground.SMPS.reference_gass_pressure];
            %             SMPS_temp.particle_density=[SMPS_temp.particle_density; ground.SMPS.particle_density];
            SMPS_temp.lat=[SMPS_temp.lat; ground.SMPS.lat];
            SMPS_temp.lon=[SMPS_temp.lon; ground.SMPS.lon];
            SMPS_temp.alt=[SMPS_temp.alt; ground.SMPS.alt];
            SMPS_temp.CN30_NTotal = SMPS_temp.N_nuc30./SMPS_temp.total_concentration';
            % SMPS_temp.CN30_NTotal = [SMPS_temp.CN30_NTotal, FCN30_NTotal];
        end

        if isstruct(MET)
            MET_temp1=day_num+(ground.MET.time_hour/24);
            MET_temp.date_time=[MET_temp.date_time; MET_temp1];
            MET_temp.atmos_pressure=[MET_temp.atmos_pressure; ground.MET.atmos_pressure];
            MET_temp.temp_mean=[MET_temp.temp_mean; ground.MET.temp_mean];
            MET_temp.temp_std=[MET_temp.temp_std; ground.MET.temp_std];
            MET_temp.rh_mean=[MET_temp.rh_mean; ground.MET.rh_mean];
            MET_temp.rh_std=[MET_temp.rh_std; ground.MET.rh_std];
            MET_temp.theta_E=[MET_temp.theta_E; ground.MET.theta_E];
            MET_temp.theta=[MET_temp.theta; ground.MET.theta];
            MET_temp.vapor_pressure_mean=[MET_temp.vapor_pressure_mean; ground.MET.vapor_pressure_mean];
            MET_temp.vapor_pressure_std=[MET_temp.vapor_pressure_std; ground.MET.vapor_pressure_std];
            MET_temp.wspd_arith_mean=[MET_temp.wspd_arith_mean; ground.MET.wspd_arith_mean];
            MET_temp.wspd_vec_mean=[MET_temp.wspd_vec_mean; ground.MET.wspd_vec_mean];
            MET_temp.wdir_vec_mean=[MET_temp.wdir_vec_mean; ground.MET.wdir_vec_mean];
            MET_temp.wdir_vec_std=[MET_temp.wdir_vec_std; ground.MET.wdir_vec_std];
            MET_temp.org_precip_rate_mean=[MET_temp.org_precip_rate_mean; ground.MET.org_precip_rate_mean];
            MET_temp.pwd_err_code=[MET_temp.pwd_err_code; ground.MET.pwd_err_code];
            MET_temp.pwd_mean_vis_1min=[MET_temp.pwd_mean_vis_1min; ground.MET.pwd_mean_vis_1min];
            MET_temp.pwd_mean_vis_10min=[MET_temp.pwd_mean_vis_10min; ground.MET.pwd_mean_vis_10min];
            MET_temp.pwd_pw_code_inst=[MET_temp.pwd_pw_code_inst; ground.MET.pwd_pw_code_inst];
            MET_temp.pwd_pw_code_15min=[MET_temp.pwd_pw_code_15min; ground.MET.pwd_pw_code_15min];
            MET_temp.pwd_pw_code_1hr=[MET_temp.pwd_pw_code_1hr; ground.MET.pwd_pw_code_1hr];
            MET_temp.pwd_precip_rate_mean_1min=[MET_temp.pwd_precip_rate_mean_1min; ground.MET.pwd_precip_rate_mean_1min];
            MET_temp.pwd_cumul_rain=[MET_temp.pwd_cumul_rain; ground.MET.pwd_cumul_rain];
            MET_temp.logger_volt=[MET_temp.logger_volt; ground.MET.logger_volt];
            MET_temp.logger_temp=[MET_temp.logger_temp; ground.MET.logger_temp];
            MET_temp.lat=[MET_temp.lat; ground.MET.lat];
            MET_temp.lon=[MET_temp.lon; ground.MET.lon];
            MET_temp.alt=[MET_temp.alt; ground.MET.alt];
        end

        if isstruct(CO)
            CO_temp1=day_num+(ground.CO.time_hour/24);
            CO_temp.date_time=[CO_temp.date_time; CO_temp1];
            CO_temp.co=[CO_temp.co; ground.CO.co];
            CO_temp.n2o=[CO_temp.n2o; ground.CO.n2o];
            CO_temp.h2o=[CO_temp.h2o; ground.CO.h2o];
            CO_temp.co_dry=[CO_temp.co_dry; ground.CO.co_dry];
            CO_temp.n2o_dry=[CO_temp.n2o_dry; ground.CO.n2o_dry];
            CO_temp.gas_pressure=[CO_temp.gas_pressure; ground.CO.gas_pressure];
            CO_temp.gas_temperature=[CO_temp.gas_temperature; ground.CO.gas_temperature];
            CO_temp.ambient_temperature=[CO_temp.ambient_temperature; ground.CO.ambient_temperature];
            CO_temp.set_point_for_MFC_1=[CO_temp.set_point_for_MFC_1; ground.CO.set_point_for_MFC_1];
            CO_temp.mass_flow_through_MFC_1=[CO_temp.mass_flow_through_MFC_1; ground.CO.mass_flow_through_MFC_1];
            CO_temp.valve_position_MFC_1=[CO_temp.valve_position_MFC_1; ground.CO.valve_position_MFC_1];
            CO_temp.set_point_for_MFC_2=[CO_temp.set_point_for_MFC_2; ground.CO.set_point_for_MFC_2];
            CO_temp.mass_flow_through_MFC_2=[CO_temp.mass_flow_through_MFC_2; ground.CO.mass_flow_through_MFC_2];
            CO_temp.valve_position_MFC_2=[CO_temp.valve_position_MFC_2; ground.CO.valve_position_MFC_2];
            CO_temp.lat=[CO_temp.lat; ground.CO.lat];
            CO_temp.lon=[CO_temp.lon; ground.CO.lon];
            CO_temp.alt=[CO_temp.alt; ground.CO.alt];
        end

        if isstruct(PSAP)

            PSAP_temp1=day_num+(ground.PSAP.time_hour/24);

            PSAP_temp.date_time=[PSAP_temp.date_time; PSAP_temp1];
            PSAP_temp.tr_blue=[PSAP_temp.tr_blue; ground.PSAP.tr_blue];
            PSAP_temp.tr_green=[PSAP_temp.tr_green; ground.PSAP.tr_green];
            PSAP_temp.tr_red=[PSAP_temp.tr_red; ground.PSAP.tr_red];
            PSAP_temp.absorbance_blue_raw=[PSAP_temp.absorbance_blue_raw; ground.PSAP.absorbance_blue_raw];
            PSAP_temp.absorbance_green_raw=[PSAP_temp.absorbance_green_raw; ground.PSAP.absorbance_green_raw];
            PSAP_temp.absorbance_red_raw=[PSAP_temp.absorbance_red_raw; ground.PSAP.absorbance_red_raw];
            %             PSAP_temp.filter_unstable=[PSAP_temp.filter_unstable; ground.PSAP.filter_unstable];
            PSAP_temp.transmittance_blue=[PSAP_temp.transmittance_blue; ground.PSAP.transmittance_blue];
            PSAP_temp.transmittance_green=[PSAP_temp.transmittance_green; ground.PSAP.transmittance_green];
            PSAP_temp.transmittance_red=[PSAP_temp.transmittance_red; ground.PSAP.transmittance_red];
            %             PSAP_temp.absorbance_blue=[PSAP_temp.absorbance_blue; ground.PSAP.absorbance_blue];
            %             PSAP_temp.absorbance_green=[PSAP_temp.absorbance_green; ground.PSAP.absorbance_green];
            %             PSAP_temp.absorbance_red=[PSAP_temp.absorbance_red; ground.PSAP.absorbance_red];
            PSAP_temp.sample_flow_rate=[PSAP_temp.sample_flow_rate; ground.PSAP.sample_flow_rate];
            %             PSAP_temp.dilution_flow_valve_position=[PSAP_temp.dilution_flow_valve_position; ground.PSAP.dilution_flow_valve_position];
            %             PSAP_temp.dilution_flow_setpoint=[PSAP_temp.dilution_flow_setpoint; ground.PSAP.dilution_flow_setpoint];
            %             PSAP_temp.dilution_flow=[PSAP_temp.dilution_flow; ground.PSAP.dilution_flow];
            %             PSAP_temp.dilution_correction_factor=[PSAP_temp.dilution_correction_factor; ground.PSAP.dilution_correction_factor];
            %             PSAP_temp.spot_size_area=[PSAP_temp.spot_size_area; ground.PSAP.spot_size_area];
            %             PSAP_temp.seconds_after_transition=[PSAP_temp.seconds_after_transition; ground.PSAP.seconds_after_transition];
            PSAP_temp.impactor_state=[PSAP_temp.impactor_state; ground.PSAP.impactor_state];
            %             PSAP_temp.transmittance_blue_normalization_factor=[PSAP_temp.transmittance_blue_normalization_factor; ground.PSAP.transmittance_blue_normalization_factor];
            %             PSAP_temp.transmittance_green_normalization_factor=[PSAP_temp.transmittance_green_normalization_factor; ground.PSAP.transmittance_green_normalization_factor];
            %             PSAP_temp.transmittance_red_normalization_factor=[PSAP_temp.transmittance_red_normalization_factor; ground.PSAP.transmittance_red_normalization_factor];
            PSAP_temp.lat=[PSAP_temp.lat; ground.PSAP.lat];
            PSAP_temp.lon=[PSAP_temp.lon; ground.PSAP.lon];
            PSAP_temp.alt=[PSAP_temp.alt; ground.PSAP.alt];
            %             PSAP_temp.average_absorbance_blue=[PSAP_temp.average_absorbance_blue; ground.PSAP.average_absorbance_blue];
            %             PSAP_temp.average_absorbance_green=[PSAP_temp.average_absorbance_green; ground.PSAP.average_absorbance_green];
            %             PSAP_temp.average_absorbance_red=[PSAP_temp.average_absorbance_red; ground.PSAP.average_absorbance_red];
            %             PSAP_temp.overall_average=[PSAP_temp.overall_average; ground.PSAP.overall_average];
        end

        if isstruct(SKYRAD)

            SKYRAD_temp1=day_num+(ground.SKYRAD.time_hour/24);

            SKYRAD_temp.date_time=[SKYRAD_temp.date_time; SKYRAD_temp1];
            SKYRAD_temp.down_long_hemisp1=[SKYRAD_temp.down_long_hemisp1; ground.SKYRAD.down_long_hemisp1];
            SKYRAD_temp.down_long_hemisp2=[SKYRAD_temp.down_long_hemisp2; ground.SKYRAD.down_long_hemisp2];
            SKYRAD_temp.down_short_diffuse_hemisp=[SKYRAD_temp.down_short_diffuse_hemisp; ground.SKYRAD.down_short_diffuse_hemisp];
            SKYRAD_temp.short_direct_normal=[SKYRAD_temp.short_direct_normal; ground.SKYRAD.short_direct_normal];
            SKYRAD_temp.down_short_hemisp=[SKYRAD_temp.down_short_hemisp; ground.SKYRAD.down_short_hemisp];
            SKYRAD_temp.sky_ir_temp=[SKYRAD_temp.sky_ir_temp; ground.SKYRAD.sky_ir_temp];
            SKYRAD_temp.down_long_hemisp1_std=[SKYRAD_temp.down_long_hemisp1_std; ground.SKYRAD.down_long_hemisp1_std];
            SKYRAD_temp.down_long_hemisp2_std=[SKYRAD_temp.down_long_hemisp2_std; ground.SKYRAD.down_long_hemisp2_std];
            SKYRAD_temp.down_short_diffuse_hemisp_std=[SKYRAD_temp.down_short_diffuse_hemisp_std; ground.SKYRAD.down_short_diffuse_hemisp_std];
            SKYRAD_temp.short_direct_normal_std=[SKYRAD_temp.short_direct_normal_std; ground.SKYRAD.short_direct_normal_std];
            SKYRAD_temp.down_short_hemisp_std=[SKYRAD_temp.down_short_hemisp_std; ground.SKYRAD.down_short_hemisp_std];
            SKYRAD_temp.sky_ir_temp_std=[SKYRAD_temp.sky_ir_temp_std; ground.SKYRAD.sky_ir_temp_std];
            SKYRAD_temp.down_long_hemisp1_max=[SKYRAD_temp.down_long_hemisp1_max; ground.SKYRAD.down_long_hemisp1_max];
            SKYRAD_temp.down_long_hemisp2_max=[SKYRAD_temp.down_long_hemisp2_max; ground.SKYRAD.down_long_hemisp2_max];
            SKYRAD_temp.down_short_diffuse_hemisp_max=[SKYRAD_temp.down_short_diffuse_hemisp_max; ground.SKYRAD.down_short_diffuse_hemisp_max];
            SKYRAD_temp.short_direct_normal_max=[SKYRAD_temp.short_direct_normal_max; ground.SKYRAD.short_direct_normal_max];
            SKYRAD_temp.down_short_hemisp_max=[SKYRAD_temp.down_short_hemisp_max; ground.SKYRAD.down_short_hemisp_max];
            SKYRAD_temp.sky_ir_temp_max=[SKYRAD_temp.sky_ir_temp_max; ground.SKYRAD.sky_ir_temp_max];
            SKYRAD_temp.down_long_hemisp1_min=[SKYRAD_temp.down_long_hemisp1_min; ground.SKYRAD.down_long_hemisp1_min];
            SKYRAD_temp.down_long_hemisp2_min=[SKYRAD_temp.down_long_hemisp2_min; ground.SKYRAD.down_long_hemisp2_min];
            SKYRAD_temp.down_short_diffuse_hemisp_min=[SKYRAD_temp.down_short_diffuse_hemisp_min; ground.SKYRAD.down_short_diffuse_hemisp_min];
            SKYRAD_temp.short_direct_normal_min=[SKYRAD_temp.short_direct_normal_min; ground.SKYRAD.short_direct_normal_min];
            SKYRAD_temp.down_short_hemisp_min=[SKYRAD_temp.down_short_hemisp_min; ground.SKYRAD.down_short_hemisp_min];
            SKYRAD_temp.sky_ir_temp_min=[SKYRAD_temp.sky_ir_temp_min; ground.SKYRAD.sky_ir_temp_min];
            SKYRAD_temp.vBatt=[SKYRAD_temp.vBatt; ground.SKYRAD.vBatt];
            SKYRAD_temp.logger_temp=[SKYRAD_temp.logger_temp; ground.SKYRAD.logger_temp];
            SKYRAD_temp.inst_down_long_hemisp1_dome_temp=[SKYRAD_temp.inst_down_long_hemisp1_dome_temp; ground.SKYRAD.inst_down_long_hemisp1_dome_temp];
            SKYRAD_temp.inst_down_long_hemisp1_case_temp=[SKYRAD_temp.inst_down_long_hemisp1_case_temp; ground.SKYRAD.inst_down_long_hemisp1_case_temp];
            SKYRAD_temp.inst_down_long_hemisp2_dome_temp=[SKYRAD_temp.inst_down_long_hemisp2_dome_temp; ground.SKYRAD.inst_down_long_hemisp2_dome_temp];
            SKYRAD_temp.inst_down_long_hemisp2_case_temp=[SKYRAD_temp.inst_down_long_hemisp2_case_temp; ground.SKYRAD.inst_down_long_hemisp2_case_temp];
            SKYRAD_temp.inst_down_long_hemisp1_tp=[SKYRAD_temp.inst_down_long_hemisp1_tp; ground.SKYRAD.inst_down_long_hemisp1_tp];
            SKYRAD_temp.inst_down_long_hemisp2_tp=[SKYRAD_temp.inst_down_long_hemisp2_tp; ground.SKYRAD.inst_down_long_hemisp2_tp];
            SKYRAD_temp.lat=[SKYRAD_temp.lat; ground.SKYRAD.lat];
            SKYRAD_temp.lon=[SKYRAD_temp.lon; ground.SKYRAD.lon];
            SKYRAD_temp.alt=[SKYRAD_temp.alt; ground.SKYRAD.alt];
        end

        if isstruct(SP2)
            if isfield(SP2,'time_hour')

                SP2_temp1=day_num+(ground.SP2.time_hour/24);

                SP2_temp.date_time=[SP2_temp.date_time; SP2_temp1];
                SP2_temp.time=[SP2_temp.time; ground.SP2.time];
                SP2_temp.rBC_conc=[SP2_temp.rBC_conc; ground.SP2.rBC_conc];
            end
        end

        if isstruct(DL)
            if isfield(DL,'time_hour')
                DL_temp1=day_num+(ground.DL.time_hour/24);
                DL_temp.date_time=[DL_temp.date_time; DL_temp1];
                DL_temp.time=[DL_temp.time; ground.DL.time];
                DL_temp.radial_velocity=[DL_temp.radial_velocity, ground.DL.radial_velocity];
                DL_temp.height=ground.DL.height;
            end
        end

        if isstruct(SO2)
            if isfield(SO2,'time')
                SO2_temp1=day_num+(ground.SO2.time/24/3600);
                SO2_temp.date_time=[SO2_temp.date_time; SO2_temp1];
                SO2_temp.time_offset = [SO2_temp.time_offset; ground.SO2.time_offset];
                SO2_temp.time=[SO2_temp.time; ground.SO2.time];
                SO2_temp.concentration=[SO2_temp.concentration; ground.SO2.concentration];
                SO2_temp.internal_temperature=[SO2_temp.internal_temperature; ground.SO2.internal_temperature];
                SO2_temp.sample_pressure=[SO2_temp.sample_pressure; ground.SO2.sample_pressure];
                SO2_temp.sample_flow=[SO2_temp.sample_flow; ground.SO2.sample_flow];
                SO2_temp.averaging_time=[SO2_temp.averaging_time; ground.SO2.averaging_time];
                SO2_temp.status_flag=[SO2_temp.status_flag; ground.SO2.status_flag];
                SO2_temp.lat=ground.SO2.lat;
                SO2_temp.lon=ground.SO2.lon;
                SO2_temp.alt=ground.SO2.alt;
            end
        end

        if isstruct(O3)
            if isfield(O3,'time_hour')
                O3_temp1=day_num+(ground.O3.time_hour/24);
                O3_temp.date_time=[O3_temp.date_time; O3_temp1];
                O3_temp.time_offset = [O3_temp.time_offset; ground.O3.time_offset];
                O3_temp.time=[O3_temp.time; ground.O3.time];
                O3_temp.concentration=[O3_temp.concentration; ground.O3.concentration];
                O3_temp.gas_pressure=[O3_temp.gas_pressure; ground.O3.gas_pressure];
                O3_temp.bench_temperature=[O3_temp.bench_temperature; ground.O3.bench_temperature];
                O3_temp.background=[O3_temp.background; ground.O3.background];
                O3_temp.lamp_state=[O3_temp.lamp_state; ground.O3.lamp_state];
                %             O3_temp.flags=[O3_temp.flags; ground.O3.flags];
                O3_temp.lat=[ground.O3.lat];
                O3_temp.lon=[ground.O3.lon];
                O3_temp.alt=[ground.O3.alt];
            else
                O3 = NaN;
            end
        end

        if isstruct(MWRP)
            MWRP_temp1=day_num+(ground.MWRP.time/86400);
            MWRP_temp.date_time=[MWRP_temp.date_time; MWRP_temp1];
            MWRP_temp.temp_date=[MWRP_temp.temp_date; ground.MWRP.temp_date];
            MWRP_temp.time_offset=[MWRP_temp.time_offset; ground.MWRP.time_offset];
            MWRP_temp.time=[MWRP_temp.time; ground.MWRP.time];
            MWRP_temp.height=[MWRP_temp.height; ground.MWRP.height];
            %             MWRP_temp.RH=[MWRP_temp.RH; ground.MWRP.RH];
            MWRP_temp.lwp=[MWRP_temp.lwp; ground.MWRP.lwp];
            MWRP_temp.Prec_Water=[MWRP_temp.Prec_Water; ground.MWRP.Prec_Water];
            MWRP_temp.cloudBaseHeight=[MWRP_temp.cloudBaseHeight; ground.MWRP.cloudBaseHeight];
            MWRP_temp.lat=[MWRP_temp.lat; ground.MWRP.lat];
            MWRP_temp.lon=[MWRP_temp.lon; ground.MWRP.lon];
            MWRP_temp.alt=[MWRP_temp.alt; ground.MWRP.alt];
        end

        if isstruct(ACSM)
            ACSM_temp.temp_date=[ACSM_temp.temp_date; ground.ACSM.temp_date];
            ACSM_temp.time_offset=[ACSM_temp.time_offset; ground.ACSM.time_offset];
            ACSM_temp.time=[ACSM_temp.time; ground.ACSM.time];
            ACSM_temp.total_organics=[ACSM_temp.total_organics; ground.ACSM.total_organics];
            ACSM_temp.sulfate=[ACSM_temp.sulfate; ground.ACSM.sulfate];
            ACSM_temp.ammonium=[ACSM_temp.ammonium; ground.ACSM.ammonium];
            ACSM_temp.nitrate=[ACSM_temp.nitrate; ground.ACSM.nitrate];
            ACSM_temp.chloride=[ACSM_temp.chloride; ground.ACSM.chloride];
            ACSM_temp.lat=[ACSM_temp.lat; ground.ACSM.lat];
            ACSM_temp.lon=[ACSM_temp.lon; ground.ACSM.lon];
            ACSM_temp.alt=[ACSM_temp.alt; ground.ACSM.alt];
        end

        if isstruct(RAINTB)
            RAINTB_temp1=day_num+(ground.RAINTB.time_hour/24);
            RAINTB_temp.date_time=[RAINTB_temp.date_time; RAINTB_temp1];
            RAINTB_temp.temp_date=[RAINTB_temp.temp_date; ground.RAINTB.base_time];
            RAINTB_temp.time_offset=[RAINTB_temp.time_offset; ground.RAINTB.time_offset];
            RAINTB_temp.time=[RAINTB_temp.time; ground.RAINTB.time];
            RAINTB_temp.time_hour=[RAINTB_temp.time_hour; ground.RAINTB.time_hour];
            RAINTB_temp.precip=[RAINTB_temp.precip; ground.RAINTB.precip];
            RAINTB_temp.rain_rate=[RAINTB_temp.rain_rate; ground.RAINTB.rain_rate];
            %              RAINTB_temp.time_bounds=[RAINTB_temp.time_bounds; ground.RAINTB.time_bounds];
            RAINTB_temp.lat=[RAINTB_temp.lat; ground.RAINTB.lat];
            RAINTB_temp.lon=[RAINTB_temp.lon; ground.RAINTB.lon];
            RAINTB_temp.alt=[RAINTB_temp.alt; ground.RAINTB.alt];
        end

        if isstruct(SO2a1)
            if isfield(SO2a1,'time')
                SO2a1_temp1=day_num+(ground.SO2a1.time/24/3600);
                SO2a1_temp.date_time=[SO2a1_temp.date_time; SO2a1_temp1];
                SO2a1_temp.time_offset = [SO2a1_temp.time_offset; ground.SO2a1.time_offset];
                SO2a1_temp.time=[SO2a1_temp.time; ground.SO2a1.time];
                SO2a1_temp.concentration=[SO2a1_temp.concentration; ground.SO2a1.concentration];
                SO2a1_temp.internal_temperature=[SO2a1_temp.internal_temperature; ground.SO2a1.internal_temperature];
                SO2a1_temp.sample_pressure=[SO2a1_temp.sample_pressure; ground.SO2a1.sample_pressure];
                SO2a1_temp.sample_flow=[SO2a1_temp.sample_flow; ground.SO2a1.sample_flow];
                SO2a1_temp.averaging_time=[SO2a1_temp.averaging_time; ground.SO2a1.averaging_time];
                %                 SO2a1_temp.status_flag=[SO2a1_temp.status_flag; ground.SO2a1.status_flag];
                SO2a1_temp.lat=ground.SO2a1.lat;
                SO2a1_temp.lon=ground.SO2a1.lon;
                SO2a1_temp.alt=ground.SO2a1.alt;
            end
        end

        if isstruct(DL_VAP)
            if isfield(DL_VAP,'time_hour')

                DL_VAP_temp1=day_num+(ground.DL_VAP.time_hour/24);
                DL_VAP_temp.date_time=[DL_VAP_temp.date_time; DL_VAP_temp1];
                DL_VAP_temp.day_time=[DL_VAP_temp.day_time; ground.DL_VAP.base_time];
                DL_VAP_temp.time=[DL_VAP_temp.time; ground.DL_VAP.time];
                DL_VAP_temp.radial_velocity=[DL_VAP_temp.radial_velocity, ground.DL_VAP.radial_velocity];
                DL_VAP_temp.height=ground.DL_VAP.height;
                DL_VAP_temp.ceil_cbh = [DL_VAP_temp.ceil_cbh, ground.DL_VAP.ceil_cbh];
                DL_VAP_temp.cbh_dl =[DL_VAP_temp.cbh_dl, ground.DL_VAP.cbh_dl];
                DL_VAP_temp.SNR = [DL_VAP_temp.SNR, ground.DL_VAP.SNR];
            end
        end

        if isstruct(UFCPC)
            if isfield(UFCPC,'time_hour')
                UFCPC_temp1=day_num+(ground.UFCPC.time_hour/24);
                UFCPC_temp.date_time=[UFCPC_temp.date_time; UFCPC_temp1];
                UFCPC_temp.concentration=[UFCPC_temp.concentration; ground.UFCPC.concentration];
                UFCPC_temp.saturation_temp=[UFCPC_temp.saturation_temp; ground.UFCPC.saturation_temp];
                UFCPC_temp.condensation_temp=[UFCPC_temp.condensation_temp; ground.UFCPC.condensation_temp];
                UFCPC_temp.optics_temp=[UFCPC_temp.optics_temp; ground.UFCPC.optics_temp];
                UFCPC_temp.cabinet_temp=[UFCPC_temp.cabinet_temp; ground.UFCPC.cabinet_temp];
                UFCPC_temp.ambient_pressure=[UFCPC_temp.ambient_pressure; ground.UFCPC.ambient_pressure];
                %             UFCPC_temp.aerosol_flow=[UFCPC_temp.aerosol_flow; ground.UFCPC.aerosol_flow]; %comment if the data is not available in the ingested file
                UFCPC_temp.orifice_pressure=[UFCPC_temp.orifice_pressure; ground.UFCPC.orifice_pressure];
                UFCPC_temp.nozzle_pressure=[UFCPC_temp.nozzle_pressure; ground.UFCPC.nozzle_pressure];
                UFCPC_temp.laser_current=[UFCPC_temp.laser_current; ground.UFCPC.laser_current];
                UFCPC_temp.liquid_level=[UFCPC_temp.liquid_level; ground.UFCPC.liquid_level];
                UFCPC_temp.fraction_full=[UFCPC_temp.fraction_full; ground.UFCPC.fraction_full];
                UFCPC_temp.lat=[UFCPC_temp.lat; ground.UFCPC.lat];
                UFCPC_temp.lon=[UFCPC_temp.lon; ground.UFCPC.lon];
                UFCPC_temp.alt=[UFCPC_temp.alt; ground.UFCPC.alt];
            end
        end
        if isstruct(CCN)
            if isfield(CCN,'time_hour')
                CCN_temp1=day_num+(ground.CCN.time_hour/24);
                CCN_temp.date=[CCN.temp_date; CCN_temp1];
                CCN_temp.date_time=[CCN_temp.date_time;ground.CCN.temp_date];
                CCN_temp.time_offset=[CCN_temp.time_offset;ground.CCN.time_offset];
                CCN_temp.time=[CCN_temp.time;ground.CCN.time];
                CCN_temp.diameter_mobility=[CCN_temp.diameter_mobility;ground.CCN.diameter_mobility];
                CCN_temp.diameter_mobility_bounds=[CCN_temp.diameter_mobility_bounds;ground.CCN.diameter_mobility_bounds];
                CCN_temp.droplet_size=[CCN_temp.droplet_size;ground.CCN.droplet_size];
                CCN_temp.droplet_size_bounds = [CCN_temp.droplet_size_bounds;ground.CCN.droplet_size_bounds];
                CCN_temp.SS_setpoint = [CCN_temp.SS_setpoint;ground.CCN.SS_setpoint];
                CCN_temp.hygro_param_kappa = [CCN_temp.hygro_param_kappa;ground.CCN.hygro_param_kappa];
                CCN_temp.supersaturation = [CCN_temp.supersaturation;ground.CCN.supersaturation];
                CCN_temp.N_CCN = [CCN_temp.N_CCN;ground.CCN.N_CCN];
                CCN_temp.N_CCN_dN = [CCN_temp.N_CCN_dN;ground.CCN.N_CCN_dN];
                CCN_temp.dN_dlogDp = [CCN_temp.dN_dlogDp;ground.CCN.dN_dlogDp];
                CCN_temp.lat=[CCN_temp.lat; ground.CCN.lat];
                CCN_temp.lon=[CCN_temp.lon; ground.CCN.lon];
                CCN_temp.alt=[CCN_temp.alt; ground.CCN.alt];
            end
        end

        if isstruct(TSI)
            if isfield(TSI,'time_hour')
                TSI_temp1=day_num+(ground.TSI.time_hour/24);
                TSI_temp.date=[TSI.temp_date; TSI_temp1];
                TSI_temp.date_time=[TSI_temp.date_time;ground.TSI.temp_date];
                TSI_temp.time_offset=[TSI_temp.time_offset;ground.TSI.time_offset];
                TSI_temp.time=[TSI_temp.time;ground.TSI.time];
                TSI_temp.percent_thin=[TSI_temp.percent_thin;ground.TSI.percent_thin];
                TSI_temp.percent_opaque=[TSI_temp.percent_opaque;ground.TSI.percent_opaque];
                TSI_temp.sunny=[TSI_temp.sunny;ground.TSI.sunny];
                TSI_temp.solar_altitude = [TSI_temp.solar_altitude;ground.TSI.solar_altitude];
                TSI_temp.solar_azimuth = [TSI_temp.solar_azimuth;ground.TSI.solar_azimuth];
                TSI_temp.lat=[TSI_temp.lat; ground.TSI.lat];
                TSI_temp.lon=[TSI_temp.lon; ground.TSI.lon];
                TSI_temp.alt=[TSI_temp.alt; ground.TSI.alt];
            end
        end
        week_date= [week_date;ground.date];
    end
 
    %Saving week data

    if ~(rem(day_num,7)) %If the day_num is not divisible by 7

        Q=(day_num/7);
        week_num=fix(Q); %round the week num to be in the 7 day range
        filename1=strcat('C:\Users\mxb2517\OneDrive - University of Miami\University_of_Miami\Thesis\DOE_Projects\LASIC\LASIC_Matlab_Code\Weekly_data_files_Marcus\Week',num2str(week_num));
        % filename1=strcat('/Users/marcusbatista/Library/CloudStorage/OneDrive-UniversityofMiami/University_of_Miami/Thesis/DOE_Projects/LASIC/LASIC_Matlab_Code/Weekly_data_files_Marcus/Week',num2str(week_num)); %Location of Week(num) files in Mac
        load(filename1);
        startdate= get_mission_paramt_ASI(day_num-6); %Start date of the week for the plot title
        start_date = startdate.date;
        enddate = get_mission_paramt_ASI(day_num);
        end_date = enddate.date; %Final date of the week for the plot title
        ground_weekly.date = week_date;
        ground_weekly.day_num=SMPS_temp.day_num;
        ground_weekly.start_date=start_date;
        ground_weekly.week_num=week_num;
        ground_weekly.CPC_temp=CPC_temp;
        ground_weekly.SMPS_temp=SMPS_temp;
        ground_weekly.MET_temp=MET_temp;
        ground_weekly.CO_temp=CO_temp;
        ground_weekly.PSAP_temp=PSAP_temp;
        ground_weekly.SKYRAD_temp=SKYRAD_temp;
        ground_weekly.SP2_temp=SP2_temp;
        ground_weekly.DL_temp=DL_temp;
        ground_weekly.SO2_temp=SO2_temp;
        ground_weekly.O3_temp=O3_temp;
        ground_weekly.MWRP_temp=MWRP_temp;
        ground_weekly.ACSM_temp=ACSM_temp;
        ground_weekly.RAINTB_temp=RAINTB_temp;
        ground_weekly.SO2a1_temp=SO2a1_temp;
        ground_weekly.DL_VAP_temp=DL_VAP_temp;
        ground_weekly.UFCPC_temp=UFCPC_temp;


        save(filename1,'ground_weekly');

        temp1=temp1+7;
        temp2=temp2+7;

        if 1
            week_date = [];

            SMPS_temp.date= [];
            SMPS_temp.day_num= [];
            SMPS_temp.date_time=[];
            SMPS_temp.sample_temperature=[];
            SMPS_temp.sample_pressure=[];
            SMPS_temp.mean_free_path=[];
            SMPS_temp.gas_viscosity=[];
            SMPS_temp.diameter_midpoint_nm=[];
            SMPS_temp.N_nuc=[];
            SMPS_temp.N_nuc30=[];
            SMPS_temp.N_ait=[];
            SMPS_temp.N_acc=[];
            SMPS_temp.S_SMPS=[];
            SMPS_temp.diameter_midpoint_m=[];
            SMPS_temp.number_size_distribution=[];     % transpose it
            SMPS_temp.sheath_flow=[];
            SMPS_temp.aerosol_flow=[];
            SMPS_temp.cpc_inlet_flow=[];
            SMPS_temp.cpc_sample_flow=[];
            SMPS_temp.low_voltage=[];
            SMPS_temp.high_voltage=[];
            SMPS_temp.lower_size=[];
            SMPS_temp.status_flag=[];
            SMPS_temp.d50=[];
            SMPS_temp.median=[];
            SMPS_temp.mean=[];
            SMPS_temp.geometric_mean=[];
            SMPS_temp.geometric_mean_std=[];
            SMPS_temp.mode=[];
            SMPS_temp.total_concentration=[];
            SMPS_temp.down_scan_first=[];
            SMPS_temp.multiple_charge_correction=[];
            SMPS_temp.diffusion_correction=[];
            SMPS_temp.nanoparticle_agglomerate_mobility_analysis=[];
            SMPS_temp.DMA_inner_radius=[];
            SMPS_temp.DMA_outer_radius=[];
            SMPS_temp.DMA_characteristic_length=[];
            SMPS_temp.reference_mean_free_path=[];
            SMPS_temp.reference_gas_viscosity=[];
            SMPS_temp.reference_gas_temperature=[];
            SMPS_temp.reference_gass_pressure=[];
            SMPS_temp.particle_density=[];
            SMPS_temp.lat=[];
            SMPS_temp.lon=[];
            SMPS_temp.alt=[];
            SMPS_temp.CN30_NTotal = [];


            CPC_temp.date_time=[];
            CPC_temp.concentration=[];
            CPC_temp.saturation_temp=[];
            CPC_temp.condensation_temp=[];
            CPC_temp.optics_temp=[];
            CPC_temp.cabinet_temp=[];
            CPC_temp.ambient_pressure=[];
            CPC_temp.aerosol_flow=[];
            CPC_temp.orifice_pressure=[];
            CPC_temp.nozzle_pressure=[];
            CPC_temp.laser_current=[];
            CPC_temp.liquid_level=[];
            CPC_temp.fraction_full=[];
            CPC_temp.lat=[];
            CPC_temp.lon=[];
            CPC_temp.alt=[];

            MET_temp.date_time=[];
            MET_temp.atmos_pressure=[];
            MET_temp.temp_mean=[];
            MET_temp.temp_std=[];
            MET_temp.rh_mean=[];
            MET_temp.rh_std=[];
            MET_temp.theta_E=[];
            MET_temp.theta=[];
            MET_temp.vapor_pressure_mean=[];
            MET_temp.vapor_pressure_std=[];
            MET_temp.wspd_arith_mean=[];
            MET_temp.wspd_vec_mean=[];
            MET_temp.wdir_vec_mean=[];
            MET_temp.wdir_vec_std=[];
            MET_temp.org_precip_rate_mean=[];
            MET_temp.pwd_err_code=[];
            MET_temp.pwd_mean_vis_1min=[];
            MET_temp.pwd_mean_vis_10min=[];
            MET_temp.pwd_pw_code_inst=[];
            MET_temp.pwd_pw_code_15min=[];
            MET_temp.pwd_pw_code_1hr=[];
            MET_temp.pwd_precip_rate_mean_1min=[];
            MET_temp.pwd_cumul_rain=[];
            MET_temp.logger_volt=[];
            MET_temp.logger_temp=[];
            MET_temp.lat=[];
            MET_temp.lon=[];
            MET_temp.alt=[];

            CO_temp.date_time=[];
            CO_temp.co=[];
            CO_temp.n2o=[];
            CO_temp.h2o=[];
            CO_temp.co_dry=[];
            CO_temp.n2o_dry=[];
            CO_temp.gas_pressure=[];
            CO_temp.gas_temperature=[];
            CO_temp.ambient_temperature=[];
            CO_temp.set_point_for_MFC_1=[];
            CO_temp.mass_flow_through_MFC_1=[];
            CO_temp.valve_position_MFC_1=[];
            CO_temp.set_point_for_MFC_2=[];
            CO_temp.mass_flow_through_MFC_2=[];
            CO_temp.valve_position_MFC_2=[];
            CO_temp.lat=[];
            CO_temp.lon=[];
            CO_temp.alt=[];

            PSAP_temp.date_time=[];
            PSAP_temp.tr_blue=[];
            PSAP_temp.tr_green=[];
            PSAP_temp.tr_red=[];
            PSAP_temp.absorbance_blue_raw=[];
            PSAP_temp.absorbance_green_raw=[];
            PSAP_temp.absorbance_red_raw=[];
            PSAP_temp.filter_unstable=[];
            PSAP_temp.transmittance_blue=[];
            PSAP_temp.transmittance_green=[];
            PSAP_temp.transmittance_red=[];
            PSAP_temp.absorbance_blue=[];
            PSAP_temp.absorbance_green=[];
            PSAP_temp.absorbance_red=[];
            PSAP_temp.sample_flow_rate=[];
            PSAP_temp.dilution_flow_valve_position=[];
            PSAP_temp.dilution_flow_setpoint=[];
            PSAP_temp.dilution_flow=[];
            PSAP_temp.dilution_correction_factor=[];
            PSAP_temp.spot_size_area=[];
            PSAP_temp.seconds_after_transition=[];
            PSAP_temp.impactor_state=[];
            PSAP_temp.transmittance_blue_normalization_factor=[];
            PSAP_temp.transmittance_green_normalization_factor=[];
            PSAP_temp.transmittance_red_normalization_factor=[];
            PSAP_temp.lat=[];
            PSAP_temp.lon=[];
            PSAP_temp.alt=[];
            PSAP_temp.average_absorbance_blue=[];
            PSAP_temp.average_absorbance_green=[];
            PSAP_temp.average_absorbance_red=[];
            PSAP_temp.overall_average=[];

            SKYRAD_temp.date_time=[];
            SKYRAD_temp.down_long_hemisp1=[];
            SKYRAD_temp.down_long_hemisp2=[];
            SKYRAD_temp.down_short_diffuse_hemisp=[];
            SKYRAD_temp.short_direct_normal=[];
            SKYRAD_temp.down_short_hemisp=[];
            SKYRAD_temp.sky_ir_temp=[];
            SKYRAD_temp.down_long_hemisp1_std=[];
            SKYRAD_temp.down_long_hemisp2_std=[];
            SKYRAD_temp.down_short_diffuse_hemisp_std=[];
            SKYRAD_temp.short_direct_normal_std=[];
            SKYRAD_temp.down_short_hemisp_std=[];
            SKYRAD_temp.sky_ir_temp_std=[];
            SKYRAD_temp.down_long_hemisp1_max=[];
            SKYRAD_temp.down_long_hemisp2_max=[];
            SKYRAD_temp.down_short_diffuse_hemisp_max=[];
            SKYRAD_temp.short_direct_normal_max=[];
            SKYRAD_temp.down_short_hemisp_max=[];
            SKYRAD_temp.sky_ir_temp_max=[];
            SKYRAD_temp.down_long_hemisp1_min=[];
            SKYRAD_temp.down_long_hemisp2_min=[];
            SKYRAD_temp.down_short_diffuse_hemisp_min=[];
            SKYRAD_temp.short_direct_normal_min=[];
            SKYRAD_temp.down_short_hemisp_min=[];
            SKYRAD_temp.sky_ir_temp_min=[];
            SKYRAD_temp.vBatt=[];
            SKYRAD_temp.logger_temp=[];
            SKYRAD_temp.inst_down_long_hemisp1_dome_temp=[];
            SKYRAD_temp.inst_down_long_hemisp1_case_temp=[];
            SKYRAD_temp.inst_down_long_hemisp2_dome_temp=[];
            SKYRAD_temp.inst_down_long_hemisp2_case_temp=[];
            SKYRAD_temp.inst_down_long_hemisp1_tp=[];
            SKYRAD_temp.inst_down_long_hemisp2_tp=[];
            SKYRAD_temp.lat=[];
            SKYRAD_temp.lon=[];
            SKYRAD_temp.alt=[];

            SP2_temp.date_time=[];
            SP2_temp.time=[];
            SP2_temp.rBC_conc=[];


            DL_temp.date_time=[];
            DL_temp.time=[];
            DL_temp.radial_velocity=[];
            DL_temp.height=[];

            SO2_temp.date_time=[];
            SO2_temp.time_offset=[];
            SO2_temp.time=[];
            SO2_temp.concentration=[];
            SO2_temp.internal_temperature=[];
            SO2_temp.sample_pressure=[];
            SO2_temp.sample_flow=[];
            SO2_temp.averaging_time=[];
            SO2_temp.status_flag=[];
            SO2_temp.lat=[];
            SO2_temp.lon=[];
            SO2_temp.alt=[];

            O3_temp.base_time=[];
            O3_temp.date_time =[];
            O3_temp.time_offset=[];
            O3_temp.time=[];
            O3_temp.concentration=[];
            O3_temp.gas_pressure=[];
            O3_temp.bench_temperature=[];
            O3_temp.background=[];
            O3_temp.lamp_state=[];
            %                 O3_temp.flags=[];
            O3_temp.lat=[];
            O3_temp.lon=[];
            O3_temp.alt=[];

            ACSM_temp.temp_date = [];
            ACSM_temp.time_offset=[];
            ACSM_temp.time=[];
            ACSM_temp.total_organics=[];
            ACSM_temp.sulfate=[];
            ACSM_temp.ammonium=[];
            ACSM_temp.nitrate=[];
            ACSM_temp.chloride=[];
            ACSM_temp.lat=[];
            ACSM_temp.lon=[];
            ACSM_temp.alt=[];

            MWRP_temp.temp_date=[];
            MWRP_temp.date_time = [];
            MWRP_temp.time_offset=[];
            MWRP_temp.time=[];
            MWRP_temp.height=[];
            MWRP_temp.lwp=[];
            MWRP_temp.RH=[];
            MWRP_temp.Prec_Water=[];
            MWRP_temp.cloudBaseHeight=[];
            MWRP_temp.lat=[];
            MWRP_temp.lon=[];
            MWRP_temp.alt=[];

            RAINTB_temp.temp_date=[];
            RAINTB_temp.date_time = [];
            RAINTB_temp.time_offset=[];
            RAINTB_temp.time=[];
            RAINTB_temp.time_hour=[];
            RAINTB_temp.precip=[];
            RAINTB_temp.rain_rate=[];
            RAINTB_temp.time_bounds=[];
            RAINTB_temp.lat=[];
            RAINTB_temp.lon=[];
            RAINTB_temp.alt=[];

            SO2a1_temp.date_time=[];
            SO2a1_temp.time_offset=[];
            SO2a1_temp.time=[];
            SO2a1_temp.concentration=[];
            SO2a1_temp.internal_temperature=[];
            SO2a1_temp.sample_pressure=[];
            SO2a1_temp.sample_flow=[];
            SO2a1_temp.averaging_time=[];
            SO2a1_temp.status_flag=[];
            SO2a1_temp.lat=[];
            SO2a1_temp.lon=[];
            SO2a1_temp.alt=[];

            DL_VAP_temp.day_time=[];
            DL_VAP_temp.date_time=[];
            DL_VAP_temp.time=[];
            DL_VAP_temp.radial_velocity=[];
            DL_VAP_temp.height=[];
            DL_VAP_temp.ceil_cbh = [];
            DL_VAP_temp.cbh_dl =[];
            DL_VAP_temp.SNR = [];

            UFCPC_temp.date_time=[];
            UFCPC_temp.concentration=[];
            UFCPC_temp.saturation_temp=[];
            UFCPC_temp.condensation_temp=[];
            UFCPC_temp.optics_temp=[];
            UFCPC_temp.cabinet_temp=[];
            UFCPC_temp.ambient_pressure=[];
            UFCPC_temp.aerosol_flow=[];
            UFCPC_temp.orifice_pressure=[];
            UFCPC_temp.nozzle_pressure=[];
            UFCPC_temp.laser_current=[];
            UFCPC_temp.liquid_level=[];
            UFCPC_temp.fraction_full=[];
            UFCPC_temp.lat=[];
            UFCPC_temp.lon=[];
            UFCPC_temp.alt=[];

            CCN_temp.date_time=[];
            CCN_temp.time_offset=[];
            CCN_temp.time=[];
            CCN_temp.diameter_mobility=[];
            CCN_temp.diameter_mobility_bounds=[];
            CCN_temp.droplet_size=[];
            CCN_temp.droplet_size_bounds=[];
            CCN_temp.SS_setpoint=[];
            CCN_temp.hygro_param_kappa=[];
            CCN_temp.supersaturation=[];
            CCN_temp.N_CCN=[];
            CCN_temp.N_CCN_dN=[];
            CCN_temp.dN_dlogDp=[];
            CCN_temp.lat=[];
            CCN_temp.lon=[];
            CCN_temp.alt=[];

            TSI_temp.date=[];
            TSI_temp.date_time=[];
            TSI_temp.time_offset=[];
            TSI_temp.time=[];
            TSI_temp.percent_thin=[];
            TSI_temp.percent_opaque=[];
            TSI_temp.sunny=[];
            TSI_temp.solar_altitude=[];
            TSI_temp.solar_azimuth=[];
            TSI_temp.lat=[];
            TSI_temp.lon=[];
            TSI_temp.alt=[];

        end
    end
end


