function submitConstraint(theForm,theWarning,theCombo,oldValue)
    {
    theObject = MM_findObj(theCombo);
    if ( window.confirm(unescape(theWarning)) )
        {
        theForm.submit();
        }
    else
	{
	for ( i=0 ; i<theObject.length ; ++i )
	    {
	    if ( theObject.options[i].text == unescape(oldValue) )
		{
	    	theObject.selectedIndex = i;
		break;
		}
	    }
	}
    }