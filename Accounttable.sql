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



-- =================================================================
-- =================================================================
-- SQL DDL for Account Related Tables
-- Inferred from the ERD provided.
-- Designed for import into data modeling tools like Erwin.
-- =================================================================

-- -----------------------------------------------------
-- Table: CompanyCode
-- -----------------------------------------------------
CREATE TABLE CompanyCode (
  CompanyCode VARCHAR(10) NOT NULL,
  CompanyName VARCHAR(100),
  LegacyCompanyNo VARCHAR(50),
  CONSTRAINT PK_CompanyCode PRIMARY KEY (CompanyCode)
);

-- -----------------------------------------------------
-- Table: Account
-- Note: Renamed from "Account-h" for SQL compatibility.
-- -----------------------------------------------------
CREATE TABLE Account (
  AccountName VARCHAR(100) NOT NULL,
  AccountName2 VARCHAR(100),
  LocationAddress1 VARCHAR(255) NOT NULL,
  LocationAddress2 VARCHAR(255),
  LocationCity VARCHAR(100) NOT NULL,
  LocationState VARCHAR(50) NOT NULL,
  LocationZip VARCHAR(10) NOT NULL,
  CompanyCode VARCHAR(10) NOT NULL,
  -- -----------------------------------------------------
  TaxIDNumber VARCHAR(20),
  NumberOfEmployees INT,
  NumberOfEmployeesDate DATE,
  ActivityStatus VARCHAR(50),
  ActivityStatusDate DATE,
  GroupNumber VARCHAR(50),
  LegacyFlexID VARCHAR(50),
  AccountEstablishedDate DATE,
  PlanYearStartDate DATE,
  PlanYearEndDate DATE,
  SubsequentYearStartDate DATE,
  IndustryDescription TEXT,
  DualCompanyFlag CHAR(1),
  ComplexAccountFlag CHAR(1),
  StandardIndustryCode VARCHAR(20),
  AnnualizedPremium DECIMAL(18, 2),
  NoOutstandingInvoices INT,
  NoMonthsInactive INT,
  LastInvoicePaidDate DATE,
  LastInvoicePaidDueDate DATE,
  LastInvoiceGenDate DATE,
  NextInvoiceGenDate DATE,
  LastServiceCallDate DATE,
  LastBillCount INT,
  DisabilityOfferingStartDate DATE,
  LocationPhone VARCHAR(20),
  AddressInformationSource VARCHAR(100),
  WebAddress VARCHAR(255),
  SpecialHandlingCode VARCHAR(20),
  MultiLocationAccountFlag CHAR(1),
  PEOFlag CHAR(1),
  PreExistingOfferingTaxStatus VARCHAR(50),
  TransOneFlag CHAR(1),
  HSAFlag CHAR(1),
  HRAFlag CHAR(1),
  DataConfidenceLevel VARCHAR(50),
  TotalPolicyCount INT,
  PendingAnnualizedPremium DECIMAL(18, 2),
  PercentByLineOfBusiness VARCHAR(255),
  ScheduledLapseDate DATE,
  PenetrationPercentage DECIMAL(5, 2),
  NoOfGAPsAccounts INT,
  CONSTRAINT PK_Account PRIMARY KEY (AccountName, LocationAddress1, LocationCity, LocationState, LocationZip, CompanyCode),
  CONSTRAINT FK_Account_CompanyCode FOREIGN KEY (CompanyCode)
    REFERENCES CompanyCode (CompanyCode)
);

-- -----------------------------------------------------
-- Table: AdminRole
-- -----------------------------------------------------
CREATE TABLE AdminRole (
  AdminRole VARCHAR(50) NOT NULL,
  AdminDescription TEXT,
  CONSTRAINT PK_AdminRole PRIMARY KEY (AdminRole)
);

-- -----------------------------------------------------
-- Table: AcctAdmin
-- -----------------------------------------------------
CREATE TABLE AcctAdmin (
  AdminLastName VARCHAR(100) NOT NULL,
  AdminFirstName VARCHAR(100) NOT NULL,
  AdminMiddleInitial CHAR(1) NOT NULL,
  AdminSuffix VARCHAR(10) NOT NULL,
  AdminAddress1 VARCHAR(255),
  AdminAddress2 VARCHAR(255),
  AdminCity VARCHAR(100),
  AdminState VARCHAR(50),
  AdminZip VARCHAR(10),
  -- -----------------------------------------------------
  Phone VARCHAR(20),
  FaxNumber VARCHAR(20),
  Gender CHAR(1),
  EMailAddress VARCHAR(255),
  CONSTRAINT PK_AcctAdmin PRIMARY KEY (AdminLastName, AdminFirstName, AdminMiddleInitial, AdminSuffix)
);

