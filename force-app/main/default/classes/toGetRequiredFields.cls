public class toGetRequiredFields {
 public static void checkRequiredField( String strObjName ) {
        
        SObjectType objType = Schema.getGlobalDescribe().get( strObjName );
         //system.debug(objType);
        Map < String, Schema.SObjectField > mapFields = objType.getDescribe().fields.getMap();
        system.debug(mapFields);
        for( String strField : mapFields.keySet() )
        
        {
            //system.debug('strField');
            SObjectField field = mapFields.get( strField );
            Schema.DescribeFieldResult fieldResult = field.getDescribe();
            
            if ( !fieldResult.isNillable() && !fieldResult.isDefaultedOnCreate() ) {
                //system.debug( fieldResult.getLabel() + ' is required.' );
            }
            
        }
        
    }
}