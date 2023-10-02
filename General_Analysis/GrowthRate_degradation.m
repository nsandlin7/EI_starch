%% This code is used for growth rate and OD analysis of a 96-well plate
%This version - Sam Dyckman (Modified from lab) 
%Last updated: 7/16/2018 
%**This is a work in progress to get a fully annotated code for new members
%of lab to easily understand what each line of the code does**

%% Clearing any previously saved information
%Always begin a code with clear so it does not have stored information from
%other codes which could mislead you about this code.
clear

%% Opening the Text File with Plate Reader Data
%Tell the code where to look for your text file. 
%For example "Z:\Members\Deno\Experiments\Plate Reader\*.*"
%Z is the home drive
%If this is for a mac the slashes need to be reversed and Z has a different
%name, Ex. "/Volumes/home/Members/Sam/"
%For PC
[infile,inpath] = uigetfile('Z:\Members\Natalie\2023\Experiments\*.*');

%For Mac
%[infile,inpath] = uigetfile('/Volumes/home/Members/Sam/Experiments/Plate Reader/Dilution Ratio Experiments/*.*');

fid = fopen(strcat(inpath,infile),'r');
%% Declaring Variables/Matrix
%In Matlab, like other coding languages, you must declare what variables are 
%ch is being declared as an empty string
%(String = letters, numerals, punctuation marks or combo there of)
%Then n, N, and Nr are declared as numbers. 
ch = '';

n = 0;
%Maximum number of time points to be collected from the protocol
N = 577;
%max time from text file (if it was stopped early) 
%Note: Nr CANNOT excede N
Nr = 577; 

tp = 5;
dt = 5/60;
tf = 48;

%Creates a matrix of zeros to keep track of the reads 
Rd = zeros(1,Nr);
%Cretes a matrix that will store the 96-well plate OD600 data over time
%8 = rows 12 = collumns Nr = time
OD6 = zeros(8,12,Nr);
FL1 = zeros(8,12,Nr);
FL2 = zeros(8,12,Nr);

%% Reading the Text file
%Reads the text file
ch = fscanf(fid,'%s',1);

%This next section reads through the first part of the text file, which is
%useful for us (settings/date/protocol) but not necessarily useful for the
%Matlab code in reading the data. This section of the code is used to get
%the Matlab code to the beginning of the data

%Examining your text file for the first use of the word "Temperature"
%This has the code systematically check each word/number to determine if it
%matches "Temperature" If it does not, it moves to the next word/number.
%One-by-one examing the text file. 
while strcmp(ch,'Temperature')==0
    ch = fscanf(fid,'%s',1);
end

%Examining your text file for the word Time (same as before)
while strcmp(ch,'Time')==0
    ch = fscanf(fid,'%s',1);
end 

%% Recording the Plate Reader Data

%This is a While loop so it says,
%"While this is true, do the commands in the loop"
%"When this is false, move to the next part of the code."
%This loop specifically says, While n is less than Nr perform the actions in the loop. 
%Note: n is incremented each loop so it goes up by one so the code will 
%Eventually exit the loop. Otherwise the code gets stuck in an infinite loop.
%Infinite loops mean the code will never continue - you will have to force
%stop the code.  (ctr+c for PC)

while n < Nr
    %This next line increments n each time it goes through the loop
    n = n+1;
    %This adds information to the nth entry into the Rd matrix (read
    %matrix)
    Rd(n) = fscanf(fid,'%i',1);
    
    %This step records the time stamp and stores it in "Time"
    Ts = fscanf(fid,'%s',1);
    Time(n,1:length(Ts)-2) = Ts(2:length(Ts)-1);
    
    %The number at the end indicates how many words/number to skip to
    %get back to the data. In this case: 3
    %If this is confusing, read it along side the text file to understand
    %how to get back to the next line of data. 
    ch = fscanf(fid,'%s',3);
    %This says skip 13 words/numbers while reading through the file
    ch = fscanf(fid,'%s',13);
    
    %This reads the OD of the plate i = rows j = columns n = time
    for i = 1:8
        for j = 1:12
            OD6(i,j,n) = str2double(fscanf(fid,'%s',1));
        end
        
        %This says skip 3 words/numbers while reading through the file
        ch = fscanf(fid,'%s',4); 
    end
    % skips to the next set of data
    ch = fscanf(fid,'%s',3); 
end

%% For Plate Reader Data that ends prematurely and has another type of Read
%This says - skip the empty matrices and get to the next set of data such
%as fluorescence data
for ndump = Nr+1:N,
    %The number at the end indicates how many words/number to skip to
        %get back to the data In this case: 44
    ch = fscanf(fid,'%s',53);
