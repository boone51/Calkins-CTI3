 <%-- Show Media Loader Images --%>
        <!-- if online photos were uploaded, display photos -->
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
                <li>
                    <webbase:adData dataType="PDFPreview">View PDF preview of this ad.</webbase:adData>
                </li>
                <li>
                    Products associated with this ad:
                    <webbase:runScheduleIt>
                        <ul>
                            <li>
                                <webbase:RSDetail dataType="ProductDescription" />
                            </li>
                        </ul>
                    </webbase:runScheduleIt>
                </li>
            </ul>

        </webbase:adIt>



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
                    <!--BEGIN buttons-->
<div class="container">
    <div class="row" style="padding-top:30px" class="text-center">
        <div class="col-sm-2">
        </div>
        <div class="col-sm-3 text-left">
            <webbase:formHelper dataType="cancelButtonV2" label="Previous" nextURL="/jsp/EditAd.jsp" buttonClass="btn btn-default" />

        </div>

        <div class="col-sm-2 text-center">
            <!--quote buttons-->
            <webbase:showIf expression="!isFakeCustomerLoggedIn">
                <webbase:orderData dataType="SaveQuoteBtnV2" nextURL="/jsp/OrderConfirmationQuote.jsp" label="Save as QuoteV2" buttonClass="btn btn-default" />
            </webbase:showIf>
            <!--quote back buttons-->
        </div>

        <div class="col-sm-3 text-right">
            <!--continue buttons-->
            <webbase:showIf expression="!isFakeCustomerLoggedIn">
                <webbase:orderData dataType="SaveOrderBtnV2" label="Save Order" nextURL="/jsp/OrderConfirmation.jsp" unlock="1" buttonClass="btn btn-success" />
            </webbase:showIf>
            <webbase:showIf expression="isFakeCustomerLoggedIn">
                <a href="#" data-toggle="modal" data-target=".bs-example-modal-sm" class="btn btn-success">Login<!--<span class="caret"></span>--></a>
            </webbase:showIf>
            <!--END continue buttons-->
        </div>
        <div class="col-sm-2">
        </div>
    </div>
</div><!--END button row-->