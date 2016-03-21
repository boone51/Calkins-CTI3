///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Module:      AtexModirum3dSecureUtils.js
// Description:
//      The following was put in for the Modirum 3d Secure implementation for Trinity Mirror
//      for pre authorizing credit cards submitted by the end users placing ads.  It attempts to provide a nice
//      abstraction for generation of the DIGEST value given a bunch of other informaition that is placed in 
//      hidden fields via the Modirum3dSecureTag.
//
//      This utilizes the javascript from  http://pajhome.org.uk/crypt/sha1
//      that are managed in the JavaScriptSha1Utils.  
//      This javascript is utilized by the Modirum3dSecureTag.java
//
//      Implementation Note(s):  
//      a) I really really hated to do this.. but.. other attempts failed to attempt to hide this in a form processor...
//      b) Note the constants that are used for the field names.  These MUST match the ones that generated via the CUSTOM tag...
//      c) I had to use a different implementation of the sha1 hash code because the one from webtoolkit.info, I could not get it 
//         to provide the SHA1 / base64 it properly.  This one seemd to do it out of the box and in 1 method call
//
// Author:      J. Oelschlegel 
// Date:        November 16, 2008
// Copyright:   2008 Atex
//              Track 51604
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var Modirum3dSecureDigestCalculator = 
{
    // static properties used for FIELD identifiers
    // Please note that these MUST match the field identifiers specified in the 
    // Modirum3dSecureTag specification.  These field names are mandated via the Modirum specification
    // and cannot be modified.
    
    F_Version : "version",
    F_CardType : "cardType",
    F_Pan : "pan",
    F_Expiry : "expiry",
    F_DeviceCategory : "deviceCategory",
    F_PurchaseAmount : "purchAmount",
    F_Exponent : "exponent",
    F_Description : "description",
    F_Currency : "currency",
    F_MerchantId : "merchantID",
    F_XID : "xid",
    F_OkUrl : "okUrl",
    F_FailUrl : "failUrl",
    F_Demo : "demo",
    F_MerchantData : "MD",
    F_Digest : "digest",
    F_Debug : "false",  
    F_OutputDebugFields : "false",

    // Get the value of a particular element on a particular form 
    getElementValue : function (aFormName, aElementName)
    {
        var aElement = document.forms[aFormName].elements[aElementName];
        var aReturnValue = "";
        if (aElement != null)
        {
            aReturnValue = aElement.value;
        }
        else
        {
            if (this.F_Debug == "true")
            {
                alert("Form: " + aFormName + " Element:" + aElementName + " was not found.  Compare Modirum3dSecure tag  and javascript files for mismatches.. However please note some fields are optional");
            }
        }
        // If the field is not present, simply return the empty string
        return aReturnValue;
    },
    
    // Set the value of a particular element on a particular form
    setElementValue : function(aFormName, aElementName, aValue)
    {
        var aElement = document.forms[aFormName].elements[aElementName];
        if (aElement != null)
        {
            aElement.value = aValue;
        }
        else
        {
            alert("Form: " + aFormName + " Element:" + aElementName + " was not found.  Compare Modirum3dSecure tag  and javascript files for mismatches");
        }
    },
    
    preSubmitProcessing : function(aFormName)
    {
        var aReversedPAN = this.reverseIt( this.getElementValue(aFormName, this.F_Pan) );
        var aDecodedPAN = Base64.decode( aReversedPAN );
        this.setElementValue(aFormName, this.F_Pan, aDecodedPAN);
    },
    
    reverseIt : function(aValue)
    {
        var aNewBuffer = "";
        if ((aValue != null) && (aValue.length > 0 ) )
        {
            var aIndex = 0;
            for (aIndex = aValue.length - 1; aIndex >= 0; aIndex--)
            {
                aNewBuffer += aValue.charAt(aIndex);
            }
        }
        return aNewBuffer;
    },
    
    // Compute the digest value including the shared key value passed in from the tag
    computeDigest : function(aFormName, aSharedKey)
    {
        var aConcatString = "";           
        aConcatString += this.getElementValue( aFormName, this.F_Version);
        aConcatString += this.getElementValue( aFormName, this.F_CardType);

        // aConcatString += this.getElementValue( aFormName, this.F_Pan);        
        // We need to first decode the PAN to use for computing the DIGEST value
        var aReversedPAN = this.reverseIt( this.getElementValue(aFormName, this.F_Pan) );
        var aDecodedPAN = Base64.decode( aReversedPAN );

        aConcatString += aDecodedPAN;                
        aConcatString += this.getElementValue( aFormName, this.F_Expiry);
        aConcatString += this.getElementValue( aFormName, this.F_DeviceCategory);
        aConcatString += this.getElementValue( aFormName, this.F_PurchaseAmount);
        aConcatString += this.getElementValue( aFormName, this.F_Exponent);
        aConcatString += this.getElementValue( aFormName, this.F_Description);
        aConcatString += this.getElementValue( aFormName, this.F_Currency);
        aConcatString += this.getElementValue( aFormName, this.F_MerchantId);
        aConcatString += this.getElementValue( aFormName, this.F_XID);
        aConcatString += this.getElementValue( aFormName, this.F_OkUrl);
        aConcatString += this.getElementValue( aFormName, this.F_FailUrl);
        aConcatString += this.getElementValue( aFormName, this.F_Demo);
        aConcatString += this.getElementValue( aFormName, this.F_MerchantData);
        if (aSharedKey != null)
        {
            aConcatString += aSharedKey;
        }
        
        // Now we have the concatenated string for the digest buffer... now we need to generate the SHA1
        // hash key and base64 encode the resultant 20 byte SHA1 hash key
        
        var aEncodedDigestValue = b64_sha1(aConcatString);
        var aHexDigestValue = hex_sha1(aConcatString);
        
        // Put the computed digest value back on the form for final submission to the Merchant Server per the spec
        this.setElementValue(aFormName, this.F_Digest, aEncodedDigestValue);   

        //////////////////////////////////////////////////////////////////////////////////////////////////////
        // ORIGINAL IMPLEMENTATION using the webtoolkit package...
        //
        // We DO NOT want to convert the computed value into HEX for display purposes... 
        // This was hosing us at trinity....
        // var aHashDigestValue = SHA1(aDigestValue, false);
        // var aHexHashDigestValue = SHA1(aDigestValue, true);
        // Now we need to base64 encode it... the raw bytes coming from the SHA1 
        // This is what I could not get in the proper format for base64 encoding and at some point
        // we may want to circle around and try to get this to work ... but it wasnt obvious 
        // what was occurring.. other than the string I was building up wasnt right... 
        // I should have ended up with a 28 byte entity... but it was 40 after base64 encoding it
        // This other new package (sha1.js) worked out of the box so I decided to cut my losses since
        // we were getting a lot of pressure to get this delivered. 
        // var aEncodedDigestValue = Base64.encode(aHashDigestValue);
        
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        // The following block is for testing / diagnostic purposes in the field
        // so that we can see what the values that we are generating that are being 
        // sent over to the MerchantServer
        //////////////////////////////////////////////////////////////////////////////////////////////////////

        if (this.F_OutputDebugFields == "true")
        {
            this.setElementValue(aFormName, "ConcatStringValue", aConcatString)
            this.setElementValue(aFormName, "HexDigestValue", aHexDigestValue);
            this.setElementValue(aFormName, "Base64EncodedDigestValue", aEncodedDigestValue);

            // This block of code can be used to create a DUMMY RESPONSE from modirum... 
            // Simply create a FORM and plop these fields on it along with a SUBMIT button... and it will 
            // simulate a response coming back from the Modirum 3d Secure MERCHANT SERVER
            this.setElementValue("DummyMerchantResponseForm", this.F_Digest,        this.getElementValue(aFormName, this.F_Digest) );
            this.setElementValue("DummyMerchantResponseForm", this.F_XID,           this.getElementValue(aFormName, this.F_XID) );
            this.setElementValue("DummyMerchantResponseForm", this.F_MerchantId,    this.getElementValue(aFormName, this.F_MerchantId) );
            this.setElementValue("DummyMerchantResponseForm", this.F_MerchantData,  this.getElementValue(aFormName, this.F_MerchantData) );
            this.setElementValue("DummyMerchantResponseForm", "mdStatus", '0');
            this.setElementValue("DummyMerchantResponseForm", "mdErrorMsg", 'no error message' );
            this.setElementValue("DummyMerchantResponseForm", "txstatus", '0');
            this.setElementValue("DummyMerchantResponseForm", "iReqCode", '');
            this.setElementValue("DummyMerchantResponseForm", "iReqDetail", '');
            this.setElementValue("DummyMerchantResponseForm", "vendorCode", '');
            this.setElementValue("DummyMerchantResponseForm", "eci", '');
            this.setElementValue("DummyMerchantResponseForm", "cavv", '');
            this.setElementValue("DummyMerchantResponseForm", "cavvAlgorithm", '');
            this.setElementValue("DummyMerchantResponseForm", "PAResVerified", '');
            this.setElementValue("DummyMerchantResponseForm", "PAResSyntaxOK", '');
        }
    }    
}

