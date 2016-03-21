
// 
// Mactive Phone Field Utilities
// version 1, June 21, 2002
// version 2, Updated December 5, 2005
//            Allow the phone mask to be specified instead of only allowing U.S. format (xxx)xxx-xxxx. 
//            Phone formatting is no longer timer based therefore onPhoneFocus() no longer initiates 
//             the timer and the timedPhoneCheck() method is no long used to call formatPhone(). 
//             Instead formatPhone() is now called from the onPhoneKeyPress() method.
//            Added support so if the browser is Firefox the phone field is allowed to format as the
//             user types same as for IE.
//
// NOTES:
//   This set of functions is intended to be a common set of
//   phone edit field utility functions which can be included by 
//   our WebBase pages to satisfy our needs for either IE or 
//   Netscape. It was tested with Netscape 4.77 and IE 5.0. If the  
//   implementation for the two browsers ends up being too diverse 
//   we can consider putting the functions in separate browser
//   dependent .js files which can be utilized by pages created 
//   specifically for the given browser.
//   (Version 2 was tested with IE 6, Firefox 1.0.1 and Netscape 4.77)
// 
// REQUIREMENTS:
//   These functions make use of the MM_findObj() method which is
//   expected to be present on any WebBase page that uses this
//   library (MM_findObj() gets generated along with the form's
//   verify() method by our custom tags).
//
// CAVEATS:
//   The default phone mask is U.S. format (xxx)xxx-xxxx. To use
//   a different mask the initPhoneUtils() method must be called
//   with the mask. Digits are designated with an 'x'. The mask can
//   contain whatever literals you want. If phone field validaton is 
//   active, the user will be required to enter digits for all the x's.
//
// DESCRIPTION:
//
//   initPhoneUtils() - new method added 12/5/05. This method can be
//     called to initialize phone mask to something other than the
//     default (xxx)xxx-xxxx . A digit is represented by 'x' and all
//     other characters are regarded as literals
//
//   timedPhoneCheck() - removed 12/5/05. Processing is now done from 
//     onPhoneKeyPress() handler vs this timer routine.
//
//   onPhoneFocus() is an event handler for the onfocus event. It
//     used to call the timePhoneCheck() method that was removed. Now
//     it's just an empty function available for the future if needed.
//
//   onPhoneChange() is an event handler for the onchange event.
//     For older Netscape the phone number field ONLY gets formatted
//     after the field is exited since it's not done as the user types
//     the data as it is for IE. (Netscape kept moving the cursor back  
//     to start of field when the field contents were reformatted).
//
//   onPhoneKeyPress() is an event handler for the onkeypress event
//     and is used to allow only numeric data to be entered into the
//     phone field. Also for browsers other than older Netscape, 
//     the formatPhone() function is called to format the user's 
//     input according to the phone mask as they type. For older 
//     Netscape the formatting is ONLY done in the onPhoneChange()
//     method when the field is exited,
//
//   validatePhoneNumber() is intended to be called by the
//     form's verify() method to validate the phone number before
//     the form is submitted. At this time it just checks that it
//     contains the specified number of digits.
//
//   formatPhone() is a general function to provide information
//     about a phone number. It is called by onPhoneKeyPress(),
//     onPhoneChange(), and validatePhoneNumber(). You pass it 
//     any phone number string and it strips out anything that 
//     is not a number and reformats it according to the mask
//     string in phMask.
//     It returns three pieces of information 1) a string which 
//     is just the numbers, 2) a string which is the numbers 
//     formatted according to phMask, and 3) a count which is the
//     number of characters in the input string which were not a 
//     number or a valid format character (valid format characters 
//     are anything in phMask other than 'x')
//        
// THIS LINE LOADS THE JS LIBRARY FOR THE PHONE FIELD UTILITIES 
//
// <SCRIPT LANGUAGE="JavaScript" SRC="phoneUtils.js"></SCRIPT>


// Non-Strict Browser determination to identify IE and Firefox
var isIE_MM = (navigator.appName.indexOf("Microsoft") != -1);
var isFirefox_MM = (navigator.userAgent.indexOf("Firefox") != -1);


