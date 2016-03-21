
/*
 * IpixUploaderSubmit.js
 * G. LaPinsky              July 19, 2005
 * Mactive routines to assist with Bulk Uploader interface
 *
 * Access to IpixUploaderSubmit.js script is required by the Mactive tag
 * <webbase:IpixUploader dataType="GenerateUploaderScript" />
 */

if ( typeof gUploader != "undefined" )
{
    gUploader.setSubmitParm("mediasetName", document.ipixform.UploaderMediaset.value);
    if ("true" == document.ipixform.UploaderIncludePrint.value)
    {
    	gUploader.setInitParm("assignSlot", "primaryimage");
    	gUploader.setInitParm("slotLabels", "Print Photo");
    }
    gUploader.setInitParm("thumbcols", "2");
    gUploader.setHandler("onLoad", "onLoadHandler");
    gUploader.setHandler("onAfterAll", "onAfterAllHandler");
    gUploader.setHandler("onError", "onErrorHandler");
}
else
{
    alert("Error - Photo Uploader not Installed");
}

var pageLoadComplete = false;

/*
 * The button used to submit the Uploader photos has an 'onClick'
 * event which calls 'SubmitData()'
 */
function SubmitData()
{
    if (gUploader.getType() == "bulk")
    {
	if (!pageLoadComplete)
	{
	    alert("Please wait till the page is loaded.");
	    return false;
        }
    }

    if (!gUploader.ckForImages())
    {
	alert("There are no images loaded.");
        return false;
    }

    gUploader.submit();
    return true;
}

/*
 * This handler called by uploader prior to submitting all photos.
 * Return:  true -  to proceed with AdMission upload after this function call
 *          false - halts AdMission uploading if this function returns false
 *
 * NOTE that the form being submitted here ('ipixform') must match the name
 *      of form containing the iPIX control
 */
function onAfterAllHandler(results)
{
    //alert("In uploaderSubmissionComplete");
    if (results)
    {
        //alert("Number of images: " +results.length);

        var urlList = "";
        for (var i=0; i < results.length; i++)
        {
            var imageURL = results[i].imageResult;
            urlList += ";";
            urlList += imageURL;
        }

        if (results[0].authenticationToken.length > 0)
        {
            document.ipixform.UploaderAuthentication.value = results[0].authenticationToken;
        }
        document.ipixform.UploaderImages.value = urlList;

        document.ipixform.submit();
        return true;
    }
    else
    {
        alert("Error uploading images. Results not available");
        return false;
    }
}

function onErrorHandler(errCode, errMsg)
{
    alert("Error: " +errCode+ " " +errMsg);
    return false;
}

function onLoadHandler()
{
    pageLoadComplete=true;
    return true;
}