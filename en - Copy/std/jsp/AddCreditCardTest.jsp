<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no" noLoginRedirectURL="WebBaseMain.do"/>
<!DOCTYPE html><html><!-- InstanceBegin template="/Templates/withmenu.dwt" codeOutsideHTMLIsLocked="false" -->
<% session.putValue( "pageName", "AddCreditCard.jsp" );%>
<% session.putValue( "returnPage", "AddCreditCard.jsp" );%>
<%@ include file="header.jsp"%>
  
   	<!-- InstanceBeginEditable name="content" -->
           	<form method="post" action="WebBaseMain.do" name="AddCreditCard">
                         
                <webbase:errorData dataType="ErrorMsg" label="OK"/>
                <webbase:errorData dataType="ErrorURL" nextURL="/jsp/AddCreditCard.jsp"/>
                <div class="container">
                <h2>Add a Credit Card</h2>
				<div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-2">
                        <%@ include file="menuLeft.jsp"%>
                    </div>
		<!--			<div class="col-xs-12 col-sm-12 col-md-3">     
               
                           
                <webbase:CCardData dataType="BtnCancel" label="Cancel" targetURL="_pop_"><img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"> </webbase:CCardData>
                
				<webbase:CCardData dataType="BtnSave" label="Save" targetURL="_pop_"><img src="../../../images/navigation/continue.gif" width="70" height="17"></webbase:CCardData>
				</div> -->
			  
              
				    <div class="col-md-4 col-sm-6">
                    Credit Card Number:
                    <webbase:CCardData dataType="CardNum" maxInputLength="16" editMode="1"/></div>
                  
                  <tr>
                    <td valign="top" class="mattrlabeltext">Expiration Date:</td>
                    <td width="67" class="mattrlabeltext">Month:
                    <br>                    </td>
                    <td width="223" class="mattrlabeltext"><webbase:CCardData dataType="CardExpMonth" editMode="1"/>                    </td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><span class="mattrlabeltext">Year: </span></td>
                    <td><span class="mattrlabeltext">
                      <webbase:CCardData dataType="CardExpYear" editMode="1"/>
                    </span></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">Name as It Appears on the Card:&nbsp;</td>
                    <td colspan="2"><webbase:CCardData dataType="Name" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">Phone:</td>
                    <td colspan="2"><webbase:CCardData dataType="Phone" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">Billing Address:</td>
                    <td colspan="2"><webbase:CCardData dataType="Addr1" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">Address 2:</td>
                    <td colspan="2"><webbase:CCardData dataType="Addr2" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">City:</td>
                    <td colspan="2"><webbase:CCardData dataType="City" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">State:</td>
                    <td colspan="2"><webbase:CCardData dataType="State" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">Zip:</td>
                    <td colspan="2"><webbase:CCardData dataType="CardZip1" editMode="1"/></td>
                  </tr>
                  <tr>
                    <td class="mattrlabeltext">Country:</td>
                    <td colspan="2"><webbase:CCardData dataType="Country" editMode="1"/></td>
                  </tr>
                
              
              <div class="col-xs-12 col-sm-12 col-md-7">  
                <td><webbase:CCardData dataType="BtnCancel" label="Cancel" targetURL="_pop_"><img src="../../../images/navigation/previous.gif" width="70" height="17" border="0"></webbase:CCardData></td>
                <td><webbase:CCardData dataType="BtnSave" label="Save" targetURL="_pop_"><img src="../../../images/navigation/continue.gif" width="70" height="17"></webbase:CCardData></td>
              </div>
              
            
			</div>
            <webbase:formHelper dataType="formList"/>
            <webbase:formHelper dataType="FormValidate"/>
            </form>
<!-- InstanceEndEditable --></td>


 <%@ include file="modals.jsp"%>
 <%@ include file="footer.jsp"%>
  
<!-- InstanceEnd --></html>
		
