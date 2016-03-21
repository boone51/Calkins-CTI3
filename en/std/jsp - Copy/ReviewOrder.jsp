<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "ReviewOrder.jsp" );%>
<% session.putValue( "returnPage", "ReviewOrder.jsp" );%>
<%@ include file="../includes/header.htm"%>
<%@ include file="../includes/top-nav.htm"%>
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
		  
        <h2>Review Order</h2>
		
		
		
		
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
		<div style="padding-bottom:30px">Your selected Ad Category is:
			<span class="mgroupname">
				<webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/>
			</span></br>
			<%-- Show Media Loader Images --%>
				  <!-- if online photos were uploaded, display photos -->
				<webbase:showIf expression="isOnlinePhotoUploaded">
					Uploaded Photos
					<webbase:uploadImage dataType="thumbNails" numColumns="4" thumbnailSize="100" displayOnly="true"/>
					<a href="WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp">Click to change photos</a>
				</webbase:showIf>
				<webbase:adIt>
					<strong>Ad Preview</strong></br>
					<webbase:adData dataType="ImagePreviewAllVersions"/>
					<webbase:adData dataType="PDFPreview">View PDF preview of this ad.</webbase:adData>
						
					<h4>Ad Information</h4>
					
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
					</ul>
				  </webbase:adIt>
				<!-- If customer is not in edit mode -->

				<webbase:showIf expression="!adInEditMode">
					<webbase:showIf expression="!isFakeCustomerLoggedIn" >
					  <webbase:showIf expression="!isAdOrderZeroCost" >
					  <span class="mgroupname">Credit Card: <webbase:adOrderPaymentInfo dataType="PayForCurrentOrder" editMode="1"/></span>
						  <span class="mgroupname">CCID: <webbase:adOrderPaymentInfo dataType="CreditCardSecurityNumber" editMode="1"/>
						 </br>
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
	<div class="col-md-2">
	</div>
</div>
</div>
<!--END row-->
		<div style="display:none">
				<webbase:showIf expression="isFakeCustomerLoggedIn" >
							<webbase:formHelper dataType="submitButton" label="Continue" name="SetLayout" nextURL="/jsp/SignIn.jsp"> 
							<img src="../../../images/navigation/login.gif" width="49" height="17" border="0"> 
							</webbase:formHelper>
				</webbase:showIf>
				
				<webbase:showIf expression="!isFakeCustomerLoggedIn" >
				<webbase:orderData dataType="SaveQuoteBtn" nextURL="/jsp/OrderConfirmationQuote.jsp" label="Save as Quote"><img src="../../../images/navigation/saveasquote.gif" width="99" height="17"></webbase:orderData>
				 <webbase:orderData dataType="SaveOrderBtn" label="Save Order" nextURL="/jsp/OrderConfirmation.jsp" unlock="1"><img src="../../../images/navigation/place_ad_now.gif" width="89" height="17" border="0"></webbase:orderData>
				</webbase:showIf>

		</div>

		<!--BEGIN button row-->
		<div class="row" style="padding-top:30px" class="text-center">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-3 text-left">
			<!--back buttons-->
				<div style="display:inline">
				<a href="WebBaseMain.do?NextURL=/jsp/PreviewAds.jsp">
				<button type="button" class="btn btn-default Ebutton" value="#">Previous</button></a><input type="hidden" name="GoBackURL" value="/jsp/PreviewAds.jsp">	
				<!--END back buttons-->
				</div>
				
			</div>
			
			<div class="col-sm-2 text-center">
				<!--quote buttons-->
				<webbase:showIf expression="!isFakeCustomerLoggedIn" >
				<button type="button" class="btn btn-default Ebutton" value="SaveQuoteBtn">Save Quote</button>
				</webbase:showIf>
				<!--quote back buttons-->
			</div>
			
			<div class="col-sm-3 text-right">
			<!--continue buttons-->
				<button type="button" class="btn btn-success Ebutton" value="SaveOrderBtn"><webbase:showIf expression="!isFakeCustomerLoggedIn" >
				Place Order!
				</webbase:showIf>
				<webbase:showIf expression="isFakeCustomerLoggedIn" >
				Login!
				</webbase:showIf>
				</button>
			<!--END continue buttons-->
			</div>
			<div class="col-sm-2">
					</div>
		</div>
		<!--END row-->
		<!--END button row-->
		
		
		<webbase:formHelper dataType="formList"/> 
        <webbase:formHelper dataType="FormValidate"/>
<%@ include file="../includes/footer.htm"%>
</html>
