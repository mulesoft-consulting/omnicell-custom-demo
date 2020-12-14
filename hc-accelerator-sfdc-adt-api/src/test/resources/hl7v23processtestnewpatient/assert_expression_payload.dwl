%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "compositeResponse": [
    {
      "body": {
        "id": "0015w00002B4yQnAAJ",
        "success": true,
        "errors": []
      },
      "httpHeaders": {
        "Location": "/services/data/v38.0/sobjects/Account/0015w00002B4yQnAAJ"
      },
      "httpStatusCode": 201,
      "referenceId": "Account"
    },
    {
      "body": {
        "id": "a4b5w000000REiiAAG",
        "success": true,
        "errors": []
      },
      "httpHeaders": {
        "Location": "/services/data/v38.0/sobjects/HealthCloudGA__EhrPatient__c/a4b5w000000REiiAAG"
      },
      "httpStatusCode": 201,
      "referenceId": "EHR"
    },
    {
      "body": {
        "id": "a4T5w000002NGaCEAW",
        "success": true,
        "errors": []
      },
      "httpHeaders": {
        "Location": "/services/data/v38.0/sobjects/HealthCloudGA__EhrEncounter__c/a4T5w000002NGaCEAW"
      },
      "httpStatusCode": 201,
      "referenceId": "Visit"
    },
    {
      "body": {
        "id": "a4H5w0000012X4PEAU",
        "success": true,
        "errors": []
      },
      "httpHeaders": {
        "Location": "/services/data/v38.0/sobjects/HealthCloudGA__EhrAllergyIntolerance__c/a4H5w0000012X4PEAU"
      },
      "httpStatusCode": 201,
      "referenceId": "Allergy0"
    },
    {
      "body": {
        "id": "a4Y5w0000054sLrEAI",
        "success": true,
        "errors": []
      },
      "httpHeaders": {
        "Location": "/services/data/v38.0/sobjects/HealthCloudGA__EhrObservation__c/a4Y5w0000054sLrEAI"
      },
      "httpStatusCode": 201,
      "referenceId": "Observation0"
    },
    {
      "body": {
        "id": "a4Y5w0000054sLsEAI",
        "success": true,
        "errors": []
      },
      "httpHeaders": {
        "Location": "/services/data/v38.0/sobjects/HealthCloudGA__EhrObservation__c/a4Y5w0000054sLsEAI"
      },
      "httpStatusCode": 201,
      "referenceId": "Observation1"
    }
  ]
})