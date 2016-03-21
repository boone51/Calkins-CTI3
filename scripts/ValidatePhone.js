function ValidatePhone(fieldName,numberLen,requiredFlag,AlertMsg)
    {
    ReturnValue = true

   if (MM_findObj(fieldName) == null) return true;

    if (MM_findObj(fieldName).type != "text")
        {
        window.alert(fieldName + ": Not a text field")
        ReturnValue = false
        }
    else
        {
        if (MM_findObj(fieldName).value == '')
            {
            if (requiredFlag == true)
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
            if (validatePhoneNumber(fieldName,numberLen) == false)
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
        }
    return ReturnValue
    }