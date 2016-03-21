function ValidateLogin(fieldName,minLen,maxLen,minDigits,AlertMsg)
   {
   ReturnValue = true

   if (MM_findObj(fieldName) == null) return true;

   if ((MM_findObj(fieldName).type != "text") &&
       (MM_findObj(fieldName).type != "textarea") &&
       (MM_findObj(fieldName).type != "password"))
      {
      window.alert("WebLogin: Not a text field")
      ReturnValue = false
      }
   else
      {
      var len=MM_findObj(fieldName).value.length
      if (len == 0)
         {
         window.alert(AlertMsg)
         MM_findObj(fieldName).focus()
         ReturnValue = false
         }
      else if (len < minLen)
         {
         window.alert("Login must be at least " + minLen + " characters")
         MM_findObj(fieldName).focus()
         ReturnValue = false
         }
      else if (len > maxLen)
         {
         window.alert("Login must not exceed " + maxLen + " characters")
         MM_findObj(fieldName).focus()
         ReturnValue = false
         }
      else
         {
         if (minDigits > 0)
            {
            var pw=MM_findObj(fieldName).value
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
              window.alert("Login must contain at least " + minDigits + " digits")
              MM_findObj(fieldName).focus()
              ReturnValue = false
              }
            }
         }
      }
   return ReturnValue
   }