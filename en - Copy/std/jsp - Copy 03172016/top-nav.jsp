<!--BEGIN TOP navigation-->
<div class="row" style="margin-top:85px">
<div id="top-nav" class="container" data-spy="affix" data-offset-top="10" data-offset-bottom="200" style="z-index: 1;">
<nav class="navbar navbar-default navbar-transparent" role="navigation">
	  <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		 <!-- <a class="navbar-brand" href="#">Brand</a>-->
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		  <ul class="nav navbar-nav">
		  <li><a href="WebBaseMain.do?NextURL=/jsp/SetAdType.jsp" >Start Over</a></li>
			  <webbase:showIf expression="isFakeCustomerLoggedIn" >
				  <li class="dropdown active">
					  <a href="#" data-toggle="modal" data-target=".bs-example-modal-sm">Login<!--<span class="caret"></span>--></a>
					  <ul class="dropdown-menu" role="menu">
						  <li></li>
					  </ul>
				  </li>
			  </webbase:showIf>
			<webbase:showIf expression="isFakeCustomerLoggedIn" >
				<li>
				<a href="WebBaseMain.do?cmd=NewCustomerLL">Create New Account</a>
				</li>
			</webbase:showIf>
			<webbase:showIf expression="!isFakeCustomerLoggedIn" >
			<li class="dropdown active">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Account Tools<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="WebBaseMain.do?NextURL=/jsp/accountsummary.jsp&urlaction=push">Account Summary</a></li>
						<li><a href="WebBaseMain.do?NextURL=/jsp/AdOrderSearch.jsp&urlaction=push" >Search Orders</a></li>
						 <li><a href="WebBaseMain.do?NextURL=/jsp/ViewCurrentOrders.jsp&urlaction=push" >My Orders</a></li>
						<li class="divider"></li>
						<li><a href="WebBaseMain.do?NextURL=/jsp/ViewProfileSummary.jsp&urlaction=push">My Profile<span class="glyphicon glyphicon-user pull-right"></span></a></li>
						<!--<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>-->
					</ul>
			</li>
			</webbase:showIf>
			<li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Booking Info<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li>
							<!--<a href="rates.jsp"alt="Rates" target="_blank" name="test">-->
							<a href="#" data-toggle="modal" data-target=".xtraInfo" onclick="getXtraInfo('rates')">Rates</a></li>
						<li><a href="#" data-toggle="modal" data-target=".xtraInfo" onclick="getXtraInfo('deadlines')">Deadlines</a></li>
						<!-- <li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>-->
					</ul>
			</li>
		  </ul>
		 <!-- <form class="navbar-form navbar-left" role="search">
			<div class="form-group">
			  <input type="text" class="form-control" placeholder="Search">
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		  </form>-->
			<!--<ul class="nav pagination" style="margin-top:5px;margin-bottom:5px">
				<li><a href="#">&laquo;</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>-->
		  <ul class="nav navbar-nav navbar-right">
			<li><a href="WebBaseMain.do?cmd=LogOff&NextURL=/jsp/logout.jsp">Log Off</a></li>
			<!--<li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
			  <ul class="dropdown-menu" role="menu">
				<li><a href="#">Action</a></li>
				<li><a href="#">Another action</a></li>
				<li><a href="#">Something else here</a></li>
				<li class="divider"></li>
				<li><a href="#">Separated link</a></li>
			  </ul>
			</li>-->
		  </ul>
		</div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
</nav>
</div>
</div>
<!--END TOP navigation-->
<div id="EpageError" class="alert alert-danger" role="alert" style="display:none"><webbase:errorData dataType='ErrorMsg'/> </div>
