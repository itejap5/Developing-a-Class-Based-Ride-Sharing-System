Object subclass: Ride [
    | rideID pickupLocation dropoffLocation distance fare |
    
    Ride class >> new [
        ^ super new initialize
    ]
    
    initialize [
        rideID := 0.
        pickupLocation := ''.
        dropoffLocation := ''.
        distance := 0.
        fare := 0.
        ^ self
    ]
    
    rideID: id [
        rideID := id
    ]
    
    rideID [
        ^ rideID
    ]
    
    pickupLocation: location [
        pickupLocation := location
    ]
    
    pickupLocation [
        ^ pickupLocation
    ]
    
    dropoffLocation: location [
        dropoffLocation := location
    ]
    
    dropoffLocation [
        ^ dropoffLocation
    ]
    
    distance: dist [
        distance := dist
    ]
    
    distance [
        ^ distance
    ]
    
    fare [
        fare := self calculateFare.
        ^ fare
    ]
    
    calculateFare [
        ^ distance * 2
    ]
    
    rideDetails [
        Transcript show: 'Ride ID: ', rideID printString; cr.
        Transcript show: 'Pickup: ', pickupLocation; cr.
        Transcript show: 'Dropoff: ', dropoffLocation; cr.
        Transcript show: 'Distance: ', distance printString, ' miles'; cr.
        Transcript show: 'Fare: $', self fare printString; cr.
        Transcript show: '---'; cr.
    ]
]

Ride subclass: StandardRide [
    
    calculateFare [
        ^ distance * 2
    ]
    
    rideDetails [
        Transcript show: '=== STANDARD RIDE ==='; cr.
        super rideDetails.
    ]
]

Ride subclass: PremiumRide [
    
    calculateFare [
        ^ distance * 3.5
    ]
    
    rideDetails [
        Transcript show: '=== PREMIUM RIDE ==='; cr.
        super rideDetails.
    ]
]
