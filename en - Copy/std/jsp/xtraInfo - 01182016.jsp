<div id="Rates">
<h3>Classified Open Rates </h3>
<ul class="list-unstyled">
	<li><strong>Daily </strong>:
	$1 per  line</li>
	<li><strong>Automotive</strong>
	$1.50 per  line</li>
	<li><strong>Notices</strong>
	$1.50 per  line</li>
	<li><strong>Real Estate</strong>
	$2.00 per  line</li>
	<li><strong>Recreation</strong>
	$2.00 per  line </li>
</ul></div>
<div id="Deadlines">
<ul class="list-unstyled">
    <li>Placement Publication Day Deadline Day Time
    </li>
    <li>All Monday Thursday 2:45 p.m. EST</li>
    <li> All Tuesday Sunday 2:45 p.m. EST</li>
    <li> All Wednesday Monday 3:00 p.m. EST</li>
    <li>All Thursday Monday 3:00 p.m. EST</li>
    <li> All Friday Wednesday 3:00 p.m. EST</li>
    <li>All Saturday Thursday 3:30 p.m. EST</li>
    <li>All Sunday Thursday 4:00 p.m. EST</li>
</ul>
					  
</div>
<div id="profile">
<h4> Profile Info</h4>
<form method="post" action="WebBaseMain.do" name="myaccount"> 
            <webbase:errorData dataType='ErrorMsg'/>
            <webbase:errorData dataType='ErrorURL' nextURL='/jsp/ViewProfileSummary.jsp'/>
            Personal Information 
<ul class="list-unstyled">
    <li>Account Number: <webbase:customerData dataType="Accno" dataSource="U" /></li>
    <li>Name: <webbase:customerData dataType="FullName" dataSource="U" /></li>
    <li>Address: <webbase:customerData dataType="AddrStreet1" dataSource="U" /></li>
    <li>Address 2: <webbase:customerData dataType="AddrStreet2" dataSource="U" /></li>
    <li>Address 3: <webbase:customerData dataType="AddrStreet3" dataSource="U" /></li>
    <li>City: <webbase:customerData dataType="AddrCity" dataSource="U" /></li>
    <li>State: <webbase:customerData dataType="AddrState" dataSource="U" /></li>
    <li>Zip: <webbase:customerData dataType="AddrZip1" dataSource="U" /></li>
    <li>Country: <webbase:customerData dataType="AddrCountry" dataSource="U" /></li>
    <li>Phone: (<webbase:customerData dataType="PhoneAC" dataSource="U" />) <webbase:customerData dataType="Phone3" dataSource="U" />-<webbase:customerData dataType="Phone4" dataSource="U" /></li>
    <li>Ext. <webbase:customerData dataType="Phonex" dataSource="U" /></li>
    <li>Secondary Phone: (<webbase:customerData dataType="SecPhoneAC" dataSource="U" />) <webbase:customerData dataType="SecPhone3" dataSource="U" />-<webbase:customerData dataType="SecPhone4" dataSource="U" /></li>
    <li>Ext. <webbase:customerData dataType="SecPhonex" dataSource="U" /></li>
    <li>Email: <webbase:customerData dataType="Email" dataSource="U" /></li>
</ul>
            <a href="WebBaseMain.do?NextURL=/jsp/editaccount.jsp"><img src="../../../images/navigation/editaccount.gif" width="99" height="17" border="0"></a> 
            Credit Cards on File 
            <a href="WebBaseMain.do?NextURL=/jsp/AddCreditCard.jsp&urlaction=push"><img src="../../../images/navigation/addcreditcard.gif" width="115" height="17" border="0"></a>
		  <webbase:CCardIt> 
<ul class="list-unstyled">
    <li><webbase:CCardData dataType="CardKind" /></li>
    <li><webbase:CCardData dataType="CardNum" /> </li>
    <li>Expires: <webbase:CCardData dataType="ExpDate" /></li>
    <li><webbase:CCardData dataType="Name" /></li>
    <li><webbase:CCardData dataType="Addr1" /></li>
    <li><webbase:CCardData dataType="City" /></li>
    <li><webbase:CCardData dataType="State" /></li>
    <li><webbase:CCardData dataType="Zip" /></li>
    <li><webbase:CCardData dataType="Phone" /></li>
</ul>
          </webbase:CCardIt> 
      </form> 
					  
</div>