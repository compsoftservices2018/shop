<%@ include file="../common/header.jsp"%>
<%@ page import="com.compsoft.shop.model.TranOrder"%>
<%@ page import="com.compsoft.shop.model.TranOrderDetail"%>
<%@ page import="com.compsoft.shop.model.TranOrderPayment"%>
<%
	TranOrder loTranOrder = (TranOrder) request.getAttribute("order");
	Long lbdSellingPrice = ((loTranOrder.getTot_payment_amt()).multiply(new BigDecimal("100"))).longValue();
	String lsRzrId = ReferenceUtils.getCnfigParamValue(session, "PAYMENT_RZP_ID");
%>

<script>
$(document).ready(function() {
	<%if (loTranOrder.getTranOrderPayment().get(0).getStatus().equals(AppConstants.STATUS_PAYMENT_PENDING)
					&& loTranOrder.getTranOrderPayment().get(0).getPayment_mode()
							.equals(AppConstants.PAYMENT_MODE_ONLINE)) {%>
	$("#rzp-button1").click();
	<%}%>

});
</script>
<title><%=session.getAttribute("TITLE")%></title>

<body>

	<div class="row m-0">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 p-0" style="min-height: 404px;">
			<div class="text-success row m-0 ">${payment_info}</div>
			<div class="row m-0 justify-content-end">

				<%
					if (loTranOrder.getTranOrderPayment().get(0).getStatus().equals(AppConstants.STATUS_PAYMENT_PENDING)
							&& loTranOrder.getTranOrderPayment().get(0).getPayment_mode()
									.equals(AppConstants.PAYMENT_MODE_ONLINE)) {
				%>
				<div class="col-sm-10 p-0"></div>
				<div class="col-sm-2 p-0">

					<button id="rzp-button1"
						class="btn btn-info btn-sm btn-block  btn-default-action">Proceed
						to Pay</button>
					<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
					<script>
		var options = {"key": "<%=lsRzrId%>", // Enter the Key ID generated from the Dashboard
					    "amount": "<%=lbdSellingPrice%>", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
					    "currency": "INR",
					    "name": "<%=GlobalValues.getCompanyShortName(session)%>",
					    "description": "Payment",
					    "image": "<%=request.getContextPath()%>/app<%=msImg%>/logo-sm.png?ver=1.03",
					    "order_id": "<%=loTranOrder.getTranOrderPayment().get(0).getRzr_order_id()%>", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
					    "callback_url": "<%=request.getContextPath()%>/CheckoutCallBack?order_id=<%=loTranOrder.getTranOrderKey().getOrder_no()%>",
					    "prefill": {
					        "name": "<%=loTranOrder.getCustomer_name()%>",
					        "email": "<%=loTranOrder.getEmail()%>",
					        "contact": "<%=loTranOrder.getMobile()%>"
					    },
					    "notes": {
					        "address": "<%=loTranOrder.getDelivery_address() + " PIN-" + loTranOrder.getPin() + " Contact-"
						+ loTranOrder.getMobile() + " email- " + loTranOrder.getEmail()%>"
						},
						"theme" : {
							"color" : "#17a2b8"
						}
		
					};
					var rzp1 = new Razorpay(options);
					document.getElementById('rzp-button1').onclick = function(e) {
						//hideProgress();
						rzp1.open();
						e.preventDefault();
					}
				</script>
				</div>
				<%
					} else if (loTranOrder.getStatus().equals(AppConstants.STATUS_ORDER_CLOSED)) {
				%>
				<div class="col-2 p-0 d-none d-md-block d-lg-block ">
					<button
						class="col invoice btn btn-info btn-sm btn-block btn-default-action">Invoice</button>
				</div>
				<div class="col-2 p-0 d-none d-md-block d-lg-block">
					<button class="col orderlist btn btn-info btn-sm btn-block ">My
						Orders</button>
				</div>
				<%
					} else {
				%>
				<div class="col-2 p-0 d-none d-md-block d-lg-block ">
					<button
						class="col productlist btn btn-info btn-sm btn-block btn-default-action">Continue
						Shopping</button>
				</div>
				<div class="col-2 p-0 d-none d-md-block d-lg-block">
					<button class="col orderlist btn btn-info btn-sm btn-block">My
						Orders</button>
				</div>
				<%
					}
				%>

			</div>
			<%@ include file="../Snippet/Snippet_OrderDetail.jsp"%>

		</div>
		<div class="col-sm-1"></div>
	</div>
	<div class="d-none d-md-block d-lg-block">
		<%@ include file="../Snippet/Snippet_HomeFooter.jsp"%>
	</div>
	<nav
		class="fixed-bottom bg-none border-top primary d-lg-none d-md-none">
		<div class="row m-0">

			<%
				if (loTranOrder.getStatus().equals(AppConstants.STATUS_ORDER_CLOSED)) {
			%>

			<div class="col p-0">
				<button
					class="col invoice btn btn-info btn-sm btn-block btn-default-action">Invoice</button>
			</div>
			<div class="col p-0">
				<button class="col orderlist btn btn-info btn-sm btn-block">My
					Orders</button>
			</div>

			<%
				} else {
			%>
			<div class="col p-0">
				<button
					class="col productlist btn btn-info btn-block btn-default-action">Continue
					Shopping</button>
			</div>
			<div class="col p-0">
				<button class="col orderlist btn btn-info btn-block">My
					Orders</button>
			</div>
			<%
				}
			%>
		</div>

		<%-- 
		<div class="container col-sm-12">
			<%@ include file="../Snippet/Snippet_FooterActions.jsp"%>
		</div> --%>

	</nav>
</body>
<!-- <div class="d-lg-none d-md-none" style="height:25px;"></div> -->
<%@ include file="../common/footer.jsp"%>