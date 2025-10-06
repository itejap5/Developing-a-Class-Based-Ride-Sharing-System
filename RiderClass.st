Object subclass: Rider [
    | riderID name requestedRides |
    
    Rider class >> new [
        ^ super new initialize
    ]
    
    initialize [
        riderID := 0.
        name := ''.
        requestedRides := OrderedCollection new.
        ^ self
    ]
    
    riderID: id [
        riderID := id
    ]
    
    riderID [
        ^ riderID
    ]
    
    name: riderName [
        name := riderName
    ]
    
    name [
        ^ name
    ]
    
    requestRide: ride [
        requestedRides add: ride
    ]
    
    viewRides [
        Transcript show: '=== RIDER INFO ==='; cr.
        Transcript show: 'Rider ID: ', riderID printString; cr.
        Transcript show: 'Name: ', name; cr.
        Transcript show: 'Total Rides Requested: ', requestedRides size printString; cr.
        Transcript show: '---'; cr.
        Transcript show: 'RIDE HISTORY:'; cr.
        requestedRides do: [ :ride |
            ride rideDetails
        ]
    ]
]
