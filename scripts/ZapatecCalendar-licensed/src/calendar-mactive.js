// Description:
// This is taken from the original calendar-marcive.js that was created for the original DHTML Calendar
// (which is the precursor to this flavour from M. Bison)
// This calendar is now supported because it supports skip-days whereas the original one did not.
//
// Purpose:
// This collection of JavaScript function will support the use of the Zapatec DHTML calendar with the 
// Advanced scheduler functionality.
//
// Programmer:  J. Oelschlegel
//      Original material taken (massaged and transformed) from the original calendar-mactive.js
//      that was originally coded by S. Klingberg, G. Lapinsky, and D. Liu.  I simply attempted to 
//      adapt it to the use the new version of the DTHML calendar & OpenThought
//
//  Copyright: 2006 Mactive Incorporated
//

DOW_Monday      = 0x01;
DOW_Tuesday     = 0x02;
DOW_Wednesday   = 0x04;
DOW_Thursday    = 0x08;
DOW_Friday      = 0x10;
DOW_Saturday    = 0x20;
DOW_Sunday      = 0x40;

var startDate = new Date(1901, 1, 1, 0, 0, 0, 0);
var validDates_a = new Array();
var invalidDates_a = new Array();
var selectedDates_a = new Array();
var savSelectedDates_a = new Array();
var deadlineDates_a = new Array();
var mandatoryDates_a = new Array();
var theDowMask;

var internalStartDateFieldName = "";
var internalInsertsFieldName = "";
var internalCalendarButtonFieldId = "";
var internalCalendarButtonFieldDOMElement;
var internalSelectedDatesFieldName = "";
var internalStartDateFieldDOMElement;
var internalInsertsFieldDOMElement;
var internalSelectedDatesFieldDOMElement;
var internalFormObject;
var internalDateFormatString;
var internalSelectedDateString;
var internalReturnDate;
// Track 54375 - define a default value for internalReturnStartDate so it's not left
//               undefined in the case where no dates are selected
var internalReturnStartDate = "";

var SelectedDateStr="";


// The following 2 methods are taken out of the OpenThought.js module
function getRefOT_ex(element, d)
{
    var p,i,x;
    if(!d && frames[0].document)
    {
        d = frames[0].document;
    }
    if((p = element.indexOf("?")) > 0 && parent.frames.length)
    {
        d = parent.frames[element.substring(p+1)].document;
        element = element.substring(0,p);
    }
    if(!(x = d[element]) && d.all)
    {
        x = d.all[element];
    }
    for (i=0;!x&&i<d.forms.length;i++)
    {
        x = d.forms[i][element];
    }
    for(i=0; !x && d.layers && i < d.layers.length; i++)
    {
        x = getRefOT_ex(element, d.layers[i].document);
    }
    // Mozilla needs this
    for(i=0; !x && d.frames && typeof(d.frames)!='undefined' && i<d.frames.length;i++)
    {
      x = getRefOT_ex(element, d.frames[i].document);
    }
    if(!x && d.getElementById)
    {
        x = d.getElementById(element);
    }
    // Now that we found our Object, cache it for later use
    //formElement[element] = x;
    return x;
}



// Digs through the browsers DOM hunting down a particular form element
function FindObject_ex(element, d)
{
    var ret = getRefOT_ex(element, d);
    if (ret == null)
    {
        ret = getRefOT_ex(element, top.frames[0].document);
    }
//    if (ret == null)
//    {
//        alert("FindObject: Tried but failed to find object: name=" + element);
//    }
    return ret;
}

// This method used to live over in the OpenThought.js module, however, because that 'execution context' is at the global scope, there were problems creating the Calendar from there
// because events didnt seem to be propagating properly.  Therefore, we want the execution context to be in the FRAME that contains the document / object that is causing the calendar
// to be created.
//
// This idea emanates from the fact that 'a function is executed in the scope in which it was defined... not in the scope from which it is invoked.  So... while the function is invoked
// from the top level of the index.jsp page (outside of the frames/frameset) it will execute in the context of the AdvancedScheduler.jsp page since that is where it is 
// included.

