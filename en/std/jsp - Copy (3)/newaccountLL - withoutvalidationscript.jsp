<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no"/>
<!DOCTYPE html>
<% session.putValue( "pageName", "newaccountLL.jsp" );%>
<%@ include file="header.jsp"%>
    <!-- InstanceBeginEditable name="content" -->
<!--	  <span class="PageName"> !! -- newaccount.jsp</span>-->
	  <script type="text/javascript" src="../../../scripts/FormValidation.js"></script>
	  <webbase:AdbaseEFormValidationMask />
    <!--END validation mask insert-->
      <form method="post" action="WebBaseMain.do" name="NewCustomer" onSubmit="return ValidateForm()">
            <strong style="color:#FF0000"><webbase:errorData dataType='ErrorMsg'/>
              <webbase:errorData dataType='ErrorURL' nextURL='/jsp/newaccountLL.jsp'/></strong>
<div class="container">
<h2>Create Your Account</h2>
<div class="row">
    <div class="col-md-2">
    </div>
    <div class="col-md-8">

            <div class="Enewaccount">
                <fieldset>
                    <legend>Account Details </legend>
                    <blockquote>Required fields are marked with an asterisk(*).</blockquote>
<ul class="list-unstyled">

    <li>
        <div class="form-group">
            <label for="Fname" class="col-sm-3 control-label">First Name: *</label>
            <div class="col-sm-9">
                <webbase:customerData dataType="Fname" editMode="1" dataSource="L" />
            </div>
    </li>

    <li>
        <div class="form-group">
            <label for="Lname" class="col-sm-3 control-label">Last Name: *</label>
            <div class="col-sm-9">
                <webbase:customerData dataType="Lname" editMode="1" dataSource="L" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="PhoneFull" class="col-sm-3 control-label">Phone Number: *</label>
            <div class="col-sm-9">
                <webbase:customerData dataType="PhoneFull" editMode="1" dataSource="L" width="13" newStyleValidationFlag="1" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="Phonex" class="col-sm-3 control-label"> Ext </label>
            <div class="col-sm-9">
                <webbase:customerData dataType="Phonex" editMode="1" dataSource="L" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="SecPhoneFull" class="col-sm-3 control-label">Secondary Phone Number:</label>
            <div class="col-sm-9">
                <webbase:customerData dataType="SecPhoneFull" editMode="1" dataSource="L" width="13" newStyleValidationFlag="1" />
            </div>
        </div>
    </li>
    </br>
    <li>
        <div class="form-group">
            <label for="SecPhonex" class="col-sm-3 control-label"> Ext</label>
            <div class="col-sm-9">
                <webbase:customerData dataType="SecPhonex" editMode="1" dataSource="L" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="SubscriberFlag" class="col-sm-3 control-label" style="margin-top:25px">Subscriber:</label>
            <div class="col-sm-9"  style="margin-top:25px">
                <webbase:customerData dataType="SubscriberFlag" editMode="1" dataSource="L" />
            </div>
        </div><br clear="all">
    </li>

    <li>
        <div class="form-group">
            <label for="AddrStreet1" class="col-sm-3 control-label"> Address: * </label>
            <div class="col-sm-9">
                <webbase:customerData dataType="AddrStreet1" editMode="1" dataSource="L" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="AddrStreet2" class="col-sm-3 control-label">Address 1: </label>
            <div class="col-sm-9">
                <webbase:customerData dataType="AddrStreet2" editMode="1" dataSource="L" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="AddrStreet3" class="col-sm-3 control-label">Address 2: </label>
            <div class="col-sm-9">
                <webbase:customerData dataType="AddrStreet3" editMode="1" dataSource="L" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="AddrCity" class="col-sm-3 control-label">City: *</label>
            <div class="col-sm-9">
                <webbase:customerData dataType="AddrCity" editMode="1" dataSource="L" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group" style="clear: both">
            <label for="AddrState" class="col-sm-3 control-label"> State: *</label>
            <div class="col-sm-9">
                <webbase:customerData dataType="AddrState" editMode="1" dataSource="L" dataDefault="PA" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="AddrZipFull" class="col-sm-3 control-label">Zip: * </label>
            <div class="col-sm-9">
                <webbase:customerData dataType="AddrZipFull" editMode="1" dataSource="L" newStyleValidationFlag="1" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group" style="clear: both">
            <label for="AddrCountry" class="col-sm-3 control-label">Country: *</label>
            <div class="col-sm-9">
                <webbase:customerData dataType="AddrCountry" editMode="1" dataSource="L" dataDefault="USA" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="Email" class="col-sm-3 control-label">Email:</label>
            <div class="col-sm-9">
                <webbase:customerData dataType="Email" editMode="1" dataSource="L" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="EmailC" class="col-sm-3 control-label">Email Confirm:</label>
            <div class="col-sm-9">
                <webbase:customerData dataType="EmailC" editMode="1" dataSource="L" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="WebLogin" class="col-sm-3 control-label">Username: * </label>
            <div class="col-sm-9">
                <webbase:customerData dataType="WebLogin" editMode="1" dataSource="L" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="WebPassword" class="col-sm-3 control-label">Password: * </label>
            <div class="col-sm-9">
                <webbase:customerData dataType="WebPassword" editMode="1" dataSource="L" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="WebPasswordC" class="col-sm-3 control-label">Password Confirm: *</label>
            <div class="col-sm-9">
                <webbase:customerData dataType="WebPasswordC" editMode="1" dataSource="L" /> </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="WebQuestion" class="col-sm-3 control-label"> Secret Question: *</label>
            <div class="col-sm-9">
                <webbase:customerData dataType="WebQuestion" editMode="1" dataSource="L" />
            </div>
        </div>
    </li>

    <li>
        <div class="form-group">
            <label for="WebAnswer" class="col-sm-3 control-label">Secret Answer: *</label>
            <div class="col-sm-9">
                <webbase:customerData dataType="WebAnswer" editMode="1" dataSource="L" />
            </div>
        </div>
    </li>

