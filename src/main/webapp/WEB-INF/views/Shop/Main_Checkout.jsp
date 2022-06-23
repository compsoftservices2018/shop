<%@ include file="../common/header.jsp"%>
<%@ page import="com.compsoft.shopportal.model.TranOrder"%>
<%@ page import="com.compsoft.shopportal.model.TranOrderDetail"%>

<%
	TranOrder loCustOrder = (TranOrder) request.getAttribute("payment_order");
	Long lbdSellingPrice = ((loCustOrder.getTot_payment_amt()).multiply(new BigDecimal("100"))).longValue();
	String lsRzrId = ReferenceUtils.getCnfigParamValue(session, "PAYMENT_RZP_ID");
	
%>

<title><%=session.getAttribute("TITLE")%></title>

<body>

	<div class="col-md-4 p-1"></div>
	<div class="col-md-4" style="padding-top: 10px;">
		<div>
			<form id="ModifyOrder" class="" method="get" action="ModifyOrder">
				<input id="order_no" name="order_no" type="hidden" style="float: left;"
					value=<%=loCustOrder.getTranOrderKey().getOrder_no()%> " />
				<button type="submit" class="btn btn-info"
					style="float: right;">Modify
					Order</button>
			</form>
			<div>
				<button id="rzp-button1" class="btn btn-info">Proceed to
					Pay</button>
				<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
				<script>
		var options = {"key": "<%=lsRzrId%>", // Enter the Key ID generated from the Dashboard
					    "amount": "<%=lbdSellingPrice%>", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
					    "currency": "INR",
					    "name": "<%=GlobalValues.getCompanyShortName(session)%>",
					    "description": "Payment",
					    "image": "<%=request.getContextPath()%>/app<%=msImg%>/logo-sm.png?ver=1.03",
					    "order_id": "<%=loCustOrder.getTranOrderPayment().get(0).getTranOrderPaymentKey().getOrder_no()%>", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
					    "callback_url": "<%=request.getContextPath()%>/CheckoutCallBack",
					    "prefill": {
					        "name": "<%=loCustOrder.getCustomer_name()%>",
					        "email": "<%=loCustOrder.getEmail()%>",
					        "contact": "<%=loCustOrder.getMobile()%>"
					    },
					    "notes": {
					        "address": "<%=loCustOrder.getDelivery_address() + " PIN-" + loCustOrder.getPin()%>"
						},
						"theme" : {
							"color" : "#F37254"
						}
		
					};
					var rzp1 = new Razorpay(options);
					document.getElementById('rzp-button1').onclick = function(e) {
						showProgress("");
						rzp1.open();
						e.preventDefault();
					}
				</script>
			</div>
		</div>
		<div>
			<%-- <%@ include file="../Snippet/Snippet_OrderDetail.jsp"%> --%>

		</div>
	</div>
	<div class="col-md-4 p-1"></div>

</body>
<%@ include file="../common/footer.jsp"%>