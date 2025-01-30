clear all;
clc;

% Get input data
data = input('Enter the dataset: ', 's');

% Calculate heart rate
hr = beatRate(data);

% Format the message
s = sprintf('The beat rate is %.1f BPM.', hr);

% Analyze heart rate condition
if hr < 60
    s2 = 'The heart rate is very low! Please take him/her to the doctor!';
elseif hr > 100
    s2 = 'The heart rate is very high! Please take him/her to the doctor!';
else
    s2 = 'The heart rate is normal';
end

% Save results to a text file
fid = fopen('record.txt', 'wt');
fprintf(fid, '%s\n%s', s, s2);
fclose(fid);

% Send email alert
sendEmail(hr);

% Open ECG report & Google Maps for hospitals
web('index.html', '-browser');
web('https://maps.google.co.in/maps?q=hospitals+near', '-browser');
