# Health Cloud ADT System API

## Setup Instructions

### Salesforce Health Cloud - Enable Person Accounts
There are different ways to represent patients in Health Cloud. This template requires that the patients in Health Cloud are represented as Person Accounts. 
 1. Ask your Salesforce representative to make person accounts available in your organization.
 2. From Setup, enter Custom Settings in the Quick Find box, then select Custom Settings.
 3. In the list of custom settings, click Manage next to the Use Person Accounts custom settings.
 4. Click Edit next to Use Person Account.
 5. Select Enable. 
 After person accounts are enabled, assign them to profiles.
 Please refer to attached [document](https://developer.salesforce.com/docs/atlas.en-us.health_cloud.meta/health_cloud/admin_person_account_overview.htm) for the detailed explanation of representing patients in Health Cloud

### Salesforce Connector Configuration
MuleSoft's Salesforce Connector requires username, password, and optionally a security token to communicate with Salesforce. After obtaining the necessary credentials information configure it in the properties file located in `config/properties` folder.

`salesforce.username` should be configured in `config-<env>.yaml` file.

`salesforce.password` should be encrypted and configured in `config-secured-<env>.yaml` file

`salesforce.securityToken` should be encrypted and configured in `config-secured-<env>.yaml` file

Please refer to the attached [link](https://docs.mulesoft.com/mule-runtime/4.3/secure-configuration-properties) on how to secure the configuration properties. 



### Salesforce Composite Connector Configuration
This template uses Salesforce composite connector to perform atomic upserts to multiple Salesforce objects in a single transaction. It requires 'Connected App' in Salesforce. 
Please refer to the instructions in Salesforce docs [link](https://help.salesforce.com/articleView?id=connected_app_create.htm&type=5).

After creating the connected app obtaining the necessary credentials information (Consumer Key and Consumer Secret) configure it in the properties file located in `config/properties` folder.

`salesforce.consumerKey` should be configured in `config-<env>.yaml` file.

`salesforce.consumerSecret` should be encrypted and configured in `config-secured-<env>.yaml` file

Please refer to the attached [link](https://docs.mulesoft.com/mule-runtime/4.3/secure-configuration-properties) on how to secure the configuration properties. 

## Storing HL7 ADT messages in Health Cloud

This template follows the guidelines documented in the Health Cloud developers guide - [link](https://developer.salesforce.com/docs/atlas.en-us.health_cloud_object_reference.meta/health_cloud_object_reference/hl7_adt.htm#hl7_adt).

The specific mappings are documented below. 
### ADT Patient Identification (PID)
#### Account and Contact objects
|SEQ | HL7 Element | Field | Notes|
|----|----| ----| ----| 
|PID-02 | Medical Record Number | HealthCloudGA__MedicalRecordNumber__c ||
|PID-03 | Internal ID | HealthCloudGA__SourceSystemId__c | This is Salesforce External ID field. This should be unique. This will typically be an EPIC record identifier.|
|PID-05 | Patient Name | FirstName <br/> LastName ||
|PID-07 | Birth Date | PersonBirthDate | |
|PID-11 | Address | PersonMailingStreet <br/> PersonMailingCity <br/> PersonMailingState <br/> PersonMailingPostalCode <br/>PersonMailingCountry||
|PID-13 | Home Phone| PersonHomePhone| |
|PID-14 | Other Phone| PersonOtherPhone||                                         
|PID-15 | Communication Language | dkom__Language__c | |
|PID-18 | Account Number | AccountNumber| |
|PID-19 | Social Security Number | Last_4_digits_of_SSN__pc ||

#### EHR Patient object
|SEQ | HL7 Element | Field | Notes|
|----|----| ----| ----| 
|NA | NA | HealthCloudGA__Account__c | Salesforce Id of Person Account |
|PID-03 | Internal ID | HealthCloudGA__SourceSystemId__c | This is Salesforce External ID field. This should be unique. This will typically be an EPIC record identifier.|
|PID-05 | Patient Name | HealthCloudGA__GivenName1__c <br/> HealthCloudGA__FamilyName1__c ||
|PID-07 | Birth Date | HealthCloudGA__BirthDate__c | |
|PID-08 | Gender | HealthCloudGA__GenderLabel__c | |
|PID-11 | Address | HealthCloudGA__Address1Line1__c <br/> HealthCloudGA__Address1Line2__c <br/>HealthCloudGA__Address1City__c<br/> HealthCloudGA__Address1State__c <br/> HealthCloudGA__Address1PostalCode__c <br/>HealthCloudGA__Address1Country__c||
|PID-13 | Home Phone| PersonHomePhone| |
|PID-14 | Other Phone| PersonOtherPhone||                                         
|PID-15 | Communication Language | HealthCloudGA__Communication1Code__c | |
|PID-16 | Marital Status | HealthCloudGA__MaritalStatusLabel__c | |
|PID-18 | Account Number | AccountNumber| |
|PID-19 | Social Security Number | Last_4_digits_of_SSN__pc ||


### ADT Patient Visit (PV1)
|SEQ | HL7 Element | Field | Notes|
|----|----| ----| ----| 
|NA | NA | HealthCloudGA__Account__c | Salesforce Id of Person Account |
|PV1-02 | Patient Class | HealthCloudGA__Class__c | |
|PV1-03 | Assigned Patient Location | HealthCloudGA__Location1Name__c <br/> HealthCloudGA__Location1Type__c <br/> HealthCloudGA__Location1Description__c||
|PV1-04 | Admission Type | HealthCloudGA__ReasonLabel__c | |
|PV1-05 | Preadmit Number | HealthCloudGA__HospitalizationPreAdmissionId__c | |
|PV1-06 | Prior Patient Location |HealthCloudGA__HospitalizationOrigin__c ||
|PV1-08 | Referring Doctor	| HealthCloudGA__HospitalizeAdmitSourceCode__c| |
|PV1-10 | Hospital Service	| HealthCloudGA__Location1TypeLabel__c||                                         
|PV1-13 | Re-admission Indicator	 | HealthCloudGA__HospitalizeReadmission__c | |
|PV1-36 | Discharge Disposition	| HealthCloudGA__HospitalizeDischargeDispositionCode__c | |
|PV1-37 | Discharged to Location	 | HealthCloudGA__HospitalizeDestination__c| |
|PV1-38 | Diet Type	 | HealthCloudGA__HospitalizeDietLabel__c ||
|PV1-44 | Admit Date/Time	| HealthCloudGA__HospitalizePeriodStart__c ||
|PV1-45 | Discharge Date/Time	 | HealthCloudGA__HospitalizePeriodEnd__c ||




### ADT Allergies (AL1)

|SEQ | HL7 Element | Field | Notes|
|----|----| ----| ----| 
|NA | NA | HealthCloudGA__Account__c | Salesforce Id of Person Account |
|AL1-02 |Allergen Type Code	 | HealthCloudGA__SensitivityTypeLabel__c | |
|AL1-03 | Allergen Code/Mnemonic/Description | HealthCloudGA__StatusSystem__c <br/>HealthCloudGA__Substance255__c <br/>HealthCloudGA__SubstanceCodeSystem__c||
|AL1-04 | Allergy Severity Code	 | HealthCloudGA__CriticalityLabel__c||
|AL1-05 | Allergy Reaction Code	| HealthCloudGA__Reaction255__c| |
|AL1-06 | Identification Date	| HealthCloudGA__RecordedDate__c| |




## Security Considerations