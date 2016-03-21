 <% if (session.getAttribute("pageName") != "SetMerchandiseAttributes.jsp"){ %>

            <div id="EpageAlert" class="alert alert-danger" role="alert" style="display:none">
                <div id="errorConent">

                </div>

            </div>
<%}%>




<!--BEGIN SignIn modal-->

<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
			<div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Login</h4>
                </div>
				<div style="padding:5px">
						<form name="LoginUser" method="post" action="WebBaseMain.do">
                                <div align="center">
                                    <p><strong>Sign In to Our Secure Server to Complete Placing Your Ad</strong></p>
                                    </br>
                                    <webbase:errorData dataType="ErrorMsg" />
                                    <webbase:errorData dataType="ErrorURL" nextURL="/jsp/SetyaMamaOnFiya.jsp" />
                                    </br>
                                    User Name:
                                    <webbase:userLogin dataType="userName" /> 
                                    Password:
                                    <webbase:userLogin dataType="userPassword" />
                                    <webbase:userLogin dataType="lateLogin" />
                                    <webbase:formHelper dataType="submitButton" label="Login" name="lateLogin" nextURL="/jsp/SetAdType.jsp">
                                        <img src="../../../images/navigation/but_login.gif"width="110" height="41" border="0">
                                    </webbase:formHelper>
                                    <webbase:formHelper dataType="formList" />
                                    <webbase:formHelper dataType="FormValidate" />
                                </div>
												<p>
												</p>
                            <br>
						</form>
						<!---->
				</div>
			</div>
	</div>
</div>
<!--END SignIn modal-->

<!---BEGIN changePackage modal-->
<div class="modal fade changePackage" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
			<div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Change Package</h4>
                </div>
				<div style="padding:5px">
						<div class="row text-center" style="margin-top:20px;">Would you like to change your package?</div><div class="row text-center" style="margin-top:20px;"><a href="WebBaseMain.do?NextURL=/jsp/SetPackage.jsp"><button type="button" class="btn btn-info"><strong>Change Package</strong><span class="glyphicon glyphicon-cog" style="margin-left:4px"></span></button></a></div>
						<!---->
				</div>
			</div>
	</div>
</div>
<!--END changePackage modal-->
<div class="modal fade xtraInfo" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
			<div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 id="genModal" class="modal-title"><span style="display:inline;">Info</span></h4>
                </div>
				<div style="padding:5px">
						<div id="xtraInfoResult">

						</div>


						<!---->
				</div>
			</div>
	</div>
</div>

