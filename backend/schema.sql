USE health_dashboard;

CREATE TABLE patients
(
    patient_id  CHAR(36)    NOT NULL,
    first_name  VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name   VARCHAR(50) NOT NULL,
    birthdate   DATE        NOT NULL,
    gender      CHAR(1),
    PRIMARY KEY (patient_id)
);

CREATE TABLE encounters
(
    encounter_id          CHAR(36)     NOT NULL,
    patient_id            CHAR(36)     NOT NULL,
    encounter_class       VARCHAR(20)  NOT NULL,
    encounter_description VARCHAR(255) NOT NULL,
    start_time            DATETIME     NOT NULL,
    stop_time             DATETIME     NOT NULL,
    PRIMARY KEY (encounter_id),
    FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);

CREATE TABLE conditions
(
    condition_id          INT auto_increment PRIMARY KEY,
    patient_id            CHAR(36)     NOT NULL,
    encounter_id          CHAR(36)     NOT NULL,
    start_date            DATE         NOT NULL,
    stop_date             DATE,
    condition_description VARCHAR(255) NOT NULL,
    FOREIGN KEY (encounter_id) REFERENCES encounters (encounter_id),
    FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);

CREATE TABLE medications
(
    medication_id          INT auto_increment PRIMARY KEY,
    patient_id             CHAR(36)     NOT NULL,
    encounter_id           CHAR(36)     NOT NULL,
    medication_description VARCHAR(255) NOT NULL,
    start_time             DATETIME     NOT NULL,
    stop_time              DATETIME,
    FOREIGN KEY (encounter_id) REFERENCES encounters (encounter_id),
    FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);

DESCRIBE patients;
DESCRIBE encounters;
DESCRIBE conditions;
DESCRIBE medications;