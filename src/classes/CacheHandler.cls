/**********************************************************************************
* Date:           23 Aug 2023
* Author:         Shohrat Muhamov
* Description:    This is virtual class for Salesforce Cache
* Version:        1.0
* 
**********************************************************************************/
public virtual class CacheHandler implements CacheInterface{
    protected Cache.Partition partition {get; set;}
   
    public CacheHandler(String cacheType, String partitionName) {
        if (cacheType.equalsIgnoreCase('Org')) {
            this.partition = Cache.Org.getPartition(partitionName);
        } else if (cacheType.equalsIgnoreCase('Session')) {
            this.partition = Cache.Session.getPartition(partitionName);
        } else {
            throw new CacheException('Invalid Cache type. Please re-enter valid Cache Type');
        } 
    }

    public Boolean remove(String key) {
        return partition.remove(CX_CacheBuilder.class, key);
    }

    public Object get(String key) {
        return partition.get(CX_CacheBuilder.class, key);
    }

    public String getJson(String key) {
        return JSON.serialize(partition.get(CX_CacheBuilder.class, key));
    }
}