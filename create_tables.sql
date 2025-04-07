CREATE TABLE IF NOT EXISTS STATUS (
    StatusId INT PRIMARY KEY,
    Status VARCHAR(20) 
);

CREATE TABLE IF NOT EXISTS SEASONS (
    Year INT PRIMARY KEY,
    URL VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS COUNTRIES (
    Id INT PRIMARY KEY,
    Code CHAR(2),
    Name VARCHAR(60),
    Continent CHAR(2),
    WikipediaLInk VARCHAR(255),
    Keywords VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS AIRPORTS (
    Id INT PRIMARY KEY,
    Ident VARCHAR(10),
    Type VARCHAR(15),
    Name VARCHAR(60) ,
    LatDeg FLOAT,
    LongDeg FLOAT,
    ElevFt INT,
    Continent CHAR(2),
    ISOCountry CHAR(2),
    ISORegion CHAR(5),
    City VARCHAR(60),
    Scheduled_Service VARCHAR(3),
    ICAOCode CHAR(4),
    IATACode CHAR(3),
    GPSCode CHAR(4),
    LocalCode CHAR(4),
    HomeLink VARCHAR(255),
    WikipediaLInk VARCHAR(255),
    Keywords VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS GEOCITIES15K (
    GeonameId INT PRIMARY KEY,
    Name VARCHAR(60),
    AsciiName VARCHAR(60),
    AlternateNames TEXT,
    Lat FLOAT,
    Long FLOAT,
    FeatureClass CHAR(1),
    FeatureCode VARCHAR(5),
    Country CHAR(2),
    CC2 VARCHAR(5),
    Admin1Code VARCHAR(20),
    Admin2Code VARCHAR(20),
    Admin3Code VARCHAR(20),
    Admin4Code VARCHAR(20),
    Population INT,
    Elevation INT,
    Dem INT,
    TimeZone VARCHAR(20),
    Modification DATE
);

-- Tabela CIRCUITS
CREATE TABLE IF NOT EXISTS CIRCUITS (
    CircuitId INT PRIMARY KEY,
    CircuitRef VARCHAR(60),
    Name VARCHAR(60),
    Location VARCHAR(60),
    Country VARCHAR(60),
    Lat FLOAT,
    Lng FLOAT,
    Alt INT,
    URL VARCHAR(255)
);

-- Tabela CONSTRUCTORS
CREATE TABLE IF NOT EXISTS CONSTRUCTORS (
    ConstructorId INT PRIMARY KEY,
    ConstructorRef VARCHAR(60),
    Name VARCHAR(60),
    Nationality VARCHAR(60),
    URL VARCHAR(255)
);

-- Tabela DRIVER
CREATE TABLE IF NOT EXISTS DRIVER (
    DriverId INT PRIMARY KEY,
    DriverRef VARCHAR(60),
    Number INT,
    Code VARCHAR(3),
    Forename VARCHAR(60),
    Surname VARCHAR(60),
    DateOfBirth DATE,
    Nationality VARCHAR(60),
    URL VARCHAR(255)
);

-- Tabela RACES
-- Tem 10 colunas aparentemente só com nulos na tabela race que eu nao coloquei
CREATE TABLE IF NOT EXISTS RACES (
    RaceId INT PRIMARY KEY,
    Year INT,
    Round INT,
    CircuitId INT,
    Name VARCHAR(100),
    Date DATE,
    Time TIME,
    URL VARCHAR(255),
    FP1Date Date, 
    FP1Time Time,
    FP2Date Date,
    FP2Time Time,
    FP3Date Date,
    FP3Time Time,
    QualiDate Date,
    QualiTime Time,
    SprintDate Date,
    SprintTime Time,
    FOREIGN KEY (CircuitId) REFERENCES CIRCUITS(CircuitId),
    FOREIGN KEY (Year) REFERENCES SEASONS(Year)
);



-- Tabela DRIVERSTANDINGS
CREATE TABLE IF NOT EXISTS DRIVERSTANDINGS (
    DriverStandingsId INT PRIMARY KEY,
    RaceId INT,
    DriverId INT,
    Points INT,
    Position INT,
    PositionText VARCHAR(2),
    Wins INT,
    FOREIGN KEY (RaceId) REFERENCES RACES(RaceId),
    FOREIGN KEY (DriverId) REFERENCES DRIVER(DriverId)
);
-- Tabela LAPTIMES
-- nao sei o formato do time
CREATE TABLE IF NOT EXISTS LAPTIMES (
    RaceId INT,
    DriverId INT,
    Lap INT,
    Position INT,
    Time TIME,
    Milliseconds INT,
    PRIMARY KEY (RaceId, DriverId, Lap),
    FOREIGN KEY (RaceId) REFERENCES RACES(RaceId),
    FOREIGN KEY (DriverId) REFERENCES DRIVER(DriverId)
);

-- Tabela PITSTOPS
CREATE TABLE PITSTOPS (
    RaceId INT,
    DriverId INT,
    Stop INT,
    Lap INT,
    Time TIME,
    Duration Time,
    Milliseconds INT,
    PRIMARY KEY (RaceId, DriverId, Stop),
    FOREIGN KEY (RaceId) REFERENCES RACES(RaceId),
    FOREIGN KEY (DriverId) REFERENCES DRIVER(DriverId)
);

CREATE TABLE IF NOT EXISTS QUALIFYING(
    QualifyId INT PRIMARY KEY,
    RaceId INT,
    DriverId INT,
    ConstructorId INT,
    Number INT,
    Position INT,
    Q1 TIME,
    Q2 TIME,
    Q3 TIME,
    FOREIGN KEY (RaceId) REFERENCES RACES(RaceId),
    FOREIGN KEY (DriverId) REFERENCES DRIVER(DriverId),
    FOREIGN KEY (ConstructorId) REFERENCES CONSTRUCTORS(ConstructorId)
);

CREATE TABLE IF NOT EXISTS RESULTS(
    ResultId INT PRIMARY KEY,
    RaceId INT,
    DriverId INT,
    ConstructorId INT,
    Number INT,
    Grid INT,
    Position INT,
    PositionText VARCHAR(2),
    PositionOrder INT,
    Points INT,
    Laps INT,
    Time TIME,
    Milliseconds INT,
    FastesLap INT,
    Rank INT,
    FastesLapTime TIME,
    FastestLapSpeed VARCHAR(7),
    StatusId INT,
    FOREIGN KEY (RaceId) REFERENCES RACES(RaceId),
    FOREIGN KEY (DriverId) REFERENCES DRIVER(DriverId),
    FOREIGN KEY (ConstructorId) REFERENCES CONSTRUCTORS(ConstructorId),
    FOREIGN KEY (StatusId) REFERENCES STATUS(StatusId)
);

