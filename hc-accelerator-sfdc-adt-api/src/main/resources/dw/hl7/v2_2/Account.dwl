%dw 2.0
output application/java
import dw::hl7::helper
var ID = payload.Id
var PID=payload.Data[ID].PID

---
{
	RecordTypeId: vars.RecordType,
	FirstName: (PID."PID-05"."PN-02") default "",
	LastName: (PID."PID-05"."PN-01") default "",
	(HealthCloudGA__MedicalRecordNumber__c: PID."PID-02"."CK-01") if (PID."PID-02"."CK-01" != null),
	(HealthCloudGA__SourceSystemId__c: (PID."PID-03"."CM_PAT_ID-01")[0]),
	(dkom__Language__c: helper::getCommLang(PID."PID-15")) if (PID."PID-15" !=null),
	(PersonMailingStreet: (PID."PID-11"."AD-01")[0]) if ((PID."PID-11"."AD-01")[0] !=null),
	(PersonMailingCity: (PID."PID-11"."AD-03")[0]) if ((PID."PID-11"."AD-03")[0] !=null),
	(PersonMailingState: (PID."PID-11"."AD-04")[0]) if ((PID."PID-11"."AD-04")[0] !=null),
	(PersonMailingPostalCode: (PID."PID-11"."AD-05")[0]) if ((PID."PID-11"."AD-05")[0] !=null),
	(PersonMailingCountry: (PID."PID-11"."AD-06")[0]) if ((PID."PID-11"."AD-06")[0] !=null),
	(PersonHomePhone: (PID."PID-13")[0]) if ((PID."PID-13")[0] !=null),
	(PersonOtherPhone: (PID."PID-14")[0]) if ((PID."PID-14")[0] !=null),
	PersonBirthdate: PID."PID-07"."TS-01" as Date {format: "yyyyMMddHHmmss"} as String {format: "yyyy-MM-dd"} default null,
	(Last_4_digits_of_SSN__pc: PID."PID-19"[-4 to -1]) if (PID."PID-19" != null),
	(AccountNumber: PID."PID-18"."CK-01") if (PID."PID-18"."CK-01" != null)
}