function CreateOpenThoughtCompatibleCalendar(
    aUseDHTMLCalendar,
    startDateFieldName,
    insertsFieldName,
    validStartDate,
    validDates,
    invalidDates,
    validDowMask,
    deadlineDates,
    selectedDatesFieldName,
    theStartDateString,
    runCount,
    selectedDatesString,
    mandatoryDatesString,
    aCalendarButtonFieldId,
    aNumberOfMonthsToDisplay, 
    aNumberOfMonthsInRow,
    aDateFormatString)
{

//    var aDateFormatString = "%m/%d/%Y";

    FindObject_ex(startDateFieldName).value = theStartDateString;
    FindObject_ex(insertsFieldName).value = runCount;
    FindObject_ex(selectedDatesFieldName).value = selectedDatesString;

        setupDHTMLCalendarVariables(
            startDateFieldName,
            insertsFieldName,
            validStartDate,
            validDates,
            invalidDates,
            validDowMask,
            deadlineDates,
            selectedDatesFieldName,
            theStartDateString,
            runCount,
            selectedDatesString,
            mandatoryDatesString,
            aDateFormatString,
            aCalendarButtonFieldId
        );


        // Now go and create the DHTML Calendar 
		var cal = new Zapatec.Calendar(0, null, null, onCalendarClosedHandler);
		cal.id = Zapatec.Utils.generateID("calendar");
		cal.disableFdowClick = true;
        cal.numberMonths = aNumberOfMonthsToDisplay;
        cal.monthsInRow = aNumberOfMonthsInRow;
        cal.vertical = false;
		cal.showsOtherMonths = false;
		cal.showsTime = false;
		cal.time24 = true;
		cal.timeInterval = null;
		//cal.params = params;
		cal.weekNumbers = false;
		cal.sortOrder = "asc";
        cal.setRange(1999, 2999);
        cal.disableDrag=false;
		cal.helpButton = true;
        cal.setDateFormat(aDateFormatString);
        cal.setTtDateFormat(aDateFormatString);
        cal.setMultipleDates(selectedDates_a);
        cal.setDateStatusHandler(isValidDateCallbackHandler);
        cal.create();
        cal.showAtElement(FindObject_ex("calendar-container"));     
}

function setupDHTMLCalendarVariables(
    aStartDateFieldName,
    aInsertsFieldName,
    aValidStartDate,
    aValidDates,
    aInvalidDates,
    aValidDowMask,
    aDeadlineDates,
    aSelectedDatesFieldName,
    aStartDateString,
    aRunCount,
    aSelectedDatesString,
    aMandatoryDatesString,
    aDateFormatString,
    aCalendarButtonFieldId)
        
{
    internalStartDateFieldName = aStartDateFieldName;
    internalStartDateFieldDOMElement = FindObject_ex(internalStartDateFieldName);

    internalCalendarFieldButtonId = aCalendarButtonFieldId;
    internalCalendarFieldDOMElement = FindObject_ex(internalCalendarFieldButtonId);
    
    // GET THE VALUE OF THE INCOMING FIELD
    inDate = internalStartDateFieldDOMElement.value;

    // Track 24537 use today's date if the field is empty
    if (inDate.length == 0) 
    { 
        var d = new Date(); 
        inDate = "" + (d.getMonth()+1) + "/" + d.getDate() + "/" + d.getFullYear();
        // Track 54375 - print() is not a valid operation for inDate which is a string
        //internalStartDateFieldDOMElement.value = inDate.print(aDateFormatString);
        var dd = new Date(Date.parse(inDate));
        internalStartDateFieldDOMElement.value = dd.print(aDateFormatString);
    } 
    
    internalInsertsFieldName = aInsertsFieldName;
    internalInsertsFieldDOMElement = FindObject_ex(internalInsertsFieldName);
    
    internalSelectedDatesFieldName = aSelectedDatesFieldName;
    internalSelectedDatesFieldDOMElement = FindObject_ex(internalSelectedDatesFieldName);
 
    
    setupSelectedDatesFromDateStrings(aSelectedDatesString);
    setupValidDatesFromDateStrings(aValidDates);
    setupInvalidDatesFromDateStrings(aInvalidDates);
    setupDeadlineDatesFromDateStrings(aDeadlineDates);
    setupMandatoryDatesFromDateStrings(aMandatoryDatesString);
    setupDOWMask(aValidDowMask);
    setupDateFormatString(aDateFormatString);
    
}
            

function setupDateFormatString(aDateFormatString)
{
    internalDateFormatString = aDateFormatString;
}

