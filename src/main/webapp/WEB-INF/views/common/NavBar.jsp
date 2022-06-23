<%@ page import="com.compsoft.shopportal.model.MstCustomer"%>

<header class="header-area overlay ">
	<nav
		class="navbar navbar-expand-md fixed-top bg-info border-bottom border-light" style="border-bottom-color: #f8f9fa!important;">
		<div class="col-sm-12 p-1 container">

			<ul class="d-lg-none d-md-none">
				<li class="d-none customer sysuser dropdown nav-link"><div
						class="btn btn-info btn-sm p-0" for="#menu" data-toggle="dropdown">
						<div id="menu">
							<hr style="width: 32px; height: 2px;"
								class="m-0 mb-1 mt-1 bg-white rounded">
							<hr style="width: 32px; height: 2px;"
								class="m-0 mb-1 bg-white rounded">
							<hr style="width: 32px; height: 2px;"
								class="m-0 mb-1 bg-white rounded">
							<hr style="width: 32px; height: 2px;"
								class="m-0 bg-white rounded">
						</div>
					</div> <%@ include file="../Snippet/Snippet_Menu.jsp"%></li>

			</ul>

			<ul>
				<li class="nav-link pointer" data-toggle="tooltip"
					data-placement="bottom" title="Home">
					<div>
						<a class="home"> <img style="height: 37px;" class="rounded"
							src="<%=request.getContextPath()%>/app<%=msImg%>/logo-sm.png?ver=1.03" />
						</a>

					</div>
				</li>
			</ul>

			<%-- <ul>
				<li class="nav-link">
					<h3><%=GlobalValues.getCompanyShortName(session)%></h3>
				</li>
			</ul> --%>

			<ul class="collapse navbar-collapse justify-content-end">
				<li class="nav-link"><%@ include
						file="../Snippet/Snippet_SearchProductBasic.jsp"%>
				</li>
			</ul>

			<%-- <ul class="home d-lg-none d-md-none">
				<li class="nav-link d-flex" data-toggle="tooltip"
					data-placement="bottom" title="Home">
					<div>
						<img class="icon-sm"
							src="<%=request.getContextPath()%>/img/home.png?ver=1.03" />
					</div>
				</li>
			</ul> --%>



			<ul class="pointer ">
				<li class="nav-link d-flex" data-toggle="tooltip"
					data-placement="bottom" title="Location">
					<div class="location d-none">
						<img class="icon rounded-circle"
							src="<%=request.getContextPath()%>/img/loc.png?ver=1.03" />
					</div>
					<div class="align-self-center location d-none">
						<h6 class="p-1 m-0 nav-link navbar-collapse font-sm"><%=" " + msLocationUI%></h6>
					</div>
				</li>
			</ul>
			<ul class="pointer searchproducts d-lg-none d-md-none ">
				<li class="nav-link d-flex" data-toggle="tooltip"
					data-placement="bottom" title="Search">
					<div class="">
						<img class="icon rounded-circle"
							src="<%=request.getContextPath()%>/img/search.png?ver=1.03" />
					</div>
				</li>
			</ul>

			<%-- <ul class="searchproducts d-lg-none d-md-none">
				<li class="nav-link d-flex" data-toggle="tooltip"
					data-placement="bottom" title="Search Products">
					<div>
						<img class="icon-sm"
							src="<%=request.getContextPath()%>/img/search.png?ver=1.03" />
					</div>

				</li>
			</ul> --%>

			<ul class="collapse navbar-collapse pointer">
				<li class="nav-link d-flex" data-toggle="tooltip"
					data-placement="bottom" title="Show Cart"
					onclick="window.open('<%=request.getContextPath()%>/ViewCart','_self')">
					<div class="cartinfo d-none">
						<div class="d-flex">
							<div class="align-self-center">
								<img class="icon rounded-circle"
									src="<%=request.getContextPath()%>/img/itemcart.png?ver=1.03" />
							</div>
							<div class="p-0 pr-1 pl-1 align-self-center">
								<h6
									class="h8 p-0 m-0 bv cartbv nav-link navbar-collapse font-sm"></h6>
								<h6 class="p-0 m-0 cartamt nav-link navbar-collapse font-sm"></h6>
							</div>
						</div>
					</div>
				</li>
			</ul>


			<%-- <ul class="collapse navbar-collapse justify-content-end">
				<li class="customer nav-link">
					<div>
						<h5 class="nav-link navbar-collapse font-sm"><%=msWelcomeMsgUI%></h5>
						<h6 class="nav-link navbar-collapse font-sm"><%=msCustNameUI%></h6>
					</div>
				</li>
			</ul> --%>
			<ul class="d-none d-md-block d-lg-block">
				<li
					class="dropleft font-sm d-none customer sysuser dropdown nav-link text-center">
					<span><%=msWelcomeMsgUI + " " + msCustNameUI%></span>
				</li>
			</ul>

			<ul class="d-none d-md-block d-lg-block">
				<li
					class="dropleft font-sm d-none customer sysuser dropdown nav-link text-center">
					<%-- <button type="button"
						class="p-0 pr-1 pl-1 btn btn-info  p-0 s-1 dropdown-toggle"
						data-toggle="dropdown">My Account</button> <%@ include
						file="../Snippet/Snippet_Menu.jsp"%> --%>
					<button type="button" class="btn btn-info dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						My Account</button> <%@ include file="../Snippet/Snippet_Menu.jsp"%>
				</li>

				<%-- <li class="font-sm d-none customer sysuser dropdown nav-link text-center">
					<span><%=msWelcomeMsgUI + " " + msCustNameUI%></span>
					<button type="button"
						class="p-0 pr-1 pl-1 btn btn-info  p-0 s-1 dropdown-toggle"
						data-toggle="dropdown">My Account</button> <%@ include
						file="../Snippet/Snippet_Menu.jsp"%></li> --%>

			</ul>

			<ul class="sign-in d-none justify-content-end">
				<li class="nav-link"><a
					class="btn btn-info btn-sm border-white">Sign In</a></li>
			</ul>


		</div>

	</nav>
</header>






