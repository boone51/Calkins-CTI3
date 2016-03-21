function ValidateMatch(fieldName1,fieldName2,requiredFlag,AlertMsg1,AlertMsg2)
   {
   ReturnValue = true

   if (MM_findObj(fieldName1) == null || MM_findObj(fieldName2) == null) return true;

   if ((MM_findObj(fieldName1).type != "text") && (MM_findObj(fieldName1).type != "textarea"))
      {
      window.alert(fieldName1 + ": Not a text field")
      ReturnValue = false
      }
   else
      {
      if (MM_findObj(fieldName1).value == '')
         {
         if (requiredFlag == true)
            {
            window.alert(AlertMsg1)
            MM_findObj(fieldName1).focus()
            ReturnValue = false
            }
         }

      if ( MM_findObj(fieldName2) != null )
         {
         if ((MM_findObj(fieldName2).type != "text") && (MM_findObj(fieldName2).type != "textarea"))
            {
	    window.alert(fieldName2 + ": Not a text field")
      	    ReturnValue = false
	    }
	 else
	    {
      	    if (MM_findObj(fieldName1).value != MM_findObj(fieldName2).value)
               {
               window.alert(AlertMsg2)
               MM_findObj(fieldName1).focus()
               ReturnValue = false
               }
	    }
	 }
      }
   return ReturnValue
   }