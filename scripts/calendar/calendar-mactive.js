// MactiveInc: Added for Track #17645
// ----------------------------------
// Basically newspaper firms want to set the number of days in the future
// they allow customers to book the ad. This method is the "disableFunc"
// handler of the new calendar.

// pastDays   - number of days in the past from today that are selectable
// futureDays - number of days in the future from today that are selectable
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

