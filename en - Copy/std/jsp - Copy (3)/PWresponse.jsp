<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>1.2</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
//document.location="WebBaseMain.do";
//alert('hitting the first alert');
//
$(document).ready(function () {
	//alert('hit the doc ready');
	//
	$('input[name="card_expirationYear"]').val("20<%= request.getParameter("expirationYear") %>");
	$('input[name="card_expirationMonth"]').val("<%= request.getParameter("expirationMonth") %>");
	//get Masked Card Number
	var maskedCNum = "<%= request.getParameter("accountNumber") %>";
	//change card mask
	//maskedCNum = "************" + maskedCNum.substring(12,16);

	var cType = "";
	var cType = "<%= request.getParameter("paymentType") %>";
	if (cType == "PAY_VISA"){
		$('input[name="card_cardType"]').val("001");
	} //else if (cType == "PAY_MASTERCARD"){
	//	$('input[name="card_cardType"]').val("002");
	//} else if (cType == "PAY_AMEX"){
	//	$('input[name="card_cardType"]').val("003");
	//} else if (cType == "PAY_DISCOVER"){
	//	$('input[name="card_cardType"]').val("004");
	//}

	$('input[name="error_code"]').val("<%= request.getParameter("errorCode") %>");
	$('input[name="error_message"]').val("<%= request.getParameter("errorMessage") %>");
	$('input[name="return_result"]').val("<%= request.getParameter("status") %>");
//	$('input[name="customer_id"]').val("<%= request.getParameter("account") %>");
	$('input[name="billTo_firstName"]').val("<%= request.getParameter("first") %>");
	$('input[name="billTo_lastName"]').val("<%= request.getParameter("last") %>");
	$('input[name="card_accountNumber"]').val(maskedCNum);
	$('input[name="paySubscriptionCreateReply_subscriptionID"]').val("<%= request.getParameter("token")%>");
	$('input[name="billTo_postalCode"]').val("<%= request.getParameter("zip") %>");
	$('input[name="billTo_phoneNumber"]').val("<%= request.getParameter("phone") %>");

submitForm();
});

//
function submitForm(){
document.payprocess.submit();
//var myString = "<%= request.getParameter("credit_card_expiration_date") %>";
//var splits = myString.split("/");
//alert(splits[0]);
}

</script>
</head>

<body style="display:none;">

Redirect Page!

<form action="WebBaseMain.do?externaltype=cs&NextURL=/jsp/ReviewOrder.jsp" method="post" name="payprocess">
<input name="error_code" type="text" /><br>
<input name="error_message" type="text" /><br>
<input name="return_result" type="text" /><br>

<input name="card_expirationYear" type="text" /><br>
<input name="card_expirationMonth" type="text" /><br>
<input name="card_cardType" type="text" /><br>
<%--input name="customer_id" type="text" /--%><br>
<input name="billTo_firstName" type="text" /><br>
<input name="billTo_lastName" type="text" /><br>
<input name="card_accountNumber" type="text" /><br>
<input name="paySubscriptionCreateReply_subscriptionID" type="text" /><br>
<input name="billTo_postalCode" type="text" />
<input name="billTo_phoneNumber" type="text" />
<br>
<a href="javascript:submitForm()">Click here to Submit</a>
</form>
</body>
</html>