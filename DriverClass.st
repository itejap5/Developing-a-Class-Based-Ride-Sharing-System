Object subclass: Driver [
    | driverID name rating assignedRides |
    
    Driver class >> new [
        ^ super new initialize
    ]
    
    initialize [
        driverID := 0.
        name := ''.
        rating := 5.0.
        assignedRides := OrderedCollection new.
        ^ self
    ]
    
    driverID: id [
        driverID := id
    ]
    
    driverID [
        ^ driverID
    ]
    
    name: driverName [
        name := driverName
    ]
    
    name [
        ^ name
    ]
    
    rating: driverRating [
        rating := driverRating
    ]
    
    rating [
        ^ rating
    ]
    
    addRide: ride [
        assignedRides add: ride
    ]
    
    getDriverInfo [
        Transcript show: '=== DRIVER INFO ==='; cr.
        Transcript show: 'Driver ID: ', driverID printString; cr.
        Transcript show: 'Name: ', name; cr.
        Transcript show: 'Rating: ', rating printString, ' stars'; cr.
        Transcript show: 'Total Rides: ', assignedRides size printString; cr.
        Transcript show: '---'; cr.
    ]
    
    showAllRides [
        Transcript show: 'Rides for Driver: ', name; cr.
        assignedRides do: [ :ride |
            ride rideDetails
        ]
    ]
]
