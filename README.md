# plant stein - Group 11

<img src="logo.png" width="60%">

## How to run this project

- Start the backend server
- Copy frontend/.env.example to frontend/.env and set 'SERVER' to your local IP (which is logged by the server)
- Use flutter run or your IDE to start the app
- The flutter app should automatically add some test data. Plant #1 will be the plant the microcontroller sends data to.
- If you wish to emulate the microcontroller, use e.g. `mosquitto_pub -h localhost -m "{\"brightness\":700.0,\"temperature\":22,\"humidity\":70.0,\"moisture\":200.0}" -t "timeseries/1"` to publish mocked sensor data

## Team Information

- Adam Faundez Laurokari
- Fernando Ramiro Medina Mercado
- Michael König
- Parisa Babaei
- Sofia Serbina
- Anna Mäkinen
