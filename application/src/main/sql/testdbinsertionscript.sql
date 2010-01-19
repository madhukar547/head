/*
This file contains test data for the junit tests.
*/

/* Area office It belongs to the head office created by master scripts */
INSERT INTO OFFICE(OFFICE_ID, PARENT_OFFICE_ID, GLOBAL_OFFICE_NUM, STATUS_ID, OFFICE_CODE_ID, OFFICE_LEVEL_ID,  SEARCH_ID, OFFICE_SHORT_NAME, MAX_CHILD_COUNT,LOCAL_REMOTE_FLAG, DISPLAY_NAME, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, VERSION_NO)
 		VALUES(2,1,'0002',1,NULL,4,'1.1.1','MIF2',2,1,'TestAreaOffice',NULL,NULL,NULL,NULL,1);
 		
INSERT INTO OFFICE_ADDRESS (OFFICE_ADDRESS_ID, OFFICE_ID, ADDRESS_1, ADDRESS_2, ADDRESS_3, 
CITY, STATE, COUNTRY, ZIP, TELEPHONE) 
VALUES(2,2,'add2',null,null,null,null,null,null,null);

/* Branch office It belongs to the area office created by test script statements above*/
INSERT INTO OFFICE(OFFICE_ID, PARENT_OFFICE_ID, GLOBAL_OFFICE_NUM, STATUS_ID, OFFICE_CODE_ID, OFFICE_LEVEL_ID,  SEARCH_ID, OFFICE_SHORT_NAME, MAX_CHILD_COUNT,LOCAL_REMOTE_FLAG, DISPLAY_NAME, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, VERSION_NO)
 		VALUES(3,2,'0003',1,NULL,5,'1.1.1.1','MIF3',2,1,'TestBranchOffice',NULL,NULL,NULL,NULL,1); 		

INSERT INTO OFFICE_ADDRESS (OFFICE_ADDRESS_ID, OFFICE_ID, ADDRESS_1, ADDRESS_2, ADDRESS_3, 
CITY, STATE, COUNTRY, ZIP, TELEPHONE) 
VALUES(3,3,'add3',null,null,null,null,null,null,null);


 
 /*Non loan officer belonging to branch office with office id 3 */		
INSERT INTO PERSONNEL(PERSONNEL_ID,LEVEL_ID,GLOBAL_PERSONNEL_NUM,OFFICE_ID,
	TITLE,PERSONNEL_STATUS,PREFERRED_LOCALE,
	SEARCH_ID,MAX_CHILD_COUNT,PASSWORD,LOGIN_NAME,EMAIL_ID,PASSWORD_CHANGED,
	DISPLAY_NAME,CREATED_BY,CREATED_DATE,UPDATED_BY,UPDATED_DATE,
	NO_OF_TRIES,LAST_LOGIN,LOCKED,VERSION_NO)
VALUES(2,2,'2',3,
	1,1,1,
	null,1,null,'nonloanofficer',NULL,1,
	'non loan officer',1,NULL,1,NULL,
	4,NULL,0,0);

INSERT INTO PERSONNEL_DETAILS VALUES(2,'testnon loan officer',NULL,NULL,'MFI','123','1979-12-12',NULL,50,NULL,NULL,NULL,'Bangalore',NULL,NULL,'Bangalore','Bangalore','Bangalore',null,NULL);	

INSERT INTO PERSONNEL_ROLE (PERSONNEL_ROLE_ID, ROLE_ID, PERSONNEL_ID) 
VALUES(2,1,2);
/*Loan officer belonging to branch*/
INSERT INTO PERSONNEL(PERSONNEL_ID,LEVEL_ID,GLOBAL_PERSONNEL_NUM,OFFICE_ID,
	TITLE,PERSONNEL_STATUS,PREFERRED_LOCALE,
	SEARCH_ID,MAX_CHILD_COUNT,PASSWORD,LOGIN_NAME,EMAIL_ID,PASSWORD_CHANGED,
	DISPLAY_NAME,CREATED_BY,CREATED_DATE,UPDATED_BY,UPDATED_DATE,
	NO_OF_TRIES,LAST_LOGIN,LOCKED,VERSION_NO) 
VALUES(3,1,'3',3,
	1,1,1,
	null,1,null,'loanofficer',NULL,1,
	'loan officer',1,NULL,1,NULL,
	4,NULL,0,0);

