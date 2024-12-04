clear

%% Growth rate
jt = 0.07;

%Growth rates for isolates (16S seq) in starch (GIS) and glucose (GIG)
SI_GIS = [0.13505 0.50865 0.67235 0.64915 0.70645 1.5358 0.4395 1.1042 1.00745 0.27445 1.0992 0.9286];
SI_GIG = [0.16555 0.1128 0.64185 0.9193 0.6091 1.06505 0.38515 0.88655 0.821 0.30035 0.68825 0.6363];
GI_GIS = [0.86545 0.4216 1.0467 0.94565 1.1768 0.8025 1.019 0.4165 0.8653 0.82175 0.40215 1.2984 0.29075 0.44915 0.49845];
GI_GIG = [1.03025 0 0.47945 0.85765 1.0691 0.2827 1.1723 1.1061 1.08285 0.8214 0.3058 1.2232 1.20885 0.4865 0.4937];

xSI_GIS = 1+jt*randn(1,length(SI_GIS));
xSI_GIG = 2+jt*randn(1,length(SI_GIG));
xGI_GIS = 3+jt*randn(1,length(GI_GIS));
xGI_GIG = 4+jt*randn(1,length(GI_GIG));

%Figure 3A
figure (11)
plot([xSI_GIS; xSI_GIG],[SI_GIS; SI_GIG],'-','color',[0.5 0.5 0.5]) % plot linkages
hold on
plot(xSI_GIS,SI_GIS,'b.','MarkerSize',16) % plot jittered data points
plot([1-jt, 1+jt], mean(SI_GIS)*[1,1],'k') % mark mean
plot(1, median(SI_GIS),'k^') % mark median
plot(xSI_GIG,SI_GIG,'b.','MarkerSize',16) % plot jittered data points
plot([2-jt, 2+jt], mean(SI_GIG)*[1,1],'k') % mark mean
plot(2, median(SI_GIG),'k^') % mark median
plot([xGI_GIS; xGI_GIG],[GI_GIS; GI_GIG],'-','color',[0.5 0.5 0.5]) % plot jittered data points
plot(xGI_GIS,GI_GIS,'r.','MarkerSize',16) % plot jittered data points
plot([3-jt, 3+jt], mean(GI_GIS)*[1,1],'k') % mark mean
plot(3, median(GI_GIS),'k^') % mark median
plot(xGI_GIG,GI_GIG,'r.','MarkerSize',16) % plot jittered data points
plot([4-jt, 4+jt], mean(GI_GIG)*[1,1],'k') % mark mean
plot(4, median(GI_GIG),'k^') % mark median
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'SI-DIS','SI-DIG','GI-GIS','GI-DIG'})
ylabel('Growth rate (1/hr)')
xlim([0 5])
ylim([0 2])


% compare SI_DIS and SI_DIG
pSS_SG = ranksum(SI_GIS,SI_GIG)
% compare SI_DIS and GI_DIS
pSS_GS = ranksum(SI_GIS,GI_GIS)
% compare SI_DIS and GI_DIG
pSS_GG = ranksum(SI_GIS,GI_GIG)
% compare SI_DIG and GI_DIS
pSG_GS = ranksum(SI_GIG,GI_GIS)
% compare SI_DIG and GI_DIG
pSG_GG = ranksum(SI_GIG,GI_GIG)
% compare GI_DIS and GI_DIG
pGS_GG = ranksum(GI_GIS,GI_GIG)


%% Carrying capacity 

%Carrying capacities for isolates (16S seq) in starch (IS) and glucose (IG)
SI_IS = [1.3151 1.2649 1.3858 1.4498 1.1636 1.344 1.2378 1.55535 1.443 0.33125 1.392 1.35865];
SI_IG = [0.996 1.07315 1.4699 1.4685 1.55325 1.60685 1.3794 1.5371 1.4935 1.02125 1.4034 1.33975];
GI_IS = [0.7465 0.35625 0.9284 0.54625 0.602 0.676 0.60225 0.626 0.62425 0.70135 0.61635 0.67555 0.48075 0.28315 0.4055];
GI_IG = [1.2139 0.0005 0.97615 1.129 1.298 0.2709 1.29985 1.1604 1.28755 1.2725 1.272 1.28135 1.293 1.332 1.13015];

xSI_IS = 1+jt*randn(1,length(SI_IS));
xSI_IG = 2+jt*randn(1,length(SI_IG));
xGI_IS = 3+jt*randn(1,length(GI_IS));
xGI_IG = 4+jt*randn(1,length(GI_IG));

%Figure 3B
figure (13)
plot([xSI_IS; xSI_IG],[SI_IS; SI_IG],'-','color',[0.5 0.5 0.5]) % plot linkages
hold on
plot(xSI_IS,SI_IS,'b.','MarkerSize',16) % plot jittered data points
plot([1-jt, 1+jt], mean(SI_IS)*[1,1],'k') % mark mean
plot(1, median(SI_IS),'k^') % mark median
plot(xSI_IG,SI_IG,'b.','MarkerSize',16) % plot jittered data points
plot([2-jt, 2+jt], mean(SI_IG)*[1,1],'k') % mark mean
plot(2, median(SI_IG),'k^') % mark median
plot([xGI_IS; xGI_IG],[GI_IS; GI_IG],'-','color',[0.5 0.5 0.5]) % plot jittered data points
plot(xGI_IS,GI_IS,'r.','MarkerSize',16) % plot jittered data points
plot([3-jt, 3+jt], mean(GI_IS)*[1,1],'k') % mark mean
plot(3, median(GI_IS),'k^') % mark median
plot(xGI_IG,GI_IG,'r.','MarkerSize',16) % plot jittered data points
plot([4-jt, 4+jt], mean(GI_IG)*[1,1],'k') % mark mean
plot(4, median(GI_IG),'k^') % mark median
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'SI-DIS','SI-DIG','GI-GIS','GI-DIG'})
ylabel('Carrying capacity (Max OD_6_0_0 used a a proxy)')
xlim([0 5])
ylim([0 2])

% compare SI_DIS and SI_DIG
cSS_SG = ranksum(SI_IS,SI_IG)
% compare SI_DIS and GI_DIS
cSS_GS = ranksum(SI_IS,GI_IS)
% compare SI_DIS and GI_DIG
cSS_GG = ranksum(SI_IS,GI_IG)
% compare SI_DIG and GI_DIS
cSG_GS = ranksum(SI_IG,GI_IS)
% compare SI_DIG and GI_DIG
cSG_GG = ranksum(SI_IG,GI_IG)
% compare GI_DIS and GI_DIG
cGS_GG = ranksum(GI_IS,GI_IG)
