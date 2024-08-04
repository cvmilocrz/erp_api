-- Crear tabla de usuarios
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_name varchar(20) NOT NULL,
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
CREATE TABLE