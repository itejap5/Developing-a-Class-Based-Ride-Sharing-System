# Ride Sharing System - Smalltalk Interpreter

## Overview

This project is a **Smalltalk-to-Python interpreter** designed to parse and execute Smalltalk code for a ride-sharing system. The interpreter reads `.st` files containing Smalltalk class definitions and methods, then executes them within a Python runtime environment. The system translates Smalltalk's object-oriented constructs (classes, methods, instance variables) into Python equivalents, allowing Smalltalk code to run in a Python environment.

The primary use case is to demonstrate **three core OOP principles** (Encapsulation, Inheritance, Polymorphism) using a ride-sharing domain model written in Smalltalk, featuring entities like rides, drivers, and riders.

### Current Implementation (October 2025)

The system successfully demonstrates all three OOP principles:

1. **ENCAPSULATION**: Private instance variables accessed only through defined methods
   - Ride class: rideID, pickupLocation, dropoffLocation, distance, fare
   - Driver class: driverID, name, rating, assignedRides (private collection)
   - Rider class: riderID, name, requestedRides (private collection)

2. **INHERITANCE**: Class hierarchy with subclasses extending base class
   - Base class: Ride
   - Subclasses: StandardRide, PremiumRide
   - Subclasses inherit all methods and instance variables from Ride

3. **POLYMORPHISM**: Different ride types override calculateFare() method
   - StandardRide: $2 per mile
   - PremiumRide: $3.5 per mile
   - Collection holds mixed types, fare() calls work uniformly
   - Total fare calculated polymorphically: $75.0 (demonstrating different types in same collection)

## User Preferences

Preferred communication style: Simple, everyday language.

## System Architecture

### Core Design Pattern: Interpreter Pattern

The system implements the **Interpreter pattern** to parse and execute Smalltalk code. The architecture separates parsing logic from execution logic:

**Problem**: Need to execute Smalltalk code (a language different from Python) within a Python environment.

**Solution**: Build a custom interpreter that:
1. Parses Smalltalk syntax from `.st` files
2. Constructs Python representations of Smalltalk classes and methods
3. Executes Smalltalk methods by translating them to Python operations at runtime

**Alternatives considered**: 
- Using an existing Smalltalk VM (rejected due to complexity and integration challenges)
- Full transpilation to Python (rejected to maintain runtime flexibility)

**Pros**: Flexible, allows dynamic method execution, maintains Smalltalk semantics
**Cons**: Performance overhead compared to native Python, requires manual syntax parsing

### Class Hierarchy Management

**SmalltalkClass**: Represents Smalltalk class definitions with support for:
- Class name and superclass relationships
- Instance variable declarations
- Method storage and lookup through class hierarchy
- Method resolution that walks up the inheritance chain

**SmalltalkMethod**: Encapsulates parsed method definitions with:
- Method selector (name)
- Parameter list
- Method body (Smalltalk code as string)
- Reference to owning class

**SmalltalkObject**: Base runtime object providing:
- Instance variable storage via dictionary
- Generic getters/setters for instance variables
- Foundation for domain-specific classes (e.g., Ride)

### Smalltalk Runtime Components

**OrderedCollection**: Python list wrapper implementing Smalltalk's collection protocol with `add()` and `size()` methods.

**Transcript**: Static output utility mimicking Smalltalk's standard output mechanism with `show()` for printing and `cr()` for line breaks.

### Domain Model: Ride Sharing

The system includes concrete domain classes like **Ride** that:
- Extend SmalltalkObject
- Define ride-specific instance variables (rideID, pickupLocation, dropoffLocation, distance, fare)
- Implement Smalltalk-style getter/setter pairs (e.g., `rideID()` and `rideID_set()`)

**Design rationale**: Separates the generic interpreter infrastructure from domain-specific business logic, allowing the interpreter to support any Smalltalk domain model.

### Parsing Strategy

The interpreter uses **regular expressions** for syntax parsing rather than a formal parser generator.

**Rationale**: 
- Smalltalk syntax is relatively simple and uniform
- Regex provides sufficient power for method signatures and class definitions
- Avoids external dependencies on parser libraries

**Trade-offs**: Less robust error handling compared to formal grammars, but simpler implementation and maintenance.

### Method Execution Model

Methods are stored as **unparsed Smalltalk code strings** and executed dynamically rather than being pre-compiled to Python.

**Rationale**: Maintains flexibility to interpret Smalltalk semantics at runtime, supports features like `self` and message passing that differ from Python's object model.

## External Dependencies

### Language Runtime
- **Python 3**: Core runtime environment (no specific framework dependencies observed)
- Uses only Python standard library (`re` for regex, `sys` for system operations, `typing` for type hints)

### Development Tools
- Designed to run on **Replit** platform (indicated by file naming and context)
- No external package dependencies (no `requirements.txt` or package imports beyond stdlib)

### File System Dependencies
- Expects `.st` files containing Smalltalk source code as input
- File reading and parsing handled by interpreter modules

### No External Services
- Self-contained system with no database connections
- No API integrations or web frameworks
- No authentication/authorization mechanisms (single-user interpreter context)