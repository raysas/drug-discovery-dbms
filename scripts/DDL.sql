CREATE SCHEMA drug_discovery_company;
USE drug_discovery_company;
-- creating the table PATIENT
CREATE TABLE PATIENT(
    ID INT(8) NOT NULL,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(12) NOT NULL,
    age INT(2) NOT NULL,
    sex CHAR(1) NOT NULL,
    PRIMARY KEY(ID)
);


-- creating table DISEASE
CREATE TABLE DISEASE(
    name VARCHAR(20) NOT NULL,
    type VARCHAR(20),
    PRIMARY KEY(name)
);

-- Creating table GENE
CREATE TABLE GENE(
    code VARCHAR(7) NOT NULL,
    description VARCHAR(100),
    chromosome_no VARCHAR(2) NOT NULL,
    coordinates VARCHAR(30),
    strand VARCHAR(14),
    phenotype VARCHAR(100),
    PRIMARY KEY(code),
    FOREIGN KEY(phenotype) REFERENCES DISEASE(name)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- creating table COMPOUND
CREATE TABLE COMPOUND(
    ID VARCHAR(20) NOT NULL,
    molecular_formula VARCHAR(100),
    weight FLOAT,
    type VARCHAR(30),
    PRIMARY KEY(ID)
);

-- creating table DRUG
CREATE TABLE DRUG(
    generic_name VARCHAR(30) NOT NULL,
    classification VARCHAR(40),
    molecule VARCHAR(20) NOT NULL,
    phase CHAR(1),
    PRIMARY KEY(generic_name),
    UNIQUE(molecule),
    FOREIGN KEY(molecule) REFERENCES COMPOUND(ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- creating the table RECORD

CREATE TABLE RECORD(
    record_no INT NOT NULL auto_increment,
    patient_id INT(8) NOT NULL,-- total participation
    disease_name VARCHAR(20) NOT NULL,
    drug_name VARCHAR(30) NOT NULL,
    test_date DATE,
    effective BOOLEAN,
    PRIMARY KEY(record_no),
    UNIQUE(patient_id),
    FOREIGN KEY(patient_id) REFERENCES PATIENT(ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(disease_name) REFERENCES DISEASE(name)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(drug_name) REFERENCES DRUG(generic_name)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- creating table VARIANT (weak entity)
CREATE TABLE VARIANT(
    variant_no INT(3) NOT NULL,
    gene VARCHAR(7) NOT NULL,
    size INT,
    protein_size INT,
    biotype VARCHAR(100),
    PRIMARY KEY(variant_no, gene),
    FOREIGN KEY(gene) REFERENCES GENE(code)
        ON UPDATE CASCADE
);


-- creating table BRAND_NAMES (multivalued attribute for gene)
CREATE TABLE BRAND_NAME(
    drug VARCHAR(30) NOT NULL,
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY(drug,name),
    FOREIGN KEY(drug) REFERENCES DRUG(generic_name)
        ON DELETE CASCADE ON UPDATE CASCADE
);