-- -----------------------------------------------------
-- Table: AccountRelation
-- -----------------------------------------------------
CREATE TABLE AccountRelation (
  AccountName VARCHAR(100) NOT NULL,
  AccountName2 VARCHAR(100),
  CompanyCode VARCHAR(10) NOT NULL,
  LocationAddress1 VARCHAR(255) NOT NULL,
  LocationAddress2 VARCHAR(255),
  LocationCity VARCHAR(100) NOT NULL,
  LocationState VARCHAR(50) NOT NULL,
  LocationZip VARCHAR(10) NOT NULL,
  MasterAcctName VARCHAR(100) NOT NULL,
  MasterAcctName2 VARCHAR(100),
  MasterAcctAddress1 VARCHAR(255) NOT NULL,
  MasterAcctAddress2 VARCHAR(255),
  MasterAcctCity VARCHAR(100) NOT NULL,
  MasterAcctState VARCHAR(50) NOT NULL,
  MasterAcctZip VARCHAR(10) NOT NULL,
  RelationshipType VARCHAR(50) NOT NULL,
  RelationTypeDate DATE NOT NULL,
  CONSTRAINT PK_AccountRelation PRIMARY KEY (AccountName, CompanyCode, LocationAddress1, LocationCity, LocationState, LocationZip, MasterAcctName, MasterAcctAddress1, MasterAcctCity, MasterAcctState, MasterAcctZip, RelationshipType, RelationTypeDate),
  CONSTRAINT FK_AccountRelation_Account FOREIGN KEY (AccountName, LocationAddress1, LocationCity, LocationState, LocationZip, CompanyCode)
    REFERENCES Account (AccountName, LocationAddress1, LocationCity, LocationState, LocationZip, CompanyCode),
  CONSTRAINT FK_AccountRelation_MasterAccount FOREIGN KEY (MasterAcctName, MasterAcctAddress1, MasterAcctCity, MasterAcctState, MasterAcctZip, CompanyCode)
    REFERENCES Account (AccountName, LocationAddress1, LocationCity, LocationState, LocationZip, CompanyCode)
);

-- -----------------------------------------------------
-- Table: AccountEligibility
-- -----------------------------------------------------
CREATE TABLE AccountEligibility (
  AccountName VARCHAR(100) NOT NULL,
  AccountName2 VARCHAR(100),
  LocationAddress1 VARCHAR(255) NOT NULL,
  LocationAddress2 VARCHAR(255),
  LocationCity VARCHAR(100) NOT NULL,
  LocationState VARCHAR(50) NOT NULL,
  LocationZip VARCHAR(10) NOT NULL,
  StartDate DATE NOT NULL,
  CompanyCode VARCHAR(10) NOT NULL,
    -- -----------------------------------------------------
  Description TEXT,
  EndDate DATE,
  CONSTRAINT PK_AccountEligibility PRIMARY KEY (AccountName, LocationAddress1, LocationCity, LocationState, LocationZip, StartDate, CompanyCode),
  CONSTRAINT FK_AccountEligibility_Account FOREIGN KEY (AccountName, LocationAddress1, LocationCity, LocationState, LocationZip, CompanyCode)
    REFERENCES Account (AccountName, LocationAddress1, LocationCity, LocationState, LocationZip, CompanyCode)
);

