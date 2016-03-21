function ValidateSelect(fieldName,defaultItem,AlertMsg)
   {
   ReturnValue = true

   if (MM_findObj(fieldName) == null) return true;

    if ((MM_findObj(fieldName).type != "select-one") && (MM_findObj(fieldName).type != "select-multiple"))
      {
      window.alert(fieldName + ": Not a select field")
      ReturnValue = false
      }
   else
      {
      if (MM_findObj(fieldName).options[MM_findObj(fieldName).selectedIndex].value == defaultItem)
         {
			 newFieldName = $.trim(fieldName);
		  		 newFieldName = newFieldName.replace(/\s+/gi,'');
				 if(document.getElementById(newFieldName + "_div")){
					$("#" + newFieldName + "_div").addClass('errorClass');
					var checkError = $("#" + newFieldName + "_div").html();
					if(checkError.indexOf(AlertMsg) <= 0){
		    		  $("#" + newFieldName + "_div").append("<br>" + AlertMsg);
		  			}
				 } else {
		 
		 			window.alert(AlertMsg)
               		MM_findObj(fieldName).focus()
               		ReturnValue = false
				 }
 
         }
      }
   return ReturnValue
   }


function ValidateSelect_ex(fieldName, defaultItem, aCountryControlFieldName, aSettingsFieldName,  AlertMsg)
{
   ReturnValue = true

   if (MM_findObj(fieldName) == null) return true;

   if ((MM_findObj(fieldName).type != "select-one") && (MM_findObj(fieldName).type != "select-multiple"))
      {
        window.alert(fieldName + ": Not a select field")
        ReturnValue = false  
	  }
   else
      {

         var aRequiredFlag = true
        
         var aRequiredStateFlag = getInternationalizedFieldMask(aSettingsFieldName, aCountryControlFieldName)
         if (aRequiredStateFlag != null)
            if (aRequiredStateFlag.toLowerCase() == "false")
               aRequiredFlag = false

         if (aRequiredFlag == true)
         {
            if (MM_findObj(fieldName).options[MM_findObj(fieldName).selectedIndex].value == defaultItem)
               {
               
			   newFieldName = $.trim(fieldName);
		  		 newFieldName = newFieldName.replace(/\s+/gi,'');
				 if(document.getElementById(newFieldName + "_div")){
					$("#" + newFieldName + "_div").addClass('errorClass');
					var checkError = $("#" + newFieldName + "_div").html();
					if(checkError.indexOf(AlertMsg) <= 0){
		    		  $("#" + newFieldName + "_div").append("<br>" + AlertMsg);
		  			}
				 } else {
		 
		 			window.alert(AlertMsg)
               		MM_findObj(fieldName).focus()
               		ReturnValue = false
				 }
			   
			   }   
         }
         else 
         {
            ReturnValue = true
         }
      }
   return ReturnValue
   
}
