<ul class="menuLeft list-unstyled">
		<h4>Help Menu</h4>
		<hr>
		<webbase:showIf expression="isFakeCustomerLoggedIn" >
        <%  if (session.getAttribute("pageName") == "ReviewOrder.jsp"){ %>    
		<li class="clickable">
		<a href="#" data-toggle="modal" data-target=".bs-example-modal-sm">Login<!--<span class="caret"></span>--></a>
		</li>
		<li class="clickable">
		<a href="WebBaseMain.do?cmd=NewCustomerLL">Create New Account</a>
		</li>
		<hr>
        <%}%>    
		</webbase:showIf>
		<webbase:showIf expression="!isFakeCustomerLoggedIn" >
				<li class="clickable"><a href="WebBaseMain.do?NextURL=/jsp/accountsummary.jsp&urlaction=push">Account Summary</a></li>
<!--				<li class="clickable"><a href="WebBaseMain.do?NextURL=/jsp/AdOrderSearch.jsp&urlaction=push" >Search Orders</a></li>-->
				<li class="clickable"><a href="WebBaseMain.do?NextURL=/jsp/ViewCurrentOrders.jsp&urlaction=push" >My Orders</a></li>
				<hr>
<!--
				<li class="clickable"><a href="WebBaseMain.do?NextURL=/jsp/ViewProfileSummary.jsp&urlaction=push">My Profile
                    </a></li>
-->
<!--
            <li class="clickable"><a href="#" data-toggle="modal" data-target=".xtraInfo" onclick="getXtraInfo('profile')">My Profile
                    </a></li> 
-->
		</webbase:showIf>
		<!--<a href="rates.jsp"alt="Rates" target="_blank" name="test">
		<li class="clickable"><a href="#" data-toggle="modal" data-target=".xtraInfo" onclick="getXtraInfo('Rates')">Rates</a></li>-->
		<li class="clickable"><a href="#" data-toggle="modal" data-target=".xtraInfo" onclick="getXtraInfo('Deadlines')">Deadlines</a></li>
		<hr>
		<li class="clickable"><a href="WebBaseMain.do?NextURL=/jsp/SetAdType.jsp">Start Over</a></li>
		<webbase:showIf expression="!isFakeCustomerLoggedIn" >
				<li><a href="WebBaseMain.do?cmd=LogOff&NextURL=/jsp/logout.jsp">Log Out</a></li>
		</webbase:showIf>
</ul>