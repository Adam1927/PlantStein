/****************************************************************************
  Code base on "MQTT Exmple for SeeedStudio Wio Terminal".
  Author: Salman Faris
  Source: https://www.hackster.io/Salmanfarisvp/mqtt-on-wio-terminal-4ea8f8
*****************************************************************************/

#include <rpcWiFi.h>
#include "WiFi.h"
#include"TFT_eSPI.h"
#include <PubSubClient.h>

const char* ssid = SSID; // WiFi Name
const char* password = PASSWORD;  // WiFi Password
const char* mqtt_server = my_IPv4;

TFT_eSPI tft;
WiFiClient wioClient;
PubSubClient client(wioClient);
long lastMsg = 0;
char moistureMsg[50];
char lightMsg[50];
int value = 0;

int moisturePin = A0;
int lightPin = A1;
int moistureValue = 0;
int lightValue = 0;

void setup_wifi() {

  delay(10);

  tft.setTextSize(2);
  tft.setCursor((320 - tft.textWidth("Connecting to Wi-Fi..")) / 2, 120);
  tft.print("Connecting to Wi-Fi..");

  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password); // Connecting WiFi

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");

  tft.fillScreen(TFT_BLACK);
  tft.setCursor((320 - tft.textWidth("Connected!")) / 2, 120);
  tft.print("Connected!");

  Serial.println("IP address: ");
  Serial.println(WiFi.localIP()); // Display Local IP Address

}

void callback(char* topic, byte* payload, unsigned int length) {
  //tft.fillScreen(TFT_BLACK);
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");
  char buff_p[length];
  for (int i = 0; i < length; i++) {
    Serial.print((char)payload[i]);
    buff_p[i] = (char)payload[i];
  }
  Serial.println();
  buff_p[length] = '\0';
  String msg_p = String(buff_p);
  tft.fillScreen(TFT_BLACK);
  tft.setCursor((320 - tft.textWidth("MQTT Message")) / 2, 90);
  tft.print("MQTT Message: " );
  tft.setCursor((320 - tft.textWidth(msg_p)) / 2, 120);
  tft.print(msg_p); // Print recieved payload

}

void reconnect() {
  // Loop until we're reconnected
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    // Create a random client ID
    String clientId = "WioTerminal-";
    clientId += String(random(0xffff), HEX);
    // Attempt to connect
    if (client.connect(clientId.c_str())) {
      Serial.println("connected");
      // Once connected, publish an announcement...
      client.publish("SensorData", "hello world");
      // ... and resubscribe
      client.subscribe("NotificationData");
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

void setup() {

  tft.begin();
  tft.fillScreen(TFT_BLACK);
  tft.setRotation(3);


  Serial.println();
  Serial.begin(115200);
  setup_wifi();
  client.setServer(mqtt_server, 1883); // Connect the MQTT Server
  client.setCallback(callback);
}

void loop() {

  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  long now = millis();
  if (now - lastMsg > 2000) {
    lastMsg = now;

    moistureValue = analogRead(moisturePin);
    lightValue = analogRead(lightPin);

    snprintf (moistureMsg, 50, "Moisture: %ld", moistureValue);
    snprintf (lightMsg, 50, "Light: %ld", lightValue);
    Serial.println(moistureMsg);
    client.publish("SensorData", moistureMsg);
    Serial.println(lightMsg);
    client.publish("SensorData", lightMsg);

    tft.fillScreen(TFT_BLACK);
    tft.setCursor(0, 60);
    tft.print(moistureMsg);
    tft.setCursor(0, 180);
    tft.print(lightMsg);
  }
}
