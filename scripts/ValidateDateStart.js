function ValidateDateStart(fieldName,theYear,theMonth,theDay,theYear2,theMonth2,theDay2,AlertMsg,DateInPastMsg)
{
    // US format default
    var ReturnValue = ValidateDateStartI18n(fieldName,"MDY",theYear,theMonth,theDay,theYear2,theMonth2,theDay2,AlertMsg,DateInPastMsg)
    return ReturnValue;
}

// 06/17/2008
// fieldDateOrder  - is a sequence of the letters, M,D,Y indicating the order
//                   of the delimited parts of the date in fieldName field
function ValidateDateStartI18n(fieldName,fieldDateOrder,theYear,theMonth,theDay,theYear2,theMonth2,theDay2,AlertMsg,DateInPastMsg)
{
   var ReturnValue = true

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
         var dateParts = new Array("","","");
         splitDate(MM_findObj(fieldName).value, dateParts);
         if ( validateSplitDate( dateParts, fieldDateOrder ) == false )
         {
            window.alert(AlertMsg)
            MM_findObj(fieldName).focus()
            ReturnValue = false
         }
         else
         {
            var ixMonth, ixDay, ixYear
            ixMonth = fieldDateOrder.indexOf("M");
            ixDay = fieldDateOrder.indexOf("D");
            ixYear = fieldDateOrder.indexOf("Y");

            month = parseInt(dateParts[ixMonth],10) - 1
            day = parseInt(dateParts[ixDay],10)
            year = parseInt(dateParts[ixYear],10)

            if ( year < 100 )
            {
               if ( year < 30 )
                  year += 2000
               else
                  year += 1900
            }

            if ( year < theYear || year > theYear2 )
            {
               window.alert(DateInPastMsg)
               MM_findObj(fieldName).focus()
               ReturnValue = false
            }
            if ( year == theYear )
            {
               if ( month < theMonth )
               {
                  window.alert(DateInPastMsg)
                  MM_findObj(fieldName).focus()
                  ReturnValue = false
               }
               else if ( month == theMonth )
               {
                  if ( day < theDay )
                  {
                     window.alert(DateInPastMsg)
                     MM_findObj(fieldName).focus()
                     ReturnValue = false
                  }
               }
            }
            if ( year == theYear2 )
            {
               if ( month > theMonth2 )
               {
                  window.alert(DateInPastMsg)
                  MM_findObj(fieldName).focus()
                  ReturnValue = false
               }
               else if ( month == theMonth2 )
               {
                  if ( day >= theDay2 )
                  {
                     window.alert(DateInPastMsg)
                     MM_findObj(fieldName).focus()
                     ReturnValue = false
                  }
               }
            }
         }
      }
   }

   return ReturnValue
}
