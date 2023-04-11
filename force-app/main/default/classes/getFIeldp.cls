public class getFIeldp {

     public static map<string,boolean> getFieldProperty(string objname, string fname ){
        SObjectType objType = Schema.getGlobalDescribe().get( objname );
        Map < String, Schema.SObjectField > m = objType.getDescribe().fields.getMap();
         Schema.DescribeFieldResult rfield=m.get(fname).getDescribe();
         map<string,boolean> val=new map<string,boolean>();
         val.put('required',rfield.isNillable());
          val.put('creatable',rfield.isCreateable());
          val.put('custom',rfield.isCustom());
          val.put('delete',rfield.isRestrictedDelete());
          val.put('update',rfield.isUpdateable());
          system.debug(val);
 return val;
     }
}