function setupValidDatesFromDateStrings(validDates)
{
    // Parse valid date string
    validDates_a.length = 0;
    if ( validDates )
    {
        var ValidDateArrayStr = validDates.split('|');
        if ( ValidDateArrayStr.length )
	    {
            for ( var i=0 ; i<ValidDateArrayStr.length; i++ )
	    	{
                var aDate = new Date(Date.parse(ValidDateArrayStr[i]));
                validDates_a[validDates_a.length] = aDate;
	    	} 
	    } 
    } 
}


function setupInvalidDatesFromDateStrings(invalidDates)
{
    // Parse invalid date string
    invalidDates_a.length = 0;
    if ( invalidDates )
    {
        var InvalidDateArrayStr = invalidDates.split('|');
        if ( InvalidDateArrayStr.length )
	    {
            for ( var i=0 ; i<InvalidDateArrayStr.length; i++ )
	    	{
                var aDate = new Date(Date.parse(InvalidDateArrayStr[i]));
                invalidDates_a[invalidDates_a.length] = aDate;
	    	} 
	    } 
    } 
}


function setupSelectedDatesFromDateStrings(selectedDates)
{
    var aDateString = "";

    selectedDates_a.length = 0;
    savSelectedDates_a.length = 0;
    if ( selectedDates )
    {
        aDateString = selectedDates;
        if ( aDateString.length )
	    {
            var SelectedDateArrayStr = aDateString.split('|');
            for ( var i=0 ; i<SelectedDateArrayStr.length; i++ )
	        {
                var aDate = new Date(Date.parse(SelectedDateArrayStr[i]));
                selectedDates_a[selectedDates_a.length] = aDate;
                savSelectedDates_a[savSelectedDates_a.length] = aDate;
	        } 
	    } 
    } 
}

function setupDeadlineDatesFromDateStrings(deadlineDates)
{
    // Parse deadline date string (should have 7 entries - one
    // for each day of week)
    deadlineDates_a.length = 0;
    if ( deadlineDates )
    {
        var DeadlineDateArrayStr = deadlineDates.split('|');
        for ( var i=0 ; i<DeadlineDateArrayStr.length; i++ )
	    {
            var aDate = new Date(Date.parse(DeadlineDateArrayStr[i]));
            deadlineDates_a[deadlineDates_a.length] = aDate;
	    } 
    } 
}

function setupMandatoryDatesFromDateStrings(mandatoryDates)
{
    // Parse mandatoryDates string
    // Enhancement for new-style packages... 
    mandatoryDates_a.length = 0;
    if ( mandatoryDates )
    {
        var ManadatoryDateArrayStr = mandatoryDates.split('|');
        if ( ManadatoryDateArrayStr.length )
	    {
            for ( var i=0 ; i<ManadatoryDateArrayStr.length ; ++i )
	    	{
                var aDate = new Date(Date.parse(ManadatoryDateArrayStr[i]));
                mandatoryDates_a[mandatoryDates_a.length] = aDate;
	    	} 
	    } 
    } 
}

function setupDOWMask(DowMask)
{
    theDowMask = DowMask;
}

