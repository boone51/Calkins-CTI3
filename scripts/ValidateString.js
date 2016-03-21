var invalidChars = new String("<>");

function ValidateString(fieldName,AlertMsg)
{
   return ValidateStringEx(fieldName,AlertMsg,false);
}

function ValidateStringEx(fieldName,AlertMsg,checkSpecialChars)
{
   var field = MM_findObj(fieldName);
   var ReturnValue = true;

   if (field == null) return true;

   if ((field.type != "text") && (field.type != "textarea") && (field.type != "password"))
   {
      window.alert(fieldName + ": Not a text field");
      ReturnValue = false;
   }
   else
   {
      if (field.value == '')
      {
         ReturnValue = false;
      }
      else if (checkSpecialChars == true)
      {
         for (var i = 0; i < invalidChars.length; i++)
         {
            if (field.value.indexOf(invalidChars.substring(i, i+1)) != -1)
            {
               ReturnValue = false;
               break;
            }
         }
      }

      if (ReturnValue == false){
		newFieldName = $.trim(fieldName);
		newFieldName = newFieldName.replace(/\s+/gi,'');
        if(document.getElementById(newFieldName + "_div")){
		  $("#" + newFieldName + "_div").addClass('errorClass');
		  var checkError = $("#" + newFieldName + "_div").html();
		  if(checkError.indexOf(AlertMsg) <= 0){
		    $("#" + newFieldName + "_div").append("<br>" + AlertMsg);
		  }
		} else {
		  window.alert(AlertMsg);
          field.focus();
		}
      }
   }
   return ReturnValue;
}


//ValidateStringEx("Fname","You must enter a valid first name",true)