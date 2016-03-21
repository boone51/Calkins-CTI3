<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no"/>
<!DOCTYPE html>
<html><!-- InstanceBegin template="/Templates/nomenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>New Account</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link id="mainCSS" href="BS3/css/bootstrap-flat.css" rel="stylesheet">
<link href="allstyles.css" rel="stylesheet">
<script src="jquery.js"></script>
<script src="BS3/js/bootstrap.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>


<script language = "Javascript">
$(document).ready(function(){
    $("input:not([type=image],[type=button],[type=submit],[type=hidden],[type=checkbox],[type=radio])").each(function(){
					$(this).addClass( "form-control" );
			});
                $("select").each(function(){
					$(this).addClass( "form-control" );
			});
}); 
    

    

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
</script>


</head>

<body>
<div class="container">
    <div class="row" style="padding-bottom:30px;">
    <!--    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">-->
        <div class="col-md-12 col-lg-12">
            <div class="customHeader">
<nav class="navbar navbar-inverse navbar-static-top navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
            <a class="navbar-brand" href="WebBaseMain.do?NextURL=/jsp/login.jsp&urlaction=push"><img src="images/logo.png"></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="defaultNavbar1">
            <ul class="nav navbar-nav">
                
<%  if (session.getAttribute("pageName") == "login.jsp"){ %>
    <li><a href="javascript:document.LoginUser2.submit()">Build Ad Now<span class="sr-only"></span></a></li>
    <%}%>
           
<%  if (session.getAttribute("pageName") != "login.jsp"){ %>
    <webbase:showIf expression="!isFakeCustomerLoggedIn">
        <li class="loginTrue"><a href="WebBaseMain.do?NextURL=/jsp/accountsummary.jsp&urlaction=push">Account Summary</a></li>
        <li class="loginTrue"><a href="WebBaseMain.do?NextURL=/jsp/AdOrderSearch.jsp&urlaction=push">Search Orders</a></li>
        <li class="loginTrue"><a href="WebBaseMain.do?NextURL=/jsp/ViewCurrentOrders.jsp&urlaction=push">My Orders</a></li>
    </webbase:showIf>
       <webbase:showIf expression="!isFakeCustomerLoggedIn" > <li> <a href="WebBaseMain.do?cmd=LogOff&NextURL=/jsp/logout.jsp" class="menuLinks">Log Off</a></li></webbase:showIf>
<%}%>
<!--                END showif tag for latelogin-->
                       
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <!-- Go to www.addthis.com/dashboard to customize your tools -->
                    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-53bfea00151a756b" async></script>
                    <!-- Go to www.addthis.com/dashboard to customize your tools -->
                    <div class="addthis_sharing_toolbox" style="margin-top:10px"></div>
                </li>

            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
            </div>
        </div>
    </div>
</div>

<div style="padding:10px">
<div class="container">
    
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
<!--                    <div class="col-md-4 col-sm-6">-->
                        <div class="col-md-8">
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
                            <!--<li>
                                <label for="SecPhoneFull" class="control-label">Secondary Phone Number:</label>
                                <webbase:customerData dataType="SecPhoneFull" editMode="1" width="13" newStyleValidationFlag="1" /> </li>
                            </br>
                            <li>
                                <label for="SecPhonex" class="control-label"> Ext</label>
                                <webbase:customerData dataType="SecPhonex" editMode="1" /> </li>
                            <li>
                                <label for="SubscriberFlag" class="control-label">Subscriber:</label>
                                <webbase:customerData dataType="SubscriberFlag" editMode="1" /> </li>-->
                        </ul>
<!--                    </div>-->
<!--                    <div class="col-md-4 col-sm-6">-->
<!--                        <ul class="list-unstyled">-->
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
                                        <webbase:customerData dataType="AddrState" editMode="1" dataDefault="PA" />
                                    </div>
                                    <div class="col-md-4">
                                        <label for="AddrCountry" class="control-label">Country: *</label>
                                        </br>
                                        <webbase:customerData dataType="AddrCountry" editMode="1" dataDefault="USA" />
                                    </div>
                                </div>
                            </li>
                        </ul>
<!--                    </div>-->
<!--                    <div class="col-md-4 col-sm-12">-->
<!--                        <ul class="list-unstyled">-->
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
                    <webbase:customerData dataType="NewCustomer" customerCompany="Courier Times" customerType="1 Private Party" />
                </fieldset>
            </div>
            <!--END enewaccount div-->

        </div>
        <!--END row-->
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
                <div style="display:inline">
                    <webbase:formHelper dataType="SaveNewCustomerBtn" label="Save Customer" nextURL="/jsp/SetAdType.jsp">
                        <!--<button type="button" class="btn btn-lg btn-success">Go!</button>-->
                        <img src="../../../images/navigation/but_creataccount.gif" width="140" height="41" border="0">
                    </webbase:formHelper>
                </div>
                <!--END continue buttons-->
            </div>
        </div>
        <!--END row-->
    </div>
    <!--END container-->
    <!--END button row-->
    <webbase:customerData dataType="SaveCustomer" />
    <webbase:customerData dataType="LoginCustomer" />
    <webbase:formHelper dataType="formList" />
    <webbase:formHelper dataType="FormValidate" />
</form>


    <div style="padding-top:20px">
<!-- Padding for the footer -->
</div>
<!--BEGIN footer-->
<div class="footer" >
	  <div class="text-center" style="padding-top:10px">
		<p class="text-muted">All Rights Reserved. <span class="glyphicon glyphicon-registration-mark"></span>  Registered since 2004</p>
	  </div>
</div>
<!--END footer-->
</div> <!-- /container -->





    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="BS3/js/bootstrap.min.js"></script>-->
    <!-- <script src="../../assets/js/docs.min.js"></script>
    IE10 viewport hack for Surface/desktop Windows 8 bug
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>-->
	<script src="responsive-toolkit.js"></script>
	<script src="main.js"></script>
</body>

</html>
