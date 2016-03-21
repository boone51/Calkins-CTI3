<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../includes/header.htm"%>
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
	<div class="jumbotron" style="margin-top:85px">
        <h1>Welcome to AdbaseE Classifieds!</h1>
        <p>Here you'll find many options for selling whatever it is you're trying to sell. Browse through our categories using the link below, or login to view your account details, kill an running ad, release a quote, etc. Thanks for choosing AdbaseE Classifieds as your online ad booking tool.</p>
        <p><a href="#" class="btn btn-default btn-lg popover-trigger" id="ThisName" role="button" >Learn more &raquo;</a></p>
		
		<p id='container'>
<button class='btn btn-primary btn-large' data-popover="true" data-html=true data-content="<a href='http://www.wojt.eu' target='blank' >click me, I'll try not to disappear</a>">hover here</button>
</p>
      </div>
	<h2>Login Options</h2>
	<!--BEGIN Tabs attempt-->
	 <ul id="myTab" class="nav nav-tabs" role="tablist">
      <li class="active"><a href="#home" role="tab" data-toggle="tab">Start Now!</a></li>
      <li><a href="#login" role="tab" data-toggle="tab">Login</a></li>
      <li class="dropdown">
        <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">I Forgot... <span class="caret"></span></a>
        <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
          <li><a href="#forgotPW" tabindex="-1" role="tab" data-toggle="tab">Forgot Password</a></li>
          <li><a href="#dropdown2" tabindex="-1" role="tab" data-toggle="tab">Soft Login</a></li>
        </ul>
      </li>
    </ul>
	<!--BEGIN Tabs Content-->
	<div id="myTabContent" class="tab-content">
      <div class="tab-pane fade in active" id="home">
        <h3>Start Building My Ad</h3>
          <p>You can skip the account creation and begin placing your ad. Once you're happy with your ad you can create an account or login at that time.</span></p>
		  <p><a href="javascript:document.LoginUser2.submit()" class="mainlinks"><button type="button" class="btn btn-lg btn-primary" id="formSub">Begin creating your ad now!</button></a>
		  <webbase:userLogin dataType="fakeLogin" loginAsUser="latelogin" lateLoginFormName="LoginUser2"/>
		  </p>
      </div>
      <div class="tab-pane fade" id="login">
			<form method="post" action="WebBaseMain.do" name="LoginUser" class="form-inline" role="form">
			<webbase:errorData dataType='ErrorURL' nextURL='/jsp/login.jsp'/>
				<h3>Login</h3>
					<fieldset style="width:450px">
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
						<input name="imageField" type="image" src="../../../images/navigation/login.gif"  class="btn btn-lg btn-success" alt="Click To Log In" width="49" height="17" border="0">
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
      <div class="tab-pane fade" id="forgotPW">
		<h3>Password Lookup</h3>
        <p>Forget your password? Use our <a href="WebBaseMain.do?cmd=EmailPassword" class="mainlinks">Password Lookup</a>.
		</p>
      </div>
      <div class="tab-pane fade" id="dropdown2">
	  <h3>Soft Login</h3>
        <form name="SoftLogin" method="post" action="WebBaseMain.do" class="nomargin">
			<webbase:errorData dataType='ErrorURL' nextURL='/jsp/login.jsp'/>
			<p>Enter last name and phone number. Entereing address will help to narrow our search down.
			</p>
			<p>Last Name:</p>
			<p><webbase:userLogin dataType="customerLastName"/></p>
			<p>Phone Number:</p>
			<p><webbase:userLogin dataType="customerTelephone"/>
			<br>
			xxxxxxxxxx
			<p>Address:</p>
			<p><webbase:userLogin dataType="customerAddress"/></p>
			<webbase:formHelper dataType="submitButton" label="Login" name="questionableLogin" nextURL="/jsp/SetAdType.jsp">
			searchMe
			</webbase:formHelper> <button type="button" class="btn btn-lg btn-success">Find Me!</button>
			<webbase:formHelper dataType="formList"/>
			<webbase:formHelper dataType="FormValidate"/>
		</form>
      </div>
    </div>
	<!--END Tabs content-->
	<!--END Tabs attempt-->
	  <!--END new content divs-->
<%@ include file="../includes/footer.htm"%>


<script>
		$(document).ready(function() {

		//
		$( "#category" ).addClass( "popover" );

		  
		  
		  //
		var originalLeave = $.fn.popover.Constructor.prototype.leave;
		$.fn.popover.Constructor.prototype.leave = function(obj){
		  var self = obj instanceof this.constructor ?
			obj : $(obj.currentTarget)[this.type](this.getDelegateOptions()).data('bs.' + this.type)
		  var container, timeout;

		  originalLeave.call(this, obj);

		  if(obj.currentTarget) {
			container = $(obj.currentTarget).siblings('.popover')
			timeout = self.timeout;
			container.one('mouseenter', function(){
			  //We entered the actual popover – call off the dogs
			  clearTimeout(timeout);
			  //Let's monitor popover content instead
			  container.one('mouseleave', function(){
				$.fn.popover.Constructor.prototype.leave.call(self, self);
			  });
			})
		  }
		};


		$('body').popover({ selector: '[data-popover]', trigger: 'click hover', placement: 'auto', delay: {show: 50, hide: 400}});
		  //
		  $(".popover-trigger").mouseover(function() {
			el = $(this);
			testID = $(this).attr("id");
			console.log(testID);
			if (testID=="category"){
					console.log("its category id");
			}
			$.get("testLoad.html", function(response) {
			  el.unbind('click').popover({
				content: response,
				title: 'Dynamic response!',
				trigger: 'click hover',
				html: true,
				delay: {show: 500, hide: 100}
			  }).popover('show');
			});
		  });
		/*END on Load function*/
		});
</script>
</html>