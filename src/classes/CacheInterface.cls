/**********************************************************************************
* Date:           23 Aug 2023
* Author:         Shohrat Muhamov
* Description:    This is interface class for Salesforce Cache
* Version:        1.0
* 
**********************************************************************************/
public interface CacheInterface {

   Boolean remove(String key);

   Object get(String key);

   String getJson(String key);
}