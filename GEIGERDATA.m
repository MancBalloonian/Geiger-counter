%% Clear Workspace

clearvars;
close all;

%% readind the data file

[timestamp, cps, cpm, uSv_hr] = readingData('geiger_data.csv');
[time2, lat, long, altitude, verticalSpeed, speed, heading, sat, temp, battery, current] = readingAllData('all_data.csv');

%% read date time

DAT = datetime(timestamp, 'InputFormat', ' dd/MM/yyyy HH:mm');
DAT2 = datetime(time2, 'InputFormat', ' HH:mm:ss');

% extract the calibrated time (HH:mm:ss) from the datetime array
[time_gData, ~] = outputDateTime(DAT, false);
[time_allData, startPt] = outputDateTime(DAT2, true);
[time_allData2, ~] = outputDateTime(DAT2, false);
%% Plot Results
    
figure(1);
set(gcf, 'Position', [10 10 900 600])
subplot(2, 2, 1);
plot(time_gData, cpm, 'b--.')
xlabel('Time (hrs)', 'Fontsize', 12); xlim([1.2, 2.8])
ylabel('CPM', 'Fontsize', 12)
title('CPM vs Flight time')

subplot(2, 2, 2);
plot(time_gData,cps, 'g--.')
xlabel('Time (hrs)', 'Fontsize', 12); xlim([1.2, 2.8])
ylabel('CPS', 'Fontsize', 12)
title('CPS vs Flight time')

subplot(2, 2, 3);
plot(time_gData,uSv_hr, 'r--.')
xlabel('Time (hrs)', 'Fontsize', 12); xlim([1.2, 2.8])
ylabel('\mu Sv/hr', 'Fontsize', 12)
title('\mu Sv/hr vs Flight time')

%% some more plots
geigerStopPt = 1.8;

% finds the indicies of the interesting points
[idx1] = findIndex(time_gData, geigerStopPt);
[idx2] = findIndex(time_allData, geigerStopPt);

figure(2);
set(gcf, 'Position', [10 10 900 600])
subplot(2, 2, 1);
plot(time_gData(1:idx1), cpm(1:idx1), 'b--.'); hold;
plot(time_gData(idx1:end), cpm(idx1:end), 'r--.'); hold;
xlabel('Time (hrs)', 'Fontsize', 12); xlim([1.2, 2.8])
ylabel('CPM', 'Fontsize', 12)
title('CPM vs Flight time')

% selecting the cutting off index where the geiger stops taking data
subplot(2, 2, 2);
altitude_new = altitude(startPt:end);
plot(time_allData, altitude_new, 'bx'); hold;
plot(time_allData(idx2:end), altitude_new(idx2:end), 'rx'); hold;
xlabel('Time (hrs)', 'Fontsize', 12); xlim([1.2, 2.8])
ylabel('Altitude (m)', 'Fontsize', 12)
legend('Ascent', 'Descent')
title('Altitude vs Flight time')

subplot(2, 2, 3);
temp_new = temp(startPt:end);
plot(time_allData, temp_new, 'bx'); hold;
plot(time_allData(idx2:end), temp_new(idx2:end), 'rx'); hold;
xlabel('Time (hrs)', 'Fontsize', 12);  xlim([1.2, 2.8])
ylabel('Temperature (Cel)', 'Fontsize', 12)
legend('Ascent', 'Descent')
title('Temperature vs Flight time')

subplot(2, 2, 4);
speed_new = speed(startPt:end);
plot(time_allData, speed_new, 'bx'); hold;
plot(time_allData(idx2:end), speed_new(idx2:end), 'rx'); hold;
xlabel('Time (hrs)', 'Fontsize', 12);  xlim([1.2, 2.8])
ylabel('Speed (m/s)', 'Fontsize', 12)
legend('Ascent', 'Descent')
title('Speed vs Flight time')
%% reads in all the other data

figure(3);
