# Developing a Class-Based Ride Sharing System

This project shows how to build a small **Ride Sharing System** using Object-Oriented Programming (OOP) in **C++** and **Smalltalk**.  
It demonstrates three main OOP ideas: **Encapsulation, Inheritance, and Polymorphism**, through simple class examples like Ride, Driver, and Rider.

---

## Overview

The project includes two implementations:

1. **C++ version** – console program (`Main.cpp`)
2. **Smalltalk version** – `.st` files executed through a Smalltalk interpreter (`smalltalk_interpreter.py` and `smalltalk_runner.py`)

Both versions create a few sample rides, drivers, and riders.  
The output shows how each language applies the three OOP principles.

---

## Features

- **Encapsulation**  
  Each class has private variables that are accessed only through specific methods.

- **Inheritance**  
  `StandardRide` and `PremiumRide` classes extend a base `Ride` class and reuse its code.

- **Polymorphism**  
  Different ride types calculate fares differently, but they can be stored and used together in one list.

---

## Files Included

| File | Description |
|------|--------------|
| `Main.cpp` | C++ implementation of the Ride Sharing System |
| `RideClass.st`, `DriverClass.st`, `RiderClass.st`, `Main.st` | Smalltalk classes and main script |
| `smalltalk_interpreter.py` | Parses and runs Smalltalk files |
| `smalltalk_runner.py` | Simpler runtime demonstration for Smalltalk |
| `replit.md` | Notes about the Replit Smalltalk environment |
| `README.md` | This document |

---

## How It Works

### In **C++**
1. The `Ride` class defines shared properties (rideID, pickup, dropoff, distance).  
2. `StandardRide` and `PremiumRide` inherit from `Ride` and override the `fare()` function.  
3. `Driver` and `Rider` classes hold their own rides and information.  
4. The `main()` function creates objects and prints details to show polymorphism.

Run with:
```bash
g++ Main.cpp -o rides
./rides
```

### In **Smalltalk**

1. The .st files define the same classes as in C++.
2. RideClass.st defines the base class.
3. StandardRide and PremiumRide override calculateFare.
4. Main.st runs a demo to show encapsulation, inheritance, and polymorphism.

Run with:
```bash
python3 smalltalk_interpreter.py
```

---

## Example Output
```
Ride Details (Polymorphism Demo):
[Ride#1 Standard] A -> B, 3.2 mi, Fare: $6.80
[Ride#2 Premium] C -> D, 5.0 mi, Fare: $16.00

Driver D101 - Sam (4.8★)
Assigned rides: 2
Total earnings: $23.80

Rider U501 - Mia
Requested rides:
[Ride#2 Premium] C -> D, 5.0 mi, Fare: $16.00
```

The Smalltalk output shows similar results in text format with class headers.

---

## Author

- Developed by **Teja Pavan Kumar Ponneboyina**
- For Assignment 5: Developing a Class-Based Ride Sharing System
- (October 2025)
