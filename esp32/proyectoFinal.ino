#include <WiFi.h>
#include <HTTPClient.h>

const char* ssid = "NOMBRE_RED";  
const char* password = "CONTRASEÑA_RED"; 
const char* serverUrl = "URL_SERVIDOR_INSERTAR_DATOS"; 

int analogPin = 32;  // Usar el pin 34 como entrada analógica (sensor de humo)
int digitalPins[] = {25, 26, 27, analogPin};  // Agregar analogPin al arreglo

// int analogPin = 32;  // Usar el pin 32 como entrada analógica (sensor de humo)
// int digitalPins[] = {25, 26, 27, analogPin};  // Agregar analogPin al arreglo
//Pasillo1: 34 el de humo y movimiento 33
//Pasillo2: 32 el de humo y movimiento 25

void setup() {
  Serial.begin(115200);

  for (int i = 0; i < 4; i++) {  // Cambiar a 4 para incluir el pin analógico
    if (digitalPins[i] == analogPin) {
      pinMode(analogPin, INPUT);
    } else {
      pinMode(digitalPins[i], INPUT);
    }
    
  }

  Serial.println("Iniciando...");

  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Conectando a la red Wi-Fi...");
  }

  Serial.println("Conectado a la red Wi-Fi.");
}

void loop() {
  if (WiFi.status() == WL_CONNECTED) {
    String mac = WiFi.macAddress();
    HTTPClient http;

    for (int i = 0; i < 4; i++) {  // Cambiar a 4 para incluir el pin analógico
      int value;
      if (digitalPins[i] == analogPin) {
        value = analogRead(analogPin);  // Leer valor analógico del pin 12
      } else {
        value = digitalRead(digitalPins[i]);
      }

      Serial.print("Valor del sensor en pin ");
      Serial.print(digitalPins[i]);
      Serial.print(": ");
      Serial.println(value);

      String postData = "mac=" + mac + "&sensor=" + String(digitalPins[i]) + "&valor=" + String(value);

      Serial.println("Enviando datos al servidor...");
      Serial.println("Datos a enviar: " + postData);

      http.begin(serverUrl);
      http.addHeader("Content-Type", "application/x-www-form-urlencoded");

      int httpResponseCode = http.POST(postData);

      if (httpResponseCode > 0) {
        Serial.println("Datos enviados exitosamente al servidor.");
        Serial.println(httpResponseCode);
      } else {
        Serial.print("Error en la solicitud HTTP. Código de respuesta: ");
        Serial.println(httpResponseCode);
      }

      http.end();
      delay(1000);
    }
  } else {
    Serial.println("Desconectado de la red Wi-Fi.");
  }

  delay(40000);
}