clear

%% GMM7 data for AFG2

%OD of serial dilutions
OD_PGG = [0.705888889	0.336	0.157	0.119222222 0.091444444];
OD_EGG = [0.929333333	0.370555556	0.197111111	0.124333333 0.091444444];
OD_CGG = [1.315111111	0.581555556	0.257222222	0.091444444];
OD_GGG = [1.249	0.553	0.261888889	0.142777778 0.091444444];

%RFU of serial dilutions
D_PGG = [11306.44444	13433.22222	14261.11111	14840.88889 13836.77778];
D_EGG = [10118.55556	12748.22222	13639.77778	14581.66667 13836.77778];
D_CGG = [8603.555556	10592.77778	11624.33333	13836.77778];
D_GGG = [8297.666667	10529.33333	12585.66667	13529 13836.77778];


%OD background normalization
OD_PGG = (OD_PGG - 0.09144);
OD_EGG = (OD_EGG - 0.09144);
OD_CGG = (OD_CGG - 0.09144);
OD_GGG = (OD_GGG - 0.09144);

%Converation of RFU to toxin concentration
D_PGG = 24*(D_PGG - 71)./(50448 - D_PGG);
D_EGG = 24*(D_EGG - 71)./(50448 - D_EGG);
D_CGG = 24*(D_CGG - 71)./(50448 - D_CGG);
D_GGG = 24*(D_GGG - 71)./(50448 - D_GGG);

figure
    hold on
    plot(OD_PGG,D_PGG)
    plot(OD_EGG,D_EGG)
    plot(OD_CGG,D_CGG)
    plot(OD_GGG,D_GGG)
    xlabel('OD 600')
    ylabel('Toxin concentration')
    legend('R. pyr','R.ery','SI-C8','GI-38')
    
