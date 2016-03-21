function ValidateDateYMD(yearFieldName,monthFieldName,dayFieldName,AlertMsg)
   {
   ReturnValue = true

   if (MM_findObj(yearFieldName) == null || MM_findObj(monthFieldName) == null || MM_findObj(dayFieldName) == null) return true;

   if ((MM_findObj(yearFieldName).type != "text") && (MM_findObj(yearFieldName).type != "textarea"))
      {
      window.alert(yearFieldName + ": Not a text field")
      ReturnValue = false
      }
   else if ((MM_findObj(monthFieldName).type != "text") && (MM_findObj(monthFieldName).type != "textarea"))
      {
      window.alert(monthFieldName + ": Not a text field")
      ReturnValue = false
      }
   else if ((MM_findObj(dayFieldName).type != "text") && (MM_findObj(dayFieldName).type != "textarea"))
      {
      window.alert(dayFieldName + ": Not a text field")
      ReturnValue = false
      }
   else
      {
      if (MM_findObj(yearFieldName).value == '')
         {
         window.alert(AlertMsg)
         MM_findObj(yearFieldName).focus()
         ReturnValue = false
         }
      else if (MM_findObj(monthFieldName).value == '')
         {
         window.alert(AlertMsg)
         MM_findObj(monthFieldName).focus()
         ReturnValue = false
         }
      else if (MM_findObj(dayFieldName).value == '')
         {
         window.alert(AlertMsg)
         MM_findObj(dayFieldName).focus()
         ReturnValue = false
         }
      else
         {
         var strMonth = MM_findObj(monthFieldName).value
         var strDay = MM_findObj(dayFieldName).value
         var strYear = MM_findObj(yearFieldName).value
         var strUSDate = strMonth + "/" + strDay + "/" + strYear
         if ( validateDate(strUSDate) == false )
            {
            window.alert(AlertMsg)
            MM_findObj(monthFieldName).focus()
            ReturnValue = false
            }
         }
      }
   return ReturnValue
   }