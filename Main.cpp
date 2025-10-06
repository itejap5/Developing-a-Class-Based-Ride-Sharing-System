#include <iostream>
#include <vector>
#include <string>
#include <memory>
#include <iomanip>
using namespace std;

// ---------- Base Class ----------
class Ride {
protected:
    int rideID;
    string pickupLocation;
    string dropoffLocation;
    double distance;
    double fareAmount;

public:
    Ride(int id, string pickup, string dropoff, double dist)
        : rideID(id), pickupLocation(pickup), dropoffLocation(dropoff), distance(dist) {
        if (dist < 0) throw invalid_argument("Distance cannot be negative.");
        fareAmount = 0.0;
    }

    virtual ~Ride() = default;

    virtual double calculateFare() const = 0;
    virtual string rideType() const = 0;

    double fare() {
        fareAmount = calculateFare();
        return fareAmount;
    }

    virtual void rideDetails() {
        cout << "Ride ID: " << rideID << "\n"
             << "Pickup: " << pickupLocation << "\n"
             << "Dropoff: " << dropoffLocation << "\n"
             << "Distance: " << distance << " miles\n"
             << "Fare: $" << fixed << setprecision(2) << fare() << "\n---\n";
    }
};

// ---------- Derived Classes ----------
class StandardRide : public Ride {
public:
    StandardRide(int id, string pickup, string dropoff, double dist)
        : Ride(id, pickup, dropoff, dist) {}

    double calculateFare() const override { return distance * 2.0; }

    string rideType() const override { return "Standard"; }

    void rideDetails() override {
        cout << "=== STANDARD RIDE ===\n";
        Ride::rideDetails();
    }
};

class PremiumRide : public Ride {
public:
    PremiumRide(int id, string pickup, string dropoff, double dist)
        : Ride(id, pickup, dropoff, dist) {}

    double calculateFare() const override { return distance * 3.5; }

    string rideType() const override { return "Premium"; }

    void rideDetails() override {
        cout << "=== PREMIUM RIDE ===\n";
        Ride::rideDetails();
    }
};

// ---------- Driver Class ----------
class Driver {
private:
    int driverID;
    string name;
    double rating;
    vector<shared_ptr<Ride>> assignedRides;

public:
    Driver(int id, string n, double r) : driverID(id), name(n), rating(r) {
        if (rating < 0 || rating > 5) rating = 5.0;
    }

    void addRide(shared_ptr<Ride> ride) { assignedRides.push_back(ride); }

    void getDriverInfo() const {
        cout << "=== DRIVER INFO ===\n"
             << "Driver ID: " << driverID << "\n"
             << "Name: " << name << "\n"
             << "Rating: " << fixed << setprecision(1) << rating << " stars\n"
             << "Total Rides: " << assignedRides.size() << "\n---\n";
    }

    void showAllRides() const {
        cout << "Rides for Driver: " << name << "\n";
        for (auto& r : assignedRides)
            r->rideDetails();
    }
};

// ---------- Rider Class ----------
class Rider {
private:
    int riderID;
    string name;
    vector<shared_ptr<Ride>> requestedRides;

public:
    Rider(int id, string n) : riderID(id), name(n) {}

    void requestRide(shared_ptr<Ride> ride) { requestedRides.push_back(ride); }

    void viewRides() const {
        cout << "=== RIDER INFO ===\n"
             << "Rider ID: " << riderID << "\n"
             << "Name: " << name << "\n"
             << "Total Rides Requested: " << requestedRides.size() << "\n---\n";
        cout << "RIDE HISTORY:\n";
        for (auto& r : requestedRides)
            r->rideDetails();
    }
};

// ---------- Main Program ----------
int main() {
    cout << "====================================\n";
    cout << "RIDE SHARING SYSTEM DEMONSTRATION\n";
    cout << "Demonstrating OOP Principles:\n";
    cout << "1. Encapsulation\n";
    cout << "2. Inheritance\n";
    cout << "3. Polymorphism\n";
    cout << "====================================\n\n";

    cout << "--- Creating Rides ---\n";

    auto ride1 = make_shared<StandardRide>(101, "123 Main St", "456 Oak Ave", 5);
    auto ride2 = make_shared<PremiumRide>(102, "789 Elm St", "321 Pine Rd", 10);
    auto ride3 = make_shared<StandardRide>(103, "Airport Terminal", "Downtown Hotel", 15);

    cout << "\n--- POLYMORPHISM DEMONSTRATION ---\n";
    cout << "Different ride types in same collection:\n\n";

    vector<shared_ptr<Ride>> rides = {ride1, ride2, ride3};
    double totalFare = 0;

    for (auto& r : rides)
        r->rideDetails(), totalFare += r->fare();

    cout << "Total Fare (Polymorphic Calculation): $" << fixed << setprecision(2) << totalFare << "\n\n";

    cout << "--- ENCAPSULATION DEMONSTRATION ---\n";
    cout << "Driver class with private assignedRides:\n\n";

    Driver driver1(1001, "John Smith", 4.8);
    driver1.addRide(ride1);
    driver1.addRide(ride3);
    driver1.getDriverInfo();

    cout << "\n";
    Driver driver2(1002, "Sarah Johnson", 4.9);
    driver2.addRide(ride2);
    driver2.getDriverInfo();

    cout << "\n--- Rider class with private requestedRides:\n\n";
    Rider rider1(2001, "Michael Chen");
    rider1.requestRide(ride1);
    rider1.requestRide(ride2);
    rider1.viewRides();

    cout << "\n====================================\n";
    cout << "INHERITANCE DEMONSTRATION\n";
    cout << "====================================\n\n";
    cout << "StandardRide inherits from Ride:\n"
         << "  - Base fare rate: $2/mile\n"
         << "  - 5 mile ride = $" << fixed << setprecision(2) << ride1->fare() << "\n\n";
    cout << "PremiumRide inherits from Ride:\n"
         << "  - Premium fare rate: $3.5/mile\n"
         << "  - 10 mile ride = $" << fixed << setprecision(2) << ride2->fare() << "\n\n";

    cout << "====================================\n";
    cout << "DEMONSTRATION COMPLETE\n";
    cout << "====================================\n";

    return 0;
}