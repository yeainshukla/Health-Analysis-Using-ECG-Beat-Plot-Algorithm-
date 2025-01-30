function sendEmail(hr)
    clc;

    % Sender & Receiver Information
    source = 'nikhilbharadwaj0@gmail.com'; % Replace with your email
    destination = 'ut261998@gmail.com'; % Replace with recipient's email
    myEmailPassword = 'YOUR_APP_PASSWORD'; % Replace with a secure App Password

    % Email Subject & Message
    subj = 'Important Heart Rate Alert';
    msg = sprintf('The heart rate of your dear one is at %.1f BPM which is abnormal.\n\n%s\n%s', ...
                  hr, 'Please click on the link to check the nearest hospitals:', ...
                  'https://maps.google.co.in/maps?q=hospitals+near');

    % Set up SMTP service for Gmail
    setpref('Internet', 'E_mail', source);
    setpref('Internet', 'SMTP_Server', 'smtp.gmail.com');
    setpref('Internet', 'SMTP_Username', source);
    setpref('Internet', 'SMTP_Password', myEmailPassword);

    % Gmail Server Properties
    props = java.lang.System.getProperties;
    props.setProperty('mail.smtp.auth', 'true');
    props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
    props.setProperty('mail.smtp.socketFactory.port', '465');

    % Send the Email
    try
        sendmail(destination, subj, msg);
        disp('✅ Email Sent Successfully!');
    catch ME
        disp('❌ Error Sending Email:');
        disp(ME.message);
    end

    % [Optional] Remove SMTP Preferences for Privacy
    setpref('Internet', 'E_mail', '');
    setpref('Internet', 'SMTP_Server', '');
    setpref('Internet', 'SMTP_Username', '');
    setpref('Internet', 'SMTP_Password', '');
end
