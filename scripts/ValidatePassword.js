function ValidatePassword(fieldName1,fieldName2,minLen,maxLen,minDigits,AlertMsg)
   {
   ReturnValue = true

   if (MM_findObj(fieldName1) == null || MM_findObj(fieldName2) == null) return true;

   if ((MM_findObj(fieldName1).type != "password") || (MM_findObj(fieldName2).type != "password"))
      {
      window.alert(fieldName1 + " or " + fieldName2 + ": Not a password field")
      ReturnValue = false
      }
   else
      {
      var len=MM_findObj(fieldName1).value.length
      if (len == 0)
         {
         window.alert(AlertMsg)
         MM_findObj(fieldName1).focus()
         ReturnValue = false
         }
      else if (len < minLen )
         {
         window.alert(" Password must be at least " + minLen + " characters")
         MM_findObj(fieldName1).focus()
         ReturnValue = false
         }
      else if (len > maxLen )
         {
         window.alert("Password must not exceed " + maxLen + " characters")
         MM_findObj(fieldName1).focus()
         ReturnValue = false
         }
      else
         {
         if (minDigits > 0)
            {
            var pw=MM_findObj(fieldName1).value
            var digits="0123456789"
            var hasRequiredDigits=false
            var cnt = 0;
            for (var c1=0; c1 < len; c1++)
              {
              if (digits.indexOf(pw.charAt(c1)) != -1)
                {
                  cnt++;
                  if(cnt >= minDigits)
                  {
                    hasRequiredDigits=true
                    break;
                  }
                }
              }

            if (hasRequiredDigits == false)
              {
              window.alert("Password must contain at least" + minDigits + " digits")
              MM_findObj(fieldName1).focus()
              ReturnValue = false
              }
            }

         if (MM_findObj(fieldName1).value != MM_findObj(fieldName2).value)
            {
            window.alert("Passwords Do Not Match!")
            MM_findObj(fieldName1).focus()
            ReturnValue = false
            }
         }
      }
   return ReturnValue
   }