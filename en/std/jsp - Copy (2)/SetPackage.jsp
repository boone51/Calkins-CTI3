<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% session.putValue( "pageName", "SetPackage.jsp" );%>
<% session.putValue( "returnPage", "SetPackage.jsp" );%>
<%@ include file="header.jsp"%>


	<form method="post" action="WebBaseMain.do" name="AdOrderData">
		<webbase:errorData dataType='ErrorMsg'/>
		<webbase:errorData dataType='ErrorURL' nextURL='/jsp/SetPackage.jsp'/>
			<div class="container">
                <h2>Choose Your Package</h2>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-2">
                        <%@ include file="menuLeft.jsp"%>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-7">
                            <div id="pckDisplay">
                                <webbase:orderData dataType="PackageSelectorV2" editMode="1" numColumns="3" buttonClass="btn btn-default" label="Choose Package" nextURL="/jsp/SetMerchandiseAttributes.jsp" />

                            </div>
                            <!--BEGIN Right Ad Info-->

                        <!--END Right Ad Info-->
                    </div>
                    <div id="subnav" class="col-xs-12 col-sm-12 col-md-3">
                        <%@ include file="orderPanel.jsp"%>
                    </div>
                </div>
            </div>
        <webbase:formHelper dataType="formList"/>
		<webbase:formHelper dataType="FormValidate"/>
	</form>
<%@ include file="modals.jsp"%>
<%@ include file="footer.jsp"%>
</html>
