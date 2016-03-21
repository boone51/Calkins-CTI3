
	<div class="panel panel-primary">
								  <div class="panel-heading">
									<h3 class="panel-title"><strong>Current Order</strong></h3>
								  </div>
				<div class="panel-body">
							<div class="row" style="padding:10px;">
								<ul class="list-unstyled">
								<!--BEGIN dynamic content-->
											<%String pageName=(String)session.getAttribute("pageName");

											if (session.getAttribute("pageName") == "SetPackage.jsp"){ %>
											 <li> <strong>Category: <span class="catName"></span></strong>
                                                 
                                                <%-- <webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/>--%> 
                                                </li>
											<%}%>

											<% if ((pageName.equals("SetMerchandiseAttributes.jsp")) || (pageName.equals("AnswerQuestions.jsp")) || (pageName.equals("GetPackageInformation.jsp")) || (pageName.equals("SetAdbaseImage.jsp")))  { %>
                                                <li> <strong>Category: <webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/></strong>  </li>
											<li><a href="#" data-toggle="modal" data-target=".changePackage">Change Package<%--<webbase:orderData dataType="CurrentPackage" packageDisplayOptions="name" />--%></a></li>
											<%}%>

											<% if ((pageName.equals("PreviewAds.jsp")) || (pageName.equals("EditAd.jsp")) || (pageName.equals("ReviewOrder.jsp")) || (pageName.equals("OrderConfirmationQuote.jsp")))  { %>
                                                <li> <strong>Category: <webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/></strong>  </li>
											<li><a href="#" data-toggle="modal" data-target=".changePackage">Change Package<%--<webbase:orderData dataType="CurrentPackage" packageDisplayOptions="name" />--%></a></li>
											<li style="margin-top:10px"><strong>Ad Schedule(s):</strong> 
													<webbase:adIt>
													<webbase:runScheduleIt>
													<ul class="list-unstyled" style="font-size:12px">
													    <li><webbase:RSDetail dataType="DateRangeBegin" plus="../../../images/plus.gif" minus="../../../images/minus.gif"/>
														    <webbase:RSDetail dataType="NumInserts"/> day(s) starting
                                                            <webbase:RSDetail dataType="Fday"/> </li>
                                                        <li>in <webbase:RSDetail dataType="ProductDescription"/></li>
                                                        <li>(<webbase:RSDetail dataType="PositionDescription"/>) <webbase:RSDetail dataType="DateRangeEnd"/> </li>
																			
																		</ul>
																	</webbase:runScheduleIt>
													</webbase:adIt>
											</li>
                                                <%}%>
                                                <% if ((pageName.equals("ReviewOrder.jsp")) || (pageName.equals("OrderConfirmationQuote.jsp")))  { %>
											<li style="margin-top:10px">Ad Cost: <strong><webbase:orderData dataType="Total Price"/></strong></li>
											<%}%>
								<!--END dynamic content-->
								</ul>
							</div>
				</div>
	</div>
