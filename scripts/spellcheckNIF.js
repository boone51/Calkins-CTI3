
// 
// Mactive Spell Check Javascript Utilities
// Sept 20, 2002
//

// THIS LINE LOADS THE JS LIBRARY FOR THE PHONE FIELD UTILITIES 
//
// <SCRIPT LANGUAGE="JavaScript" SRC="../scripts/spellcheckNIF.js"></SCRIPT>

// Spell check completed dialog function
function doSpellComplete()
{
  window.alert("Spell Check Complete");
}

// Update SpellCHeck Form function
function updateForm()
{
  var displayText = "";

  // If more corrections to go, then continue
  if(currCorrection < corrections.length)
  {

    // Update Ad Body in the textarea
    // Start with the text that has already been processed
    if(currIndex < corrections[currCorrection].startPos)
      newBody += orgBody.substring(currIndex,corrections[currCorrection].startPos);
    var currBody = newBody;

    // get the current misspelled word
    currWord = orgBody.substring(corrections[currCorrection].startPos,corrections[currCorrection].endPos);
    currBody += currWord;
    document.SpellCheck.errorWord.value = currWord;

    // get the remaining text from the original text,
    // adding any corrections processed by the doReplaceAll() function
    currIndex = corrections[currCorrection].endPos;
    var tmpIndex = currIndex;
    var endBody = "";
    for(var i = currCorrection + 1; i < corrections.length; i = i + 1)
    {
      if((processList[i] == true) && (corrWord[i] != null))
      {
        if(tmpIndex != corrections[i].startPos)
          endBody += orgBody.substring(tmpIndex,corrections[i].startPos);
        endBody += corrWord[i];
        tmpIndex = corrections[i].endPos;
      }
    }
    endBody += orgBody.substring(tmpIndex,orgBody.length);
    currBody += endBody;

    // Display portion of text.
    // Display a snippet of the spell check text and the misspelled word
    var halfWidth = document.SpellCheck.displayWidth.value/2;
    if(newBody.length < halfWidth)
    {
      displayText = newBody;
    }
    else
    {
      var newWidth = newBody.length + currWord.length + endBody.length;
      if(newWidth < document.SpellCheck.displayWidth.value)
      {
        displayText = newBody;
      }
      else
      {
        if((currWord.length + endBody.length) < halfWidth)
        {
          halfWidth = document.SpellCheck.displayWidth.value - currWord.length
          halfWidth = halfWidth - endBody.length;
        }
        displayText = newBody.substring(newBody.length - halfWidth,newBody.length);
      }
    }
    displayText += currWord;
    displayText += endBody.substring(0,document.SpellCheck.displayWidth.value - displayText.length);

    // Update the correction options list
    for(var i = 0; i < corrections[currCorrection].correctionOptions.length; i = i + 1)
    {
      document.SpellCheck.correctionList.options[i] = new Option();
      document.SpellCheck.correctionList.options[i].text = corrections[currCorrection].correctionOptions[i];
    }
    document.SpellCheck.correctionList.options.length = corrections[currCorrection].correctionOptions.length;
    document.SpellCheck.correctionList.selectedIndex = 0;

    // Update the suggested correction value
    if(corrections[currCorrection].correctionOptions.length != 0)
    {
      document.SpellCheck.corrected.value = corrections[currCorrection].correctionOptions[0];
    }
    else
    {
      document.SpellCheck.corrected.value = currWord;
    }
  }
  else
  {
    if(currIndex < orgBody.length)
      newBody += orgBody.substring(currIndex,orgBody.length);
    currIndex = orgBody.length;
    document.SpellCheck.errorWord.value = "";

    // Update the suggested correction value
    document.SpellCheck.corrected.value = "";

    // Display portion of text.
    displayText = newBody.substring(0,document.SpellCheck.displayWidth.value);

    // Update the correction options list
    document.SpellCheck.correctionList.options.length = 0;
    document.SpellCheck.correctionList.selectedIndex = 0;
    doSpellComplete();
  }

  // Display the snippet of Text.
  displayText = displayText.replace(/\r\n/gi," ");
  displayText = displayText.replace(/\r/gi," ");
  displayText = displayText.replace(/\n/gi," ");
  document.SpellCheck.displayText.value = displayText;
}

// replace button action function
function doReplace()
{
  // If spell check not complete, then continue
  if(currCorrection < corrections.length)
  {
    var newWord = document.SpellCheck.corrected.value;
    newBody += newWord;
    corrWord[currCorrection] = newWord;
  }
  nextCorrection();
}

