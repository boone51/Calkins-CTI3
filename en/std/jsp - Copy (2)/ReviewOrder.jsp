<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "ReviewOrder.jsp" );%>
<% session.putValue( "returnPage", "ReviewOrder.jsp" );%>
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


	  <webbase:mactiveAction dataType="RunCommand" dataValue="<DoAction action='GenerateAd'/>"/>
	  <webbase:mactiveAction dataType="UpdateData" dataValue=""/>

	 <form name="ReviewOrder" method="post" action="WebBaseMain.do">

      <webbase:errorData dataType="ErrorURL" nextURL="/jsp/ReviewOrder.jsp"/>
	  <div id="EpageError" class="alert alert-danger" role="alert" style="display:none"><webbase:errorData dataType='ErrorMsg'/> </div>
<div class="container">
        <h2>Review Order</h2>




		<div class="row">
            <div class="col-md-2">
                <%@ include file="menuLeft.jsp"%>
            </div>

			<div class="col-md-4">

					<%-- Show Media Loader Images --%>
						  <!-- if online photos were uploaded, display photos -->
						<webbase:showIf expression="isOnlinePhotoUploaded">
							Uploaded Photos
							<webbase:uploadImage dataType="thumbNails" numColumns="4" thumbnailSize="100" displayOnly="true"/>
							<a href="WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp">Click to change photos</a>
						</webbase:showIf>
						<webbase:adIt>
							<strong>Ad Preview</strong></br>
							<ul class="list-unstyled">
									<li class="adPreviews"><webbase:adData dataType="ImagePreviewAllVersions"/></li>
									<li>
									<webbase:adData dataType="PDFPreview">View PDF preview of this ad.</webbase:adData>
									</li>
									<li>
												Prodcuts associated with this ad:
												<webbase:runScheduleIt>
												<ul>
														<li>
																<webbase:RSDetail dataType="Product"/>
														</li>
												</ul>
											</webbase:runScheduleIt>
									</li>
							</ul>
							<%--<h4>Ad Information</h4>

							<ul class="list-unstyled">
							<li>Size: <webbase:adData dataType="AdDepthInUnits"/></li>

							<li>Run Schedule: </li>
							<webbase:runScheduleIt>
								<ul class="list-unstyled">
								<li><webbase:RSDetail dataType="DateRangeBegin" plus="../../../images/plus.gif" minus="../../../images/minus.gif"/>
								<webbase:RSDetail dataType="NumInserts"/>
								day(s) starting
								<webbase:RSDetail dataType="Fday"/> in <webbase:RSDetail dataType="Product"/><br>
								<webbase:RSDetail dataType="DateRangeEnd"/> </li>
								</ul>
							</webbase:runScheduleIt>
								</br>
								<strong>Price:</strong> <webbase:adData dataType="AdPrice"/>
							</ul>--%><!---->
						  </webbase:adIt>


			</div>


    <!-- If customer is not in edit mode -->
<div id="subnav" class="col-md-3">
						<webbase:showIf expression="!adInEditMode">
							<webbase:showIf expression="!isFakeCustomerLoggedIn" >
							  <webbase:showIf expression="!isAdOrderZeroCost" >

                                  <div class="row">
							  <span class="mgroupname">Credit Card: <webbase:adOrderPaymentInfo dataType="PayForCurrentOrder" editMode="1"/></span>
                                  </div>
                                    <div class="row">
                                        <span class="mgroupname">CCID: <webbase:adOrderPaymentInfo dataType="CreditCardSecurityNumber" editMode="1"/>
                                    </div>


								 <a href="WebBaseMain.do?NextURL=/jsp/AddCreditCard.jsp&urlaction=push"><button type="button" class="btn btn-info">Add Credit Card</button></a>
								  </webbase:showIf>
							</webbase:showIf>
						</webbase:showIf>

				<!-- If customer is in edit mode -->
						<webbase:showIf expression="adInEditMode">
							 <webbase:showIf expression="!isFakeCustomerLoggedIn">
								<webbase:showIf expression="!isAdOrderZeroCost">
									<webbase:showIf expression="orderHasBalanceDue">
									  <span class="mgroupname">Credit Card: <webbase:adOrderPaymentInfo dataType="PayForCurrentOrder" editMode="1"/></span>
									</webbase:showIf>
									<webbase:showIf expression="orderRefundIsDue">
										<span class="mgroupname">
										Original Order Price: <webbase:orderData dataType="AdOrderPreEditCost"/><br>
										Your Refund: <webbase:orderData dataType="TotalOrderAmountDue"/>
										 </span>
									 </webbase:showIf>
								</webbase:showIf>
							</webbase:showIf>
						</webbase:showIf>
    </div>
			<!--BEGIN Right Ad Info-->
							<div id="subnav" class="col-md-3">
									<%@ include file="orderPanel.jsp"%>
							</div>
							<!--END Right Ad Info-->
		</div>
<!--END row-->



		<!--BEGIN button row-->
		<div class="row" style="padding-top:30px" class="text-center">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-3 text-left">
					<webbase:formHelper dataType="cancelButtonV2" label="Previous" nextURL="/jsp/PreviewAds.jsp" buttonClass="btn btn-default"/>

			</div>

			<div class="col-sm-2 text-center">
				<!--quote buttons-->
				<webbase:showIf expression="!isFakeCustomerLoggedIn" >
				<webbase:orderData dataType="SaveQuoteBtnV2" nextURL="/jsp/OrderConfirmationQuote.jsp" label="Save as QuoteV2" buttonClass="btn btn-default"/>
				</webbase:showIf>
				<!--quote back buttons-->
			</div>

			<div class="col-sm-3 text-right">
					<!--continue buttons-->
						<webbase:showIf expression="!isFakeCustomerLoggedIn" >
						<webbase:orderData dataType="SaveOrderBtnV2" label="Save Order" nextURL="/jsp/OrderConfirmation.jsp" unlock="1" buttonClass="btn btn-success"/>
						</webbase:showIf>
						<webbase:showIf expression="isFakeCustomerLoggedIn" >
						<a href="#" data-toggle="modal" data-target=".bs-example-modal-sm" class="btn btn-success">Login<!--<span class="caret"></span>--></a>
						</webbase:showIf>
					<!--END continue buttons-->
			</div>
			<div class="col-sm-2">
					</div>
		</div>
		<!--END row-->
		<!--END button row-->
</div>

		<webbase:formHelper dataType="formList"/>
        <webbase:formHelper dataType="FormValidate"/>
	</form>
<%@ include file="footer.jsp"%>
</html>
