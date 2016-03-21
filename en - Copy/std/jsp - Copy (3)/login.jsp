<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
    
<!DOCTYPE html>
<% session.putValue( "pageName", "login.jsp" );%>
<% session.putValue( "returnPage", "login.jsp" );%>
<%@ include file="header.jsp"%>

<div class="container">

    <div class="row">


	<h2>Login Options</h2> <span style="color:red;"><strong><webbase:errorData dataType='ErrorMsg'/></strong></span>
	<!--BEGIN Tabs attempt-->
	 <ul id="myTab" class="nav nav-tabs" role="tablist">
      <li class="active"><a href="#home" role="tab" data-toggle="tab">Start Now!</a></li>
      <li><a href="#login" role="tab" data-toggle="tab">Login</a></li>
      
    </ul>
	<!--BEGIN Tabs Content-->
	<div id="myTabContent" class="tab-content">
      <div class="tab-pane fade in active" id="home">
        <h3>Start Building My Ad</h3>
         <p class="alerttext"><span class="glyphicon glyphicon-pushpin"></span><em>Please Note: This self-serve ad portal offers "Private Party" rates only. For "Business" rates, please call 1-866-938-3010, and our Classified Specialist will be happy to help you. (Employment Category is excluded, so you may use the Self-Serve ad portal)</em>
</p>
          <p>You can skip the account creation and begin placing your ad. Once you're happy with your ad you can create an account or login at that time.</p>
		  <p><a href="javascript:document.LoginUser2.submit()" class="mainlinks"><button type="button" class="btn btn-lg btn-primary" id="formSub">Begin creating your ad now!</button></a>
		  <webbase:userLogin dataType="fakeLogin" loginAsUser="lateloginCTI" lateLoginFormName="LoginUser2"/>
		  </p>
      </div>
      <div class="tab-pane fade" id="login">
			<form method="post" action="WebBaseMain.do" name="LoginUser" class="form-inline" role="form">
			<webbase:errorData dataType='ErrorURL' nextURL='/jsp/login.jsp'/>

				<h3>Login</h3>
					<fieldset style="max-width:450px">
						<p>Enter your username and password. If you don't have a username and password, you can <a href="WebBaseMain.do?cmd=NewCustomer" class="mainlinks">create a new account</a>.
				</p>
						<label for="userName">Username:</label>
						<webbase:userLogin dataType="userName"/>
						</br>
						<label for="userPassword">Password:</label>
						<webbase:userLogin dataType="userPassword"/>

					</fieldset>
				<div class="form-group">
					<div id="loginBut">
						<!--BEGIN continue button code-->
						<input name="imageField" type="image" src="../../../images/navigation/but_login.gif" width="110" height="41" border="0" value="Log In">
<!--                        <input name="imageField" type="image" src="../../../images/navigation/login.gif" alt="Click To Log In" width="49" height="17" border="0">-->
						<!--END continue button code-->
						 <!--<button type="submit" form="LoginUser" value="Submit">Submit</button>.-->
					</div>
				<!--<button type="button" class="btn btn-lg btn-success" id="formSub">Go!</button>-->
				</div>
				<webbase:formHelper dataType="formList"/>
				<webbase:formHelper dataType="FormValidate"/>
				</br>
				<p>Forget your password? Use our <a href="WebBaseMain.do?cmd=EmailPassword" class="mainlinks">Password Lookup</a>.
				</p>
            </form>
      </div>

 
    </div>
	<!--END Tabs content-->
	<!--END Tabs attempt-->
	  <!--END new carousel divs-->
    </div>
</div>

<%@ include file="footer.jsp"%>



</html>
