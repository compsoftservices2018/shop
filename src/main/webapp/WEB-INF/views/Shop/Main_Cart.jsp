<%@ include file="../common/header.jsp"%>
<%@ page import="com.compsoft.shopportal.model.TranOrder"%>
<%@ page import="com.compsoft.shopportal.model.TranOrderDetail"%>
<%@ page import="com.compsoft.shopportal.model.TranOrderPayment"%>
<%
	TranOrder loTranOrder = (TranOrder) request.getAttribute("TranOrder");
%>
<script>
	
</script>

<title><%=session.getAttribute("TITLE")%></title>

<body>

	<button id="submitorder" onclick="submitCart();" class="d-none"></button>

	<div class="row m-0">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 p-0">
			<div class="col-sm-12 p-1">
				<div class="shadow-sm">

					<div class="row m-0  bg-light ">
						<div class="col-3 p-0 ">
							<h6 class=" bg-light p-1 text-underline">Summary</h6>
						</div>
						<div class="col-9 p-1 text-danger text-right cartamt font-weight-bold "></div>
					</div>
					<div class="row m-0 p-1 h6">
						<div class="col bv cartbv p-0"></div>
						<div class="col cartdiscount p-0"></div>

					</div>
				</div>
			</div>
			<div class="row m-0">
				<div class="col-sm-4 p-1 font-sm">
					<div class="shadow-sm">
						<h6 class="bg-light p-1 text-underline">Payment Mode</h6>
						<div class="row m-0 p-2">
							<div class="col-sm form-check pt-1 pb-1">
								<label class="form-check-label" for="radio1"> <input
									type="radio" class="paymentmode form-check-input" id="radio1"
									name="paymentmode" value="CH" checked>Pay on Delivery
								</label>
							</div>
							<div class="col-sm form-check d-none pt-1 pb-1 onlinepayment">
								<label class="form-check-label" for="radio2"> <input
									type="radio" class="paymentmode form-check-input" id="radio2"
									name="paymentmode" value="OL">Pay Online
								</label> <!-- <img style="height:20px;" src="/shoponline/img/paycc.png?ver=1.03"> -->
							</div>
						</div>
					</div>
					<div class="shadow-sm">
						<h6 class="bg-light p-1 text-underline">Delivery Information</h6>
						<form class="form">
						<div class="form-group form-group-sm p-1">
							<%-- <div class="col-sm-12 p-1 pt-2 d-none">
								<label class="control-label" for="inputsm"
									style="text-align: left;">Scheduled Date & Time </label>
							</div>
							<div class="col-sm-12 p-1 d-none">
								<input id="scheduled_delivery_date" id="scheduled_delivery_date"
									name="order_date" type="text"
									class="form-control formatdatecalendar form-control-sm"
									value="<%=loTranOrder.getScheduled_delivery_date()%>" /> <select
									id="scheduled_delivery_time" type="text"
									class="form-control form-control-sm"
									value="<%=loTranOrder.getScheduled_delivery_time()%>">
									<%=ReferenceUtils.buildOptions(session, AppConstants.GROUP_DELIVERY_TIME,
					loTranOrder.getScheduled_delivery_time(), true)%>
								</select>
							</div> --%>
							
								<label>Address</label>
							
								<textarea id="address" name="address" maxlength="400"
									class="form-control form-control-sm text-uppercase" rows="4"
									value="<%=loTranOrder.getDelivery_address()%>"><%=loTranOrder.getDelivery_address()%></textarea>
							

								<label>Pin</label>
								<input type="text" maxlength="6"
									class="form-control form-control-sm" id="pin"
									value="<%=loTranOrder.getPin()%>" />
						</div>
						</form>
					</div>
					<div class="d-none d-md-block d-lg-block">
						<div class="row m-0 p-0">
							<div class="col p-0">
								<button
									class="confirmorder btn btn-sm btn-block btn-default-action">Confirm
									Order</button>
							</div>
							<div class="col p-0">
								<button class="productlist btn btn-info btn-sm btn-block">Continue
									Shopping</button>
							</div>
						</div>
					</div>

				</div>
				<div class="col-sm-8 p-1 font-sm">

					<div class="shadow-sm">
						<h6 class="bg-light p-1 text-underline">Details</h6>

						<%
							List<TranOrderDetail> loTranOrderDetailList = loTranOrder.getTranOrderDetail();
							if (loTranOrderDetailList != null) {
								int i = 0;
								int liCol = 0;
								String lsProductCode = "";
								String lsVendorCode = "";
								BigDecimal lbdSellingPrice = BigDecimal.ZERO;
								BigDecimal lbdQty = BigDecimal.ZERO;
								for (TranOrderDetail loDetailRow : loTranOrderDetailList) {
									i++;
									lsProductCode = loDetailRow.getTranOrderDetailKey().getProduct_code();
									lsVendorCode = loDetailRow.getTranOrderDetailKey().getVendor_code();
									lbdSellingPrice = loDetailRow.getTranOrderDetailKey().getSelling_price();
									lbdQty = loDetailRow.getOrder_qty();
						%>
						<div class="shadow-sm row m-0 p-1 font-sm">
							<div class="col-12 p-0"><%=loDetailRow.getProduct_name()%>
							</div>
							<div class="row col-12 m-0 p-0">
								<div class="col-2 p-0">
									<img class="productdetail img-fluid rounded "
										product_code="<%=lsProductCode%>"
										vendor_code="<%=lsVendorCode%>"
										selling_price="<%=lbdSellingPrice%>" style="height: 40px;"
										src="<%=request.getContextPath()%>/app<%=msProductImg%><%=loDetailRow.getImage_name()%>.jpg"
										onerror="this.src='<%=request.getContextPath()%>/img/noimage.png?ver=1.03'">
								</div>
								<div class="col-10	 p-0">
									<div class="row m-0 p-1">
										<div class="col-sm text-right p-0">
											<%="Rate: " + lbdSellingPrice%>
										</div>
										<div class="col-sm text-right p-0 ">
											<div class="p-0 d-flex float-right ">
												<%-- <span class="pr-1">Quantity: </span> <input type="number"
													class="p-1 text-right order_qty form-control input-group-sm"
													selling_price=<%=lbdSellingPrice%>
													product_code="<%=lsProductCode%>"
													vendor_code="<%=lsVendorCode%>"
													order_qty="<%=loDetailRow.getOrder_qty()%>"
													attr_item_total="item_total<%=i%>"
													style="height: 26px; width: 70px; margin-top: -2px;" id="order_qty<%=i%>"
													value="<%=loDetailRow.getOrder_qty()%>"> --%>
											
											<%@ include file="../Snippet/Snippet_Quantity.jsp"%>
											
											</div>
										</div>
										<div class="col-sm text-right text-danger p-0">
											Item Total: <span id="item_total<%=i%>"><%=lbdSellingPrice.multiply(loDetailRow.getOrder_qty())%>
											</span>
										</div>
										<%-- <div class="col-sm text-right p-0">
											<button product_code="<%=lsProductCode%>"
												vendor_code="<%=lsVendorCode%>"
												class="proddetails btn btn-outline-info btn-sm font-xs p-1">Update</button>
										</div> --%>
									</div>
								</div>
							</div>
						</div>
						<%
							}
							}
						%>

					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>


	<div class="d-none d-md-block d-lg-block">
		<%@ include file="../Snippet/Snippet_HomeFooter.jsp"%>
	</div>

	<nav
		class="fixed-bottom bg-none border-top primary d-lg-none d-md-none">
		<div class="row m-0">
			<div class="col p-0">
				<button
					class="confirmorder btn btn-info btn-block btn-default-action">Confirm</button>
			</div>
			<div class="col p-0">
				<button class="productlist btn btn-info btn-block">Add
					Items</button>
			</div>
		</div>
		<%-- <div class="container col-sm-12">
			<%@ include file="../Snippet/Snippet_FooterActions.jsp"%>
			<%@ include file="../Snippet/Snippet_CartInfo.jsp"%>
		</div> --%>

	</nav>

</body>
<!-- <div class="d-lg-none d-md-none" style="height:37px;"></div> -->
<%@ include file="../common/footer.jsp"%>