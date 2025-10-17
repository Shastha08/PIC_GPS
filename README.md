
# 🛰️ GPS Location Display using PIC16F877A, NEO-7M, and 16x2 LCD

This project demonstrates how to interface a **NEO-7M GPS module** with a **PIC16F877A microcontroller** to display real-time **latitude and longitude** coordinates on a **16x2 LCD**. It parses NMEA sentences from the GPS module and extracts the `$GPRMC` data to show the current GPS location.

## 📌 Features

- UART communication with NEO-7M GPS module
- NMEA sentence parsing (specifically `$GPRMC`)
- Displays latitude and longitude on a 16x2 LCD
- Simple LCD interface using 8-bit mode
- GPS fix and data ready indicators using LEDs

## 🧰 Hardware Used

- PIC16F877A Microcontroller  
- NEO-7M GPS Module  
- 16x2 LCD Display (HD44780 compatible)  
- 20 MHz Crystal Oscillator  
- Capacitors, Resistors, Breadboard or PCB  
- 5V Power Supply

## 🔌 Pin Connections

| Component | PIC Pin | Description            |
|-----------|---------|------------------------|
| GPS TX    | RC7     | UART RX                |
| LCD RS    | RC0     | LCD Register Select    |
| LCD EN    | RC1     | LCD Enable             |
| LCD D0-D7 | PORTB   | LCD Data Lines         |
| RD0       | Output  | GPS Fix Indicator LED  |
| RD1       | Output  | Data Ready Indicator   |

## 🧠 Code Overview

- Initializes UART at 9600 baud
- Waits for the `$GPRMC` sentence from GPS
- Extracts latitude and longitude fields
- Displays them on the LCD with labels
- Uses LEDs to indicate GPS fix and data readiness

## 📄 Sample Output on LCD

```
1234.5678 LAT
0987.6543 LON
```

## 🛠️ How to Use

1. Connect the GPS module to the PIC as per the pin mapping.
2. Flash the code using MPLAB or MikroC.
3. Power the circuit and wait for GPS fix.
4. Latitude and Longitude will be displayed on the LCD.

## 📁 Files Included

- `main.c` – Source code for PIC (MPLAB XC8 or MikroC)
- `README.md` – Project overview and instructions
![WhatsApp Image 2025-10-17 at 12 51 15 PM](https://github.com/user-attachments/assets/b696c2dd-d134-49b3-8391-8c20e705b6ab)
![WhatsApp Image 2025-10-17 at 12 51 17 PM](https://github.com/user-attachments/assets/17a5bd78-280f-4b07-a03b-b6ebebc36846)
<img width="1240" height="863" alt="Screenshot (264)" src="https://github.com/user-attachments/assets/cd3afd5f-8c90-414d-b69c-99f270f80938" />