INSERT INTO PERSONNEL_DETAILS VALUES(3,'testloan officer',NULL,NULL,'MFI','123','1979-12-12',NULL,50,NULL,NULL,NULL,'Bangalore',NULL,NULL,'Bangalore','Bangalore','Bangalore',null,NULL);

INSERT INTO PERSONNEL_ROLE (PERSONNEL_ROLE_ID, ROLE_ID, PERSONNEL_ID) 
VALUES(3,1,3);

INSERT INTO ROLE(ROLE_ID,ROLE_NAME,VERSION_NO,CREATED_BY,CREATED_DATE,UPDATED_BY,UPDATED_DATE)
VALUES(2,'SavingTestPermisson',1,NULL,NULL,NULL,NULL);
INSERT INTO ROLES_ACTIVITY(ACTIVITY_ID,ROLE_ID)
VALUES(182,2);
INSERT INTO ROLES_ACTIVITY(ACTIVITY_ID,ROLE_ID)
VALUES(183,2);

UPDATE FIELD_CONFIGURATION set PARENT_FIELD_CONFIG_ID = null;
DELETE FROM FIELD_CONFIGURATION;

/*master data for table FIELD_CONFIGURATION */
/*Second Last Name for client and personnel*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(1,'SecondLastName',1,1,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(2,'SecondLastName',17,1,1);
/*Government id*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(3,'GovernmentId',1,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(4,'GovernmentId',17,0,1);
/*External id for cleint group center personnel*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(5,'ExternalId',1,1,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(6,'ExternalId',12,1,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(7,'ExternalId',20,1,1);
/*Ethnicity, Citizenship, Handicapped, business Activities, Education Level, Photo*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(8,'Ethinicity',1,1,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(9,'Citizenship',1,1,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(10,'Handicapped',1,1,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(11,'BusinessActivities',1,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(12,'EducationLevel',1,1,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(13,'Photo',1,0,1);
/*SpouseFatharSecondLastName for Client*/ 
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(14,'SpouseFatherSecondLastName',1,1,1);
/*Trained and trained date*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(15,'Trained',1,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(16,'Trained',12,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(17,'TrainedDate',1,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(18,'TrainedDate',12,0,1);
/*Entire Address for client*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(19,'Address',1,0,0);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(20,'Address',12,0,0);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(21,'Address',20,0,0);
/**Address 1 for client group and center*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(22,'Address1',1,0,1,19);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(23,'Address1',12,1,1,20);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(24,'Address1',20,0,1,21);
/**Address 2 for client group and center*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(25,'Address2',1,0,1,19);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(26,'Address2',12,0,1,20);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(27,'Address2',20,0,1,21);
/**Address 3*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(28,'Address3',1,0,1,19);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(29,'Address3',12,0,1,20);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(30,'Address3',20,0,1,21);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(31,'Address3',15,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(32,'Address3',17,0,1);
/*City*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(33,'City',1,0,1,19);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(34,'City',12,1,1,20);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(35,'City',20,0,1,21);
/*State*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(36,'State',1,0,1,19);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(37,'State',12,1,1,20);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(38,'State',20,0,1,21);
/*Country*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(39,'Country',1,0,1,19);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(40,'Country',12,1,1,20);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(41,'Country',20,0,1,21);
/*Postal Code*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(42,'PostalCode',1,0,1,19);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(43,'PostalCode',12,1,1,20);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG,PARENT_FIELD_CONFIG_ID)
VALUES(44,'PostalCode',20,1,0,21);
/**Phone number*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(45,'PhoneNumber',1,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(46,'PhoneNumber',12,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(47,'PhoneNumber',20,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(48,'PhoneNumber',17,1,1);
/*Purpose Of Loan*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(49,'PurposeOfLoan',22,1,0);
/*Collateral Type and Notes For Loan*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(50,'CollateralType',22,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(51,'CollateralNotes',22,0,1);
/*Receipt id and date*/
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(52,'ReceiptId',1,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(53,'ReceiptId',12,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(54,'ReceiptId',20,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(55,'ReceiptId',21,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(56,'ReceiptId',22,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(57,'ReceiptId',23,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(58,'ReceiptDate',1,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(59,'ReceiptDate',12,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(60,'ReceiptDate',20,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(61,'ReceiptDate',21,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(62,'ReceiptDate',22,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(63,'ReceiptDate',23,0,1);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(64,'Address2',15,0,0);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(65,'Address2',17,0,0);
INSERT INTO FIELD_CONFIGURATION(FIELD_CONFIG_ID,FIELD_NAME,ENTITY_ID,MANDATORY_FLAG,HIDDEN_FLAG)
VALUES(79,'City',15,0,0);



/* make the Non-Working day a working day*/
UPDATE WEEK_DAYS_MASTER SET WORKING_DAY = 1 WHERE WEEK_DAYS_MASTER_ID = 1;

/* make a listdatasource for test*/
Insert into report_datasource (DATASOURCE_ID,NAME,DRIVER,URL,USERNAME,PASSWORD) values(1,'test','test','test
','test','test');

/* retain default custom fields for testing purposes */
INSERT INTO LOOKUP_ENTITY(ENTITY_ID,ENTITY_NAME,DESCRIPTION)
VALUES(58,'ReplacementStatus','Custom Field ReplacementStatus for Client');
INSERT INTO LOOKUP_ENTITY(ENTITY_ID,ENTITY_NAME,DESCRIPTION)
VALUES(59,'GRTStaffId','Custom Field GRTStaffId for Group');
INSERT INTO LOOKUP_ENTITY(ENTITY_ID,ENTITY_NAME,DESCRIPTION)
VALUES(60,'MeetingTime','Custom Field Meeting Time for Center');
INSERT INTO LOOKUP_ENTITY(ENTITY_ID,ENTITY_NAME,DESCRIPTION)
VALUES(61,'DistanceFromBoToCenter','Custom Field Distance from BO To Center');
INSERT INTO LOOKUP_ENTITY(ENTITY_ID,ENTITY_NAME,DESCRIPTION)
VALUES(63,'NoOfClientsPerGroup','Custom Field  No. of Clients per Group');
INSERT INTO LOOKUP_ENTITY(ENTITY_ID,ENTITY_NAME,DESCRIPTION)
VALUES(64,'NoOfClientsPerCenter','Custom Field No. of Clients per Center');
INSERT INTO LOOKUP_ENTITY(ENTITY_ID,ENTITY_NAME,DESCRIPTION)
VALUES(65,'DistanceFromHoToBO','Custom Field Distance from HO To BO for office');
INSERT INTO LOOKUP_ENTITY(ENTITY_ID,ENTITY_NAME,DESCRIPTION)
VALUES(66,'ExternalLoanId','Custom Field ExternalID for office');
INSERT INTO LOOKUP_ENTITY(ENTITY_ID,ENTITY_NAME,DESCRIPTION)
VALUES(67,'ExternalSavingsId','Custom Field ExternalSavingsId');


INSERT INTO LOOKUP_LABEL(LABEL_ID,ENTITY_ID,LOCALE_ID,ENTITY_NAME)
VALUES(108,58,1,'Replacement Status');
INSERT INTO LOOKUP_LABEL(LABEL_ID,ENTITY_ID,LOCALE_ID,ENTITY_NAME)
VALUES(110,59,1,'GRT Staff Id');
INSERT INTO LOOKUP_LABEL(LABEL_ID,ENTITY_ID,LOCALE_ID,ENTITY_NAME)
VALUES(112,60,1,'Meeting Time for Center');
INSERT INTO LOOKUP_LABEL(LABEL_ID,ENTITY_ID,LOCALE_ID,ENTITY_NAME)
VALUES(114,61,1,'Distance from BO to Center');

INSERT INTO LOOKUP_LABEL(LABEL_ID,ENTITY_ID,LOCALE_ID,ENTITY_NAME)
VALUES(118,63,1,'Number of Clients per Group');
INSERT INTO LOOKUP_LABEL(LABEL_ID,ENTITY_ID,LOCALE_ID,ENTITY_NAME)
VALUES(120,64,1,'Number of Clients per Center');
INSERT INTO LOOKUP_LABEL(LABEL_ID,ENTITY_ID,LOCALE_ID,ENTITY_NAME)
VALUES(122,65,1,'Distance from HO to BO for office');
INSERT INTO LOOKUP_LABEL(LABEL_ID,ENTITY_ID,LOCALE_ID,ENTITY_NAME)
VALUES(124,66,1,'External Loan Id');
INSERT INTO LOOKUP_LABEL(LABEL_ID,ENTITY_ID,LOCALE_ID,ENTITY_NAME)
VALUES(126,67,1,'External Savings Id');


/* The table Custom Field Definition will contain the additional information fields that an MFI configure Mifosthat will be required to be shown for a client , group etc for the MFI - Configuration */
/* Client*/
INSERT INTO CUSTOM_FIELD_DEFINITION(FIELD_ID,ENTITY_ID,FIELD_TYPE,ENTITY_TYPE,MANDATORY_FLAG,LEVEL_ID,DEFAULT_VALUE) 
VALUES (3,58,2,1,0,1,NULL);
/*Group*/
INSERT INTO CUSTOM_FIELD_DEFINITION(FIELD_ID,ENTITY_ID,FIELD_TYPE,ENTITY_TYPE,MANDATORY_FLAG,LEVEL_ID,DEFAULT_VALUE) 
VALUES (4,59,2,12,1,2,NULL);
/*Center*/
INSERT INTO CUSTOM_FIELD_DEFINITION(FIELD_ID,ENTITY_ID,FIELD_TYPE,ENTITY_TYPE,MANDATORY_FLAG,LEVEL_ID,DEFAULT_VALUE)
VALUES (5,60,2,20,0,3,NULL);
INSERT INTO CUSTOM_FIELD_DEFINITION(FIELD_ID,ENTITY_ID,FIELD_TYPE,ENTITY_TYPE,MANDATORY_FLAG,LEVEL_ID,DEFAULT_VALUE)
VALUES (6,61,1,20,1,3,NULL);
/*Personnel*/
INSERT INTO CUSTOM_FIELD_DEFINITION(FIELD_ID,ENTITY_ID,FIELD_TYPE,ENTITY_TYPE,MANDATORY_FLAG,LEVEL_ID,DEFAULT_VALUE)
VALUES (9,62,2,17,0,1,NULL);
/*Office*/
INSERT INTO CUSTOM_FIELD_DEFINITION(FIELD_ID,ENTITY_ID,FIELD_TYPE,ENTITY_TYPE,MANDATORY_FLAG,LEVEL_ID,DEFAULT_VALUE)
VALUES (10,62,2,15,0,1,NULL);
INSERT INTO CUSTOM_FIELD_DEFINITION(FIELD_ID,ENTITY_ID,FIELD_TYPE,ENTITY_TYPE,MANDATORY_FLAG,LEVEL_ID,DEFAULT_VALUE) 
VALUES (11,63,1,15,1,2,NULL);
INSERT INTO CUSTOM_FIELD_DEFINITION(FIELD_ID,ENTITY_ID,FIELD_TYPE,ENTITY_TYPE,MANDATORY_FLAG,LEVEL_ID,DEFAULT_VALUE)
VALUES (12,64,1,15,1,2,NULL);
INSERT INTO CUSTOM_FIELD_DEFINITION(FIELD_ID,ENTITY_ID,FIELD_TYPE,ENTITY_TYPE,MANDATORY_FLAG,LEVEL_ID,DEFAULT_VALUE)
VALUES (13,65,1,15,0,2,NULL);

/*Loan*/
INSERT INTO CUSTOM_FIELD_DEFINITION(FIELD_ID,ENTITY_ID,FIELD_TYPE,ENTITY_TYPE,MANDATORY_FLAG,LEVEL_ID,DEFAULT_VALUE)
VALUES (7,66,2,22,0,1,NULL);
/*Savings*/
INSERT INTO CUSTOM_FIELD_DEFINITION(FIELD_ID,ENTITY_ID,FIELD_TYPE,ENTITY_TYPE,MANDATORY_FLAG,LEVEL_ID,DEFAULT_VALUE)
VALUES (8,67,2,21,0,1,NULL);

/* The table Personnelcustom field contains the additional information of the default user  - Configuration */
INSERT INTO PERSONNEL_CUSTOM_FIELD (FIELD_ID,PERSONNEL_ID,FIELD_VALUE)
VALUES(9,1,'');

INSERT INTO OFFICE_CUSTOM_FIELD (OFFICE_ID,FIELD_ID,FIELD_VALUE) VALUES(1,10,'');
INSERT INTO OFFICE_CUSTOM_FIELD (OFFICE_ID,FIELD_ID,FIELD_VALUE) VALUES(1,11,'');
INSERT INTO OFFICE_CUSTOM_FIELD (OFFICE_ID,FIELD_ID,FIELD_VALUE) VALUES(1,12,'');
INSERT INTO OFFICE_CUSTOM_FIELD (OFFICE_ID,FIELD_ID,FIELD_VALUE) VALUES(1,13,'');


