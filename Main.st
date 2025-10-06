| ride1 ride2 ride3 driver1 driver2 rider1 rides totalFare |

Transcript show: '===================================='; cr.
Transcript show: 'RIDE SHARING SYSTEM DEMONSTRATION'; cr.
Transcript show: 'Demonstrating OOP Principles:'; cr.
Transcript show: '1. Encapsulation'; cr.
Transcript show: '2. Inheritance'; cr.
Transcript show: '3. Polymorphism'; cr.
Transcript show: '===================================='; cr; cr.

Transcript show: '--- Creating Rides ---'; cr.

ride1 := StandardRide new.
ride1 rideID: 101.
ride1 pickupLocation: '123 Main St'.
ride1 dropoffLocation: '456 Oak Ave'.
ride1 distance: 5.

ride2 := PremiumRide new.
ride2 rideID: 102.
ride2 pickupLocation: '789 Elm St'.
ride2 dropoffLocation: '321 Pine Rd'.
ride2 distance: 10.

ride3 := StandardRide new.
ride3 rideID: 103.
ride3 pickupLocation: 'Airport Terminal'.
ride3 dropoffLocation: 'Downtown Hotel'.
ride3 distance: 15.

Transcript cr.
Transcript show: '--- POLYMORPHISM DEMONSTRATION ---'; cr.
Transcript show: 'Different ride types in same collection:'; cr; cr.

rides := Array with: ride1 with: ride2 with: ride3.

totalFare := 0.
rides do: [ :ride |
    ride rideDetails.
    totalFare := totalFare + ride fare.
].

Transcript show: 'Total Fare (Polymorphic Calculation): $', totalFare printString; cr; cr.

Transcript show: '--- ENCAPSULATION DEMONSTRATION ---'; cr.
Transcript show: 'Driver class with private assignedRides:'; cr; cr.

driver1 := Driver new.
driver1 driverID: 1001.
driver1 name: 'John Smith'.
driver1 rating: 4.8.

driver1 addRide: ride1.
driver1 addRide: ride3.
driver1 getDriverInfo.

Transcript cr.

driver2 := Driver new.
driver2 driverID: 1002.
driver2 name: 'Sarah Johnson'.
driver2 rating: 4.9.

driver2 addRide: ride2.
driver2 getDriverInfo.

Transcript cr.
Transcript show: '--- Rider class with private requestedRides:'; cr; cr.

rider1 := Rider new.
rider1 riderID: 2001.
rider1 name: 'Michael Chen'.

rider1 requestRide: ride1.
rider1 requestRide: ride2.

rider1 viewRides.

Transcript cr.
Transcript show: '===================================='; cr.
Transcript show: 'INHERITANCE DEMONSTRATION'; cr.
Transcript show: '===================================='; cr; cr.

Transcript show: 'StandardRide inherits from Ride:'; cr.
Transcript show: '  - Base fare rate: $2/mile'; cr.
Transcript show: '  - 5 mile ride = $', (ride1 fare) printString; cr; cr.

Transcript show: 'PremiumRide inherits from Ride:'; cr.
Transcript show: '  - Premium fare rate: $3.5/mile'; cr.
Transcript show: '  - 10 mile ride = $', (ride2 fare) printString; cr; cr.

Transcript show: '===================================='; cr.
Transcript show: 'DEMONSTRATION COMPLETE'; cr.
Transcript show: '===================================='; cr.
