%dw 2.0
output application/java
import dw::hl7::helper
var ID = payload.Id
var ZIF=payload.Data[ID].ZIF
---
{
	(HealthCloudGA__Account__c: "@{Account.id}") if vars.existingPersonAccountId == null,
	(HealthCloudGA__CategoryCode__c: (ZIF."ZIF-01")[0]) if((ZIF."ZIF-01")[0] != null),
	(HealthCloudGA__CodeLabel__c: (ZIF."ZIF-01")[1]) if((ZIF."ZIF-01")[1] != null)
}