<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<%@ page import="javax.crypto.*, javax.crypto.spec.*, org.apache.commons.codec.binary.Base64, sun.misc.BASE64Encoder"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mactiveinc.webbase.util.services.*" %>


<%!
  private String getUserName() {
	System.out.println("UserName: " + EdgilPayWayConfig.getUserName());
	return EdgilPayWayConfig.getUserName();
  }

  private String getPassword() {
	System.out.println("Password: " + EdgilPayWayConfig.getPassword());
	return EdgilPayWayConfig.getPassword();
  }

  private String getMerchantID() {
	return EdgilPayWayConfig.getMerchantId();
  }

  private String getOEPId() {
	return EdgilPayWayConfig.getOEPId();
  }

  private String getIntegrator() {
	return EdgilPayWayConfig.getIntegrator();
  }

  private String getPageName() {
	return EdgilPayWayConfig.getPageName();
  }

  private String getCustomerName() {
	return EdgilPayWayConfig.getCustomerName();
  }

//  private String getResponseUrl(HttpServletRequest request) {
//	String path = (request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + getServletContext().getContextPath()) + EdgilPayWayConfig.getTokenCaptureUrl();
//	return path;
// }
  /**
   * @param map - Map containing fields that are to be signed.
   * Can only contain fields and values that should not be changed.
   * At the very minimum, map should contain 'amount', 'currency', and 'orderPage_transactionType'
   * if 'orderPage_transactionType' is 'subscription' or 'subscription_modify', the following are also required:
   * 'recurringSubscriptionInfo_amount', 'recurringSubscriptionInfo_numberOfPayments', 'recurringSubscriptionInfo_frequency',
   * 'recurringSubscriptionInfo_startDate', 'recurringSubscriptionInfo_automaticRenew'
   * if 'orderPage_transactionType' is 'subscription_modify' then 'paySubscriptionCreateReply_subscriptionID' is also required
   * @return html of hidden fields
   */
  public String insertSignature(Map<String, String> map) {
    if (map == null) {
      return "";
    }
    try {
      //map.put("merchant", getMerchantID());
      Set keys = map.keySet();
      StringBuffer customFields = new StringBuffer();
      StringBuffer customValues = new StringBuffer();
      StringBuffer output = new StringBuffer();
      for (Iterator i = keys.iterator(); i.hasNext();) {
        String key = (String) i.next();
        customFields.append(key);
        if (i.hasNext()) {
          customFields.append(",");
        }
        customValues.append(String.valueOf(map.get(key)));
        output.append("<input type=\"hidden\" name=\"");
        output.append(key);
        output.append("\" value=\"");
        output.append(String.valueOf(map.get(key)));
        output.append("\">\n");
      }
      return output.toString();
    } catch (Exception e) {
      e.printStackTrace();
      return "";
    }
  }
%>

   <% 
	 Map<String, String> csMap = new HashMap<String, String>();
	 csMap.put("request", "CreateToken");
	 csMap.put("integratorName", getIntegrator());
	 csMap.put("customerName", getCustomerName());
	 csMap.put("pageName", getPageName());
	 csMap.put("replyURL", "https://directclassifieds.calkins.com/webbaseCTI3/a.do?NextURL=/jsp/PWresponse.jsp");
	 csMap.put("userName", getUserName());
	 csMap.put("password", getPassword() );
   %>

   
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%><input type="hidden" name="first" value="<webbase:customerData dataType="Fname" dataSource="U"/>">
   <input type="hidden" name="last" value="<webbase:customerData dataType="Lname" dataSource="U"/>">
   <input type="hidden" name="address" value="<webbase:customerData dataType="AddrStreet1" dataSource="U"/>">
   <input type="hidden" name="city" value="<webbase:customerData dataType="AddrCity" dataSource="U"/>">
   <input type="hidden" name="state" value="<webbase:customerData dataType="AddrState" dataSource="U"/>">
   <input type="hidden" name="zip" value="<webbase:customerData dataType="AddrZip1" dataSource="U"/>">


