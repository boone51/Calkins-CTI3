
//
// Mactive Exception Word Check Javascript Utilities
// Sept 20, 2002
//

// THIS LINE LOADS THE JS LIBRARY FOR THE PHONE FIELD UTILITIES
//
// <SCRIPT LANGUAGE="JavaScript" SRC="../scripts/exception.js"></SCRIPT>

// Exception check completed dialog function
function doExceptionComplete()
{
  window.alert("Exception Word Check Complete");
}

// Update Exception CHeck Form function
function updateForm()
{

  // Iframe HTML document string
  var docBody = "<body>";

  // If more Exceptions to go, then continue
  if(currException < exceptions.length)
  {

    // Update Ad Body in the textarea
    // Start with the text that has already been processed
    if(currIndex != exceptions[currException].startPos)
      newBody += orgBody.substring(currIndex,exceptions[currException].startPos);
    var currBody = newBody;
    docBody += currBody;

    // get the current exception word
    currWord = orgBody.substring(exceptions[currException].startPos,exceptions[currException].endPos);
    currBody += currWord;
    docBody += "<span id=\"exceptionWord\">";
    docBody += currWord.fontcolor("#FF0000");
    docBody += "</span>";

    // get the remaining text from the original text,
    // adding any exceptions processed by the doReplaceAll() function
    currIndex = exceptions[currException].endPos;
    var tmpIndex = currIndex;
    var endBody = "";
    for(var i = currException + 1; i < exceptions.length; i = i + 1)
    {
      if((processList[i] == true) && (exceptionWord[i] != null))
      {
        if(tmpIndex != exceptions[i].startPos)
          endBody += orgBody.substring(tmpIndex,exceptions[i].startPos);
        endBody += exceptionWord[i];
        tmpIndex = exceptions[i].endPos;
      }
    }
    endBody += orgBody.substring(tmpIndex,orgBody.length);
    currBody += endBody;
    docBody += endBody;

    // Update the correction value
    document.SpellCheck.corrected.value = currWord;
  }
  else
  {
    if(currIndex < orgBody.length)
      newBody += orgBody.substring(currIndex,orgBody.length);
    currIndex = orgBody.length;
    docBody += newBody;

    // Update the correction value
    document.SpellCheck.corrected.value = "";
    doExceptionComplete();
  }

  // Complete the Iframe window's HTML document.
  // Need to support line breaks of CR-LF, CR and LF????
  docBody += "</body>";
  docBody = docBody.replace(/\r\n/gi,"<br>");
  docBody = docBody.replace(/\r/gi,"<br>");
  docBody = docBody.replace(/\n/gi,"<br>");

  // Update Iframe contents.
  SpellText.document.open();
  SpellText.document.write(docBody);
  SpellText.document.close();
  if(currException < exceptions.length)
    SpellText.exceptionWord.scrollIntoView();
}

// replace button action function
function doReplace()
{
  // If spell check not complete, then continue
  if(currException < exceptions.length)
  {
    var newWord = document.SpellCheck.corrected.value;
    newBody += newWord;
    exceptionWord[currException] = newWord;
  }
  nextException();
}

// replace button action function
function doReplaceAll()
{
  // If exception check not complete, then continue
  if(currException < exceptions.length)
  {
    // replace the current exception
    var newWord = document.SpellCheck.corrected.value;
    newBody += newWord;
    exceptionWord[currException] = newWord;

    // find other errors that need to be replaced
    var errWord = "";
    for(var i = currException + 1; i < exceptions.length; i = i + 1)
    {
      // Ensure that this has not been corrected already
      if(processList[i] == false)
      {
        // If there is a match then update the exception word array
        errWord = orgBody.substring(exceptions[i].startPos,exceptions[i].endPos);
        if(errWord == currWord)
        {
          exceptionWord[i] = newWord;
          processList[i] = true;
        }
      }
    }
  }
  nextException();
}

// find next exception
function nextException()
{
  // If exception check not complete, then continue
  if(currException < exceptions.length)
  {

    // Find the next exception
    currException = currException + 1;
    while(currException < exceptions.length)
    {
      if(processList[currException] == false)
      {
        processList[currException] = true;
        break;
      }

      if(exceptionWord[currException] == null)
      {
        newBody += orgBody.substring(currIndex,exceptions[currException].endPos);
      }
      else
      {
        newBody += orgBody.substring(currIndex,exceptions[currException].startPos);
        newBody += exceptionWord[currException];
      }
      currIndex = exceptions[currException].endPos;
      currException = currException + 1;
    }

    // Update the exception check form
    updateForm();
  }
}

// reset the exception check function
var processList = new Array();
var exceptionWord = new Array();
function resetForm()
{
  // Initialize array for determining which exceptions have been processed
  for( var i = 0; i < exceptions.length; i = i + 1)
  {
    processList[i] = false;
    exceptionWord[i] = null;
  }
  processList.length = exceptions.length;
  exceptionWord.length = exceptions.length;

  // Reset all the global variables,
  // except for the "original Text" and "exceptions" array variables.
  currIndex = 0;
  currException = 0;
  newBody = "";
  currWord = "";

  // start first exception
  processList[currException] = true;
  updateForm();
}

// verify on submit function
function verify()
{
  // If more exceptions to go when form is submitted,
  // then complete the building of the corrected text.
  if(currException < exceptions.length)
  {

    // ignore the current exception
    newBody += currWord;
    while(currException < exceptions.length)
    {
      if(exceptionWord[currException] == null)
      {
        newBody += orgBody.substring(currIndex,exceptions[currException].endPos);
      }
      else
      {
        newBody += orgBody.substring(currIndex,exceptions[currException].startPos);
        newBody += exceptionWord[currException];
      }
      currIndex = exceptions[currException].endPos;
      currException = currException + 1;
    }

    if(currIndex < orgBody.length)
      newBody += orgBody.substring(currIndex,orgBody.length);
    currIndex = orgBody.length;
  }
  document.SpellCheck.correctedText.value = newBody;
  return true;
}
