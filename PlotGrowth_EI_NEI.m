clear

%% Growth rate

SI_GIS = [0.13505 0.50865 0.67235 0.64915 0.70645 1.5358 0.4395 1.1042 1.00745 0.27445 1.0992 0.9286];
SI_GIG = [0.16555 0.1128 0.64185 0.9193 0.6091 1.06505 0.38515 0.88655 0.821 0.30035 0.68825 0.6363];
GI_GIS = [0.86545 0.4216 1.0467 0.94565 1.1768 0.8025 1.019 0.4165 0.8653 0.82175 0.40215 1.2984 0.29075 0.44915 0.49845];
GI_GIG = [1.03025 0 0.47945 0.85765 1.0691 0.2827 1.1723 1.1061 1.08285 0.8214 0.3058 1.2232 1.20885 0.4865 0.4937];

jt = 0.1;
figure (1)
plot(1+jt*randn(1,length(SI_GIS)),SI_GIS,'b.','MarkerSize',16) % plot jittered data points
hold on
plot([1-jt, 1+jt], mean(SI_GIS)*[1,1],'k') % mark mean
plot(1, median(SI_GIS),'k^') % mark median
plot(2+jt*randn(1,length(SI_GIG)),SI_GIG,'b.','MarkerSize',16) % plot jittered data points
plot([2-jt, 2+jt], mean(SI_GIG)*[1,1],'k') % mark mean
plot(2, median(SI_GIG),'k^') % mark median
plot(3+jt*randn(1,length(GI_GIS)),GI_GIS,'r.','MarkerSize',16) % plot jittered data points
plot([3-jt, 3+jt], mean(GI_GIS)*[1,1],'k') % mark mean
plot(3, median(GI_GIS),'k^') % mark median
plot(4+jt*randn(1,length(GI_GIG)),GI_GIG,'r.','MarkerSize',16) % plot jittered data points
plot([4-jt, 4+jt], mean(GI_GIG)*[1,1],'k') % mark mean
plot(4, median(GI_GIG),'k^') % mark median
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'SI-DIS','SI-DIG','GI-DIS','GI-DIG'})
ylabel('Growth rate')
xlim([0 5])
ylim([0 2])

figure(2)
hold on
plot(SI_GIS, SI_GIG, 'b.', 'MarkerSize',16)
plot(GI_GIS, GI_GIG, 'r.', 'MarkerSize', 16)
x = linspace(0,100);
y = linspace(0,100);
plot(x, y, 'k--');
xlabel('Growth rate in starch')
ylabel('Growth rate in glucose')
xlim([0 2])
ylim([0 2])
legend('Starch Isolated', 'Glucose Isolated')
hold off


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

SI_IS = [1.3151 1.2649 1.3858 1.4498 1.1636 1.344 1.2378 1.55535 1.443 0.33125 1.392 1.35865];
SI_IG = [0.996 1.07315 1.4699 1.4685 1.55325 1.60685 1.3794 1.5371 1.4935 1.02125 1.4034 1.33975];
GI_IS = [0.7465 0.35625 0.9284 0.54625 0.602 0.676 0.60225 0.626 0.62425 0.70135 0.61635 0.67555 0.48075 0.28315 0.4055];
GI_IG = [1.2139 0.0005 0.97615 1.129 1.298 0.2709 1.29985 1.1604 1.28755 1.2725 1.272 1.28135 1.293 1.332 1.13015];

