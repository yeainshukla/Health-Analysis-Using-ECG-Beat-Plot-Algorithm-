#ifndef SECRETS_H
#define SECRETS_H

#define WIFISSID "your_wifi_ssid"
#define PASSWORD "your_wifi_password"
#define TOKEN "your_ubidots_token"
#define MQTT_CLIENT_NAME "ecgbeatplot"

#endif
#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include "secrets.h" // Import WiFi & Token credentials

// Define Constants
#define VARIABLE_LABEL "sensor"  // Ubidots variable label
#define DEVICE_LABEL "esp8266"   // Ubidots device label
#define SENSOR A0                // Sensor pin

// MQTT Broker Details
const char* mqttBroker = "industrial.api.ubidots.com";
char topic[150]; 
char payload[100]; 
char str_sensor[10];

WiFiClient ubidots;
PubSubClient client(ubidots);

// Callback function for MQTT messages
void callback(char* topic, byte* payload, unsigned int length) {
    Serial.print("Message received on topic: ");
    Serial.println(topic);
    Serial.print("Message: ");
    
    for (int i = 0; i < length; i++) {
        Serial.print((char)payload[i]);
    }
    Serial.println();
}

// Reconnect to MQTT broker
void reconnect() {
    while (!client.connected()) {
        Serial.println("Attempting MQTT connection...");
        if (client.connect(MQTT_CLIENT_NAME, TOKEN, "")) {
            Serial.println("✅ Connected to MQTT Broker");
        } else {
            Serial.print("❌ Failed, rc=");
            Serial.print(client.state());
            Serial.println(" → Retrying in 2 seconds...");
            delay(2000);
        }
    }
}

// Setup function
void setup() {
    Serial.begin(115200);

    // Connect to WiFi
    WiFi.begin(WIFISSID, PASSWORD);
    Serial.print("Connecting to WiFi...");
    
    while (WiFi.status() != WL_CONNECTED) {
        Serial.print(".");
        delay(500);
    }

    Serial.println("\n✅ WiFi Connected");
    Serial.print("IP Address: ");
    Serial.println(WiFi.localIP());

    // Connect to MQTT broker
    client.setServer(mqttBroker, 1883);
    client.setCallback(callback);
}

// Main Loop
void loop() {
    if (!client.connected()) {
        reconnect();
    }

    // Prepare the topic
    snprintf(topic, sizeof(topic), "/v1.6/devices/%s", DEVICE_LABEL);

    // Read Sensor Data
    float sensorValue = analogRead(SENSOR);
    dtostrf(sensorValue, 4, 2, str_sensor);

    // Create Payload
    snprintf(payload, sizeof(payload), "{\"%s\": {\"value\": %s}}", VARIABLE_LABEL, str_sensor);

    // Publish Data
    Serial.println("📡 Sending data to Ubidots...");
    Serial.println(payload);
    client.publish(topic, payload);

    client.loop();
    delay(500);
}
