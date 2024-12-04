clear

%% AFG2

%Degradation efficiencies for starch isolates (16S seq) in starch
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
64.495
];

%Degradation efficiencies for starch isolates (16S seq) in glucose
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
13.29
];

%Degradation efficiencies for glucose isolates (16S seq) in starch
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

%Degradation efficiencies for glucose isolates (16S seq) in glucose
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

%Figure 3C
jt = 0.07;
xSI_DIS = 1+jt*randn(length(SI_DIS),1);
xSI_DIG = 2+jt*randn(length(SI_DIG),1);
xGI_DIS = 3+jt*randn(length(GI_DIS),1);
xGI_DIG = 4+jt*randn(length(GI_DIG),1);

%% Fig S1, AFG2
figure (17)
plot([xSI_DIS, xSI_DIG]',[SI_DIS, SI_DIG]','-','color',[0.5 0.5 0.5]) % plot jittered data points
hold on
plot(xSI_DIS,SI_DIS,'b.','MarkerSize',16) % plot jittered data points
plot([1-jt, 1+jt], mean(SI_DIS)*[1,1],'k') % mark mean
plot(1, median(SI_DIS),'k^') % mark median
plot(xSI_DIG,SI_DIG,'b.','MarkerSize',16) % plot jittered data points
plot([2-jt, 2+jt], mean(SI_DIG)*[1,1],'k') % mark mean
plot(2, median(SI_DIG),'k^') % mark median
plot([xGI_DIS, xGI_DIG]',[GI_DIS, GI_DIG]','-','color',[0.5 0.5 0.5]) % plot jittered data points
plot(xGI_DIS,GI_DIS,'r.','MarkerSize',16) % plot jittered data points
plot([3-jt, 3+jt], mean(GI_DIS)*[1,1],'k') % mark mean
plot(3, median(GI_DIS),'k^') % mark median
plot(xGI_DIG,GI_DIG,'r.','MarkerSize',16) % plot jittered data points
plot([4-jt, 4+jt], mean(GI_DIG)*[1,1],'k') % mark mean
plot(4, median(GI_DIG),'k^') % mark median
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'SI-DIS','SI-DIG','GI-DIS','GI-DIG'})
ylabel('Degradation efficiency (%)')
title('AFG_2 Degradation Efficiencies')
xlim([0 5])
ylim([0 100])

%Statistical analysis- Mann-Whitney
% compare SI_DIS and SI_DIG
pSS_SG = ranksum(SI_DIS,SI_DIG)
% compare SI_DIS and GI_DIS
pSS_GS = ranksum(SI_DIS,GI_DIS)
% compare SI_DIS and GI_DIG
pSS_GG = ranksum(SI_DIS,GI_DIG)
% compare SI_DIG and GI_DIS
pSG_GS = ranksum(SI_DIG,GI_DIS)
% compare SI_DIG and GI_DIG
pSG_GG = ranksum(SI_DIG,GI_DIG)
% compare GI_DIS and GI_DIG
pGS_GG = ranksum(GI_DIS,GI_DIG)

%% AFB1

%Degradation efficiencies for starch isolates (16S seq) in starch
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

%Degradation efficiencies for starch isolates (16S seq) in glucose
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

%Degradation efficiencies for glucose isolates (16S seq) in starch
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

%Degradation efficiencies for glucose isolates (16S seq) in glucose
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

%Statistical analysis- Mann-Whitney
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

%% Fig S1, AFB1
figure (12)
plot([xSI_DIS, xSI_DIG]',[SI_DISb, SI_DIGb]','-','color',[0.5 0.5 0.5]) % plot jittered data points
hold on
plot(xSI_DIS,SI_DISb,'b.','MarkerSize',16) % plot jittered data points
plot([1-jt, 1+jt], mean(SI_DIS)*[1,1],'k') % mark mean
plot(1, median(SI_DISb),'k^') % mark median
plot(xSI_DIG,SI_DIGb,'b.','MarkerSize',16) % plot jittered data points
plot([2-jt, 2+jt], mean(SI_DIGb)*[1,1],'k') % mark mean
plot(2, median(SI_DIGb),'k^') % mark median
plot([xGI_DIS, xGI_DIG]',[GI_DISb, GI_DIGb]','-','color',[0.5 0.5 0.5]) % plot jittered data points
plot(xGI_DIS,GI_DISb,'r.','MarkerSize',16) % plot jittered data points
plot([3-jt, 3+jt], mean(GI_DISb)*[1,1],'k') % mark mean
plot(3, median(GI_DISb),'k^') % mark median
plot(xGI_DIG,GI_DIGb,'r.','MarkerSize',16) % plot jittered data points
plot([4-jt, 4+jt], mean(GI_DIGb)*[1,1],'k') % mark mean
plot(4, median(GI_DIGb),'k^') % mark median
set(gca,'XTick',[1 2 3 4],'XTickLabel',{'SI-DIS','SI-DIG','GI-DIS','GI-DIG'})
ylabel('Degradation efficiency (%)')
title('AFB_1 Degradation Efficiencies')
xlim([0 5])
ylim([0 100])
