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
 $().ready(function(){
			//alert('doc is loading');
			$("input[type!=image]").each(function(){
			//
				$(this).addClass( "form-control" );
			});
			//
			$("input[type=image]").each(function(){
			//
				//$(this).addClass( "btn btn-lg btn-success" );
				//$(this).val( "Go!" );
			});
			$('#previousBUT a').html('My New Link Text or HTML');
			alert('setting button');
			<%   
			if (session.getAttribute("pageName") == "newaccountLL.jsp")
			{ %>
				var returnInput = document.getElementsByName('SaveNewCustomerBtnURL');
				$(returnInput).val('/jsp/<%= session.getAttribute( "returnPage" ) %>');
			<%}%>
			//
			$( ".Ebutton" ).on( "click", function() {
					$( document.getElementsByName($(this).val()) ).trigger( "click" );
			});
			//
			
			//
});//END doc ready function