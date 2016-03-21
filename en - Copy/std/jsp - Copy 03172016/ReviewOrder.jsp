<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
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
<%--<webbase:errorData dataType="ErrorURL" nextURL="/jsp/ReviewOrder.jsp"/>--%>
     
           
	  <div id="EpageError" class="alert alert-danger" role="alert" style="display:none"> <%--<webbase:errorData dataType='ErrorMsg'/>--%> </div>
         
         <!---->
<div class="container">
        <h2>Review Order</h2>




		<div class="row">
            <div class="col-md-2">
                <%@ include file="menuLeft.jsp"%>
            </div>

<div class="col-md-7">

    <!--BEGIN-->
    <webbase:showIf expression="isOnlinePhotoUploaded">
            Uploaded Photos
            <webbase:uploadImage dataType="thumbNails" numColumns="4" thumbnailSize="100" displayOnly="true" />
            <a href="WebBaseMain.do?NextURL=/jsp/SetAdbaseImage.jsp">Click to change photos</a>
        </webbase:showIf>
        <webbase:adIt>
            <strong>Ad Preview</strong></br>
            <ul class="list-unstyled">
                <li class="adPreviews">
                    <webbase:adData dataType="ImagePreviewAllVersions" />
                </li>
                <li></li>
                <li></li>
                
                <li class="text-center" style="padding-top:10px">
                    <webbase:adData dataType="PDFPreview">View PDF preview of this ad.</webbase:adData>
                </li>
               <!--  <li>
                    Products associated with this ad:
                    <webbase:runScheduleIt>
                        <ul>
                            <li>
                                <webbase:RSDetail dataType="ProductDescription" />
                            </li>
                        </ul>
                    </webbase:runScheduleIt>
                </li>  -->
            </ul>

        </webbase:adIt>
    <!--END-->
    <!--BEGIN-->
     <webbase:showIf expression="!adInEditMode">
							<webbase:showIf expression="!isFakeCustomerLoggedIn" >
							  <webbase:showIf expression="!isAdOrderZeroCost" >
                                   <div class="row">
                                   <!--<a href="#creditcard" onClick="document.addCC.submit()"><img src="../../../images/navigation/addcreditcard.gif" alt="Pay by credit card" width="115" height="17" border="0"></a>-->
                                       <a href="javascript:void(0)" onClick="document.addCC.submit()"><button type="button" class="btn btn-info">Add Credit Card</button></a>
                                  </div>
                                  <div class="row" style="padding:20px 0px">
							  <span class="mgroupname">Credit Card on file: <webbase:adOrderPaymentInfo dataType="PayForCurrentOrder" editMode="1"/></span>
                                  </div>
                                    <div class="row">
                                        <span class="mgroupname">CCID: <webbase:adOrderPaymentInfo dataType="CreditCardSecurityNumber" editMode="1"/>
                                    </div>


								 
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
    <!--END-->
<!--BEGIN button row-->
    <div class="row" style="padding-top:30px;padding-bottom:20px" class="text-center">
  
        <div class="col-xs-6">
            <webbase:formHelper dataType="cancelButtonV2" label="Previous" nextURL="/jsp/EditAd.jsp" buttonClass="btn btn-default" />

        </div>



        <div class="col-xs-6 text-right">
            <!--continue buttons-->
            <webbase:showIf expression="!isFakeCustomerLoggedIn">
                <!--<webbase:orderData dataType="SaveQuoteBtn" nextURL="/jsp/OrderConfirmationQuote.jsp" label="Save as Quote"><img src="../../../images/navigation/saveasquote.gif" width="99" height="17"></webbase:orderData>-->
                <webbase:orderData dataType="SaveOrderBtnV2" label="Save Order" nextURL="/jsp/OrderConfirmation.jsp" unlock="1" buttonClass="btn btn-success" />
                
            </webbase:showIf>
            <webbase:showIf expression="isFakeCustomerLoggedIn">
               <!-- <a href="#" data-toggle="modal" data-target=".bs-example-modal-sm" class="btn btn-success">Login</a>-->
                <webbase:formHelper dataType="submitButton" label="Continue" name="SetLayout" nextURL="/jsp/SignIn.jsp"> 
                      <img src="../../../images/navigation/login.gif" width="49" height="17" border="0"> 
                      </webbase:formHelper>
                <div class="createAcct" style="white-space:nowrap;margin-top:5px">
                OR...<a href="WebBaseMain.do?cmd=NewCustomerLL">Create New Account</a>
                </div>
            </webbase:showIf>
            <!--END continue buttons-->
        </div>

    </div>
<!--END button row-->
</div>
<!--BEGIN Right Ad Info-->
<div id="subnav" class="col-md-3">
        <%@ include file="orderPanel.jsp"%>
</div>
<!--END Right Ad Info-->
		</div>
<!--END row-->



		<!--BEGIN button row-->
		
		<!--END row-->
		<!--END button row-->
</div>

		<webbase:formHelper dataType="formList"/>
        <webbase:formHelper dataType="FormValidate"/>
	</form>
<%@ include file="modals.jsp"%>
<%@ include file="footer.jsp"%>
    <!--HOP form -->
 <form action="https://testedgilpayway.net/zanzara/request.jsp" method="POST" name="addCC" id="addCC" style="display:none">
<%@ include file="HOP.jsp"%>
  <%=
	insertSignature(csMap) 
   %>
   <input type="submit" value="Add CreditCard" />
   <div style="display:none"><webbase:orderData dataType="SaveQuoteBtn" nextURL="/jsp/OrderConfirmationQuote.jsp" label="Save as Quote"><img src="../../($Inbox)/../../images/navigation/saveasquote.gif" width="99" height="17"></webbase:orderData></div>
</form>
<!--END HOP form -->
</html>
