DROP TABLE PilotCertification;
DROP TABLE Pilot;
DROP TABLE FlightAttendant;
DROP TABLE CrewMember;
DROP TABLE Ticket;
DROP TABLE Passenger;
DROP TABLE Airport_Flight;
DROP TABLE Gate;
DROP TABLE Flight;
DROP TABLE Plane;
DROP TABLE Airport_Airline;
DROP TABLE Airline;
DROP TABLE Airport;

CREATE TABLE Airport (
airportID    varchar(4) NOT NULL, 
location varchar(25),
noGates varchar(3),
CONSTRAINT airport_PK
       PRIMARY KEY (airportID)
);

CREATE TABLE Airline(
	airlineID varchar(4) NOT NULL,
    name varchar(25),
    CONSTRAINT airline_PK
    	PRIMARY KEY(airlineID)
);

CREATE TABLE Airport_Airline(
	airportID varchar(4) NOT NULL,
    airlineID varchar(4) NOT NULL,
    CONSTRAINT Airport_FK
    	FOREIGN KEY(airportID)
    		REFERENCES Airport(airportID),
    CONSTRAINT Airline_FK
    	FOREIGN KEY(airlineID)
    		REFERENCES Airline(airlineID)
);

CREATE TABLE Plane(
	planeID varchar(4) NOT NULL,
    model varchar(25),
    capacity varchar(4),
    airlineID varchar(4) NOT NULL,
    CONSTRAINT plane_PK
    	PRIMARY KEY(planeID),
    CONSTRAINT Plane_Airline_FK
    	FOREIGN KEY(airlineID)
    		REFERENCES Airline(airlineID)
);

CREATE TABLE Flight(
	flightNo varchar(4) NOT NULL,
    startLocation varchar(25),
    destination varchar(25),
    boardingTime varchar(8),
    departureTime varchar(8),
    arrivalTime varchar(8),
    planeID varchar(4) NOT NULL,
    airlineID varchar(4) NOT NULL,
    CONSTRAINT flight_PK
    	PRIMARY KEY(flightNo),
    CONSTRAINT Flight_Plane_FK
    	FOREIGN KEY(planeID)
    		REFERENCES Plane(planeID),
    CONSTRAINT Flight_Airline_FK
    	FOREIGN KEY(airlineID)
    		REFERENCES Airline(airlineID)
);

CREATE TABLE Gate(
	gateID varchar(4) NOT NULL,
    airportID varchar(4) NOT NULL,
    flightNo varchar(4) NOT NULL,
    CONSTRAINT gate_PK
    	PRIMARY KEY(gateID),
    CONSTRAINT Gate_Airport_FK
    	FOREIGN KEY(airportID)
    		REFERENCES Airport(airportID),
    CONSTRAINT Gate_Flight
    	FOREIGN KEY(flightNo)
    		REFERENCES Flight(flightNo)
);

CREATE TABLE Airport_Flight(
    airportID varchar(4) NOT NULL,
    flightNo varchar(4) NOT NULL,
    CONSTRAINT Airport_FK
    	FOREIGN KEY(airportID)
    		REFERENCES Airport(airportID),
    CONSTRAINT Flight_FK
    	FOREIGN KEY(flightNo)
    		REFERENCES Flight(flightNo)
);

CREATE TABLE Passenger(
	passengerID varchar(8) NOT NULL,
    name varchar(35),
    gender char(1),
    phoneNo varchar(10),
    DOB varchar(10),
    flightNo varchar(4) NOT NULL,
    CONSTRAINT passenger_PK
    	PRIMARY KEY(passengerID),
    CONSTRAINT Passenger_Flight_FK
    	FOREIGN KEY(flightNo)
    		REFERENCES Flight(flightNo)
);

CREATE TABLE Ticket(
	ticketNo varchar(13) NOT NULL,
    seat varchar(3),
    gender char(1),
    passengerID varchar(8) NOT NULL,
    flightNo varchar(4) NOT NULL,
    CONSTRAINT ticket_PK
    	PRIMARY KEY(ticketNo),
    CONSTRAINT Ticket_Passenger_FK
    	FOREIGN KEY(passengerID)
    		REFERENCES Passenger(passengerID),
    CONSTRAINT Ticket_Flight_FK
    	FOREIGN KEY(flightNo)
    		REFERENCES Flight(flightNo)
);

CREATE TABLE CrewMember(
	memberID varchar(8) NOT NULL,
    name varchar(35),
    gender char(1),
    phoneNo varchar(10),
    DOB varchar(10),
    flightNo varchar(4) NOT NULL,
    CONSTRAINT crewMember_PK
    	PRIMARY KEY(memberID),
    CONSTRAINT Passenger_Flight_FK
    	FOREIGN KEY(flightNo)
    		REFERENCES Flight(flightNo)
);

CREATE TABLE FlightAttendant(
  	faMemberID varchar(8) NOT NULL,
    yearOfService varchar(2),
    CONSTRAINT FA_FK
    	FOREIGN KEY(faMemberID)
    		REFERENCES CrewMember(memberID)
);

CREATE TABLE Pilot(
  	pMemberID varchar(8) NOT NULL,
    yearOfService varchar(2),
    CONSTRAINT P_FK
    	FOREIGN KEY(pMemberID)
    		REFERENCES CrewMember(memberID)
);

CREATE TABLE PilotCertification(
  	certification varchar(20) NOT NULL,
    pMemberID varchar(8) NOT NULL,
    CONSTRAINT cert_PK
    	PRIMARY KEY(certification),
    CONSTRAINT Pilot_Cert_FK
    	FOREIGN KEY(pMemberID)
    		REFERENCES Pilot(pMemberID)
);
