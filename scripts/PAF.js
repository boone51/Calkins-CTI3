//
// 03/24/2008 G. LaPinsky
//
// PAFlookup
// This method is used in the onClick for the PAFlookup submit button.
// If true is returned, the form is submitted and the New Customer logic
// uses the PAFflag field to know to just do a PAF lookup and allow the page
// to redisplay with the PAFlookup results.
// The country selected is checked to only do the PAF lookup if the 
// country Name matches the one for which PAF is the post code type
// 

function PAFlookup(aPostCodeFieldName, aPAFflagName, aCountryCBName, PAFcountryValue)
{
    var aResult = false;
    var PAFflag = document.getElementById(aPAFflagName);
    if (PAFflag) PAFflag.value = "false";

    var aPostCodeField = document.getElementById(aPostCodeFieldName); 
    var aCountryCB = document.getElementById(aCountryCBName); 

    if ((PAFflag != null) && (aPostCodeField != null) && (aCountryCB != null))
    {
        // only do look up if something is entered in the post code field ...
        if (aPostCodeField.value != '')
        {
            // ... and the selected country uses PAF as the post code type
	    if (aCountryCB.options[aCountryCB.selectedIndex].text == PAFcountryValue)
            {
                PAFflag.value = "true"; 
                aResult = true;
            }
        }
    }
    return aResult;
    
}

function showHidePAFElements(aDivBaseName, divCount, aCountryCBName, PAFcountryValue)
{
    var aCountryCB = document.getElementById(aCountryCBName); 

    if (aCountryCB != null)
    {
	for (var i=1; i <= divCount; i++)
	{
	    var aDivName = aDivBaseName + i;
            var aDiv=document.getElementById(aDivName);
            if (aDiv != null)
            {
	        if (aCountryCB.options[aCountryCB.selectedIndex].text == PAFcountryValue)
                {
                    aDiv.style.display = "inline";
                }
                else
                {
                    aDiv.style.display = "none";
                }
            }
        }
    }
}

function setElemsReadonlyState(elemNamesArray, controlElemName)
{
    var controlElem = document.getElementById(controlElemName);
    if (controlElem != null)
    {
        for (var i=0; i<elemNamesArray.length; i++)
        {
	    var elem = document.getElementById(elemNamesArray[i]);
	    if (elem != null)
               elem.readOnly = controlElem.checked
        }
    }
}