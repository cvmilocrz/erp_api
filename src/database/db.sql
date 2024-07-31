-- Crear tabla de usuarios
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user varchar(20) NOT NULL,
    name VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    departament VARCHAR(100),
    rol INTEGER,
    permissions INTEGER[],
    user_status INTEGER,
    user_password VARCHAR(255),
);
CREATE TABLE employees (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type_document INTEGER NOT NULL,
    document VARCHAR(20) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    admission_date DATE NOT NULL,
    retirement_date DATE,
    retirement_reason INTEGER,
    retirement_reason_description VARCHAR(1000),
    personal_phone VARCHAR(20),
    personal_email VARCHAR(100) UNIQUE NOT NULL,
    corporate_phone VARCHAR(20),
    corporate_email VARCHAR(100) UNIQUE NOT NULL,
    birth_date DATE NOT NULL,
    is_student INTEGER NOT NULL CHECK (is_student IN (1, 0)),
    is_retired INTEGER NOT NULL CHECK (is_retired IN (1, 0)),
    medical_test DATE[],
    have_phone INTEGER CHECK (have_phone IN (1, 0)),
    have_sim INTEGER CHECK (have_sim IN (1, 0)),
    sim_number VARCHAR(20),
    sim_provider VARCHAR(100),
    type_contract INTEGER NOT NULL CHECK (type_contract IN (1, 2, 3)),
    contract_expiration_date DATE
);
CREATE TABLE arl_afiliation (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE eps_afiliation (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE pension_afiliation (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE compesation_afiliation (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE act_file(
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE comptroller_record(
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE attorney_record (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE laboral_certification (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE student_certification (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE personal_certification (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE contract (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE confident_tratement (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE confident_tratement (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE personal_curriculum (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
CREATE TABLE coporate_curriculum (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    file_name varchar(25),
    doc_file bytea,
    validated_status INTEGER NOT NULL CHECK (validated_status IN (1, 0)),
    employee_id UUID REFERENCES employees(id)
);
--indefinido, prestación de servicios, fijo
INSERT INTO employees (
    name, type_document, document, cargo, admission_date, retirement_date, retirement_reason, 
    retirement_reason_description, personal_phone, personal_email, corporate_phone, corporate_email, 
    birth_date, is_student, is_retired, medical_test, have_phone, have_sim, sim_number, sim_provider, 
    type_contract, contract_expiration_date
) VALUES
    ('Alice Johnson', 1, '12345678', 'Manager', '2022-01-15', NULL, NULL, NULL, '123-456-7890', 'alice.johnson@example.com', '321-654-0987', 'alice.j@examplecorp.com', '1990-05-20', 0, 0, NULL, 1, 1, '9876543210', 'Provider A', 1, '2024-12-31'),
    ('Bob Smith', 2, '87654321', 'Developer', '2021-03-10', NULL, NULL, NULL, '234-567-8901', 'bob.smith@example.com', '432-765-0123', 'bob.s@examplecorp.com', '1988-07-15', 0, 0, NULL, 1, 1, '8765432109', 'Provider B', 2, '2023-09-30'),
    ('Carol White', 3, '23456789', 'Designer', '2020-06-25', NULL, NULL, NULL, '345-678-9012', 'carol.white@example.com', '543-876-1234', 'carol.w@examplecorp.com', '1992-11-30', 0, 0, NULL, 1, 1, '7654321098', 'Provider C', 1, '2025-03-15'),
    ('David Brown', 1, '34567890', 'Analyst', '2019-08-05', NULL, NULL, NULL, '456-789-0123', 'david.brown@example.com', '654-987-2345', 'david.b@examplecorp.com', '1985-02-10', 0, 0, NULL, 1, 1, '6543210987', 'Provider A', 3, '2024-08-20'),
    ('Eve Black', 2, '45678901', 'Consultant', '2021-10-11', NULL, NULL, NULL, '567-890-1234', 'eve.black@example.com', '765-098-3456', 'eve.b@examplecorp.com', '1995-04-25', 0, 0, NULL, 1, 1, '5432109876', 'Provider B', 2, '2024-05-10'),
    ('Frank Green', 3, '56789012', 'Tester', '2020-11-20', NULL, NULL, NULL, '678-901-2345', 'frank.green@example.com', '876-109-4567', 'frank.g@examplecorp.com', '1993-03-18', 0, 0, NULL, 1, 1, '4321098765', 'Provider C', 1, '2024-11-01'),
    ('Grace Harris', 1, '67890123', 'HR Manager', '2021-01-30', NULL, NULL, NULL, '789-012-3456', 'grace.harris@example.com', '987-210-5678', 'grace.h@examplecorp.com', '1987-06-25', 0, 0, NULL, 1, 1, '3210987654', 'Provider A', 3, '2024-07-31'),
    ('Henry Martin', 2, '78901234', 'Support', '2018-05-15', NULL, NULL, NULL, '890-123-4567', 'henry.martin@example.com', '098-321-6789', 'henry.m@examplecorp.com', '1984-09-14', 0, 0, NULL, 1, 1, '2109876543', 'Provider B', 2, '2023-12-15'),
    ('Ivy King', 3, '89012345', 'Sales', '2022-02-28', NULL, NULL, NULL, '901-234-5678', 'ivy.king@example.com', '109-432-7890', 'ivy.k@examplecorp.com', '1991-12-21', 0, 0, NULL, 1, 1, '1098765432', 'Provider C', 1, '2025-01-01'),
    ('Jack Lee', 1, '90123456', 'Marketing', '2020-03-01', NULL, NULL, NULL, '012-345-6789', 'jack.lee@example.com', '210-543-8901', 'jack.l@examplecorp.com', '1986-10-10', 0, 0, NULL, 1, 1, '0987654321', 'Provider A', 3, '2024-04-04'),
    ('Kate Walker', 2, '01234567', 'Finance', '2019-04-10', NULL, NULL, NULL, '123-456-7890', 'kate.walker@example.com', '321-654-0987', 'kate.w@examplecorp.com', '1983-11-11', 0, 0, NULL, 1, 1, '9876543210', 'Provider B', 2, '2023-11-30'),
    ('Liam Scott', 3, '12345678', 'IT Specialist', '2021-06-18', NULL, NULL, NULL, '234-567-8901', 'liam.scott@example.com', '432-765-0123', 'liam.s@examplecorp.com', '1994-08-08', 0, 0, NULL, 1, 1, '8765432109', 'Provider C', 1, '2024-06-20'),
    ('Mia Perez', 1, '23456789', 'PR Manager', '2022-07-22', NULL, NULL, NULL, '345-678-9012', 'mia.perez@example.com', '543-876-1234', 'mia.p@examplecorp.com', '1990-03-02', 0, 0, NULL, 1, 1, '7654321098', 'Provider A', 3, '2025-08-15'),
    ('Noah Davis', 2, '34567890', 'Project Manager', '2019-09-10', NULL, NULL, NULL, '456-789-0123', 'noah.davis@example.com', '654-987-2345', 'noah.d@examplecorp.com', '1982-12-12', 0, 0, NULL, 1, 1, '6543210987', 'Provider B', 2, '2023-10-05'),
    ('Olivia Brown', 3, '45678901', 'Operations', '2020-11-01', NULL, NULL, NULL, '567-890-1234', 'olivia.brown@example.com', '765-098-3456', 'olivia.b@examplecorp.com', '1997-01-15', 0, 0, NULL, 1, 1, '5432109876', 'Provider C', 1, '2024-12-01'),
    ('Paul Thomas', 1, '56789012', 'Engineer', '2018-12-05', NULL, NULL, NULL, '678-901-2345', 'paul.thomas@example.com', '876-109-4567', 'paul.t@examplecorp.com', '1981-05-18', 0, 0, NULL, 1, 1, '4321098765', 'Provider A', 3, '2024-09-10'),
    ('Quinn Allen', 2, '67890123', 'Admin Assistant', '2021-03-20', NULL, NULL, NULL, '789-012-3456', 'quinn.allen@example.com', '987-210-5678', 'quinn.a@examplecorp.com', '1996-07-25', 0, 0, NULL, 1, 1, '3210987654', 'Provider B', 2, '2024-10-15'),
    ('Ruby Campbell', 3, '78901234', 'Researcher', '2022-05-30', NULL, NULL, NULL, '890-123-4567', 'ruby.campbell@example.com', '098-321-6789', 'ruby.c@examplecorp.com', '1998-04-10', 0, 0, NULL, 1, 1, '2109876543', 'Provider C', 1, '2025-05-05'),
    ('Sam Taylor', 1, '89012345', 'Architect', '2019-07-14', NULL, NULL, NULL, '901-234-5678', 'sam.taylor@example.com', '109-432-7890', 'sam.t@examplecorp.com', '1980-06-21', 0, 0, NULL, 1, 1, '1098765432', 'Provider A', 3, '2023-11-20'),
    ('Tina Moore', 2, '90123456', 'Trainer', '2020-09-08', NULL, NULL, NULL, '012-345-6789', 'tina.moore@example.com', '210-543-8901', 'tina.m@examplecorp.com', '1995-05-05', 0, 0, NULL, 1, 1, '0987654321', 'Provider B', 2, '2024-02-28');

-- Insertar datos en la tabla de usuarios
INSERT INTO users (name, cargo, email, phone, departament, rol, permissions, user_status, user_password)
VALUES 
('Juan Camilo Cruz Cespedes', 'Desarrollador', 'camilocruz@gmail.com', '3246861582', 'Net Allcorrect', 1, {1,2}, 1, 'password1')
