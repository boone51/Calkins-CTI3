<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
<% session.putValue( "pageName", "SetAdType.jsp" );%>
<% session.putValue( "returnPage", "SetAdType.jsp" );%>
<%@ include file="header.jsp"%>
<webbase:mactiveAction dataType="UpdateData" dataValue=""/>

      <webbase:mactiveAction dataType="NewOrder" dataValue=""/>
      <webbase:TemplateControls dataType="clear"/>
	  <!--BEGIN row-->
    <div class="container">
        <h2>Choose Your Ad Category</h2>
        <div class="row catList">
			<form action="WebBaseMain.do" method="post" name="adtype" class="nomargin">
			<div class="col-md-2">
                <%@ include file="menuLeft.jsp"%>
			</div>
			  <webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder paymentMethod='Credit Card'/>" />
			  <webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder orderStatus='Not Ready'/>"/>
			  <webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder queue='1 Web'/>"/>
			  <webbase:mactiveAction dataType="SetRep" dataValue="1web"/>
			  <%-- Not normally used. These are commented out. Delete comments to set them
			  <webbase:mactiveAction dataType="RunCommand" dataValue="<SetOrder source='No Source'/>"/>
			  <webbase:mactiveAction dataType="SetProductionMethod" dataValue="Internal"/> --%>
						<webbase:mactiveAction dataType="UpdateData" dataValue=""/>
						<webbase:errorData dataType="ErrorMsg"/>
						<webbase:errorData dataType="ErrorURL" nextURL="/jsp/SetAdType.jsp"/>
				<div class="col-md-7">
					<div class="Ecategory">
					<webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="true" rootCategoryName="Merchandise CTI" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"  nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div>
				    <div class="Ecategory">
					<webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="false" rootCategoryName="Transportation CTI" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"  nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div>
					<div class="Ecategory">
					<webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="false" rootCategoryName="Service Directory CTI" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"   nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div>
                    <div class="Ecategory">
                    <webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="false" rootCategoryName="Special Service - Pets CTI" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"   nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div>
					<div class="Ecategory">
					<webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="false" rootCategoryName="Announcements CTI" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"   nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div>
					<div class="Ecategory">
					<webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="false" rootCategoryName="Garage Sales CTI" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"   nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div>
					<div class="Ecategory">
					<webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="false" rootCategoryName="Employment CTI" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"   nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div>
					<div class="Ecategory">
					<webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="false" rootCategoryName="Pets & Supplies CTI" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"   nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div>
					<div class="Ecategory">
					<webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="false" rootCategoryName="Real Estate For Sale CTI" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"   nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div>
					<div class="Ecategory">
					<webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="false" rootCategoryName="Real Estate For Rent CTI" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"   nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div>
					<div class="Ecategory">
					<webbase:AdCategorySelectorTag formName="adtype" outputInternalFields="false" rootCategoryName="Recreational CTI" rootCategoryDisplayClass="headingsub" rootCategoryCollapsed="true" displayClass="errormsg" useList="true" displayElements="description"   nextURL="/jsp/SetMerchandiseAttributes.jsp" packageURL="/jsp/SetPackage.jsp"/> 
					</div> 
				</div>
                <div class="col-md-3">
                    </div>
			<webbase:formHelper dataType="formList"/>
			<webbase:formHelper dataType="FormValidate"/>
			</form>
		</div>
    </div>
	  <!--END row-->
<%@ include file="modals.jsp"%>
<%@ include file="footer.jsp"%>
</html>