function setupReturnCalendarFormParameters()
{
    var aSelectedDateStr = "";
    var aFirstRunDateIndex = 0;
    for ( var i=0 ; i <selectedDates_a.length; i++)
    {
        if ( selectedDates_a[aFirstRunDateIndex] == null) alert("selectedDates[" + aFirstRunDateIndex + "] was null");
        if ( selectedDates_a[i] == null) alert("selectedDates[" + i + "] was null");
        if (selectedDates_a[i] && selectedDates_a[aFirstRunDateIndex])
        {

            // For some reason... on MAC OSX 10.3.9 / Safari 1.3.2 this didnt work.  The type of 
            // thelement in the array was 'function' and not 'object' as it should be.
//            var aVar = "i = " + i + " aFirstRunDateIndex = " + aFirstRunDateIndex;
//            var aVarType1 = typeof selectedDates_a[aFirstRunDateIndex];
//            var aVarType2 = typeof selectedDates_a[i];
            
//            var aS1 = selectedDates_a[aFirstRunDateIndex].toString();
//            var aS2 = selectedDates_a[i].toString();
//            alert(aVar + "\n" + aVarType1 + "\n" + aVarType2 );
            
            
            if ( (selectedDates_a[aFirstRunDateIndex].getFullYear() > selectedDates_a[i].getFullYear()) ||
                ((selectedDates_a[aFirstRunDateIndex].getFullYear() == selectedDates_a[i].getFullYear()) && (selectedDates_a[aFirstRunDateIndex].getMonth() > selectedDates_a[i].getMonth())) ||
                ((selectedDates_a[aFirstRunDateIndex].getFullYear() == selectedDates_a[i].getFullYear()) && (selectedDates_a[aFirstRunDateIndex].getMonth() == selectedDates_a[i].getMonth()) && (selectedDates_a[aFirstRunDateIndex].getDate() > selectedDates_a[i].getDate())))
                {
                    aFirstRunDateIndex = i;
                }

                if ( aSelectedDateStr.length != 0 )
                {
                    aSelectedDateStr += "|";
                }
	
                // Track 23427 - Using the long format will be too long for the URL (2083 max for IE) so we are 
                // switching to the SHORT format
                // aSelectedDateStr += selectedDates_a[i].toLocaleString();
                // aSelectedDateStr += selectedDates_a[i].print(internalDateFormatString);
                aSelectedDateStr += (selectedDates_a[i].getMonth()+1)+"/"+selectedDates_a[i].getDate()+"/"+selectedDates_a[i].getFullYear();
        } // end if (selectedDates_a[i] && selectedDates_a[aFirstRunDateIndex])
    } // end for ( var i=0 ; i<selectedDates_a.length ; ++i )
    
    // now.. lets set the value of the fields on the form so that when it gets submitted, 
    // the values will be passed to the servlet.
    
    if (internalSelectedDatesFieldDOMElement)
    {
        internalSelectedDatesFieldDOMElement.value = aSelectedDateStr;
        internalSelectedDateString = aSelectedDateStr;
    } 

    var aReturnStartDate = "";
    if (selectedDates_a.length != 0)
    {
        // Track 54375 - return the start date in the same SHORT format as the selected dates
        //aReturnStartDate += selectedDates_a[aFirstRunDateIndex].print(internalDateFormatString);
        aReturnStartDate += (selectedDates_a[aFirstRunDateIndex].getMonth()+1)+"/"+selectedDates_a[aFirstRunDateIndex].getDate()+"/"+selectedDates_a[aFirstRunDateIndex].getFullYear();
        internalReturnStartDate = aReturnStartDate;
    } 
    
    if (internalStartDateFieldDOMElement != null)
    {
        internalStartDateFieldDOMElement.value = aReturnStartDate; 
    } 
   
    if (internalInsertsFieldDOMElement != null)
    {
        internalInsertsFieldDOMElement.value = selectedDates_a.length;        
    } 
    
}

function setupSelectedDatesFromCalendarDates(cal)
{
    selectedDates_a.length = 0;
    for (var i in cal.multiple)
    {
        var d = cal.multiple[i];
        // sometimes the date is not actually selected.. therefore.. lets check..        
        if (d)
        {
            selectedDates_a[selectedDates_a.length] = d;
        } 
    }
    
    // Now that we have the selected dates setup... lets go and 
    // get the final values for the fields that will be submitted via the form
    setupReturnCalendarFormParameters();
    
}



function isPublishDate(aDay, aMonth,aYear) 
{
    var returnValue_b = true;

    // specified date is not publishable if valid dates
    // are defined and specified date is not in the list
    if ( validDates_a.length != 0 )
    {
        var found_b = false;
        for ( var i=0 ; i<validDates_a.length ; ++i )
        {
            if ( aMonth == validDates_a[i].getMonth() &&
                aDay == validDates_a[i].getDate() &&
                aYear == validDates_a[i].getFullYear() )
            {
                found_b = true;
                break;
            } 
        } 
        if ( found_b == false )
        {
            returnValue_b = false;
        } 
    } 

    // check if date specified in invalidate list
    for ( var i=0 ; i<invalidDates_a.length ; ++i )
    {
        if ( aMonth == invalidDates_a[i].getMonth() &&
            aDay == invalidDates_a[i].getDate() &&
            aYear == invalidDates_a[i].getFullYear() )
        {
            returnValue_b = false;
            break;
        } 
    } 

    // check to make sure that we are NOT past the deadline for the specified day of week
    theSpecifiedDate = new Date(aYear,aMonth,aDay,0,0,0,0);
    theDOW = theSpecifiedDate.getDay();
    theDayBit = 0;
    switch ( theDOW )
    {
        case 0: theDayBit = DOW_Sunday; break;
        case 1: theDayBit = DOW_Monday; break;
        case 2: theDayBit = DOW_Tuesday; break;
        case 3: theDayBit = DOW_Wednesday; break;
        case 4: theDayBit = DOW_Thursday; break;
        case 5: theDayBit = DOW_Friday; break;
        case 6: theDayBit = DOW_Saturday; break;
    } 
    if ( !(theDayBit & theDowMask) )
    {
        returnValue_b = false;
    } 

    // check for deadline violation
    if ( deadlineDates_a.length > theDOW )
    {
        theDeadlineDate = deadlineDates_a[theDOW];
        if ( theSpecifiedDate < theDeadlineDate )
        {
            returnValue_b = false;
        } 
    }

    return returnValue_b;
}