jt = 0.1;
figure (3)
plot(1+jt*randn(1,length(SI_IS)),SI_IS,'b.','MarkerSize',16) % plot jittered data points
hold on
plot([1-jt, 1+jt], mean(SI_IS)*[1,1],'k') % mark mean
plot(1, median(SI_IS),'k^') % mark median
plot(2+jt*randn(1,length(SI_IG)),SI_IG,'b.','MarkerSize',16) % plot jittered data points
plot([2-jt, 2+jt], mean(SI_IG)*[1,1],'k') % mark mean
plot(2, median(SI_IG),'k^') % mark median
plot(3+jt*randn(1,length(GI_IS)),GI_IS,'r.','MarkerSize',16) % plot jittered data points
plot([3-jt, 3+jt], mean(GI_IS)*[1,1],'k') % mark mean
plot(3, median(GI_IS),'k^') % mark median
plot(4+jt*randn(1,length(GI_IG)),GI_IG,'r.','MarkerSize',16) % plot jittered data points
plot([4-jt, 4+jt], mean(GI_IG)*[1,1],'k') % mark mean
plot(4, median(GI_IG),'k^') % mark median
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'SI-DIS','SI-DIG','GI-DIS','GI-DIG'})
ylabel('Carrying capacity (OD 600)')
xlim([0 5])
ylim([0 2])

figure(4)
hold on
plot(SI_IS, SI_IG, 'b.', 'MarkerSize',16)
plot(GI_IS, GI_IG, 'r.', 'MarkerSize', 16)
x = linspace(0,100);
y = linspace(0,100);
plot(x, y, 'k--');
xlabel('Carrying capacity in starch')
ylabel('Carrying capacity in glucose')
xlim([0 2])
ylim([0 2])
legend('Starch Isolated', 'Glucose Isolated')
hold off


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


%% Growth vs degradation

SI_DIS = [99.00 49.795 57.895 56.03 60.32 21.935 50.85 46.32 45.205 43.14 55.93 50.835];
SI_DIG = [56.26 53.44 32.755 28.22 36.45 38.865 40.11 31.39 27.245 54.23 20.225 25.29];
GI_DIS = [48.555 40.275 40.125 39.445 30.755 25.31 31.69 29.28 33.33 32.64 99.545 34.525 16.585 75.245 39.045];
GI_DIG = [32.23 0 34.395 30.96 20.71 8.695 29.095 21.305 29.39 31.185 99.52 28.74 21.01 24.635 34.6];

figure(5)
hold on
plot(SI_IS, SI_DIS, 'b.', 'MarkerSize',16)
plot(SI_IG, SI_DIG, 'bx', 'MarkerSize', 12)
x = linspace(0,100);
y = linspace(0,100);
%plot(x, y, 'k--');
xlabel('Carrying capacity')
ylabel('Degradation efficiency (%)')
xlim([0 1.8])
ylim([0 100])
legend('In Starch', 'In Glucose')
title('Starch isolated strains')
hold off

figure(6)
hold on
plot(GI_IS, GI_DIS, 'r.', 'MarkerSize',16)
plot(GI_IG, GI_DIG, 'rx', 'MarkerSize', 12)
x = linspace(0,100);
y = linspace(0,100);
%plot(x, y, 'k--');
xlabel('Carrying capacity')
ylabel('Degradation efficiency (%)')
xlim([0 1.8])
ylim([0 100])
legend('In Starch', 'In Glucose')
title('Glucose isolated strains')
hold off

figure(7)
hold on
plot(SI_GIS, SI_DIS, 'b.', 'MarkerSize',16)
plot(SI_GIG, SI_DIG, 'bx', 'MarkerSize', 12)
x = linspace(0,100);
y = linspace(0,100);
%plot(x, y, 'k--');
xlabel('Growth rate')
ylabel('Degradation efficiency (%)')
xlim([0 1.8])
ylim([0 100])
legend('In Starch', 'In Glucose')
title('Starch isolated strains')
hold off

figure(8)
hold on
plot(GI_GIS, GI_DIS, 'r.', 'MarkerSize',16)
plot(GI_GIG, GI_DIG, 'rx', 'MarkerSize', 12)
x = linspace(0,100);
y = linspace(0,100);
%plot(x, y, 'k--');
xlabel('Growth rate')
ylabel('Degradation efficiency (%)')
xlim([0 1.8])
ylim([0 100])
legend('In Starch', 'In Glucose')
title('Glucose isolated strains')
hold off