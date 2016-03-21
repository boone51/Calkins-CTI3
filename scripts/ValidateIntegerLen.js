function ValidateIntegerLen(fieldName,minValue,maxValue,strLen,requiredFlag,AlertMsg)
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
          if (requiredFlag == true)
             {
             window.alert(AlertMsg)
             MM_findObj(fieldName).focus()
             ReturnValue = false
             }
          }
       else
          {
          if ((MM_findObj(fieldName).value.length != strLen) && (strLen != 0))
             {
             window.alert(AlertMsg)
             MM_findObj(fieldName).focus()
             ReturnValue = false
             }
          else
             {
             tmpInt = parseInt(MM_findObj(fieldName).value,10)
             if ( isNaN(tmpInt) )
                {
                window.alert(AlertMsg)
                MM_findObj(fieldName).focus()
                ReturnValue = false
                }
             else
                {
                if ((tmpInt < minValue) || (tmpInt > maxValue))
                   {
                   window.alert(AlertMsg)
                   MM_findObj(fieldName).focus()
                   ReturnValue = false
                   }
                }
             }
          }
       }
   return ReturnValue
   }