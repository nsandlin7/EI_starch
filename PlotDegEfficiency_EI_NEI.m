clear

GI_all = [33.81 0 35.12 33.065 27.51 11.24 31.845 27.53 32.095 33.39 81.945 32.44 28.57 29.86 35.45 12.56 29.545 10.6 12.665 18.45 18 21.25 20.535 22.23 12.24 20.115 8.665 19.555 8.96 2.25 14.68 7.825 16.61 32.585 36.28 1.115 18.565 26.925 41.895 4.995 29.505 4.765 4.885 9.51 28.105 20.095 6.975 5.77 10.6 13.015 32.375 19.73 3.14 29.99 4.98];
SI_all = [63.48 10.345 19.69 19.805 29.145 21.935 3.79 11.455 20.415 16.24 31.08 18.395 53.44 45.275 43.15 46.67 43.42 59.37 64.495 49.395 40.92 41.515 37.26 47.25 38.1];

SI_DIS = [63.48
10.345
19.69
19.805
29.145
21.935
3.79
11.455
20.415
16.24
31.08
18.395
53.44
59.37
64.495];
SI_DIG = [27.69
25.44
16.51
16.595
26.74
29.01
18.75
11.06
8.075
30.75
13.295
13.185
39.31
10.555
13.29];
GI_DIS = [46.575
39.88
39.135
38.835
31.785
28.355
32.58
30.745
34.015
33.425
83.96
35.015
19.15
72.175
38.37
];
GI_DIG = [33.81
0
35.12
33.065
27.51
11.24
31.845
27.53
32.095
33.39
81.945
32.44
28.57
29.86
35.45
];

%SI_DIG_n = [43.81 42.775 47.805 44.01 54.015 49.61 41.39 47.285 44.295 46.515 39.285 44.92];


jt = 0.1;
figure (7)
plot(1+jt*randn(1,length(SI_all)),SI_all,'b.','MarkerSize',16) % plot jittered data points
hold on
plot([1-jt, 1+jt], mean(SI_all)*[1,1],'k') % mark mean
plot(1, median(SI_all),'k^') % mark median
plot(2+jt*randn(1,length(SI_DIG)),SI_DIG,'b.','MarkerSize',16) % plot jittered data points
plot([2-jt, 2+jt], mean(SI_DIG)*[1,1],'k') % mark mean
plot(2, median(SI_DIG),'k^') % mark median
plot(3+jt*randn(1,length(GI_DIS)),GI_DIS,'r.','MarkerSize',16) % plot jittered data points
plot([3-jt, 3+jt], mean(GI_DIS)*[1,1],'k') % mark mean
plot(3, median(GI_DIS),'k^') % mark median
plot(4+jt*randn(1,length(GI_all)),GI_all,'r.','MarkerSize',16) % plot jittered data points
plot([4-jt, 4+jt], mean(GI_all)*[1,1],'k') % mark mean
plot(4, median(GI_all),'k^') % mark median
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'SI-DIS','SI-DIG','GI-DIS','GI-DIG'})
ylabel('Degradation efficiency (%)')
title('AFG_2 Degradation Efficiencies')
xlim([0 5])
ylim([0 100])

figure(2)
hold on
plot(SI_DIS, SI_DIG, 'b.', 'MarkerSize',16)
plot(GI_DIS, GI_DIG, 'r.', 'MarkerSize', 16)
x = linspace(0,100);
y = linspace(0,100);
plot(x, y, 'k--');
xlabel('Degradation efficiency in starch (%)')
ylabel('Degradation efficiency in glucose (%)')
xlim([0 100])
ylim([0 100])
legend('Starch Isolated', 'Glucose Isolated')
title('AFG_2 Degradation Efficiencies')
hold off


% compare SI_DIS and SI_DIG
pSS_SG = ranksum(SI_all,SI_DIG)
% compare SI_DIS and GI_DIS
pSS_GS = ranksum(SI_all,GI_DIS)
% compare SI_DIS and GI_DIG
pSS_GG = ranksum(SI_all,GI_all)
% compare SI_DIG and GI_DIS
pSG_GS = ranksum(SI_DIG,GI_DIS)
% compare SI_DIG and GI_DIG
pSG_GG = ranksum(SI_DIG,GI_all)
% compare GI_DIS and GI_DIG
pGS_GG = ranksum(GI_DIS,GI_all)

%% AFB1

