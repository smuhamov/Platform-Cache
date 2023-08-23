/**********************************************************************************
* Date:           23 Aug 2023
* Author:         Shohrat Muhamov
* Description:    This is utility class for Salesforce Org Cache
* Version:        1.0
* 
**********************************************************************************/
public class OrgCache extends CacheHandler{
    public OrgCache(String partitionName) {
        super('Org', partitionName);
    }
}