var phMask = "(xxx)xxx-xxxx";
var phLiterals = "()- ";


if (window.captureEvents)
{
  // Netscape only
  window.captureEvents(Event.KEYPRESS);
  window.onkeypress=function(event){return window.routeEvent(event);};
}

function initPhoneUtils(aPhoneMask)
{
  if (aPhoneMask && aPhoneMask.length > 0){

    phMask = aPhoneMask;
    phLiterals = "";
    var maskIndex = 0;

    while (maskIndex < phMask.length) {
      var maskChar = phMask.charAt(maskIndex);
      if ((maskChar != "x") && (phLiterals.indexOf(maskChar) == -1)){
        phLiterals += maskChar; 
      }
      maskIndex++;
    }
  }
}

function formatPhone(inStr)
{
  var digits="0123456789";
  var rawStr="";
  var retValues = new Array("","",0);
  var outStr="";
  var nonDigitCount=0;
  var c1=0;
  var c2=0;
  var continue_b=true;
  var lastLiteral="";

  for(c2=0; (c2 < phMask.length) && continue_b ; c2++){
    var maskChar = phMask.charAt(c2);
    if (maskChar != "x"){
      lastLiteral+=maskChar;
    } else {

      var getnext_b = true;
      while (c1 < inStr.length && getnext_b){      
        var isLiteral=false;
        if (phLiterals.indexOf(inStr.charAt(c1)) != -1){
          isLiteral=true;
        }
        if(isLiteral==false){
          var isNumber=false;
          if (digits.indexOf(inStr.charAt(c1)) != -1){
            isNumber=true;
          }
          if (isNumber==false){
            nonDigitCount++;      
          } else {
            if(lastLiteral.length > 0){
              outStr += lastLiteral;
              lastLiteral = "";
            }
            outStr += inStr.charAt(c1);
            rawStr += inStr.charAt(c1);
            getnext_b = false;

            // if there's only one more format char and it's a terminating literal need to output it
            if (c2 == phMask.length-2){
              if(phMask.charAt(c2+1) != "x"){
                outStr+=phMask.charAt(c2+1);
              }
            }
          }
        } // endif isLiteral
        c1++;
      }
      if (c1 >= inStr.length) continue_b=false;
    }
  }

  retValues[0]=outStr;
  retValues[1]=rawStr;
  retValues[2]=nonDigitCount;
  return retValues;
}

function onPhoneFocus(objName)
{
  return;
}

function onPhoneChange(obj)
{
  var phoneStr=obj.value;
  var formatResult=formatPhone(phoneStr);
  obj.value=formatResult[0];
}

function onPhoneKeyPress(obj, e)
{
  var theKey;

  if (document.all) {
    e = window.event;
    theKey=e.keyCode;
  } else {
    theKey = (e.charCode) ? e.charCode : ((e.which) ? e.which : 0);
    // allow the delete and tab keys for Firefox and Netscape. For those keys
    // charCode/which is 0, but keyCode is 46 (delete) and 9 (tab)
    if (theKey == 0 && e.keyCode) theKey=e.keyCode;
  }
  
  // Allow numbers, delete, and backspace(8), and tab(9)
  if ((theKey < 45 || theKey > 57) && (theKey != 8 && theKey != 9))
  {
    if (document.all) {
      e.returnValue = false;    
    } else {
      return false;
    }
  } else {
    if (document.getElementById || isIE_MM || isFirefox_MM) {
      if ((theKey != 8) && (theKey != 46) && (theKey != 9)) {
        var v=obj.value;
        var s1=v;

        var formatResult=formatPhone(s1);
        if (v != formatResult[0]) {
          obj.value="";
          obj.value=formatResult[0];
        }
    	if (obj.value.length==phMask.length) {
          // no more input allowed when length of mask is reached
      	  return false;
        }
      }
    }
    return true;
  }  
}

function validatePhoneNumber(objName, numDigits)
{
  var isValid = true;

  var o=MM_findObj(objName);
  var phoneStr=o.value;
  var formatResult=formatPhone(phoneStr);
  if (formatResult[1].length != numDigits)
  {
    // phone # doesn't have required number of digits
    isValid = false; 
  }
  return isValid;
}

