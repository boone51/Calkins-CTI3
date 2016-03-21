<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
<% session.putValue( "pageName", "PreviewAds.jsp" );%>
<% session.putValue( "returnPage", "PreviewAds.jsp" );%>
<%@ include file="header.jsp"%>
<webbase:mactiveAction dataType="UpdateData" dataValue=""/>

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
	<div class="container">
        <h2>View and Edit Ad(s)</h2>

	<br>
<!--BEGIN row-->


			<!--new move-->
			<div class="row">
                <div class="col-md-2">
                    <%@ include file="menuLeft.jsp"%>
                </div>
				<div class="col-md-7">
                    <div class="lead">You may edit individual ads and change styles by clicking the edit button below the ad.</div>
					<div style="padding-bottom:10px">Your selected Ad Category is:
						<span class="mgroupname">
							<webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/>
						</span>
					</div>


					<webbase:adIt>
					<ul class="list-unstyled">
						<li><h4>Ad Preview</h4></li>
						<li>The preview below is how your ad will appear in the following product(s):</li>
							<li><webbase:runScheduleIt>
								<ul>
								<li><webbase:RSDetail dataType="ProductDescription"/></li>
								</ul>
								</webbase:runScheduleIt>
								</li>
							<li id="imgPreview" class="text-center"><table width="100%"><webbase:adData dataType="ImagePreviewAllVersions"/></table></li>
							<li class="text-center">

									<webbase:adData dataType="EditAdButtonV2" label="Edit Ad" nextURL="/jsp/EditAd.jsp" buttonClass="btn btn-info btn-xs"/>

							</li>
							<%--<li><strong>Ad Information</strong></li>
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
							</webbase:runScheduleIt>--%>
					</webbase:adIt>
				</div>
				<!--BEGIN Right Ad Info-->
					<div id="subnav" class="col-md-3">
							<%@ include file="orderPanel.jsp"%>
					</div>
					<!--END Right Ad Info-->
			</div>
<!--END row-->
<!--BEGIN button row-->
			<div class="row" style="padding-top:30px">
				<div class="col-sm-2">
				</div>
				<!-- If the ad is part of a package the previous page should be the SetPackage page -->
				<div class="col-sm-3 text-left">
						<webbase:formHelper dataType="cancelButtonV2" label="Previous" nextURL="/jsp/GetPackageInformation.jsp" buttonClass=" btn btn-default"/>

				</div>
				<div class="col-md-2">
				</div>
				<div class="col-sm-3 text-right">
						<div style="display:inline">
							<webbase:showIf expression="!isFakeCustomerLoggedIn">
									<webbase:formHelper dataType="submitButtonV2" name="ContinueButton" label="Continue" nextURL="/jsp/ReviewOrder.jsp" buttonClass="btn btn-success">
											<span class="glyphicon glyphicon-calendar glyphicon-cont"></span>
									</webbase:formHelper>
							</webbase:showIf>
							<webbase:showIf expression="isFakeCustomerLoggedIn">
							 <a href="#" data-toggle="modal" data-target=".bs-example-modal-sm" class="btn btn-success">Login<!--<span class="caret"></span>--></a>


									<!--enc-->
							</webbase:showIf>
						</div>



				</div>
				<div class="col-sm-2">
				</div>
			</div>
<!--END row-->
<!--END button row-->
        </div>
<!--        END container-->



<!--END button row-->

<webbase:formHelper dataType="formList"/>
<webbase:formHelper dataType="FormValidate"/>
</form>
<%@ include file="modals.jsp"%>
<%@ include file="footer.jsp"%>
<script language="javascript">
function disableBack(){
  history.go(1);
}
disableBack();
</script>
</html>
