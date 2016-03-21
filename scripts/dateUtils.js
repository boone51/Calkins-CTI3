
function validateDate(aDate)
{
    // US format default
    var dateParts = new Array("","","");
    splitDate(aDate, dateParts);
    var ReturnValue = validateSplitDate(dateParts, "MDY");
    return ReturnValue;
}

// aDate          - delimited date string
// dateSplitArray - a return array of three empty strings into which
//                  will be placed the three parts of the date
function splitDate(aDate, dateSplitArray)
{
  var digits="0123456789";
  var c1=0;
  var n1=0;

  for(c1=0; (c1 < aDate.length) && (n1 < 3); c1++)
  {
    if (digits.indexOf(aDate.charAt(c1)) != -1)
    {
      dateSplitArray[n1]+=aDate.charAt(c1);
    }
    else
    {
      n1++;
    }
  }
}

function validateSplitDate(aDatePartArray, aPartOrder)
{
  var DaysOfMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
  var ReturnValue = true
  var month, day, year
  var ixMonth, ixDay, ixYear
  var daysInMonth, Month, Year
  var tmpInt

  // check length (make sure we have a month, day, year)
  if ( aDatePartArray.length != 3 )
  {
    ReturnValue = false;
  }

  ixMonth = aPartOrder.indexOf("M");
  ixDay = aPartOrder.indexOf("D");
  ixYear = aPartOrder.indexOf("Y");

  if ( (ixMonth == -1) || (ixDay == -1) || (ixYear == -1) )
  {
    ReturnValue = false;
  }

  if (ReturnValue == true)
  {
    // check month
    month = aDatePartArray[ixMonth];
    tmpInt = parseInt(month,10);
    if ( isNaN(tmpInt) )
    {
      ReturnValue = false;
    }
    else
    {
      Month = tmpInt;
      if ((tmpInt < 1) || (tmpInt > 12))
      {
        ReturnValue = false;
      }
    }

    // check year
    year = aDatePartArray[ixYear];
    tmpInt = parseInt(year,10);
    Year = tmpInt;
    if ( isNaN(tmpInt) )
    {
      ReturnValue = false;
    }
    else
    {
      if ( Year < 100 )
      {
        if ( Year < 30 )
          Year += 2000;
        else
          Year += 1900;
      }
    }

    // check day
    if ( ReturnValue == true )
    {
      day = aDatePartArray[ixDay];
      tmpInt = parseInt(day,10);
      if ( isNaN(tmpInt) )
      {
        ReturnValue = false;
      }
      else
      {
        daysInMonth = DaysOfMonth[Month-1]
        if (((Year % 4 == 0) && ((Year % 100 != 0) || (Year % 400 == 0))) && (Month == 2))
        {
          ++daysInMonth;
        }
        if ((tmpInt < 1) || (tmpInt > daysInMonth))
        {
          ReturnValue = false;
        }
      }
    }
  }
  return ReturnValue;
}

