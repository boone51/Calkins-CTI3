<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "SetPackage.jsp" );%>
<% session.putValue( "returnPage", "SetPackage.jsp" );%>
<%@ include file="../includes/header.htm"%>
<%@ include file="../includes/top-nav.htm"%>
<style>
.packagetable {
	width:220px;
	float:left;
	padding-right:20px;

}
</style>
	<form method="post" action="WebBaseMain.do" name="AdOrderData"> 
	<script>
	
	</script>
		<webbase:errorData dataType='ErrorMsg'/> 
		<webbase:errorData dataType='ErrorURL' nextURL='/jsp/SetPackage.jsp'/><br />
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
						<div id="pckDisplay"><!--here is the other table-->
						</div>
						<!--BEGIN webbase tag-->
						<%--<webbase:orderData dataType="PackageSelector" editMode="1" numColumns="3"  packageButtonImageSrc="../../../images/apply.gif" nextURL="/jsp/SetMerchandiseAttributes.jsp" />--%>
						<webbase:orderData dataType="PackageSelectorV2" editMode="1" numColumns="3" buttonClass="btn btn-default" label="Submit" nextURL="/jsp/SetMerchandiseAttributes.jsp" /> 
						<!--END webbase tag ... seriously...this is what that one tag output.....not kidding...-->
				</div>
				<div class="col-md-2">
				</div>
			</div>
		<webbase:formHelper dataType="formList"/>
		<webbase:formHelper dataType="FormValidate"/>
	</form> 
<%@ include file="../includes/footer.htm"%>
</html>
