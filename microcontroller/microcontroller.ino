/****************************************************************************
  Code base on "MQTT Exmple for SeeedStudio Wio Terminal".
  Author: Salman Faris
  Source: https://www.hackster.io/Salmanfarisvp/mqtt-on-wio-terminal-4ea8f8
*****************************************************************************/

#include <rpcWiFi.h>
#include "WiFi.h"
#include "TFT_eSPI.h"
#include <PubSubClient.h>
#include "DHT.h"
#include <string.h>

#define DHTTYPE DHT11
#define DHTPIN D3
DHT dht(DHTPIN, DHTTYPE); 


const char* ssid = SSID; // WiFi Name
const char* password = PASSWORD;  // WiFi Password
const char* mqtt_server = my_IPv4;

TFT_eSPI tft;
WiFiClient wioClient;
PubSubClient client(wioClient);
long lastMsg = 0;
char moistureMsg[50];
char lightMsg[50];
char humidityMsg[50];
char tempMsg[50];
char moisturePublish[50];
char lightPublish[50];
char humidityPublish[50];
char tempPublish[50];


int moisturePin = A0;
int lightPin = A1;
int ledPin = D1;
int speakerPin = D2;
int humidityTempPin = D3;
int moistureValue = 0;
int lightValue = 0;
int ledValue = 0;
int speakerValue = 0;
float humidityValue = 0;
float tempValue = 0;

#if defined(ARDUINO_ARCH_AVR)
    #define debug  Serial

#elif defined(ARDUINO_ARCH_SAMD) ||  defined(ARDUINO_ARCH_SAM)
    #define debug  SerialUSB
#else
    #define debug  Serial
#endif


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

  Wire.begin();
  pinMode(humidityTempPin, INPUT);
  digitalWrite(humidityTempPin, 1);
  dht.begin();

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
    humidityValue = dht.readHumidity();
    tempValue = dht.readTemperature();
    
    snprintf (moistureMsg, 50, "Moisture: %ld", moistureValue);
    snprintf (lightMsg, 50, "Light: %ld", lightValue);
    snprintf (humidityMsg, 50, "Humidity: %.2f %%", humidityValue);
    snprintf (tempMsg, 50, "Temperature: %.2f \*C", tempValue);

    snprintf (moisturePublish, 50, "%ld", moistureValue);
    snprintf (lightPublish, 50, "%ld", lightValue);
    snprintf (humidityPublish, 50, "%f", humidityValue);
    snprintf (tempPublish, 50, "%f", tempValue);

    Serial.println(moistureMsg);
    Serial.println(lightMsg);
    Serial.println(humidityMsg);
    Serial.println(tempMsg);

    client.publish("moisture", moisturePublish);
    client.publish("light", lightPublish);
    client.publish("humidity", humidityPublish);
    client.publish("temperature", tempPublish);

    tft.fillScreen(TFT_BLACK);
    tft.setCursor(0, 48);
    tft.print(moistureMsg);
    tft.setCursor(0, 96);
    tft.print(lightMsg);
    tft.setCursor(0, 144);
    tft.print(humidityMsg);
    tft.setCursor(0, 192);
    tft.print(tempMsg);
  }
}
