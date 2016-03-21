<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html>
<% session.putValue( "pageName", "accountsummary.jsp" );%>
<% session.putValue( "returnPage", "accountsummary.jsp" );%>
<%@ include file="header.jsp"%>
	  <script type="text/javascript" src="../../../scripts/FormValidation.js"></script>
	  <webbase:AdbaseEFormValidationMask />
      <form method="post" action="WebBaseMain.do" name="NewCustomer" onSubmit="return verify()">
            <webbase:errorData dataType='ErrorMsg'/>
              <webbase:errorData dataType='ErrorURL' nextURL='/jsp/editaccount.jsp'/>
           <div class="container">
               <h2> Edit Account  </h2>

		   <div class="row">
	<div class="col-md-4">
			First Name: *
            <webbase:customerData dataType="Fname" editMode="1"/>
            Last Name: *
            <webbase:customerData dataType="Lname" editMode="1"/>
            Phone Number: *
            <webbase:customerData dataType="PhoneFull" editMode="1" width="13" newStyleValidationFlag="1"/>
            Ext
            <webbase:customerData dataType="Phonex" editMode="1"/>
            Secondary Phone Number:
            <webbase:customerData dataType="SecPhoneFull" editMode="1" width="13" newStyleValidationFlag="1"/>
            Ext
            <webbase:customerData dataType="SecPhonex" editMode="1"/>
	</div>
	<div class="col-md-4">
			 Subscriber:
            <webbase:customerData dataType="SubscriberFlag" editMode="1"/>
            Address: *
            <webbase:customerData dataType="AddrStreet1" editMode="1"/>
            Address 2:
            <webbase:customerData dataType="AddrStreet2" editMode="1"/>
            Address 3:
            <webbase:customerData dataType="AddrStreet3" editMode="1"/>
            City: *
            <webbase:customerData dataType="AddrCity" editMode="1"/>
            State: *
            <webbase:customerData dataType="AddrState" editMode="1" dataDefault="FL"/>
            Zip: *
            <webbase:customerData dataType="AddrZipFull" editMode="1" newStyleValidationFlag="1"/>
            Country: *
            <webbase:customerData dataType="AddrCountry" editMode="1" dataDefault="USA"/>

	</div>
	<div class="col-md-4">
			  Email:
            <webbase:customerData dataType="Email" editMode="1"/>
            Email Confirm:
            <webbase:customerData dataType="EmailC" editMode="1"/>
            Username: *
            <webbase:customerData dataType="WebLogin" editMode="1"/>
            Password: *
            <webbase:customerData dataType="WebPassword" editMode="1"/>
            Password Confirm:  *
            <webbase:customerData dataType="WebPasswordC" editMode="1"/>
            Secret Question:  *
            <webbase:customerData dataType="WebQuestion" editMode="1"/>
          &nbsp;
            Secret Answer:  *
            <webbase:customerData dataType="WebAnswer" editMode="1"/>
	</div>
</div>
<!--END row-->
            Required fields are marked
                with an asterisk(*).

<!--BEGIN button row-->
<div class="row" style="padding-top:30px">
	<div class="col-sm-2">
	</div>
	<!-- If the ad is part of a package the previous page should be the SetPackage page -->
	<div class="col-sm-3 text-center">
	<!--back buttons-->
			<a href="WebBaseMain.do?NextURL=/jsp/accountsummary.jsp">
				<button type="button" class="btn btn-warning">Cancel <span class="glyphicon glyphicon-ban-circle"></span></button>
			</a>
	<!--END back buttons-->
	</div>
	<div class="col-md-2">
	</div>
	<div class="col-sm-3 text-center">
	<!--continue buttons-->
			<webbase:formHelper dataType="SaveNewCustomerBtn" label="Save Customer" nextURL="/jsp/accountsummary.jsp">
              <input name="imageField" type="image" src="../../../images/navigation/but_save.png" alt="Save" border="0">
              </webbase:formHelper>
			 <!--<button type="button" class="btn btn-success Ebutton" value="SaveNewCustomerBtn">Save <span class="glyphicon glyphicon-ok"></span></button>-->
	<!--END continue buttons-->
	</div>
	<div class="col-sm-2">
	</div>
</div>
<!--END row-->
<!--END button row-->

           </div>



        <webbase:customerData dataType="SaveCustomer"/>
        <webbase:formHelper dataType="formList"/>
        <webbase:formHelper dataType="FormValidate"/>
      </form>
      <!-- InstanceEndEditable -->
    <%@ include file="modals.jsp"%>
    <%@ include file="footer.jsp"%>

<!-- InstanceEnd --></html>
