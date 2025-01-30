function heartRate = beatRate(data)
    % Load ECG Data
    try
        n20x = load(data); % Assumes .mat file
        dat = n20x.val;
    catch
        warning('Error loading file. Ensure the data file is a valid .mat file.');
        heartRate = NaN;
        return;
    end

    % Plot ECG Signal
    figure1 = figure;
    plot(dat);
    xlabel('Milliseconds');
    ylabel('Millivolts');
    title('ECG Signal');
    
    % Save Graph as Image
    saveas(figure1, 'graph.jpg');
    close(figure1); % Close figure after saving

    % Remove Trend from ECG Data
    detrendedECG = detrend(dat);

    % Identify Local Maxima (Peak Detection)
    ismax = islocalmax(detrendedECG, 'MinProminence', 0.9);
    maxIndices = find(ismax);

    % Compute Average Time Between Beats
    if length(maxIndices) < 2
        warning('Insufficient peaks detected. Heart rate calculation may be inaccurate.');
        heartRate = NaN;
        return;
    end

    msPerBeat = mean(diff(maxIndices));

    % Convert to Beats Per Minute (BPM)
    heartRate = (60 * 1000) / msPerBeat;

    % Display the result
    fprintf('Detected Heart Rate: %.1f BPM\n', heartRate);
end
