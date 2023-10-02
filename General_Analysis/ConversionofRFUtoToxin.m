clear

%This is for the conversion of RFU data into toxin concentration for AFG2

%Load saved file from GrowthRate_degradation
load('SI_new_GMM7_SMM7_08092023')

%Size of well matrix
q = 8;
v = 12;

%Matrix of zeros the size of well matrix and number of time reads
FLT1 = zeros(q,v,Nr);
FLT2 = zeros(q,v,Nr);

%AFG2 conversion
FLT1 = 24*(FL1- 71*ones(8,12,Nr))./(50448*ones(8,12,Nr) - FL1);

%AFB1 conversion
FLT2 = 63*(FL2- 477*ones(8,12,Nr))./(7480*ones(8,12,Nr) - FL2);

%Check of random read/time point
disp(FLT1(2,2,200))

%Saves the data in this file name, must change it each time
save('SI_new_GMM7_SMM7_RFUtoToxin')