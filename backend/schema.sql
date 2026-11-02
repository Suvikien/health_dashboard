USE health_dashboard;

CREATE TABLE patients(
                         patient_id CHAR(36) NOT NULL,
                         first_name VARCHAR(50) NOT NULL,
                         middle_name VARCHAR(50),
                         last_name VARCHAR(50) NOT NULL,
                         birthdate DATE NOT NULL,
                         gender CHAR(1),
                         PRIMARY KEY (patient_id)
);

DESCRIBE patients;