<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/nomenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">

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
</script>

</head>

<body class="standard">
<table width="750" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><%@ include file="../includes/header.htm"%></td>
  </tr>
  <tr>
    <td><!-- InstanceBeginEditable name="content" --> 
	 <span class="PageName"> !! -- newaccountLL.jsp</span>
	 <script type="text/javascript" src="../../../scripts/FormValidation.js"></script>
	 <webbase:AdbaseEFormValidationMask />
	 <form method="post" action="WebBaseMain.do" name="NewCustomer" onSubmit="return ValidateForm()"> 
        <table width="450" border="0" align="center" cellpadding="2" cellspacing="0" > 
          <tr align="center">
            <td colspan="4" class="errormsg"><webbase:errorData dataType='ErrorMsg'/>
              <webbase:errorData dataType='ErrorURL' nextURL='/jsp/newaccountLL.jsp'/></td>
          </tr>
          <tr> 
            <td colspan="4" class="heading">New Account </td> 
          </tr> 
          <tr> 
            <td align="right">&nbsp;</td> 
            <td colspan="3">&nbsp;</td> 
          </tr> 
          <tr> 
            <td colspan="4">Required fields are marked
                with an asterisk(*). </td> 
          </tr> 
          <tr> 
            <td width="162" align="right">&nbsp;</td> 
            <td colspan="3">&nbsp;</td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">First Name: *</td> 
            <td colspan="3"><webbase:customerData dataType="Fname" editMode="1" dataSource="L"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Last Name: *</td> 
            <td colspan="3"><webbase:customerData dataType="Lname" editMode="1" dataSource="L"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Phone Number:  *</td> 
            <td nowrap><webbase:customerData dataType="PhoneFull" editMode="1" width="13" newStyleValidationFlag="1" dataSource="L"/></td> 
            <td width="18" class="mattrlabeltext">Ext</td> 
            <td width="196"><webbase:customerData dataType="Phonex" editMode="1" dataSource="L"/></td> 
          </tr> 
		  <tr > 
            <td class="mattrlabeltext">Secondary Phone Number:</td> 
            <td nowrap><webbase:customerData dataType="SecPhoneFull" editMode="1" width="13" newStyleValidationFlag="1" dataSource="L"/></td> 
            <td width="18" class="mattrlabeltext">Ext</td> 
            <td width="196"><webbase:customerData dataType="SecPhonex" editMode="1" dataSource="L"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Subscriber:</td> 
            <td colspan="3"><webbase:customerData dataType="SubscriberFlag" editMode="1" dataSource="L"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Address: *</td> 
            <td colspan="3"><webbase:customerData dataType="AddrStreet1" editMode="1" dataSource="L"/></td> 
          </tr> 
		  <tr > 
            <td class="mattrlabeltext">Address 2:</td> 
            <td colspan="3"><webbase:customerData dataType="AddrStreet2" editMode="1" dataSource="L"/></td> 
          </tr> 
		  <tr > 
            <td class="mattrlabeltext">Address 3:</td> 
            <td colspan="3"><webbase:customerData dataType="AddrStreet3" editMode="1" dataSource="L"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">City: *</td> 
            <td colspan="3"><webbase:customerData dataType="AddrCity" editMode="1" dataSource="L"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">State: *</td> 
            <td colspan="3"><webbase:customerData dataType="AddrState" editMode="1" dataDefault="FL" dataSource="L"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Zip: *</td> 
            <td colspan="3"><webbase:customerData dataType="AddrZipFull" editMode="1" newStyleValidationFlag="1" dataSource="L"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Country: *</td> 
            <td colspan="3"><webbase:customerData dataType="AddrCountry" editMode="1" dataDefault="USA" dataSource="L"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Email:</td> 
            <td colspan="3"><webbase:customerData dataType="Email" editMode="1" dataSource="L"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Email Confirm: </td> 
            <td colspan="3"><webbase:customerData dataType="EmailC" editMode="1" dataSource="L"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Username: *</td> 
            <td colspan="3"><webbase:customerData dataType="WebLogin" editMode="1" dataSource="L"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Password: *</td> 
            <td colspan="3"><webbase:customerData dataType="WebPassword" editMode="1" dataSource="L"/></td> 
          </tr> 
          <tr > 
            <td class="mattrlabeltext">Password Confirm:  *</td> 
            <td colspan="3"><webbase:customerData dataType="WebPasswordC" editMode="1" dataSource="L"/></td> 
          </tr> 
          <tr >
            <td class="mattrlabeltext">Secret Question:  *</td>
            <td colspan="3"><webbase:customerData dataType="WebQuestion" editMode="1" dataSource="L"/>
          &nbsp;</td>
          </tr>
          <tr >
            <td class="mattrlabeltext">Secret Answer:  *</td>
            <td colspan="3"><webbase:customerData dataType="WebAnswer" editMode="1" dataSource="L"/></td>
          </tr>
          <tr> 
            <td align="right">&nbsp;</td> 
            <td width="78"><webbase:customerData dataType="NewCustomer" customerCompany="xxxx" customerType="xxxx"/><webbase:customerData dataType="NewCustomerLateLogin"/></td> 
            <td colspan="2" align="center">&nbsp;</td> 
          </tr> 
          <tr> 
            <td colspan="2" align="center"> <a href="WebBaseMain.do?NextURL=/jsp/SignIn.jsp"><img src="../../../images/navigation/cancel.gif" width="49" height="17" border="0"></a> </td> 
            <td colspan="2" align="center"><webbase:formHelper dataType="SaveNewCustomerBtn" label="Save Customer" nextURL="/jsp/ReviewOrder.jsp"> 
              <img src="../../../images/navigation/accept.gif"> 
              </webbase:formHelper> </td> 
          </tr> 
        </table> 
        <webbase:formHelper dataType="formList"/> 
        <webbase:formHelper dataType="FormValidate"/> 
      </form>
      <!-- InstanceEndEditable --></td>
  </tr>
  <tr>
    <td><%@ include file="../includes/footer.htm"%></td>
  </tr>
</table>
</body>
<!-- InstanceEnd --></html>