// replace button action function
function doReplaceAll()
{
  // If spell check not complete, then continue
  if(currCorrection < corrections.length)
  {
    // replace the current correction
    var newWord = document.SpellCheck.corrected.value;
    newBody += newWord;
    corrWord[currCorrection] = newWord;

    // find other errors that need to be replaced
    var errWord = "";
    for(var i = currCorrection + 1; i < corrections.length; i = i + 1)
    {
      // Ensure that this has not been corrected already
      if(processList[i] == false)
      {
        // If there is a match then update the corrected word array
        errWord = orgBody.substring(corrections[i].startPos,corrections[i].endPos);
        if(errWord == currWord)
        {
          corrWord[i] = newWord;
          processList[i] = true;
        }
      }
    }
  }
  nextCorrection();
}

// ignore button action function
function doIgnore()
{
  // If spell check not complete, then continue
  if(currCorrection < corrections.length)
  {
    newBody += currWord;
  }
  nextCorrection();
}

// replace button action function
function doIgnoreAll()
{
  // If spell check not complete, then continue
  if(currCorrection < corrections.length)
  {

    // ignore the current error
    newBody += currWord;

    // find other errors that need to be ignored
    var errWord = null;
    for(var i = currCorrection + 1; i < corrections.length; i = i + 1)
    {
      // Ensure that this has not been corrected already
      if(processList[i] == false)
      {
        // If there is a match then update the processed error list
        errWord = orgBody.substring(corrections[i].startPos,corrections[i].endPos);
        if(errWord == currWord)
        {
          processList[i] = true;
        }
      }
    }
  }
  nextCorrection();
}

// select suggestion option function
function updateCorrection()
{
  var i = document.SpellCheck.correctionList.selectedIndex;

  if( ( i >= 0 ) && ( i < document.SpellCheck.correctionList.options.length ) )
    document.SpellCheck.corrected.value = document.SpellCheck.correctionList.options[i].text;
  else
    window.alert("Invalid Selection Index: " + i);
}

// add word to dictionary button action function
function doAddtoDict()
{
  // If spell check not complete, then continue
  if(currCorrection < corrections.length)
  {
    var wordList = document.SpellCheck.addWordList.value;

    if(wordList.indexOf(currWord) == -1)
    {
      document.SpellCheck.addWordList.value = wordList + " " + currWord;
    }
    newBody += currWord;
  }
  nextCorrection();
}

// find next spelling correction
function nextCorrection()
{
  // If spell check not complete, then continue
  if(currCorrection < corrections.length)
  {

    // Find the next correction
    currCorrection = currCorrection + 1;
    while(currCorrection < corrections.length)
    {
      if(processList[currCorrection] == false)
      {
        processList[currCorrection] = true;
        break;
      }

      if(corrWord[currCorrection] == null)
      {
        newBody += orgBody.substring(currIndex,corrections[currCorrection].endPos);
      }
      else
      {
        newBody += orgBody.substring(currIndex,corrections[currCorrection].startPos);
        newBody += corrWord[currCorrection];
      }
      currIndex = corrections[currCorrection].endPos;
      currCorrection = currCorrection + 1;
    }

    // Update the spellcheck form
    updateForm();
  }
}

// reset the spell check function
var processList = new Array();
var corrWord = new Array();
function resetForm()
{
  // Initialize array for determining which corrections have been processed
  for( var i = 0; i < corrections.length; i = i + 1)
  {
    processList[i] = false;
    corrWord[i] = null;
  }
  processList.length = corrections.length;
  corrWord.length = corrections.length;

  // Reset all the global variables,
  // except for the "original Text" and "corrections" array variables.
  currIndex = 0;
  currCorrection = 0;
  newBody = "";
  currWord = "";

  // Clear the "add to dictionary" word list
  document.SpellCheck.addWordList.value = "";

  // start first correction
  processList[currCorrection] = true;
  updateForm();
}

// verify on submit function
function verify()
{
  // If more corrections to go when form is submitted,
  // then complete the building of the corrected text.
  if(currCorrection < corrections.length)
  {

    // ignore the current error
    newBody += currWord;
    while(currCorrection < corrections.length)
    {
      if(corrWord[currCorrection] == null)
      {
        newBody += orgBody.substring(currIndex,corrections[currCorrection].endPos);
      }
      else
      {
        newBody += orgBody.substring(currIndex,corrections[currCorrection].startPos);
        newBody += corrWord[currCorrection];
      }
      currIndex = corrections[currCorrection].endPos;
      currCorrection = currCorrection + 1;
    }

    if(currIndex < orgBody.length)
      newBody += orgBody.substring(currIndex,orgBody.length);
    currIndex = orgBody.length;
  }
  document.SpellCheck.correctedText.value = newBody;
  return true;
}

// invalid change to text field
function invalidChange()
{
  window.alert("Modification to non-editable field\rPlease modify the \"correction\" field and/or select an option button");
  updateForm();
}
