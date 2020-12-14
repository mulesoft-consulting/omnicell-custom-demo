%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "compositeResponse": [
    {
      "body": null,
      "httpHeaders": {},
      "httpStatusCode": 204,
      "referenceId": "Account"
    },
    {
      "body": null,
      "httpHeaders": {},
      "httpStatusCode": 204,
      "referenceId": "EHR"
    },
    {
      "body": {
        "id": "a4T5w000002NGJHEA4",
        "success": true,
        "errors": []
      },
      "httpHeaders": {
        "Location": "/services/data/v38.0/sobjects/HealthCloudGA__EhrEncounter__c/a4T5w000002NGJHEA4"
      },
      "httpStatusCode": 201,
      "referenceId": "Visit"
    },
    {
      "body": {
        "id": "a4O5w000000VlHcEAK",
        "success": true,
        "errors": []
      },
      "httpHeaders": {
        "Location": "/services/data/v38.0/sobjects/HealthCloudGA__EhrCondition__c/a4O5w000000VlHcEAK"
      },
      "httpStatusCode": 201,
      "referenceId": "Condition"
    },
    {
      "body": {
        "id": "a4Y5w0000054qoaEAA",
        "success": true,
        "errors": []
      },
      "httpHeaders": {
        "Location": "/services/data/v38.0/sobjects/HealthCloudGA__EhrObservation__c/a4Y5w0000054qoaEAA"
      },
      "httpStatusCode": 201,
      "referenceId": "Observation0"
    },
    {
      "body": {
        "id": "a4Y5w0000054qobEAA",
        "success": true,
        "errors": []
      },
      "httpHeaders": {
        "Location": "/services/data/v38.0/sobjects/HealthCloudGA__EhrObservation__c/a4Y5w0000054qobEAA"
      },
      "httpStatusCode": 201,
      "referenceId": "Observation1"
    },
    {
      "body": {
        "id": "a4Y5w0000054qocEAA",
        "success": true,
        "errors": []
      },
      "httpHeaders": {
        "Location": "/services/data/v38.0/sobjects/HealthCloudGA__EhrObservation__c/a4Y5w0000054qocEAA"
      },
      "httpStatusCode": 201,
      "referenceId": "Observation2"
    },
    {
      "body": {
        "id": "a4Y5w0000054qodEAA",
        "success": true,
        "errors": []
      },
      "httpHeaders": {
        "Location": "/services/data/v38.0/sobjects/HealthCloudGA__EhrObservation__c/a4Y5w0000054qodEAA"
      },
      "httpStatusCode": 201,
      "referenceId": "Observation3"
    },
    {
      "body": {
        "id": "a4Y5w0000054qoeEAA",
        "success": true,
        "errors": []
      },
      "httpHeaders": {
        "Location": "/services/data/v38.0/sobjects/HealthCloudGA__EhrObservation__c/a4Y5w0000054qoeEAA"
      },
      "httpStatusCode": 201,
      "referenceId": "Observation4"
    }
  ]
})