Health Analysis Using ECG Beat Plot Algorithm
🚀 ESP8266-based ECG Monitoring & MQTT Cloud Integration

📌 Project Overview
This project enables real-time ECG monitoring using an ESP8266 microcontroller. It reads ECG signals, processes the data, and uploads it to Ubidots via MQTT. Additionally, it includes MATLAB scripts for ECG beat rate analysis, email alerts for abnormal readings, and a web dashboard for visualization.

🎯 Features
✅ Real-time ECG Data Processing (ESP8266)
✅ MQTT-based Cloud Integration (Ubidots API)
✅ ECG Beat Rate Analysis (MATLAB)
✅ Automated Email Alerts (MATLAB)
✅ Web Dashboard for Visualization (HTML, CSS)

🔧 Setup Instructions
1️⃣ Hardware Requirements
ESP8266 NodeMCU (WiFi-enabled microcontroller)
ECG Sensor (AD8232 / Equivalent)
Jumper Wires & Breadboard
Laptop with MATLAB Installed
2️⃣ ESP8266 Firmware Setup
🔹 Install Required Arduino Libraries
Open Arduino IDE
Go to Sketch → Include Library → Manage Libraries
Install:
ESP8266WiFi
PubSubClient
Restart Arduino IDE.
🔹 Configure ESP8266 in Arduino IDE
Tools → Board → Select "NodeMCU 1.0 (ESP-12E Module)"
Tools → Port → Select your ESP8266's COM Port
Upload ecg_mqtt.ino to the ESP8266.
3️⃣ MATLAB Script Setup
Open MATLAB
Navigate to the MATLAB_Scripts/ folder
Run:

hr = beatRate('ecg_data.mat');
To send an email alert for abnormal readings:

sendEmail(hr);
4️⃣ Web Dashboard Setup
Open index.html in a browser.
ECG signal visualization & reports will be displayed.
Clicking "Nearest Heart Hospitals" redirects to Google Maps.
📡 MQTT Cloud Integration (Ubidots)
This project uploads ECG sensor data to Ubidots IoT Platform using MQTT Protocol.

🔹 Steps to Connect to Ubidots
Create a Ubidots Account → https://industrial.ubidots.com
Generate an API Token (found in API Credentials)
Update secrets.h with:

#define TOKEN "your_ubidots_token"
Restart ESP8266, and data should appear on Ubidots Dashboard.
🚨 Troubleshooting
ESP8266 Not Connecting to WiFi?
Check if WiFi SSID & Password in secrets.h are correct.
Ensure 2.4GHz WiFi (ESP8266 doesn't support 5GHz).
MATLAB Errors?
Ensure ecg_data.mat exists in the MATLAB directory.
Check if sendmail is configured for Gmail (see Gmail SMTP Setup).
Web Dashboard Not Updating?
Ensure graph.jpg is generated in MATLAB.
Refresh the index.html page.
📜 License
This project is licensed under the MIT License.

💡 Future Improvements
🚀 Real-time ECG Graph using JavaScript (D3.js)
📱 Mobile App for ECG Alerts
🔬 Advanced AI-based ECG Analysis

👨‍💻 Contributors
Yeain Shukla (@yeainshukla)
Nikhil Bharadwaj
Saharsh Agarwal
Utkarsh Gandhi
📢 Have Questions or Feedback?
Feel free to open an Issue or Pull Request! 😊🚀