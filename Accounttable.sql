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
  RelationToCustomer VARCHAR(50),
  StartDate DATE,
  EndDate DATE,
  CONSTRAINT PK_CustomerRelation PRIMARY KEY (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB, RelationLastName, RelationFirstName, RelationMiddleInitial, RelationSuffix, RelationDOB),
  CONSTRAINT FK_CustomerRelation_Customer FOREIGN KEY (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
    REFERENCES Customer (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB),
  CONSTRAINT FK_CustomerRelation_RelationCustomer FOREIGN KEY (RelationLastName, RelationFirstName, RelationMiddleInitial, RelationSuffix, RelationDOB)
    REFERENCES Customer (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
);

-- =================================================================
-- SQL DDL for Account Related Tables
-- Inferred from the ERD provided.
-- Designed for import into data modeling tools like Erwin.
-- =================================================================

-- -----------------------------------------------------
-- Table: CompanyCode
-- -----------------------------------------------------
CREATE TABLE CompanyCode (
  CompanyCode CHAR(2) NOT NULL,
  LegacyCompany CHAR(2),
  PRIMARY KEY (CompanyCode)
);

-- -----------------------------------------------------
-- Table: AccountStatus
-- -----------------------------------------------------
CREATE TABLE AccountStatus (
  AccountStatus CHAR(1) NOT NULL,
  AccountStatusDesc VARCHAR(255),
  PRIMARY KEY (AccountStatus)
);

-- -----------------------------------------------------
-- Table: AuthorRole
-- -----------------------------------------------------
CREATE TABLE AuthorRole (
  AuthorRoleID INT NOT NULL,
  AuthorRoleDesc VARCHAR(255),
  PRIMARY KEY (AuthorRoleID)
);

-- -----------------------------------------------------
-- Table: Account_h
-- -----------------------------------------------------
CREATE TABLE Account_h (
  AccountName VARCHAR(255) NOT NULL,
  LocationName VARCHAR(255) NOT NULL,
  LocationAddr1 VARCHAR(255) NOT NULL,
  LocationAddr2 VARCHAR(255),
  LocationCity VARCHAR(100) NOT NULL,
  LocationState CHAR(2) NOT NULL,
  LocationZip VARCHAR(10) NOT NULL,
  CompanyCode CHAR(2) NOT NULL,
  AccountNumber VARCHAR(50),
  NumberofEmployees INT,
  DateBusinessEst DATE,
  ActivityStatus CHAR(1),
  GroupMasterNum VARCHAR(50),
  FlexMasterNum VARCHAR(50),
  AcctEstablishedDate DATE,
  AcctTerminatedDate DATE,
  MarketTierCode CHAR(1),
  SalesRegionCode VARCHAR(10),
  IndustryDescription VARCHAR(255),
  CompanyWebSite VARCHAR(255),
  AnniversaryMonth INT,
  AnnualizedPremium DECIMAL(18, 2),
  LifeInforcePremium DECIMAL(18, 2),
  AandHInforcePremium DECIMAL(18, 2),
  LastRestructureDate DATE,
  NextRestructureDate DATE,
  TaxIDNumber VARCHAR(20),
  LastBillCount INT,
  LastUpdateDate DATETIME,
  PRIMARY KEY (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode),
  CONSTRAINT FK_Account_h_CompanyCode FOREIGN KEY (CompanyCode) REFERENCES CompanyCode (CompanyCode),
  CONSTRAINT FK_Account_h_AccountStatus FOREIGN KEY (ActivityStatus) REFERENCES AccountStatus (AccountStatus)
);

-- -----------------------------------------------------
-- Table: BillingAccount_h
-- -----------------------------------------------------
CREATE TABLE BillingAccount_h (
  BillingAddrName VARCHAR(255) NOT NULL,
  BillingAddr1 VARCHAR(255) NOT NULL,
  BillingCity VARCHAR(100) NOT NULL,
  BillingState CHAR(2) NOT NULL,
  BillingZip VARCHAR(10) NOT NULL,
  AccountName VARCHAR(255) NOT NULL,
  LocationName VARCHAR(255) NOT NULL,
  LocationAddr1 VARCHAR(255) NOT NULL,
  LocationCity VARCHAR(100) NOT NULL,
  LocationState CHAR(2) NOT NULL,
  LocationZip VARCHAR(10) NOT NULL,
  CompanyCode CHAR(2) NOT NULL,
  GroupNumber VARCHAR(50),
  BillingFrequency CHAR(1),
  DateNoticeSent DATE,
  FSAFlag CHAR(1),
  LifeFlag CHAR(1),
  AandHFlag CHAR(1),
  PRIMARY KEY (BillingAddrName, BillingAddr1, BillingCity, BillingState, BillingZip, AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode),
  CONSTRAINT FK_BillingAccount_h_Account_h FOREIGN KEY (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode)
    REFERENCES Account_h (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode)
);

-- -----------------------------------------------------
-- Table: Account_LegacyAlias
-- -----------------------------------------------------
CREATE TABLE Account_LegacyAlias (
  AccountName VARCHAR(255) NOT NULL,
  LocationName VARCHAR(255) NOT NULL,
  LocationAddr1 VARCHAR(255) NOT NULL,
  LocationCity VARCHAR(100) NOT NULL,
  LocationState CHAR(2) NOT NULL,
  LocationZip VARCHAR(10) NOT NULL,
  CompanyCode CHAR(2) NOT NULL,
  AliasSource VARCHAR(50) NOT NULL,
  AliasName VARCHAR(255),
  AliasAddr1 VARCHAR(255),
  AliasCity VARCHAR(100),
  AliasState CHAR(2),
  AliasZip VARCHAR(10),
  AliasRate VARCHAR(20),
  PRIMARY KEY (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode, AliasSource),
  CONSTRAINT FK_Account_LegacyAlias_Account_h FOREIGN KEY (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode)
    REFERENCES Account_h (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode)
);

-- -----------------------------------------------------
-- Table: Account_Member
-- -----------------------------------------------------
CREATE TABLE Account_Member (
  AccountName VARCHAR(255) NOT NULL,
  LocationName VARCHAR(255) NOT NULL,
  LocationAddr1 VARCHAR(255) NOT NULL,
  LocationCity VARCHAR(100) NOT NULL,
  LocationState CHAR(2) NOT NULL,
  LocationZip VARCHAR(10) NOT NULL,
  CompanyCode CHAR(2) NOT NULL,
  CustLastName VARCHAR(100) NOT NULL,
  CustFirstName VARCHAR(100) NOT NULL,
  CustMiddleInitial CHAR(1) NOT NULL,
  CustSuffix VARCHAR(10) NOT NULL,
  CustDOB DATE NOT NULL,
  PRIMARY KEY (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode, CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB),
  CONSTRAINT FK_Account_Member_Account_h FOREIGN KEY (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode)
    REFERENCES Account_h (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode),
  CONSTRAINT FK_Account_Member_Customer FOREIGN KEY (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
    REFERENCES Customer (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
);


-- -----------------------------------------------------
-- Table: AccountRelation
-- -----------------------------------------------------
CREATE TABLE AccountRelation (
  AccountName_Parent VARCHAR(255) NOT NULL,
  LocationName_Parent VARCHAR(255) NOT NULL,
  LocationAddr1_Parent VARCHAR(255) NOT NULL,
  LocationCity_Parent VARCHAR(100) NOT NULL,
  LocationState_Parent CHAR(2) NOT NULL,
  LocationZip_Parent VARCHAR(10) NOT NULL,
  CompanyCode_Parent CHAR(2) NOT NULL,
  AccountName_Child VARCHAR(255) NOT NULL,
  LocationName_Child VARCHAR(255) NOT NULL,
  LocationAddr1_Child VARCHAR(255) NOT NULL,
  LocationCity_Child VARCHAR(100) NOT NULL,
  LocationState_Child CHAR(2) NOT NULL,
  LocationZip_Child VARCHAR(10) NOT NULL,
  CompanyCode_Child CHAR(2) NOT NULL,
  RelationType VARCHAR(50),
  PRIMARY KEY (AccountName_Parent, LocationName_Parent, LocationAddr1_Parent, LocationCity_Parent, LocationState_Parent, LocationZip_Parent, CompanyCode_Parent, AccountName_Child, LocationName_Child, LocationAddr1_Child, LocationCity_Child, LocationState_Child, LocationZip_Child, CompanyCode_Child),
  CONSTRAINT FK_AccountRelation_Parent FOREIGN KEY (AccountName_Parent, LocationName_Parent, LocationAddr1_Parent, LocationCity_Parent, LocationState_Parent, LocationZip_Parent, CompanyCode_Parent)
    REFERENCES Account_h (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode),
  CONSTRAINT FK_AccountRelation_Child FOREIGN KEY (AccountName_Child, LocationName_Child, LocationAddr1_Child, LocationCity_Child, LocationState_Child, LocationZip_Child, CompanyCode_Child)
    REFERENCES Account_h (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode)
);


-- -----------------------------------------------------
-- Table: AcctAdmin
-- -----------------------------------------------------
CREATE TABLE AcctAdmin (
  AdminID INT NOT NULL,
  AdminLastName VARCHAR(100),
  AdminFirstName VARCHAR(100),
  AdminMiddleInitial CHAR(1),
  AdminAddress1 VARCHAR(255),
  AdminAddress2 VARCHAR(255),
  AdminCity VARCHAR(100),
  AdminState CHAR(2),
  AdminZip VARCHAR(10),
  Phone VARCHAR(20),
  Fax VARCHAR(20),
  PRIMARY KEY (AdminID)
);


-- -----------------------------------------------------
-- Table: Acct_AcctAdmin
-- -----------------------------------------------------
CREATE TABLE Acct_AcctAdmin (
  AccountName VARCHAR(255) NOT NULL,
  LocationName VARCHAR(255) NOT NULL,
  LocationAddr1 VARCHAR(255) NOT NULL,
  LocationCity VARCHAR(100) NOT NULL,
  LocationState CHAR(2) NOT NULL,
  LocationZip VARCHAR(10) NOT NULL,
  CompanyCode CHAR(2) NOT NULL,
  AdminID INT NOT NULL,
  PRIMARY KEY (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode, AdminID),
  CONSTRAINT FK_Acct_AcctAdmin_Account_h FOREIGN KEY (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode)
    REFERENCES Account_h (AccountName, LocationName, LocationAddr1, LocationCity, LocationState, LocationZip, CompanyCode),
  CONSTRAINT FK_Acct_AcctAdmin_AcctAdmin FOREIGN KEY (AdminID)
    REFERENCES AcctAdmin (AdminID)
);