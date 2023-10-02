clear

%Load saved file from ConversionofRFUtoToxin
load('SI_new_GMM7_SMM7_RFUtoToxin')

%Time of analysis (how long the plate was run) in hours
tf = 48;
dt = 5/60; %Time between read points in hours

%Dimensions of the plate; i=rows, j=columns
i = 8;
j = 12;

%Subtracting background from OD
OD6 = OD6-0.084*ones(8,12,Nr);

%Background fluorescence of toxin alone in medium
T_BGg = mean(FLT1(5:6,12,1:Nr),1); % G2
T_BGb = mean(FLT2(3:4,12,1:Nr),1); % B1

%Fluorscence normalization for cell scattering
Sg= -3.7595; %Slope for G2
Sb = -3.59269; %Slope for B1

%% Calculate percent degradation
pdegn = zeros(8,12);
pdeg_minn = zeros(8,12);
FLTn = zeros(8,12,Nr);
Tscat = zeros(8,12,Nr);
Tc = zeros(8,12,Nr);

%AFG2 conditions
for q = 2:4
    for v = 6:11
        FLTn(q,v,:) = FLT1(q,v,1:Nr)./(1/T_BGg(1,1,1)*T_BGg(1,1,1:Nr));
        Tc(q,v,:) = -Sg*OD6(q,v,1:Nr) + FLTn(q,v,1:Nr);
        start = Tc(q,v,1);
        final = Tc(q,v,Nr);
        min_toxin = min(Tc(q,v,1:Nr));
        pdeg_minn(q,v) = (start - min_toxin)/start;
    end
end

%AFB1 conditions
for q = 5:7
    for v = 6:11
        FLTn(q,v,:) = FLT2(q,v,1:Nr)./(1/T_BGb(1,1,1)*T_BGb(1,1,1:Nr));
        Tc(q,v,:) = -Sb*OD6(q,v,1:Nr) + FLTn(q,v,1:Nr);
        start = Tc(q,v,1);
        final = Tc(q,v,Nr);
        min_toxin = min(Tc(q,v,1:Nr));
        pdeg_minn(q,v) = (start - min_toxin)/start;
    end
end

disp(pdeg_minn)

%% Figures for growth and degradation

figure %Plotting growth over time
    hold on
    plot(dt*(0:Nr-1),smooth(shiftdim(mean(OD6(2:4,6,1:Nr),1),2),15))
    plot(dt*(0:Nr-1),smooth(shiftdim(mean(OD6(2:4,7,1:Nr),1),2),15))
    plot(dt*(0:Nr-1),smooth(shiftdim(mean(OD6(2:4,8,1:Nr),1),2),15))
    set(gca,'YScale','log')
    xlabel('Time (hrs)')
    ylabel('OD600')
    xlim([0 tf]) 
    xticks([0 12 24 36 48])
    legend('SI-B2','SI-C3','SI-C4')
    title('Growth in presence of AFG_2 in GMM7')
    
figure %Plotting degradation as a function of loss of toxin conc. over time
    hold on
    plot(dt*(0:Nr-1),smooth(shiftdim(mean(FLTn(2:4,6,1:Nr),1),2),15))
    plot(dt*(0:Nr-1),smooth(shiftdim(mean(FLTn(2:4,7,1:Nr),1),2),15))
    plot(dt*(0:Nr-1),smooth(shiftdim(mean(FLTn(2:4,8,1:Nr),1),2),15))
    xlabel('Time (hrs)')
    ylabel('AFG_2 Toxin Conc. (\mug/ml)')
    xlim([0 tf]) 
    xticks([0 12 24 36 48])
    legend('SI-B2','SI-C3','SI-C4')
    title('AFG_2 degradation by GI strains in GMM7')

%% OD versus toxin concentration
figure %Plotting OD as a function of loss of toxin conc. over time
    hold on
    plot(shiftdim(mean(OD6(2:4,6,1:Nr),1),2),smooth(shiftdim(mean(Tc(2:4,6,1:Nr),1),2),15))
    plot(shiftdim(mean(OD6(2:4,7,1:Nr),1),2),smooth(shiftdim(mean(Tc(2:4,7,1:Nr),1),2),15))
    plot(shiftdim(mean(OD6(2:4,8,1:Nr),1),2),smooth(shiftdim(mean(Tc(2:4,8,1:Nr),1),2),15))
    xlabel('OD600')
    ylabel('AFG_2 Toxin Conc. (\mug/ml)')
    legend('SI-B2','SI-C3','SI-C4')
    title('Toxin concentration vs OD in GMM7')    


save('SI_new_GMM7_SMM7_degeff')