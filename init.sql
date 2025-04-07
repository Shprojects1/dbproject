

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Birth DATE,
    Gender VARCHAR(10),
    Address VARCHAR(255),
    ContactInfo VARCHAR(100),
    NationalID VARCHAR(50) UNIQUE
);

CREATE TABLE MedicalHistory (
    HistoryID INT PRIMARY KEY,
    Pmed TEXT,
    Psurge TEXT,
    PatientID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

CREATE TABLE Doctor (
    DrID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Specialty VARCHAR(100),
    ContactInfo VARCHAR(100)
);

CREATE TABLE Consultation (
    ConID INT PRIMARY KEY,
    Note TEXT
);

CREATE TABLE Visit (
    VisitID INT PRIMARY KEY,
    PatientID INT,
    DrID INT,
    ConID INT,
    VisitDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DrID) REFERENCES Doctor(DrID),
    FOREIGN KEY (ConID) REFERENCES Consultation(ConID)
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Role ENUM('admin', 'doctor', 'receptionist') NOT NULL,
    LinkedID INT,
    FOREIGN KEY (LinkedID) REFERENCES Doctor(DrID)
);
