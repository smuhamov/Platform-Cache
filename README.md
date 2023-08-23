# Platform Cache

# Overview

Salesforce platform cache is lot faster than normal queries. Also when you run a caching method with SOQL, it only counts against the limit first time. Any subsequent cache runs doesn't count against per transaction limits. Data you store in cache doesn't have to be sObject records, you can store calculated data with wrapper around it as well. But thing you have to keep in mind is data in org partition stays life for 24 hours, and session for 8 hours. Unless you clear the cache and re-cache it, data updates in transaction wouldn't be applied to data in cache. Keep that in mind when you are considering to use the Salesfroce Platform Cache. This is my attempt to build resusable framework around it.

# How to Setup

Standard Cachbuilder interface would only allow alphanumeric string as an input variable for doload method. It wouldn't allow special characters or spaces in a String. So as a way around, this framework uses custom settings. Create a Custom Settings to store your queries for cachebuilder class.

<img width="2874" alt="Screenshot 2023-08-23 at 12 00 33 PM" src="https://github.com/smuhamov/Platform-Cache/assets/22484395/989dd45c-7857-4b19-8980-c8c7f828fd0d">

Create custom setting records to store you query.

<img width="2809" alt="Screenshot 2023-08-23 at 12 01 03 PM" src="https://github.com/smuhamov/Platform-Cache/assets/22484395/83072b22-6c48-4706-b9eb-46f0176f716e">

Create a Platform Cache partition
<img width="3327" alt="Screenshot 2023-08-23 at 12 21 13 PM" src="https://github.com/smuhamov/Platform-Cache/assets/22484395/b50483d3-c15e-4e22-939d-4564cc7353c6">



# How to Use the Framework

Once you create the classes, and setup the configs, you can run a query in a below format. Below is query for Org partition, you can follow the same pattern for Session partition as well. In the constructor, you need to enter name for your Platform Cache partition. 

``` Java 
OrgCache cacheInstance = new OrgCache('OrgCache');
List<Contact> accountList = (List<Contact>) cacheInstance.get('contactQuery');
```
