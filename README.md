# Platform Cache

# Overview

Salesforce platform cache is lot faster than normal queries. Also when you run a caching method with SOQL, it only counts against the limit first time. Any subsequent cache runs doesn't count against per transaction limits. Data you store in cache doesn't have to be sObject records, you can store calculated data with wrapper around it as well. But thing you have to keep in mind is data in org partition stays life for 24 hours, and session for 8 hours. Unless you clear the cache and re-cache it, data updates in transaction wouldn't be applied to data in cache. Keep that in mind when you are considering to use the Salesfroce Platform Cache. This is my attempt to build resusable framework around it.

# How to Setup

Standard Cachbuilder interface would only allow alphanumeric string as an input variable for doload method. It wouldn't allow special characters or spaces in a String. So as a way around, this framework uses custom settings. Create a Custom Settings to store your queries for cachebuilder class.

<img width="2874" alt="Screenshot 2023-08-23 at 12 00 33 PM" src="https://github.com/smuhamov/Platform-Cache/assets/22484395/ec26f0ae-cd38-49e9-9faa-3cfe5d587ecc">


Create custom setting records to store you query.

<img width="2809" alt="Screenshot 2023-08-23 at 12 01 03 PM" src="https://github.com/smuhamov/Platform-Cache/assets/22484395/42b8bf4f-74fb-49ab-98ff-dac482df2616">



Create a Platform Cache partition

<img width="3327" alt="Screenshot 2023-08-23 at 12 21 13 PM" src="https://github.com/smuhamov/Platform-Cache/assets/22484395/3feb47b7-adb1-4b81-9918-7f5c3297e8af">



# How to Use the Framework

Once you create the classes, and setup the configs, you can run a query in a below format. Below is query for Org partition, you can follow the same pattern for Session partition as well. In the constructor, you need to pass in the name for your Platform Cache partition. 

``` Java 
OrgCache cacheInstance = new OrgCache('OrgCache');
List<Account> accountList = (List<Account>) cacheInstance.get('accountQuery');
```
