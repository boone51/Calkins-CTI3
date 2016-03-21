<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html><!-- InstanceBegin template="/Templates/nomenu.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="allstyles.css" rel="stylesheet" type="text/css">
</head>

<body class="standard">

  
<% session.putValue( "pageName", "emailpassword.jsp" );%>
<% session.putValue( "returnPage", "emailpassword.jsp" );%>
<%@ include file="header.jsp"%>
  
  
    
	  <form method="post" action="WebBaseMain.do" name="EmailPassword"> 
        <<webbase:errorData dataType='ErrorMsg'/>
                    <webbase:errorData dataType='ErrorURL' nextURL='/jsp/emailpassword.jsp'/>
                <div class="container">
                  <h2> Forgot  Password:</h2>
                
                <div class = "row">
				<div class="col-xs-12 col-sm-12 col-md-2">
                        <%@ include file="menuLeft.jsp"%>
                 </div>
				
				<div class="col-xs-12 col-sm-12 col-md-7">
                                
                  Enter your email address or
                    username and click the Accept button. Your password will
                    be emailed to you shortly. <br> 
                    <br> 
                    
                    
                
                
                   Email or Username:
                  
                    <webbase:userLogin dataType="userEmail"/> 
                 
                
                 
                  
                  <td width="111"> 
                      <webbase:formHelper dataType="CancelEmailAddressBtn" label="Cancel Email Address" nextURL="/jsp/login.jsp"> 
                        <img src="../../../images/navigation/but_cancel.gif" width="110" height="41" border="0"S> 
                      </webbase:formHelper> 
                    </td> 
                  <td width="150"> 
                      <webbase:formHelper dataType="SendEmailAddressBtn" label="Send Email Address" nextURL="/jsp/emailsent.jsp"> 
                      <img src="../../../images/navigation/but_accept.gif" width="110" height="41" border="0"> 
                      </webbase:formHelper> 
                    </td> 
                </div>
        </div>
		</div>
		<webbase:formHelper dataType="formList"/> 
        <webbase:formHelper dataType="FormValidate"/>  
      </form>
      
  
 
 <%@ include file="modals.jsp"%>
 <%@ include file="footer.jsp"%>
 

<!-- InstanceEnd --></html>
