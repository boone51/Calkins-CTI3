<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "PreviewAds.jsp" );%>
<% session.putValue( "returnPage", "PreviewAds.jsp" );%>
<%@ include file="../includes/header.htm"%>
<webbase:mactiveAction dataType="UpdateData" dataValue=""/> 
<%@ include file="../includes/top-nav.htm"%>

	  <webbase:showIf expression="!allPackageAdsComplete">
	    <webbase:showIf expression="adIsPartOfPackage">
          <webbase:showIf expression="allPackageUserInputComplete">
              <webbase:mactiveAction dataType="GeneratePackageAdPreviews" dataValue=""/> 
          </webbase:showIf>
        </webbase:showIf>
	  </webbase:showIf>
	  <webbase:showIf expression="allPackageAdsComplete">
	    <webbase:mactiveAction dataType="UpdateData" dataValue=""/>
		<webbase:mactiveAction dataType="RunCommand" dataValue="<DoAction action='GenerateAd'/>"/>
			<webbase:mactiveAction dataType="UpdateData" dataValue=""/>
	  </webbase:showIf>
	  
<form method="post" action="WebBaseMain.do" name="merchattributes"> 
<%-- Updates the fielded data upon submitting this page --%>
<webbase:orderData dataType="UpdateFieldedData" />
<webbase:errorData dataType='ErrorMsg'/> 
<webbase:errorData dataType='ErrorURL' nextURL='/jsp/PreviewAds.jsp'/> 
	<h2>View and Edit Ad(s)</h2> 
	<div class="lead">You may edit individual ads and change styles by clicking the edit button below the ad. Your selected Ad Category is: </div>
	<br>
<!--BEGIN row-->
			
			
			<!--new move-->
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<div style="padding-bottom:10px">Your selected Ad Category is:
						<span class="mgroupname">
							<webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/>
						</span>
					</div>
					<a href="WebBaseMain.do?NextURL=/jsp/SetPackage.jsp"><button type="button" class="btn btn-info"><strong>Change Package</strong><span class="glyphicon glyphicon-cog" style="margin-left:4px"></span></button></a></br></br>
					<span class="mgroupname" style="padding-top:10px">Ad Cost</span>
					<webbase:orderData dataType="Total Price"/>
					<webbase:adIt>
					<ul class="list-unstyled">
						<li><h4>Ad Preview</h4></li>
						<li>The preview below is how your ad will appear in the following product(s):</li>
							<li><webbase:runScheduleIt>
								<ul>
								<li><webbase:RSDetail dataType="Product"/></li>
								</ul>
								</webbase:runScheduleIt>
								</li>
							<li id="imgPreview" class="text-center"><table width="100%"><webbase:adData dataType="ImagePreviewAllVersions"/></table></li>
							<li class="text-center">
								<div id="editBUT">
									<webbase:adData dataType="EditAdButton" label="EditAd" nextURL="/jsp/EditAd.jsp">
									<img src="../../../images/navigation/editad.gif" width="61" height="17" border="0">
									</webbase:adData>
								</div>
							</li>
							<li><strong>Ad Information</strong></li>
							<li>Ad Depth: <webbase:adData dataType="AdDepthInUnits"/></li>
							<li>Run Schedule Information</li>
							<li><span>(NOTE: Click the plus and minus buttons to see a list the individual days) </span></li>
							<webbase:runScheduleIt>
								<ul>
									<li><webbase:RSDetail dataType="DateRangeBegin" plus="../../../images/plus.gif" minus="../../../images/minus.gif"/>
									<webbase:RSDetail dataType="NumInserts"/> day(s) starting
									<webbase:RSDetail dataType="Fday"/> in <webbase:RSDetail dataType="ProductDescription"/> <webbase:RSDetail dataType="DateRangeEnd"/>
									</li>
								</ul>
							</webbase:runScheduleIt>
					</webbase:adIt>
				</div>
				<div class="col-md-2">
				</div>
			</div>
<!--END row-->
<!--BEGIN button row-->
			<div class="row" style="padding-top:30px">
				<div class="col-sm-2">
				</div>
				<!-- If the ad is part of a package the previous page should be the SetPackage page -->
				<div class="col-sm-3 text-left">
						<div id="previousBUT"><webbase:formHelper dataType="cancelButton" label="Back" name="GoBack" nextURL="/jsp/GetPackageInformation.jsp"> 
						<img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> 
						</webbase:formHelper> </div>
						
				</div>
				<div class="col-md-2">
				</div>
				<div class="col-sm-3 text-right">
						<div style="display:inline">
							<webbase:showIf expression="!isFakeCustomerLoggedIn">
									<webbase:formHelper dataType="submitButton" label="Continue" name="continue" nextURL="/jsp/ReviewOrder.jsp"> 
									<img src="../../../images/navigation/checkout.gif" width="80" height="17"> 
									</webbase:formHelper>
							</webbase:showIf>
							<webbase:showIf expression="isFakeCustomerLoggedIn">
									<%--<webbase:formHelper dataType="submitButton" label="Continue" name="continue" nextURL="/jsp/SignIn.jsp"> 
									<img src="../../../images/navigation/checkout.gif" width="80" height="17"> 
									</webbase:formHelper>--%>
									<!--enc-->
							</webbase:showIf>
						</div>
						
						
						<!--
						
						<a href="#" data-toggle="modal" data-target=".bs-example-modal-sm">Login<!{1}**<span class="caret"></span>**{1}></a>
						
						-->
						
					<webbase:showIf expression="isFakeCustomerLoggedIn" >
						<button type="button" class="btn btn-success Ebutton" data-toggle="modal" data-target=".bs-example-modal-sm">Login <span class="glyphicon glyphicon-user"> </span></button>
					</webbase:showIf>
					<webbase:showIf expression="!isFakeCustomerLoggedIn" >
						<button type="button" class="btn btn-success Ebutton" value="continue">Checkout <span class="glyphicon glyphicon-ok"></span></button>
					</webbase:showIf>
				</div>
				<div class="col-sm-2">
				</div>
			</div>
<!--END row-->
<!--END button row-->
			

			
<!--END button row-->
	
<webbase:formHelper dataType="formList"/>
<webbase:formHelper dataType="FormValidate"/>
</form>
<%@ include file="../includes/footer.htm"%>
<script language="javascript">
function disableBack(){
  history.go(1);
}
disableBack();
</script>
</html>
