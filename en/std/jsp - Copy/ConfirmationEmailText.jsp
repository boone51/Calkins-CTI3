<%@ taglib uri="/Mactive/WebBaseTags" prefix="webbase" %>
<webbase:webbasePageSetup securePage="no"/>
<webbase:mactiveAction dataType="UpdateData" dataValue=""/>
This email is to acknowledge your recent order with XYZ Advertisers.

Order Confirmation Number: <webbase:orderData dataType="Order Number" />
Ad Type: <webbase:adData dataType="AdType"/>
Order Price: <webbase:orderData dataType="Total Price"/>
Ad Run Schedule(s):
<webbase:runScheduleIt>
    <webbase:RSDetail dataType="NumInserts"/> day(s) beginning on <webbase:RSDetail dataType="Fday"/> in
        <webbase:RSDetail dataType="Product"/> (<webbase:RSDetail dataType="Placement"/>:<webbase:RSDetail dataType="Position"/>)
</webbase:runScheduleIt>

<%-- AdPay Click N Buy 
<webbase:showIf expression="isOnlinePhotoUploaded">
  Paste the below URL into your browser's address bar.<br>
  <webbase:AdPay dataType="ClickNBuy" useHref="false" useNewWindow="true"/>
</webbase:showIf> --%>

Thanks for choosing us as your adverister!