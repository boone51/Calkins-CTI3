</div></div> <!-- /container -->
<div style="padding-top:20px">
<!-- Padding for the footer -->
</div>
<!--BEGIN footer-->
<div class="footer" >
	  <div class="text-center" style="padding-top:10px">
		<p class="text-muted">&copy; Copyright 2015, Bucks County Courier Times, Levittown, PA.</p>
	  </div>
</div>
<!--END footer-->




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
	<script>
	//if new account pages
			<%
			if (session.getAttribute("pageName") == "newaccountLL.jsp" || session.getAttribute("pageName") == "newaccount.jsp")
			{ %>
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
			<%}%>
			//END if new account pgaes
			//BEGIN login page
			<%
			if (session.getAttribute("pageName") == "login.jsp")
			{ %>
			$(document).ready(function(){

				var clickEvent = false;
				$('#myCarousel').carousel({
					interval:   4000
				}).on('click', '.list-group li', function() {
						clickEvent = true;
						$('.list-group li').removeClass('active');
						$(this).addClass('active');
				}).on('slid.bs.carousel', function(e) {
					if(!clickEvent) {
						var count = $('.list-group').children().length -1;
						var current = $('.list-group li.active');
						current.removeClass('active').next().addClass('active');
						var id = parseInt(current.data('slide-to'));
						if(count == id) {
							$('.list-group li').first().addClass('active');
						}
					}
					clickEvent = false;
				});
			})

			$(window).load(function() {
				var boxheight = $('#myCarousel .carousel-inner').innerHeight();
				var itemlength = $('#myCarousel .item').length;
				var triggerheight = Math.round(boxheight/itemlength+1);
				$('#myCarousel .list-group-item').outerHeight(triggerheight);
			});
			//
			function resizeMainCarousel(){
			console.log('resizing the carousel');
			var boxheight = $('#myCarousel .carousel-inner').innerHeight();
				var itemlength = $('#myCarousel .item').length;
				var triggerheight = Math.round(boxheight/itemlength+1);
				$('#myCarousel .list-group-item').outerHeight(triggerheight);
				};
			//

			//

			<%}%>
			//END login page
			//BEGIN doc ready function
			 $().ready(function(){
			 //
			 $("td").css("background", "transparent");
			 //
			 //BEGIN Automatic forwarding
			 //If there is only one package, hide the body and automatically move to the next page.
			 if($("table[name=PackageDetailDescriptionTable]").length==1){
			 $("body").hide();
			 console.log( "found only one package");
			 $("input[name='PackageSelector']").trigger("click");
			 };
			 //
			 //END Automatic forwarding
			 //BEGIN wrap all form input with formhelper function for Bootstrap 3 automatic styling
			$("input:not([type=image],[type=button],[type=submit],[type=hidden],[type=checkbox],[type=radio])").each(function(){
					$(this).addClass( "form-control" );
			});
                $("select").each(function(){
					$(this).addClass( "form-control" );
			});
			//
			//
			//if dynamic previews page
			$(".mlayouttable table").attr('width','250px');
			$(".mlayouttable table").addClass('previewGrid');
			//


			//BEGIN function for button to upload photos
			//
			function uploadPhotos(){
				 document.editAd.action = "WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp";
				 document.editAd.submit();
			}
			//
			//END function for button to upload photos
			//BEGIN newaccount.jsp javascript
			<%
			if (session.getAttribute("pageName") == "newaccountLL.jsp")
			{ %>
			var returnInput = document.getElementsByName('SaveNewCustomerBtnURL');
			$(returnInput).val('/jsp/<%= session.getAttribute( "returnPage" ) %>');
			<%}%>
			//END newaccount.jsp javascript
			//
			//signIn upodater JS below
			var signInReturn =document.getElementsByName('lateLogin.xURL');
			$(signInReturn).val('/jsp/<%= session.getAttribute( "pageName" ) %>');
			//
			var logInReturn =document.getElementsByName('ErrorURL');
			$(logInReturn).val('/jsp/<%= session.getAttribute( "pageName" ) %>');
			//
			//Alerts override
				if ("<webbase:errorData dataType='ErrorMsg'/>"!=""){
					$("#EpageError").show();
				};
				//
				$(".close").click(function(){
					return verify()
					$("#EpageAlert").alert();
				});
				//
				window.alert = function(message) {
					document.title="message"
					$("#EpageAlert").fadeIn();
					$('#errorConent').text(message);
					//

					//
					return false;
				};
				//more overrides
				//
				/*window.confirm = function (message, callback, caption) {
					caption = caption || 'Confirmation'

					$(document.createElement('div')).attr({
						title: caption,
						'class': 'dialog'
						}).html(message).dialog({
						position: ['center', 100],
						dialogClass: 'fixed',
						buttons: {
							"OK": function () {
								$(this).dialog('close');
								callback()
								return true;
							},
							"Cancel": function () {
								$(this).dialog('close');
								return false;
							}
						},
						close: function () {
							$(this).remove();
						},
						draggable: false,
						modal: true,
						resizable: false,
						width: 'auto'
					});
				};

				confirm('dd', function () {
					//what every needed to be done on confirmation has to be done here
					console.log('confirmed')
				})
				*/

						//
			});//END doc ready function
			//
			function uploadPhotos(formName){
				document.location = "WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp";
				//document.editAd.action = "WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp";
				//console.log('trying to submit this: '+formName);
				//document.forms[formName].submit();
				//document.forms.editAd.submit();
			}
			//
			//
			//BEGIN Misc JS
			function getXtraInfo(retDiv){
				console.log('getrates called - ' +retDiv);
				$( "#xtraInfoResult" ).load( "xtraInfo.jsp #"+retDiv+"" );
			}
			//
			//
			function myPluginLoadEvent(func) {
					// assign any pre-defined functions on 'window.onload' to a variable
					var oldOnLoad = window.onload;
					// if there is not any function hooked to it
					if (typeof window.onload != 'function') {
						// you can hook your function with it
						window.onload = func
					} else {     // someone already hooked a function
						window.onload = function () {
							// call the function hooked already
							oldOnLoad();
							// call your awesome function
							console.log('awesome function loaded');
							func();
						}
					}
			}

				// pass the function you want to call at 'window.onload', in the function defined above
			myPluginLoadEvent(function(){
				// your awesome code to run on window.onload
				console.log('window loaded');

			});
			console.log("javascript is finished");
			//END Misc JS
	</script>
<script>
$(document).ready(function(){
$('fieldset input[type=checkbox]').before('<br clear="all" />');
});
</script>