%dw 2.0
output application/java
import dw::hl7::helper
var ID = payload.Id
var PV=payload.Data[ID].PV1
---
{
	(HealthCloudGA__Account__c: "@{Account.id}") if vars.existingPersonAccountId == null,
	(HealthCloudGA__Account__c: vars.existingPersonAccountId) if vars.existingPersonAccountId != null,
	HealthCloudGA__Class__c: helper::getPatientClass(PV."PV1-02") default "",
	(HealthCloudGA__Location1Name__c: PV."PV1-03"."CM_INTERNAL_LOCATION-01") if (PV."PV1-03"."CM_INTERNAL_LOCATION-01" != null),
	(HealthCloudGA__Location1Type__c : PV."PV1-03"."CM_INTERNAL_LOCATION-04") if (PV."PV1-03"."CM_INTERNAL_LOCATION-04" != null),
	(HealthCloudGA__Location1Description__c : PV."PV1-03"."CM_INTERNAL_LOCATION-05") if (PV."PV1-03"."CM_INTERNAL_LOCATION-05" != null),
	(HealthCloudGA__ReasonLabel__c: helper::getAdmissionType(PV."PV1-04")) if (PV."PV1-04" != null),
	(HealthCloudGA__HospitalizationPreAdmissionId__c: PV."PV1-05") if (PV."PV1-05" != null),
//	(HealthCloudGA__HospitalizePreAdmissionId__c: PV."PV1-05") if (PV."PV1-05" != null),
	(HealthCloudGA__HospitalizationOrigin__c: PV."PV1-06"."CM_INTERNAL_LOCATION-01") if (PV."PV1-06"."CM_INTERNAL_LOCATION-01" != null),
//	(HealthCloudGA__HospitalizeOrigin__c: PV."PV1-06"."CM_INTERNAL_LOCATION-01") if (PV."PV1-06"."CM_INTERNAL_LOCATION-01" != null),
	(HealthCloudGA__HospitalizeAdmitSourceCode__c: (PV."PV1-08"."CN_PHYSICIAN-01")[0]) if ((PV."PV1-08"."CN_PHYSICIAN-01")[0] != null),
//	HealthCloudGA__HospitalAdmitSourceLabel__c: ((payload.Data.ADT_A04.PV1."PV1-08"."CN_PHYSICIAN-03")[0] ++ " " ++ (payload.Data.ADT_A04.PV1."PV1-08"."CN_PHYSICIAN-02")[0]) default "",
	(HealthCloudGA__Location1TypeLabel__c: PV."PV1-10") if (PV."PV1-10" != null),
	(HealthCloudGA__HospitalizeReadmission__c: helper::getReAdmissionInd(PV."PV1-13")) if (PV."PV1-13" != null),
	(HealthCloudGA__HospitalizeDischargeDispositionCode__c: PV."PV1-36") if (PV."PV1-36" != null),
	(HealthCloudGA__HospitalizeDestination__c: PV."PV1-37"."CM_DLD-01") if(PV."PV1-37"."CM_DLD-01" != null),
	(HealthCloudGA__HospitalizeDietLabel__c: PV."PV1-38") if(PV."PV1-38" != null),
//	(HealthCloudGA__Location1Name__c: PV."PV1-42"."CM_INTERNAL_LOCATION-01") if (PV."PV1-42"."CM_INTERNAL_LOCATION-01" != null),
//	(HealthCloudGA__Location1Type__c : PV."PV1-42"."CM_INTERNAL_LOCATION-04") if (PV."PV1-42"."CM_INTERNAL_LOCATION-04" != null),
//	(HealthCloudGA__Location1Description__c : PV."PV1-42"."CM_INTERNAL_LOCATION-05") if (PV."PV1-42"."CM_INTERNAL_LOCATION-05" != null),
//	(HealthCloudGA__Location1Name__c: PV."PV1-43"."CM_INTERNAL_LOCATION-01") if (PV."PV1-43"."CM_INTERNAL_LOCATION-01" != null),
//	(HealthCloudGA__Location1Type__c : PV."PV1-43"."CM_INTERNAL_LOCATION-04") if (PV."PV1-43"."CM_INTERNAL_LOCATION-04" != null),
//	(HealthCloudGA__Location1Description__c : PV."PV1-43"."CM_INTERNAL_LOCATION-05") if (PV."PV1-43"."CM_INTERNAL_LOCATION-05" != null),
	HealthCloudGA__HospitalizePeriodStart__c: PV."PV1-44"."TS-01" as LocalDateTime {format: "yyyyMMddHHmmss"} as DateTime {format: "yyyy-MM-dd'T'HH:mm:ss.SSS"} default null,
	HealthCloudGA__HospitalizePeriodEnd__c: PV."PV1-45"."TS-01" as LocalDateTime {format: "yyyyMMddHHmmss"} as DateTime {format: "yyyy-MM-dd'T'HH:mm:ss.SSS"} default null
		 
}