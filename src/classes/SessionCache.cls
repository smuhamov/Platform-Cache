/**********************************************************************************
* Date:           23 Aug 2023
* Author:         Shohrat Muhamov
* Description:    This is utility class for Salesforce Session Cache
* Version:        1.0
* 
**********************************************************************************/
public class SessionCache extends CacheHandler{
    public SessionCache(String partitionName) {
        super('Session', partitionName);
    }
}