#!/usr/bin/env python3

import re
import sys
from typing import Dict, List, Any, Optional

class SmalltalkObject:
    def __init__(self):
        self.instance_vars = {}
    
    def get_var(self, name):
        return self.instance_vars.get(name)
    
    def set_var(self, name, value):
        self.instance_vars[name] = value

class Ride(SmalltalkObject):
    def __init__(self):
        super().__init__()
        self.instance_vars = {
            'rideID': 0,
            'pickupLocation': '',
            'dropoffLocation': '',
            'distance': 0,
            'fare': 0
        }
    
    def rideID_set(self, value):
        self.instance_vars['rideID'] = value
    
    def rideID(self):
        return self.instance_vars['rideID']
    
    def pickupLocation_set(self, value):
        self.instance_vars['pickupLocation'] = value
    
    def pickupLocation(self):
        return self.instance_vars['pickupLocation']
    
    def dropoffLocation_set(self, value):
        self.instance_vars['dropoffLocation'] = value
    
    def dropoffLocation(self):
        return self.instance_vars['dropoffLocation']
    
    def distance_set(self, value):
        self.instance_vars['distance'] = value
    
    def distance(self):
        return self.instance_vars['distance']
    
    def fare(self):
        self.instance_vars['fare'] = self.calculateFare()
        return self.instance_vars['fare']
    
    def calculateFare(self):
        return self.instance_vars['distance'] * 2
    
    def rideDetails(self):
        print(f"Ride ID: {self.instance_vars['rideID']}")
        print(f"Pickup: {self.instance_vars['pickupLocation']}")
        print(f"Dropoff: {self.instance_vars['dropoffLocation']}")
        print(f"Distance: {self.instance_vars['distance']} miles")
        print(f"Fare: ${self.fare()}")
        print("---")

class StandardRide(Ride):
    def calculateFare(self):
        return self.instance_vars['distance'] * 2
    
    def rideDetails(self):
        print("=== STANDARD RIDE ===")
        super().rideDetails()

class PremiumRide(Ride):
    def calculateFare(self):
        return self.instance_vars['distance'] * 3.5
    
    def rideDetails(self):
        print("=== PREMIUM RIDE ===")
        super().rideDetails()

class Driver(SmalltalkObject):
    def __init__(self):
        super().__init__()
        self.instance_vars = {
            'driverID': 0,
            'name': '',
            'rating': 5.0,
            'assignedRides': []
        }
    
    def driverID_set(self, value):
        self.instance_vars['driverID'] = value
    
    def driverID(self):
        return self.instance_vars['driverID']
    
    def name_set(self, value):
        self.instance_vars['name'] = value
    
    def name(self):
        return self.instance_vars['name']
    
    def rating_set(self, value):
        self.instance_vars['rating'] = value
    
    def rating(self):
        return self.instance_vars['rating']
    
    def addRide(self, ride):
        self.instance_vars['assignedRides'].append(ride)
    
    def getDriverInfo(self):
        print("=== DRIVER INFO ===")
        print(f"Driver ID: {self.instance_vars['driverID']}")
        print(f"Name: {self.instance_vars['name']}")
        print(f"Rating: {self.instance_vars['rating']} stars")
        print(f"Total Rides: {len(self.instance_vars['assignedRides'])}")
        print("---")
    
    def showAllRides(self):
        print(f"Rides for Driver: {self.instance_vars['name']}")
        for ride in self.instance_vars['assignedRides']:
            ride.rideDetails()

class Rider(SmalltalkObject):
    def __init__(self):
        super().__init__()
        self.instance_vars = {
            'riderID': 0,
            'name': '',
            'requestedRides': []
        }
    
    def riderID_set(self, value):
        self.instance_vars['riderID'] = value
    
    def riderID(self):
        return self.instance_vars['riderID']
    
    def name_set(self, value):
        self.instance_vars['name'] = value
    
    def name(self):
        return self.instance_vars['name']
    
    def requestRide(self, ride):
        self.instance_vars['requestedRides'].append(ride)
    
    def viewRides(self):
        print("=== RIDER INFO ===")
        print(f"Rider ID: {self.instance_vars['riderID']}")
        print(f"Name: {self.instance_vars['name']}")
        print(f"Total Rides Requested: {len(self.instance_vars['requestedRides'])}")
        print("---")
        print("RIDE HISTORY:")
        for ride in self.instance_vars['requestedRides']:
            ride.rideDetails()

def run_main_program():
    print("====================================")
    print("RIDE SHARING SYSTEM DEMONSTRATION")
    print("Demonstrating OOP Principles:")
    print("1. Encapsulation")
    print("2. Inheritance")
    print("3. Polymorphism")
    print("====================================")
    print()
    
    print("--- Creating Rides ---")
    
    ride1 = StandardRide()
    ride1.rideID_set(101)
    ride1.pickupLocation_set('123 Main St')
    ride1.dropoffLocation_set('456 Oak Ave')
    ride1.distance_set(5)
    
    ride2 = PremiumRide()
    ride2.rideID_set(102)
    ride2.pickupLocation_set('789 Elm St')
    ride2.dropoffLocation_set('321 Pine Rd')
    ride2.distance_set(10)
    
    ride3 = StandardRide()
    ride3.rideID_set(103)
    ride3.pickupLocation_set('Airport Terminal')
    ride3.dropoffLocation_set('Downtown Hotel')
    ride3.distance_set(15)
    
    print()
    print("--- POLYMORPHISM DEMONSTRATION ---")
    print("Different ride types in same collection:")
    print()
    
    rides = [ride1, ride2, ride3]
    
    totalFare = 0
    for ride in rides:
        ride.rideDetails()
        totalFare += ride.fare()
    
    print(f"Total Fare (Polymorphic Calculation): ${totalFare}")
    print()
    
    print("--- ENCAPSULATION DEMONSTRATION ---")
    print("Driver class with private assignedRides:")
    print()
    
    driver1 = Driver()
    driver1.driverID_set(1001)
    driver1.name_set('John Smith')
    driver1.rating_set(4.8)
    
    driver1.addRide(ride1)
    driver1.addRide(ride3)
    driver1.getDriverInfo()
    
    print()
    
    driver2 = Driver()
    driver2.driverID_set(1002)
    driver2.name_set('Sarah Johnson')
    driver2.rating_set(4.9)
    
    driver2.addRide(ride2)
    driver2.getDriverInfo()
    
    print()
    print("--- Rider class with private requestedRides:")
    print()
    
    rider1 = Rider()
    rider1.riderID_set(2001)
    rider1.name_set('Michael Chen')
    
    rider1.requestRide(ride1)
    rider1.requestRide(ride2)
    
    rider1.viewRides()
    
    print()
    print("====================================")
    print("INHERITANCE DEMONSTRATION")
    print("====================================")
    print()
    
    print("StandardRide inherits from Ride:")
    print("  - Base fare rate: $2/mile")
    print(f"  - 5 mile ride = ${ride1.fare()}")
    print()
    
    print("PremiumRide inherits from Ride:")
    print("  - Premium fare rate: $3.5/mile")
    print(f"  - 10 mile ride = ${ride2.fare()}")
    print()
    
    print("====================================")
    print("DEMONSTRATION COMPLETE")
    print("====================================")

if __name__ == "__main__":
    run_main_program()
