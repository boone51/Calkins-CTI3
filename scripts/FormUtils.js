//
// SetCheckedState will set or clear all checkboxes with
// the specified name in the specified form
//      SetCheckedState should work with IE4+ and NN4+
//
function SetCheckedState(val, checkName, formName)
{
    var f, len, i;

    f = document.forms[formName];
    if (f)
    {
        len = f.elements.length;
        for (i = 0; i<len; i++)
        {
            if (f.elements[i].name==checkName)
            {
                f.elements[i].checked=val;
            }
        }
    }
}

// This method is the original method and has been depricated
// The standard method show_hide_ex should be used instead as it is more
// generic and multipurpose...
function show_hide(divName, aCollapseImage, aExpandImage)
{
    var aBaseId_s = "RangeImg";
    
    // call commonized method that will use the base name passed in.. 
    show_hide_ex(divName, aBaseId_s, aCollapseImage, aExpandImage);
    
//    var m=document.getElementById("RangeImg"+divName);
//    
//    if(document.getElementById(divName).style.display == "inline")
//    {
//        document.getElementById(divName).style.display = "none";
//        if (m != null) m.src=aExpandImage;
//    } else 
//    {
//        document.getElementById(divName).style.display = "inline";
//        if (m != null) m.src=aCollapseImage;
//    }
}

// This method provides a standard mechanism for use via our tags to show or hide a div 
// region in an html document given a div name, a base name, a collapse image and an expand image
// 
function show_hide_ex(divName, aBaseName, aCollapseImage, aExpandImage)
{
    var aId_s = aBaseName+divName;
    
    var m=document.getElementById(aId_s);
    
    if(document.getElementById(divName).style.display == "inline")
    {
        document.getElementById(divName).style.display = "none";
        if (m != null) m.src=aExpandImage;
    } else 
    {
        document.getElementById(divName).style.display = "inline";
        if (m != null) m.src=aCollapseImage;
    }

}

function toggle_visibility(div1, div2)
{

    var tempState1, tempState2;

    tempState1 = document.getElementById(div1).style.display;
    tempState2 = document.getElementById(div2).style.display;
    document.getElementById(div1).style.display = tempState2;
    document.getElementById(div2).style.display = tempState1;            
	
}


function highlight(obj){

  obj.style.backgroundColor = "#FF0000";

}
 

function unhighlight(obj){

  obj.style.backgroundColor = "#FFFFFF";

}

