<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "newaccount.jsp" );%>
<% session.putValue( "returnPage", "newaccount.jsp" );%>
<%@ include file="header.jsp"%>
<%@ include file="top-nav.jsp"%>
    <!-- InstanceBeginEditable name="content" -->
<!--<span class="PageName"> !! -- newaccount.jsp</span>-->
<script type="text/javascript" src="../../../scripts/FormValidation.js"></script>
<webbase:AdbaseEFormValidationMask />
<form method="post" action="WebBaseMain.do" name="NewCustomer" onSubmit="return ValidateForm()">
    <webbase:mactiveAction dataType="RunCommand" dataValue="<DoAction action='CloseCustomer'/>" />
    <webbase:errorData dataType='ErrorMsg' />
    <webbase:errorData dataType='ErrorURL' nextURL='/jsp/newaccount.jsp' />
    <div style="container">
        <div class="row">

        <div class="Enewaccount">
            <fieldset>
                <legend>New Account </legend>
                <blockquote>Required fields are marked with an asterisk(*).</blockquote>
<div class="col-md-4 col-sm-6">
    <ul class="list-unstyled">
        <li>
            <label for="Fname" class="control-label">First Name: *</label>
            <webbase:customerData dataType="Fname" editMode="1" />
        </li>
        <li>
            <label for="Lname" class="control-label">Last Name: *</label>
            <webbase:customerData dataType="Lname" editMode="1" />
        </li>
        <li>
            <div class="row">
                <div class="col-md-8">
                    <label for="PhoneFull" class="control-label">Phone Number: *</label>
                    <webbase:customerData dataType="PhoneFull" editMode="1" width="13" newStyleValidationFlag="1" />
                </div>
                <div class="col-md-4">
                    <label for="Phonex" class="control-label"> Ext </label>
                    <webbase:customerData dataType="Phonex" editMode="1" />
                </div>
            </div>
        </li>
        <li>
            <label for="SecPhoneFull" class="control-label">Secondary Phone Number:</label>
            <webbase:customerData dataType="SecPhoneFull" editMode="1" width="13" newStyleValidationFlag="1" /> </li>
        </br>
        <li>
            <label for="SecPhonex" class="control-label"> Ext</label>
            <webbase:customerData dataType="SecPhonex" editMode="1" /> </li>
        <li>
            <label for="SubscriberFlag" class="control-label">Subscriber:</label>
            <webbase:customerData dataType="SubscriberFlag" editMode="1" /> </li>
    </ul>
</div>
<div class="col-md-4 col-sm-6">
    <ul class="list-unstyled">
        <li>
            <label for="AddrStreet1" class="control-label"> Address: * </label>
            <webbase:customerData dataType="AddrStreet1" editMode="1" /> </li>
        <li>
            <label for="AddrStreet2" class="control-label">Address 1: </label>
            <webbase:customerData dataType="AddrStreet2" editMode="1" /> </li>
        <li>
            <label for="AddrStreet3" class="control-label">Address 2: </label>
            <webbase:customerData dataType="AddrStreet3" editMode="1" /> </li>
        <li>
            <label for="AddrCity" class="control-label">City: *</label>
            <webbase:customerData dataType="AddrCity" editMode="1" />
        </li>
        <li id="cityStZip">
            <div class="row">
                <div class="col-md-5">
                    <label for="AddrZipFull" class="control-label">Zip: * </label>
                    <webbase:customerData dataType="AddrZipFull" editMode="1" newStyleValidationFlag="1" />
                </div>
                <div class="col-md-3">
                    <label for="AddrState" class="control-label"> State: *</label>
                    </br>
                    <webbase:customerData dataType="AddrState" editMode="1" dataDefault="FL" />
                </div>
                <div class="col-md-4">
                    <label for="AddrCountry" class="control-label">Country: *</label>
                    </br>
                    <webbase:customerData dataType="AddrCountry" editMode="1" dataDefault="USA" />
                </div>
            </div>
        </li>
    </ul>
