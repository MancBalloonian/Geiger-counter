%% Clear Workspace

clearvars;
close all;

%% readind the data file

[timestamp, cps, cpm, uSv_hr] = readingData('geiger_data.csv');

%% read date time

DAT = datetime(timestamp, 'InputFormat', ' dd/MM/yyyy HH:mm');
% extract the hours, minutes and seconds from the datetime array
[hh,mm,ss] = hms(DAT);

% converts the date-time into hours
time = hh+mm/60+ss/3600;
time(isnan(time))= 14.416;
timeCalibrated = time - time(1);

%% Plot Results
    
figure(1)
plot(timeCalibrated, cpm, 'b--.')
xlabel('Time (hrs)', 'Fontsize', 12); xlim([1.2, 2.8])
ylabel('CPM', 'Fontsize', 12)

%% Figures
figure(2)
plot(timeCalibrated,cps, 'g--.')
xlabel('Time (hrs)', 'Fontsize', 12); xlim([1.2, 2.8])
ylabel('CPS', 'Fontsize', 12)

figure(3)
plot(timeCalibrated,uSv_hr, 'r--.')
xlabel('Time (hrs)', 'Fontsize', 12); xlim([1.2, 2.8])
ylabel('\mu Sv/{hr}', 'Fontsize', 12)
