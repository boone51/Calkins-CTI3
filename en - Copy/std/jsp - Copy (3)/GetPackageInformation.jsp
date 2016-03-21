<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
<% session.putValue( "pageName", "GetPackageInformation.jsp" );%>
<% session.putValue( "returnPage", "GetPackageInformation.jsp" );%>
<%@ include file="header.jsp"%>

 <form method="post" action="WebBaseMain.do" name="merchattributes">
        <webbase:errorData dataType='ErrorMsg'/>
        <webbase:errorData dataType='ErrorURL' nextURL='/jsp/GetPackageInformation.jsp'/>


            <div class="container">
                <h2>Schedule Ad</h2>


            <div class="row">
                <div class="col-md-2">
                    <%@ include file="menuLeft.jsp"%>
                </div>
	<div class="col-md-6">
			<div style="padding-bottom:30px">Your selected Ad Category is:
				<span class="mgroupname">
				<webbase:adData dataType='AdCategory' showCategoryName='false' showCategoryDescription='true' categoryTextSeparator=':'/>
				</span>
			</div>
			<!--BEGIN package tag-->
			 <webbase:PackageDayPatternV2Tag displayDetails="false" displayElements="product" optionalRunScheduleHeadingText="Optional Products" displayAllAtOnce="true" displayOptionalAsDropDownIfOnlyOne="true"  dispOptMessage=" Select a product (optional)"/>
			 <!--END package tag-->
	</div>
					<!--BEGIN Right Ad Info-->
					<div id="subnav" class="col-md-4">
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
	<div class="col-sm-3 text-center">
	<!--back buttons-->
		<div id="previousBUT">
			<webbase:formHelper dataType="cancelButtonV2" label=" Previous" nextURL="/jsp/SetMerchandiseAttributes.jsp" buttonClass="btn btn-default"/>
		</div>
	<!--END back buttons-->
	</div>
	<div class="col-md-2">
	</div>
	<div class="col-sm-3 text-center">
	<!--continue buttons-->
					<webbase:formHelper dataType="SubmitPackageSchedulingButtonV2"  name="SubmitSchedule" label="Submit"  nextURL="/jsp/EditAd.jsp" buttonClass="btn btn-success"/>
	<!--END continue buttons-->
	</div>
	<div class="col-sm-2">
	</div>
</div>
<!--END row-->
<!--END button row-->
                </div>
<!--                END container-->
        <webbase:formHelper dataType="formList"/>
              <webbase:formHelper dataType="FormValidate"/>
      </form>
<%@ include file="modals.jsp"%>
<%@ include file="footer.jsp"%>
</html>