</div>
<div class="col-md-4 col-sm-12">
    <ul class="list-unstyled">
        <li>
            <label for="Email" class="control-label">Email:</label>
            <webbase:customerData dataType="Email" editMode="1" /> </li>
        <li>
            <label for="EmailC" class="control-label">Email Confirm:</label>
            <webbase:customerData dataType="EmailC" editMode="1" /> </li>
        <li>
            <label for="WebLogin" class="control-label">Username: * </label>
            <webbase:customerData dataType="WebLogin" editMode="1" /> </li>
        <li>
            <label for="WebPassword" class="control-label">Password: * </label>
            <webbase:customerData dataType="WebPassword" editMode="1" /> </li>
        <li>
            <label for="WebPasswordC" class="control-label">Password Confirm: *</label>
            <webbase:customerData dataType="WebPasswordC" editMode="1" /> </li>
        <li>
            <label for="WebQuestion" class="control-label"> Secret Question: *</label>
            <webbase:customerData dataType="WebQuestion" editMode="1" />
        </li>
        <li>
            <label for="WebAnswer" class="control-label">Secret Answer: *</label>
            <webbase:customerData dataType="WebAnswer" editMode="1" />
        </li>
    </ul>
</div>
											<webbase:customerData dataType="NewCustomer" customerCompany="Fort Collins Coloradoan" customerType="Transient"/>
										</fieldset>
            </div><!--END enewaccount div-->

        </div><!--END row-->
<!--BEGIN button row-->
<div class="row" style="padding-top:30px">
    <!-- If the ad is part of a package the previous page should be the SetPackage page -->
    <div class="col-md-6 text-center">
        <!--back buttons-->
        <a href="WebBaseMain.do?NextURL=/jsp/login.jsp">
            <button type="button" class="btn btn-lg btn-danger">Cancel</button>
            <!--<img src="../../../images/navigation/cancel.gif" width="49" height="17" border="0">--></a>
        <!--END back buttons-->
    </div>
    <div class="col-md-6 text-center">
        <!--continue buttons-->
        <div style="display:none">
            <webbase:formHelper dataType="SaveNewCustomerBtn" label="Save Customer" nextURL="/jsp/SetAdType.jsp">
                <!--<button type="button" class="btn btn-lg btn-success">Go!</button>-->
            </webbase:formHelper>
        </div>
        <button type="button" class="btn btn-lg btn-success" onclick="document.getElementsByName('SaveNewCustomerBtn').click()" id="formSub">Go!</button>
        <!--END continue buttons-->
    </div>
</div>
				<!--END row-->
    </div><!--END container-->
				<!--END button row-->
						<webbase:customerData dataType="SaveCustomer"/>
						<webbase:customerData dataType="LoginCustomer"/>
						<webbase:formHelper dataType="formList"/>
						<webbase:formHelper dataType="FormValidate"/>
	</form>
<%@ include file="footer.jsp"%>
	<script language = "Javascript">
function echeck(str) {
		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		   alert("Please Enter a Valid Email Address")
		   return false
		}
		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   alert("Please Enter a Valid Email Address")
		   return false
		}
		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    alert("Please Enter a Valid Email Address")
		    return false
		}
		 if (str.indexOf(at,(lat+1))!=-1){
		    alert("Please Enter a Valid Email Address")
		    return false
		 }
		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Please Enter a Valid Email Address")
		    return false
		 }
		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Please Enter a Valid Email Address")
		    return false
		 }
		 if (str.indexOf(" ")!=-1){
		    alert("Please Enter a Valid Email Address")
		    return false
		 }
 		 return true
	}
function ValidateForm(){
	var emailID=document.NewCustomer.Email
	if ((emailID.value==null)||(emailID.value=="")){
		alert("Please enter a valid email address")
		emailID.focus()
		return false
	}
	if (echeck(emailID.value)==false){
		emailID.value=""
		emailID.focus()
		return false
	}
	return true
 }
 $().ready(function(){
			//alert('doc is loading');
			$("input[type!=image]").each(function(){
			//
				$(this).addClass( "form-control" );
			});
			//
			$("input[type=image]").each(function(){
			//
				$(this).addClass( "btn btn-lg btn-success" );
				$(this).val( "Go!" );
			});
			//
			var origBut = document.getElementsByName('SaveNewCustomerBtn');
			//$("#signin").bind("click", function() { alert("test"); });
			$( "#formSub" ).on( "click", function() {
				//alert( 'click event');
				$( origBut ).trigger( "click" );
			});
			//
});
</script>
<%@ include file="footer.jsp"%>
</html>
