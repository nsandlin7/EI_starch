clear

%All isolates degradation in screening medium
all_EI = [33.81 0 35.12 33.065 27.51 11.24 31.845 27.53 32.095 33.39 81.945 32.44 28.57 29.86 35.45 12.56 29.545 10.6 12.665 18.45 18 21.25 20.535 22.23 12.24 20.115 8.665 19.555 8.96 2.25 14.68 7.825 16.61 32.585 36.28 1.115 18.565 26.925 41.895 4.995 29.505 4.765 4.885 9.51 28.105 20.095 6.975 5.77 10.6 13.015 32.375 19.73 3.14 29.99 4.98 63.48 10.345 19.69 19.805 29.145 21.935 3.79 11.455 20.415 16.24 31.08 18.395 53.44 45.275 43.15 46.67 43.42 59.37 64.495 49.395 40.92 41.515 37.26 47.25 38.1];
%All isolates in glucose medium
GMM_all = [33.81 0 35.12 33.065 27.51 11.24 31.845 27.53 32.095 33.39 81.945 32.44 28.57 29.86 35.45 12.56 29.545 10.6 12.665 18.45 18 21.25 20.535 22.23 12.24 20.115 8.665 19.555 8.96 2.25 14.68 7.825 16.61 32.585 36.28 1.115 18.565 26.925 41.895 4.995 29.505 4.765 4.885 9.51 28.105 20.095 6.975 5.77 10.6 13.015 32.375 19.73 3.14 29.99 4.98 27.69 25.44 16.51 16.595 26.74 29.01 18.75 11.06 8.075 30.75 13.295 13.185];
%All isolates in starch medium
SMM_all = [63.48 10.345 19.69 19.805 29.145 21.935 3.79 11.455 20.415 16.24 31.08 18.395 53.44 45.275 43.15 46.67 43.42 59.37 64.495 49.395 40.92 41.515 37.26 47.25 38.1 46.575 39.88 39.135 38.835 31.785 28.355 32.58 30.745 34.015 33.425 83.96 35.015 19.15 72.175 38.37];
%All glucose isolates in glucose
GMM_GI = [33.81 0 35.12 33.065 27.51 11.24 31.845 27.53 32.095 33.39 81.945 32.44 28.57 29.86 35.45 12.56 29.545 10.6 12.665 18.45 18 21.25 20.535 22.23 12.24 20.115 8.665 19.555 8.96 2.25 14.68 7.825 16.61 32.585 36.28 1.115 18.565 26.925 41.895 4.995 29.505 4.765 4.885 9.51 28.105 20.095 6.975 5.77 10.6 13.015 32.375 19.73 3.14 29.99 4.98];
%All starch isolates in starch
SMM_SI = [63.48 10.345 19.69 19.805 29.145 21.935 3.79 11.455 20.415 16.24 31.08 18.395 53.44 45.275 43.15 46.67 43.42 59.37 64.495 49.395 40.92 41.515 37.26 47.25 38.1];

figure
histogram(all_EI)
title('All EI strains in selection medium')

figure
histogram(GMM_all,10)
title('ALL EI strains in GMM7')

figure
histogram(SMM_all,10)
title('All EI strains in SMM7')

figure
histogram(GMM_GI,10)
title('All GI strains in GMM7')

figure
histogram(SMM_SI,10)
title('All SI strains in SMM7')


x = table([54;21],[1;4],'VariableNames',{'None/Poor','Good'},'RowNames',{'GI','SI'})
[h,p,stats] = fishertest(x)

%Figure for comparison between outcome of glucose and starch isolations
SI_good = (4/25)*100; %percent of isolates that grew on selection medium and degrade
SI_low = (21/25)*100;
GI_good = (1/55)*100;
GI_low = (54/55)*100;
X = categorical({'Starch Isolated','Glucose Isolated'});
b = [SI_good SI_low; GI_good GI_low];

figure(6)
hold on
bar(X,b);
ylabel('Isolates (%)')
ylim([0 100])
hold off

save('All_DegEff_fisher')