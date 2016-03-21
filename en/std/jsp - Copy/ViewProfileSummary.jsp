<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "ViewProfileSummary.jsp" );%>
<% session.putValue( "returnPage", "ViewProfileSummary.jsp" );%>
<%@ include file="../includes/header.htm"%>
<%@ include file="../includes/top-nav.htm"%>
<style>
.ckind {
	background: #fff;
}
.ckind:hover {
	background: #f0f0f0;
}
</style>
<h2>Profile Information</h2>
<webbase:errorData dataType='ErrorMsg'/>
 <webbase:mactiveAction dataType="UpdateData" dataValue=""/>
			<form method="post" action="WebBaseMain.do" name="myaccount"> 
				
				<webbase:errorData dataType='ErrorURL' nextURL='/jsp/ViewProfileSummary.jsp'/>
				
				
				
<div class="row">
	<div class="col-md-5">
			<!--Account info-->
				<ul class="list-unstyled">
				<li>Account Number:
				<webbase:customerData dataType="Accno" dataSource="U"/></li>
				<li>Name: 
				<webbase:customerData dataType="FullName" dataSource="U"/></li>
				<li>Address: 
				<webbase:customerData dataType="AddrStreet1" dataSource="U"/></li>
				<li>Address 2: 
				<webbase:customerData dataType="AddrStreet2" dataSource="U"/></li>
				<li>Address 3: 
				<webbase:customerData dataType="AddrStreet3" dataSource="U"/></li>
				<li>City: 
				<webbase:customerData dataType="AddrCity" dataSource="U"/></li>
				<li>State: 
				<webbase:customerData dataType="AddrState" dataSource="U"/></li>
				<li>Zip: 
				<webbase:customerData dataType="AddrZip1" dataSource="U"/></li>
				<li>Country: 
				<webbase:customerData dataType="AddrCountry" dataSource="U"/></li>
				<li>Phone: (<webbase:customerData dataType="PhoneAC" dataSource="U"/>) <webbase:customerData dataType="Phone3" dataSource="U"/>-<webbase:customerData dataType="Phone4" dataSource="U"/> Ext. <webbase:customerData dataType="Phonex" dataSource="U"/> </li>
				<li>Secondary Phone: (<webbase:customerData dataType="SecPhoneAC" dataSource="U"/>) <webbase:customerData dataType="SecPhone3" dataSource="U"/>-<webbase:customerData dataType="SecPhone4" dataSource="U"/> Ext. <webbase:customerData dataType="SecPhonex" dataSource="U"/> </li>
				<li>Email: 
				<webbase:customerData dataType="Email" dataSource="U"/></li>
				</ul>
				
				<a href="WebBaseMain.do?NextURL=/jsp/editaccount.jsp"><img src="../../../images/navigation/editaccount.gif" width="99" height="17" border="0"></a> 
	</div>
	<div class="col-md-2">
	</div>
	<div class="col-md-5">
			<h4>Credit Cards on File </h4>
				
				<a href="WebBaseMain.do?NextURL=/jsp/AddCreditCard.jsp&urlaction=push">
				<img src="../../../images/navigation/addcreditcard.gif" width="115" height="17" border="0">
				</a>
				<!--BEGIN Stored Cards-->
					  <webbase:CCardIt> 
						<ul class="list-unstyled ckind">
						<li><webbase:CCardData dataType="CardKind"/></li>
						<li><webbase:CCardData dataType="CardNum"/></li>
						<li>Expires:
						<webbase:CCardData dataType="ExpDate"/></li>
						<li><webbase:CCardData dataType="Name"/></li>
						<li><webbase:CCardData dataType="Addr1"/></li>
						<li><webbase:CCardData dataType="City"/>
						  ,
							<webbase:CCardData dataType="State"/>
							<webbase:CCardData dataType="Zip"/></li>
						<li><webbase:CCardData dataType="Phone"/></li>
						</ul>
					  </webbase:CCardIt> 
				<!--END Stored Cards-->
	</div>
</div>
<!--END row-->
				
				
				
				
				
				
				
				
			</form> 
      <!-- InstanceEndEditable -->
    <%@ include file="../includes/footer.htm"%>
	</html>