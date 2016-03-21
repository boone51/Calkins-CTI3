function ValidateFloat(fieldName,minValue,maxValue,AlertMsg)
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
          tmpFloat = parseFloat(MM_findObj(fieldName).value)
          if ( isNaN(tmpFloat) )
             {
             window.alert(AlertMsg)
             MM_findObj(fieldName).focus()
             ReturnValue = false
             }
          else
             {
             if ((tmpFloat < minValue) || (tmpFloat > maxValue))
                {
                window.alert(AlertMsg)
                MM_findObj(fieldName).focus()
                ReturnValue = false
                }
             }
          }
       }
   return ReturnValue
   }