<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "AccessDenied.jsp" );%>
<% session.putValue( "returnPage", "AccessDenied.jsp" );%>
<%@ include file="header.jsp"%>
<webbase:mactiveAction dataType="UpdateData" dataValue=""/>
<%@ include file="top-nav.jsp"%>
					<div class="row">
						<div class="col-md-3">

						</div>
						<div class="col-md-6">
							<webbase:errorData dataType='ErrorMsg'/>
							<webbase:errorData dataType='ErrorURL' nextURL='AccessDenied.jsp'/> <br>
							Please Try again.

					 <form method="post" action="WebBaseMain.do" name="LoginUser">
								  USER
									  LOGIN &nbsp;
								  Name:
									<webbase:userLogin dataType="userName"/>
								  Password:
									<webbase:userLogin dataType="userPassword"/>
								  <input name="imageField" type="image" src="../../../images/navigation/login.gif" alt="Click To Log In" width="49" height="17" border="0">
									<input type="hidden" name="FormType" value="LoginUser">
							Forget your password? Use
								our <a href="WebBaseMain.do?cmd=EmailPassword"> Password
								Lookup </a>.
							  <webbase:formHelper dataType="formList"/>
							&nbsp;
							Create a <a href="WebBaseMain.do?cmd=NewCustomer">new
								  account </a>
						<br>
						<br>
						<br>
					  </form>
					  </div>
					  <div class="col-md-3">

						</div>
					</div>
            <script language="JavaScript">
	  if(document.forms[0].userName){
	    document.forms[0].userName.focus();
	  }
	  </script>
<%@ include file="footer.jsp"%>
<script type="javascript" src="../../../scripts/FormUtils.js"></script>
</html>