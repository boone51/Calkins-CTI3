<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<!DOCTYPE html>
<%@ include file="header.jsp"%>
<style>
.jumbotron {
    padding: 0.5em 0.6em;
}
.jumbotron h1 {
        font-size: 3em;
}
.jumbotron p {
        font-size: 1.2em;
}
.jumbotron .btn {
            padding: 0.5em;
}
fieldset {
  padding: 1em;
  font:100%/1 sans-serif;
  }
label {
  float:left;
  width:25%;
  margin-right:0.5em;
  padding-top:0.2em;
  text-align:right;
  font-weight:bold;
  }
</style>

<webbase:errorData dataType='ErrorMsg'/>
<webbase:errorData dataType='ErrorURL' nextURL='/jsp/SignIn.jsp'/>
<h2>Sign In</h2>
		<div class="lead">
		Use the forms below to either login using an existing username and password you already have, or you can create a <a href="WebBaseMain.do?cmd=NewCustomerLL">new account</a>. 
		</div>
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
			<form name="LoginUser" method="post" action="WebBaseMain.do">
				<fieldset style="width:450px">
					<p>Enter your username and password. If you don't have a username and password, you can <a href="WebBaseMain.do?cmd=NewCustomer" class="mainlinks">create a new account</a>.
					</p>
					<label for="userName">Username:</label>
					<webbase:userLogin dataType="userName"/>
					</br>
					<label for="userPassword">Password:</label>
					<webbase:userLogin dataType="userPassword"/>
					</br>
					<webbase:userLogin dataType="lateLogin"/> 
					<webbase:formHelper dataType="submitButton" label="Login" name="lateLogin" nextURL="/jsp/SignInLanding.jsp">
					<img src="../../../images/navigation/login.gif" width="49" height="17" border="0" alt="Back">
					</webbase:formHelper> 
					
					</br>
					Or create a <a href="WebBaseMain.do?cmd=NewCustomerLL">new account</a>. 
					</br>
					Forget your password? Use our <a href="WebBaseMain.do?NextURL=/jsp/emailpasswordLL.jsp" class="mainlinks">Password Lookup</a>.
				</fieldset>
			<webbase:formHelper dataType="formList"/>
			<webbase:formHelper dataType="FormValidate"/>
			</form>
	<div class="col-md-2">
	</div>
</div>
<!--END row-->



<%@ include file="footer.jsp"%>
<script language="javascript">
function disableBack(){
  history.go(1);
}
disableBack();
</script>
</html>