function ValidateDate(fieldName,AlertMsg)
   {
   ReturnValue = true

   if (MM_findObj(fieldName) == null) return true;

   if ((MM_findObj(fieldName).type != "text") && (MM_findObj(fieldName).type != "textarea"))
       {
       window.alert(fieldName + ": Not a text field")
       ReturnValue = false
       }
    else
       {
       if (MM_findObj(fieldName).value == '')
          {
          window.alert(AlertMsg)
          MM_findObj(fieldName).focus()
          ReturnValue = false
          }
       else
          {
          if ( validateDate(MM_findObj(fieldName).value) == false )
             {
             window.alert(AlertMsg)
             MM_findObj(fieldName).focus()
             ReturnValue = false
             }
          }
       }
   return ReturnValue
   }