end

while strcmp(ch,'Time')==0
    ch = fscanf(fid,'%s',1);
end
n = 0;
while n < Nr,
    %This next line increments n each time it goes through the loop
    n = n+1;
    %This adds information to the nth entry into the Rd matrix (read
    %matrix)
    Rd(n) = fscanf(fid,'%i',1);
    
    %This step records the time stamp and stores it in "Time"
    Ts = fscanf(fid,'%s',1);
    Time(n,1:length(Ts)-2) = Ts(2:length(Ts)-1);
    
    %The number at the end indicates how many words/number to skip to
    %get back to the data. In this case: 3
    %If this is confusing, read it along side the text file to understand
    %how to get back to the next line of data. 
    ch = fscanf(fid,'%s',3);
    %This says skip 13 words/numbers while reading through the file
    ch = fscanf(fid,'%s',13);
    
    %This reads the OD of the plate i = rows j = collumns n = time
    for i = 1:8
        for j = 1:12
            FL1(i,j,n) = str2double(fscanf(fid,'%s',1));
        end
        
        %This says skip 3 words/numbers while reading through the file
        ch = fscanf(fid,'%s',4); 
    end
    % skips to the next set of data
    ch = fscanf(fid,'%s',3); 
end


%This says - skip the empty matrices and get to the next set of data such
%as fluorescence data
% for ndump = Nr+1:N,
%     %The number at the end indicates how many words/number to skip to
%         %get back to the data In this case: 44
%     ch = fscanf(fid,'%s',44);
% end

while strcmp(ch,'Time')==0
    ch = fscanf(fid,'%s',1);
end
n = 0;
while n < Nr,
    %This next line increments n each time it goes through the loop
    n = n+1;
    %This adds information to the nth entry into the Rd matrix (read
    %matrix)
    Rd(n) = fscanf(fid,'%i',1);
    
    %This step records the time stamp and stores it in "Time"
    Ts = fscanf(fid,'%s',1);
    Time(n,1:length(Ts)-2) = Ts(2:length(Ts)-1);
    
    %The number at the end indicates how many words/number to skip to
    %get back to the data. In this case: 3
    %If this is confusing, read it along side the text file to understand
    %how to get back to the next line of data. 
    ch = fscanf(fid,'%s',3);
    %This says skip 13 words/numbers while reading through the file
    ch = fscanf(fid,'%s',13);
    
    %This reads the OD of the plate i = rows j = collumns n = time
    for i = 1:8
        for j = 1:12
            FL2(i,j,n) = str2double(fscanf(fid,'%s',1));
        end
        
        %This says skip 3 words/numbers while reading through the file
        ch = fscanf(fid,'%s',4); 
    end
    % skips to the next set of data
    ch = fscanf(fid,'%s',3); 
end


%% Growth Rates
% timepoints(tp), lv = lower value, uv = upper value
%Makes a matrix of zeros the size of a 96 well plate. That will store
%growth rates
rng = 2:5;
r = zeros(8,12);
for q = 2:7
    for v = 2:11
        %u = higher threshold for OD
        %l = lower threshold for OD where it crosses "5e-3"
        [mm, lv(q,v)] = min(abs((shiftdim(OD6(q,v,1:Nr)- mean (OD6(q,v,rng))-(1e-2),2)))); %lower range to start analysis
        if max(OD6(q,v,1:Nr)- mean(OD6(q,v,rng)))<0.1 %if MAX OD doesn't get to 0.1 then it shifts lower what range to look at
            uv(q,v) = min(abs((shiftdim(OD6(q,v,1:Nr)- mean (OD6(q,v,rng))-(3e-2),2))));
        else
            [mm uv(q,v)] = find((shiftdim(OD6(q,v,1:Nr)- mean (OD6(q,v,rng))-(15e-2),1))>0,1);
        end
        %Growth Rate
        estpoly = polyfit(tp*(lv(q,v):uv(q,v))/60,log(shiftdim(OD6(q,v,lv(q,v):uv(q,v))- mean(OD6(q,v,rng)),1)),1);%analyzes data
        r(q,v) = estpoly(1);
    end
end 
% Shows the growth rates in the Command Window
disp(r)

%Finds max OD for carrying capacity
m = zeros(8,12);
for q = 1:8
    for v = 2:11
        m(q,v) = max(OD6(q,v,1:Nr) - mean(OD6(q,v,rng)));
    end
end
disp(m)

ch = fscanf(fid,'%s',1);
disp(ch)

ch=fclose(fid);

%Saves the data in this file name, must change it each time
save('SI_new_GMM7_SMM7_08092023')