</ul>
      <webbase:customerData dataType="NewCustomerLateLogin"/>           
<webbase:customerData dataType="NewCustomer" customerCompany="Courier Times" customerType="1 Private Party" />


                </fieldset>
                </div>

            </div>
        </div>
        <div class="col-md-2">
        </div>
    </div>
<!--END row-->

<!--BEGIN button row-->
<div class="row" style="padding-top:30px">
	<div class="col-sm-2">
	</div>
	<!-- If the ad is part of a package the previous page should be the SetPackage page -->
	<div class="col-sm-3 text-center">
	<!--back buttons-->
		<a href="WebBaseMain.do?NextURL=/jsp/login.jsp"><button type="button" class="btn btn-lg btn-danger">Cancel</button><!--<img src="../../../images/navigation/cancel.gif" width="49" height="17" border="0">--></a>
	<!--END back buttons-->
	</div>
	<div class="col-md-2">
	</div>
	<div class="col-sm-3 text-center">
	<!--continue buttons-->
			<div style="display:inline">
                <webbase:formHelper dataType="SaveNewCustomerBtn" label="Save Customer" nextURL="/jsp/SetAdType.jsp">
			<img src="../../../images/navigation/login.gif" width="49" height="17" border="0">
			</webbase:formHelper></div>
<!--			<button type="image" src="../../../images/navigation/cancel.gif" class="btn btn-lg btn-success" onclick="document.getElementsByName('SaveNewCustomerBtn').click()" id="formSub">Go!</button>-->
	<!--END continue buttons-->
	</div>
	<div class="col-sm-2">
	</div>
</div>
<!--END row-->
<!--END button row-->
</div><!--END container-->
      
        <webbase:formHelper dataType="formList"/>
        <webbase:formHelper dataType="FormValidate"/>
      </form>
<%@ include file="footer.jsp"%>
</html>
