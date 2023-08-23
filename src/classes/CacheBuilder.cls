/**********************************************************************************
* Date:           30 May 2022
* Author:         Shohrat Muhamov
* Description:    This is Cache Builder class for Salesforce Cache
* Version:        1.0
* 
**********************************************************************************/
public class CacheBuilder implements Cache.CacheBuilder{
    public Object doLoad(String key) {
        return Database.query(Cache__c.getInstance(key).Query__c);
    }
}