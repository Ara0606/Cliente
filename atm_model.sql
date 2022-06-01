-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-16 15:20:32.912

-- tables
-- Table: Ahorros
CREATE TABLE Ahorros (
    save_id SERIAL NOT NULL,
    amount int NULL,
    Cliente_client_id int NOT NULL,
    CONSTRAINT Ahorros_pk PRIMARY KEY (save_id)
);

-- Table: Card
CREATE TABLE Card (
    card_id SERIAL NOT NULL,
    Type_Card_type_id int NOT NULL,
    CONSTRAINT Card_pk PRIMARY KEY (card_id)
);

-- Table: Cliente
CREATE TABLE Cliente (
    client_id SERIAL NOT NULL,
    first_name varchar(128) NULL,
    last_name varchar(128) NULL,
    gender varchar(20) NULL,
    age int NULL,
    address varchar(128) NOT NULL,
    Card_card_id int NOT NULL,
    CONSTRAINT Cliente_pk PRIMARY KEY (client_id)
);

-- Table: Consulta_saldo
CREATE TABLE Consulta_saldo (
    bal_id SERIAL NOT NULL,
    saldo int NULL,
    Cliente_client_id int NOT NULL,
    CONSTRAINT Consulta_saldo_pk PRIMARY KEY (bal_id)
);

-- Table: Credito
CREATE TABLE Credito (
    credito_id SERIAL NOT NULL,
    garante varchar(100) NULL,
    ingreso int NULL,
    inmueble varchar(100) NULL,
    Cliente_client_id int NOT NULL,
    CONSTRAINT Credito_pk PRIMARY KEY (credito_id)
);

-- Table: Deposito
CREATE TABLE Deposito (
    deposit_id SERIAL NOT NULL,
    amount int NULL,
    Cliente_client_id int NOT NULL,
    CONSTRAINT Deposito_pk PRIMARY KEY (deposit_id)
);

-- Table: Registros
CREATE TABLE Registros (
    record_id SERIAL NOT NULL,
    Transaction_type_typeT_id int NOT NULL,
    Cliente_client_id int NOT NULL,
    Card_card_id int NOT NULL,
    date timestamp NOT NULL,
    CONSTRAINT Registros_pk PRIMARY KEY (record_id)
);

-- Table: Retiro
CREATE TABLE Retiro (
    with_id SERIAL NOT NULL,
    amount int NULL,
    Cliente_client_id int NOT NULL,
    CONSTRAINT Retiro_pk PRIMARY KEY (with_id)
);

-- Table: Transaction_type
CREATE TABLE Transaction_type (
    typeT_id SERIAL NOT NULL,
    Ahorros_save_id int NOT NULL,
    Consulta_saldo_bal_id int NOT NULL,
    Retiro_with_id int NOT NULL,
    Deposito_deposit_id int NOT NULL,
    CONSTRAINT Transaction_type_pk PRIMARY KEY (typeT_id)
);

-- Table: Type_Card
CREATE TABLE Type_Card (
    type_id SERIAL NOT NULL,
    type varchar(128) NULL,
    CONSTRAINT Type_Card_pk PRIMARY KEY (type_id)
);

-- foreign keys
-- Reference: Card_Type_Card (table: Card)
ALTER TABLE Card ADD CONSTRAINT Card_Type_Card FOREIGN KEY Card_Type_Card (Type_Card_type_id)
    REFERENCES Type_Card (type_id);

-- Reference: Consulta_saldo_Cliente (table: Consulta_saldo)
ALTER TABLE Consulta_saldo ADD CONSTRAINT Consulta_saldo_Cliente FOREIGN KEY Consulta_saldo_Cliente (Cliente_client_id)
    REFERENCES Cliente (client_id);

-- Reference: Copy_of_client_Card (table: Cliente)
ALTER TABLE Cliente ADD CONSTRAINT Copy_of_client_Card FOREIGN KEY Copy_of_client_Card (Card_card_id)
    REFERENCES Card (card_id);

-- Reference: Credito_Cliente (table: Credito)
ALTER TABLE Credito ADD CONSTRAINT Credito_Cliente FOREIGN KEY Credito_Cliente (Cliente_client_id)
    REFERENCES Cliente (client_id);

-- Reference: Deposito_Cliente (table: Deposito)
ALTER TABLE Deposito ADD CONSTRAINT Deposito_Cliente FOREIGN KEY Deposito_Cliente (Cliente_client_id)
    REFERENCES Cliente (client_id);

-- Reference: Registros_Card (table: Registros)
ALTER TABLE Registros ADD CONSTRAINT Registros_Card FOREIGN KEY Registros_Card (Card_card_id)
    REFERENCES Card (card_id);

-- Reference: Registros_Cliente (table: Registros)
ALTER TABLE Registros ADD CONSTRAINT Registros_Cliente FOREIGN KEY Registros_Cliente (Cliente_client_id)
    REFERENCES Cliente (client_id);

-- Reference: Registros_Transaction_type (table: Registros)
ALTER TABLE Registros ADD CONSTRAINT Registros_Transaction_type FOREIGN KEY Registros_Transaction_type (Transaction_type_typeT_id)
    REFERENCES Transaction_type (typeT_id);

-- Reference: Retiro_Cliente (table: Retiro)
ALTER TABLE Retiro ADD CONSTRAINT Retiro_Cliente FOREIGN KEY Retiro_Cliente (Cliente_client_id)
    REFERENCES Cliente (client_id);

-- Reference: Savings_Copy_of_client (table: Ahorros)
ALTER TABLE Ahorros ADD CONSTRAINT Savings_Copy_of_client FOREIGN KEY Savings_Copy_of_client (Cliente_client_id)
    REFERENCES Cliente (client_id);

-- Reference: Transaction_type_Ahorros (table: Transaction_type)
ALTER TABLE Transaction_type ADD CONSTRAINT Transaction_type_Ahorros FOREIGN KEY Transaction_type_Ahorros (Ahorros_save_id)
    REFERENCES Ahorros (save_id);

-- Reference: Transaction_type_Consulta_saldo (table: Transaction_type)
ALTER TABLE Transaction_type ADD CONSTRAINT Transaction_type_Consulta_saldo FOREIGN KEY Transaction_type_Consulta_saldo (Consulta_saldo_bal_id)
    REFERENCES Consulta_saldo (bal_id);

-- Reference: Transaction_type_Deposito (table: Transaction_type)
ALTER TABLE Transaction_type ADD CONSTRAINT Transaction_type_Deposito FOREIGN KEY Transaction_type_Deposito (Deposito_deposit_id)
    REFERENCES Deposito (deposit_id);

-- Reference: Transaction_type_Retiro (table: Transaction_type)
ALTER TABLE Transaction_type ADD CONSTRAINT Transaction_type_Retiro FOREIGN KEY Transaction_type_Retiro (Retiro_with_id)
    REFERENCES Retiro (with_id);

-- End of file.