SI_DISb = [43.095
29.58
30.69
34.67
43.705
9.32
32.17
23.895
21.055
32.24
38.8
25.015
49.02
49.52
38.88];
SI_DIGb = [22.055
18.555
20.835
26.15
30.945
13.595
16.48
18.805
17.255
20.475
22.685
16.815
53.405
28.09
33.03];
GI_DISb = [35.58
35.26
30.685
34.35
32.765
28.595
29.96
25
25.43
31.35
59.755
31.435
31.715
28.1
29.865];
GI_DIGb = [22.93
0
17.27
21.165
22.7
23.105
20.605
23.5
20.565
24.37
58.625
19.185
15.84
29.5
19.645];

jt = 0.1;
figure (3)
plot(1+jt*randn(1,length(SI_DISb)),SI_DISb,'b.','MarkerSize',16) % plot jittered data points
hold on
plot([1-jt, 1+jt], mean(SI_DISb)*[1,1],'k') % mark mean
plot(1, median(SI_DISb),'k^') % mark median
plot(2+jt*randn(1,length(SI_DIGb)),SI_DIGb,'b.','MarkerSize',16) % plot jittered data points
plot([2-jt, 2+jt], mean(SI_DIGb)*[1,1],'k') % mark mean
plot(2, median(SI_DIGb),'k^') % mark median
plot(3+jt*randn(1,length(GI_DISb)),GI_DISb,'r.','MarkerSize',16) % plot jittered data points
plot([3-jt, 3+jt], mean(GI_DISb)*[1,1],'k') % mark mean
plot(3, median(GI_DISb),'k^') % mark median
plot(4+jt*randn(1,length(GI_DIGb)),GI_DIGb,'r.','MarkerSize',16) % plot jittered data points
plot([4-jt, 4+jt], mean(GI_DIGb)*[1,1],'k') % mark mean
plot(4, median(GI_DIGb),'k^') % mark median
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'SI-DIS','SI-DIG','GI-DIS','GI-DIG'})
ylabel('Degradation efficiency (%)')
title('AFB_1 Degradation Efficiencies')
xlim([0 5])
ylim([0 100])

figure(4)
hold on
plot(SI_DISb, SI_DIGb, 'b.', 'MarkerSize',16)
plot(GI_DISb, GI_DIGb, 'r.', 'MarkerSize', 16)
x = linspace(0,100);
y = linspace(0,100);
plot(x, y, 'k--');
xlabel('Degradation efficiency in starch (%)')
ylabel('Degradation efficiency in glucose (%)')
xlim([0 100])
ylim([0 100])
legend('Starch Isolated', 'Glucose Isolated')
title('AFB_1 Degradation Efficiencies')
hold off
% 
% 
% compare SI_DIS and SI_DIG
pSS_SG = ranksum(SI_DISb,SI_DIGb)
% compare SI_DIS and GI_DIS
pSS_GS = ranksum(SI_DISb,GI_DISb)
% compare SI_DIS and GI_DIG
pSS_GG = ranksum(SI_DISb,GI_DIGb)
% compare SI_DIG and GI_DIS
pSG_GS = ranksum(SI_DIGb,GI_DISb)
% compare SI_DIG and GI_DIG
pSG_GG = ranksum(SI_DIGb,GI_DIGb)
% compare GI_DIS and GI_DIG
pGS_GG = ranksum(GI_DISb,GI_DIGb)

%% G2 vs B1

figure(5)
hold on
plot(SI_DIS, SI_DISb, 'b.', 'MarkerSize',16)
plot(SI_DIG, SI_DIGb, 'bx', 'MarkerSize', 12)
x = linspace(0,100);
y = linspace(0,100);
plot(x, y, 'k--');
xlabel('Degradation efficiency of AFG_2 (%)')
ylabel('Degradation efficiency of AFB_1 (%)')
xlim([0 100])
ylim([0 100])
legend('In Starch', 'In Glucose')
title('Starch Isolates')
hold off

figure(6)  
hold on
plot(GI_DIS, GI_DISb, 'r.', 'MarkerSize',16)
plot(GI_DIG, GI_DIGb, 'rx', 'MarkerSize', 12)
x = linspace(0,100);
y = linspace(0,100);
plot(x, y, 'k--');
xlabel('Degradation efficiency of AFG_2 (%)')
ylabel('Degradation efficiency of AFB_1 (%)')
xlim([0 100])
ylim([0 100])
legend('In Starch', 'In Glucose')
title('Glucose Isolates')
hold off