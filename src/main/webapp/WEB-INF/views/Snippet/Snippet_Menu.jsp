<ul class="dropdown-menu font-sm">
	<li class="customer d-none"><a
		onclick="window.open('<%=request.getContextPath()%>/GetCustomer','_self')"
		class="dropdown-item">My Profile</a></li>
	<li class="customer orderlist d-none"><a class="dropdown-item">My
			Orders</a></li>
	<%-- <li role="separator" class="dropdown-divider admin d-none"></li>
	<li class="sysuser d-none"><a
		onclick="window.open('<%=request.getContextPath()%>/ManageOrders','_self')"
		class="sysuser d-none dropdown-item">Manage Orders</a></li>
	<li class="sysuser d-none"><a
		onclick="window.open('<%=request.getContextPath()%>/ManageBills','_self')"
		class="sysuser d-none dropdown-item">Manage Bills</a></li>
	<li class="sysuser d-none"><a
		onclick="window.open('<%=request.getContextPath()%>/NewBill','_self')"
		class="sysuser d-none dropdown-item">New Bill</a></li>
	<li class="sysuser d-none"><a
		onclick="window.open('<%=request.getContextPath()%>/NewReturnBill','_self')"
		class="sysuser d-none dropdown-item">Manage Returns</a></li>
	<li class="sysuser d-none"><a
		onclick="window.open('<%=request.getContextPath()%>/ManageProducts','_self')"
		class="dropdown-item">Manage Products</a></li> --%>
	<li role="separator" class="dropdown-divider"></li>
	<li><a id="sign-off" class="dropdown-item sign-off">Sign off</a></li>
</ul>