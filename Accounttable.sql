-- =================================================================
-- SQL DDL for Customer Related Tables
-- Inferred from the ERD provided.
-- Designed for import into data modeling tools like Erwin.
-- =================================================================

-- -----------------------------------------------------
-- Table: Customer
-- -----------------------------------------------------
CREATE TABLE Customer (
  CustLastName VARCHAR(100) NOT NULL,
  CustFirstName VARCHAR(100) NOT NULL,
  CustMiddleInitial CHAR(1) NOT NULL,
  CustSuffix VARCHAR(10) NOT NULL,
  CustDOB DATE NOT NULL,
-- -----------------------------------------------------
  CustSalutation VARCHAR(20),
  CustMailAddress VARCHAR(255),
  Gender CHAR(1),
  SSN_TIN VARCHAR(11),
  SSNType VARCHAR(20),
  CustomerLegacyID VARCHAR(50),
  WithholdingCode VARCHAR(10),
  PreferredLanguage VARCHAR(50),
  StartDate DATE,
  EndDate DATE,
  PMR_N_Fields TEXT,
  PMR_Y_Fields TEXT,
  CONSTRAINT PK_Customer PRIMARY KEY (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
);

-- -----------------------------------------------------
-- Table: CustomerAddress
-- -----------------------------------------------------
CREATE TABLE CustomerAddress (
  CustLastName VARCHAR(100) NOT NULL,
  CustFirstName VARCHAR(100) NOT NULL,
  CustMiddleInitial CHAR(1) NOT NULL,
  CustSuffix VARCHAR(10) NOT NULL,
  CustDOB DATE NOT NULL,
  CustAddress1 VARCHAR(255) NOT NULL,
  CustAddress2 VARCHAR(255),
  CustCity VARCHAR(100),
  CustState VARCHAR(50),
  CustZip VARCHAR(10),
  AnnualStartDate DATE NOT NULL,
  -- -----------------------------------------------------
  AnnualEndDate DATE,
  PMR_Z_Fields TEXT,
  CONSTRAINT PK_CustomerAddress PRIMARY KEY (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB, CustAddress1, AnnualStartDate),
  CONSTRAINT FK_CustomerAddress_Customer FOREIGN KEY (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
    REFERENCES Customer (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
);

-- -----------------------------------------------------
-- Table: CustomerAlias
-- -----------------------------------------------------
CREATE TABLE CustomerAlias (
  CustLastName VARCHAR(100) NOT NULL,
  CustFirstName VARCHAR(100) NOT NULL,
  CustMiddleInitial CHAR(1) NOT NULL,
  CustSuffix VARCHAR(10) NOT NULL,
  CustDOB DATE NOT NULL,
-- -----------------------------------------------------
  AliasLastName VARCHAR(100) NOT NULL,
  AliasFirstName VARCHAR(100) NOT NULL,
  AliasMiddleInitial CHAR(1) NOT NULL,
  AliasDOB DATE NOT NULL,
  AliasSuffix VARCHAR(10),
  AliasSalutation VARCHAR(20),
  AliasMailAddress VARCHAR(255),
  Gender CHAR(1),
  SSN_TIN VARCHAR(11),
  SSNType VARCHAR(20),
  CONSTRAINT PK_CustomerAlias PRIMARY KEY (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB, AliasLastName, AliasFirstName, AliasMiddleInitial, AliasDOB),
  CONSTRAINT FK_CustomerAlias_Customer FOREIGN KEY (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
    REFERENCES Customer (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
);

-- -----------------------------------------------------
-- Table: CustomerImage
-- -----------------------------------------------------
CREATE TABLE CustomerImage (
  DocumentID VARCHAR(50) NOT NULL,
  CustLastName VARCHAR(100) NOT NULL,
  CustFirstName VARCHAR(100) NOT NULL,
  CustMiddleInitial CHAR(1) NOT NULL,
  CustSuffix VARCHAR(10) NOT NULL,
  CustDOB DATE NOT NULL,
  -- -----------------------------------------------------
  ImageFileLocation VARCHAR(500) NOT NULL,
  ImageType VARCHAR(50),
  DateReceived DATETIME,
  CONSTRAINT PK_CustomerImage PRIMARY KEY (DocumentID),
  CONSTRAINT FK_CustomerImage_Customer FOREIGN KEY (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
    REFERENCES Customer (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
);

-- -----------------------------------------------------
-- Table: CustomerRelation
-- -----------------------------------------------------
CREATE TABLE CustomerRelation (
  CustLastName VARCHAR(100) NOT NULL,
  CustFirstName VARCHAR(100) NOT NULL,
  CustMiddleInitial CHAR(1) NOT NULL,
  CustSuffix VARCHAR(10) NOT NULL,
  CustDOB DATE NOT NULL,
  RelationLastName VARCHAR(100) NOT NULL,
  RelationFirstName VARCHAR(100) NOT NULL,
  RelationMiddleInitial CHAR(1) NOT NULL,
  RelationSuffix VARCHAR(10) NOT NULL,
  RelationDOB DATE NOT NULL,
  -- -----------------------------------------------------
  RelationToCustomer VARCHAR(50),
  StartDate DATE,
  EndDate DATE,
  CONSTRAINT PK_CustomerRelation PRIMARY KEY (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB, RelationLastName, RelationFirstName, RelationMiddleInitial, RelationSuffix, RelationDOB),
  CONSTRAINT FK_CustomerRelation_Customer FOREIGN KEY (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
    REFERENCES Customer (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB),
  CONSTRAINT FK_CustomerRelation_RelationCustomer FOREIGN KEY (RelationLastName, RelationFirstName, RelationMiddleInitial, RelationSuffix, RelationDOB)
    REFERENCES Customer (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
);


--Then create all the main tables expect for Customer, which refer to the table with bold entity titles.
-- -----------------------------------------------------
-- Table: Account_h
-- -----------------------------------------------------
CREATE TABLE Account_h (
  AccountName VARCHAR(255) NOT NULL,
  AccountName2 VARCHAR(255) NOT NULL,
  LocationAddress1 VARCHAR(255) NOT NULL,
  LocationAddress2 VARCHAR(255) NOT NULL,
  LocationCity VARCHAR(100) NOT NULL,
  LocationState CHAR(2) NOT NULL,
  LocationZip VARCHAR(10) NOT NULL,
  CompanyCode CHAR(2) NOT NULL,
  TaxIDNumber VARCHAR(20),
  NumberOfEmployees INT,
  NumberOfEmployessDate DATE,
  ActivityStatus CHAR(1),
  ActivityStatusDate DATE,
  GroupNumber VARCHAR(50),
  LegacySysFlexID VARCHAR(50),
  AccountEstablishedDate DATE,
  PlanYearStartDate DATE,
  PlanYearEndDate DATE,
  SubsequentYearStartDate DATE,
  IndustryDescription VARCHAR(255),
  DualCompanyFlag CHAR(1),
  ComplexAccountFlag CHAR(1),
  StandardIndustryCode VARCHAR(20),
  AnnualizedPremuim DECIMAL(18, 2),
  NoOutstandingInvoices INT,
  NoMonthsInactive INT,
  LastInvoicePaidDate DATE,
  LastInvoicePaidIssueDate DATE,
  LastInvoiceGenDate DATE,
  NextInvoiceGenDate DATE,
  LastServiceCallDate DATE,
  LastBillCount INT,
  DisabilityOfferingStartDate DATE,
  LocationPhone VARCHAR(20),
  AddressInformationSource VARCHAR(100),
  WebAddress VARCHAR(255),
  SpecialHandlingCode VARCHAR(10),
  MultiLocationAccountFlag CHAR(1),
  PEOFlag CHAR(1),
  DisabilityOfferingTaxStatus VARCHAR(50),
  TransitOneFlag CHAR(1),
  HSAFlag CHAR(1),
  HRAFlag CHAR(1),
  DataConfidenceLevel VARCHAR(50),
  TotalPolicyCount INT,
  PendingAnnualizedPremium DECIMAL(18, 2),
  PercentByLineOfBusiness DECIMAL(5, 2),
  ScheduledLapseDate DATE,
  PenetrationPercentage DECIMAL(5, 2),
  NoFSAParticipants INT,
  PRIMARY KEY (AccountName, AccountName2, LocationAddress1, LocationAddress2, LocationCity, LocationState, LocationZip, CompanyCode)
);