// Callback handlers for calendar
function isValidDateCallbackHandler(date, y, m, d)
{
    // If a date is publishable.. then it is selectable
    // If a date is NOT publishable, then it is not selectable and this method should return TRUE
    
    return !isPublishDate(d, m, y);
}

function onCalendarClosedHandler(cal)
{
    // We need to move the variables from the dates that are currently selected into 
    // the selectedDates_a array of dates...
    
    setupSelectedDatesFromCalendarDates(cal);
    
    // submit the new dates
    parent.SendParameters('rsconstraints.ot', 'run_mode=RunSchedule', 'RSButton=ApplyRSDates',
	    'RSSelectedDates='+internalSelectedDateString, 'RSNumberOfInserts=' + selectedDates_a.length,
	    'RSStartDate='+internalReturnStartDate);

    cal.hide();
}


function isDisabled(pastDays, futureDays)
{
    // returns the disable handler function
    return function(date)
    {
        var DAY = 1000 * 60 * 60 * 24;
        var today = new Date();
        return (((date.getTime() - today.getTime()) / DAY) < (pastDays - 1) ||
                ((date.getTime() - today.getTime()) / DAY) >= (futureDays + pastDays - 1));
    }
}

function isDisabledByValidDateArray(aDateArray)
{
    return function(date)
    {
       var aIndex = 0;
       var aMatch = false;

       // if the date is found in the array.. then it is valid, otherwise it is not a valid date
       // to use

       // If no dates are present in the array, assume all are valid
       // if (aDateArray.length == 0) return false;

       for (aIndex = 0; aIndex < aDateArray.length; aIndex++)
       {

// You can do the following.. however, looking at the code, it looks at part of the time also 
//           if (date.prototype.equalsTo(aDateArray[aIndex])) return false;
           // Wasnt sure if you could do a 'if (aDate1 == aDate2)' construct
           if (
              (date.getFullYear() == aDateArray[aIndex].getFullYear() ) &&
              (date.getMonth() == aDateArray[aIndex].getMonth()) &&
              (date.getDate() == aDateArray[aIndex].getDate() ) ) 
              return false;
       }
       return true;
    }

}

// default onSelect handler copied from calenbdar-setup
function defaultOnSelect(cal) {
    var p = cal.params;
    var update = (cal.dateClicked || p.electric);
    if (update && p.flat) {
        if (typeof p.flatCallback == "function")
            p.flatCallback(cal);
        else
            alert("No flatCallback given -- doing nothing.");
        return false;
    }
    if (update && p.inputField) {
        p.inputField.value = cal.date.print(p.ifFormat);
        if (typeof p.inputField.onchange == "function")
            p.inputField.onchange();
    }
    if (update && p.displayArea)
        p.displayArea.innerHTML = cal.date.print(p.daFormat);
    if (update && p.singleClick && cal.dateClicked)
        cal.callCloseHandler();
    if (update && typeof p.onUpdate == "function")
        p.onUpdate(cal);
};

// customized onSelect handler that supports multiple date fields
function onSelect(monthFieldId, dayFieldId, yearFieldId)
{
    return function(cal)
    {
        defaultOnSelect(cal);
        document.getElementById(monthFieldId).value = cal.date.print("%m");
        document.getElementById(dayFieldId).value = cal.date.print("%d");
        document.getElementById(yearFieldId).value = cal.date.print("%Y");
    }
}

// dateStatusFunc for ad order searching to allow all dates
function allowSearchDate()
{ 
    return function(date) {return false;}
}

// onClose for ad order searching to set the checkbox if date picked
function updateCheckboxOnClose(checkBoxId)
{
    return function(calendar)
    {
        var elemId = checkBoxId;
        var elem = (document.getElementById) ? document.getElementById(elemId) :
                   ((document.all) ? document.all(elemId) : null);
        if (elem)
        {
            if (calendar.dateClicked)
            {
                elem.checked = true;
            }
        }
        calendar.hide();
    }
}