-- -----------------------------------------------------
-- Table: Account_Member
-- -----------------------------------------------------
CREATE TABLE Account_Member (
  AccountName VARCHAR(100) NOT NULL,
  AccountName2 VARCHAR(100),
  LocationAddress1 VARCHAR(255) NOT NULL,
  LocationAddress2 VARCHAR(255),
  LocationCity VARCHAR(100) NOT NULL,
  LocationState VARCHAR(50) NOT NULL,
  LocationZip VARCHAR(10) NOT NULL,
  CustLastName VARCHAR(100) NOT NULL,
  CustFirstName VARCHAR(100) NOT NULL,
  CustMiddleInitial CHAR(1) NOT NULL,
  CustDOB DATE NOT NULL,
  StartDate DATE NOT NULL,
  CustSuffix VARCHAR(10) NOT NULL,
  CompanyCode VARCHAR(10) NOT NULL,
 -- -----------------------------------------------------
  FSAContributionAmount DECIMAL(18, 2),
  CustIBAcctDepartmentName VARCHAR(100),
  EndDate DATE,
  CONSTRAINT PK_Account_Member PRIMARY KEY (AccountName, LocationAddress1, LocationCity, LocationState, LocationZip, CustLastName, CustFirstName, CustMiddleInitial, CustDOB, StartDate, CompanyCode),
  CONSTRAINT FK_AccountMember_Account FOREIGN KEY (AccountName, LocationAddress1, LocationCity, LocationState, LocationZip, CompanyCode)
    REFERENCES Account (AccountName, LocationAddress1, LocationCity, LocationState, LocationZip, CompanyCode),
  CONSTRAINT FK_AccountMember_Customer FOREIGN KEY (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
    REFERENCES Customer (CustLastName, CustFirstName, CustMiddleInitial, CustSuffix, CustDOB)
);

-- =================================================================
-- SQL DDL for Territory and Organizational Structure Tables (Revised)
-- Corrected based on new ERD images provided.
-- =================================================================

-- -----------------------------------------------------
-- Table: Territory
-- -----------------------------------------------------
CREATE TABLE Territory (
  TerritoryName VARCHAR(100) NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE,
  CONSTRAINT PK_Territory PRIMARY KEY (TerritoryName, StartDate)
);

-- -----------------------------------------------------
-- Table: State
-- -----------------------------------------------------
CREATE TABLE State (
  StateCode VARCHAR(2) NOT NULL,
  StateName VARCHAR(50),
  CONSTRAINT PK_State PRIMARY KEY (StateCode)
);

-- -----------------------------------------------------
-- Table: StateOperation
-- -----------------------------------------------------
CREATE TABLE StateOperation (
  StateOperationName VARCHAR(100) NOT NULL,
  TerritoryName VARCHAR(100) NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE,
  CONSTRAINT PK_StateOperation PRIMARY KEY (StateOperationName, TerritoryName, StartDate),
  CONSTRAINT FK_StateOperation_Territory FOREIGN KEY (TerritoryName, StartDate)
    REFERENCES Territory (TerritoryName, StartDate)
);

-- -----------------------------------------------------
-- Table: County
-- -----------------------------------------------------
CREATE TABLE County (
  CountyCode VARCHAR(10) NOT NULL,
  StateCode VARCHAR(2) NOT NULL,
  CountyName VARCHAR(100),
  CONSTRAINT PK_County PRIMARY KEY (CountyCode, StateCode),
  CONSTRAINT FK_County_State FOREIGN KEY (StateCode)
    REFERENCES State (StateCode)
);

-- -----------------------------------------------------
-- Table: StateOperationDivision
-- -----------------------------------------------------
CREATE TABLE StateOperationDivision (
  StateOperationDivisionName VARCHAR(100) NOT NULL,
  StateOperationName VARCHAR(100) NOT NULL,
  TerritoryName VARCHAR(100) NOT NULL,
  StateCode VARCHAR(2) NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE,
  CONSTRAINT PK_StateOperationDivision PRIMARY KEY (StateOperationDivisionName, StateOperationName, TerritoryName, StateCode, StartDate),
  CONSTRAINT FK_StateOperationDivision_StateOperation FOREIGN KEY (StateOperationName, TerritoryName, StartDate)
    REFERENCES StateOperation (StateOperationName, TerritoryName, StartDate),
  CONSTRAINT FK_StateOperationDivision_State FOREIGN KEY (StateCode)
    REFERENCES State (StateCode)
);

-- -----------------------------------------------------
-- Table: Region
-- -----------------------------------------------------
CREATE TABLE Region (
  RegionName VARCHAR(100) NOT NULL,
  StateOperationDivisionName VARCHAR(100) NOT NULL,
  StateOperationName VARCHAR(100) NOT NULL,
  TerritoryName VARCHAR(100) NOT NULL,
  StateCode VARCHAR(2) NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE,
  CONSTRAINT PK_Region PRIMARY KEY (RegionName, StateOperationDivisionName, StateOperationName, TerritoryName, StateCode, StartDate),
  CONSTRAINT FK_Region_StateOperationDivision FOREIGN KEY (StateOperationDivisionName, StateOperationName, TerritoryName, StateCode, StartDate)
    REFERENCES StateOperationDivision (StateOperationDivisionName, StateOperationName, TerritoryName, StateCode, StartDate)
);

-- -----------------------------------------------------
-- Table: District
-- -----------------------------------------------------
CREATE TABLE District (
  DistrictName VARCHAR(100) NOT NULL,
  RegionName VARCHAR(100) NOT NULL,
  StateOperationDivisionName VARCHAR(100) NOT NULL,
  StateOperationName VARCHAR(100) NOT NULL,
  TerritoryName VARCHAR(100) NOT NULL,
  StateCode VARCHAR(2) NOT NULL,
  StartDate DATE NOT NULL,
  EndDate DATE,
  CONSTRAINT PK_District PRIMARY KEY (DistrictName, RegionName, StateOperationDivisionName, StateOperationName, TerritoryName, StateCode, StartDate),
  CONSTRAINT FK_District_Region FOREIGN KEY (RegionName, StateOperationDivisionName, StateOperationName, TerritoryName, StateCode, StartDate)
    REFERENCES Region (RegionName, StateOperationDivisionName, StateOperationName, TerritoryName, StateCode, StartDate)
);