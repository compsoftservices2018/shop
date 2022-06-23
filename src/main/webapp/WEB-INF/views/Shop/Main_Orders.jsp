<%@ include file="../common/header.jsp"%>
<%@ page import="com.compsoft.shopportal.model.TranOrder"%>
<style>
div.dataTables_wrapper div.dataTables_filter input {
	width: 150px;
}
</style>


<%
	TranOrder loTranOrder = (TranOrder) request.getAttribute("TranOrder");
	String lsStatusSearch = loTranOrder.getStatus();
%>

<title><%=session.getAttribute("TITLE")%></title>

<body>
	<div class="row m-0">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 p-0 border border-light" style="min-height: 404px;">
			<div class="row m-0">
				<div class="col p-0">
					<form:form id="FormSearchOrder" class="" method="post"
						modelAttribute="TranOrder" action="SearchOrder">
						<div class="input-group input-group-sm row m-0">
							<div class="input-group-prepend input-group-sm col p-0">
								<form:select path="status" type="text"
									class="form-control d-block">
									<%=ReferenceUtils.buildOptions(session, AppConstants.GROUP_ORDER_STATUS, lsStatusSearch,
							true)%>
								</form:select>
							</div>
							<div class="input-group-append col p-0">
								<button class="btn btn-sm btn-block btn-default-action" type="submit">Search</button>
							</div>
						</div>

					</form:form>
				</div>
				<div class="col p-0 d-none d-md-block d-lg-block">
					<button class="productlist btn btn-info btn-sm btn-block">Continue Shopping</button>
				</div>
			</div>

			<%
				List<Map<String, Object>> loOrders = (List<Map<String, Object>>) request.getAttribute("OrderList");
				if (loOrders != null) {
					int liRow = 0;
					for (Map<String, Object> loOrderList : loOrders) {
						String lsCompanyCode = (String) loOrderList.get("company_code");
						String lsCustomerCode = (String) loOrderList.get("customer_code");
						String lsOrderNo = (String) loOrderList.get("order_no");
						String lsStatus = (String) loOrderList.get("status");
						String lsOrderDate = AppUtils.getFormattedDate((Timestamp) loOrderList.get("order_date"));
						String lsOrderDistributionMonth = AppUtils
								.getFormattedDateTime((Timestamp) loOrderList.get("distribution_month"));
			%>
			<div class="font-sm">
				<div class="row shadow-sm m-0 rounded">
					<div class="row col-sm m-0">
						<%-- <div class="col-sm col p-1">
							<img class="icon-sm rounded img-fluid" 
								src="<%=request.getContextPath()%>/app<%=msProductImg%>/<%=loOrderList.get("FIRST_PRODUCT")%>.jpg"
								onerror="this.src='<%=request.getContextPath()%>/img/noimage.png?ver=1.03'">
						</div> --%>
						<div class="col-sm col p-1  text-right text-nowrap">
							<form id="OrderDetail" class="" method="get" action="OrderDetail">
								<input id="were23wer" name="were23wer" type="hidden"
									value=<%=Security.encrypt((String) loOrderList.get("order_no"))%> />
								<button type="submit" class="btn text-info btn-sm  link"
									style="font-weight: normal; padding: 0px 10px 0px 10px;"><%="Order#: " + lsOrderNo%></button>
							</form>
						</div>
					
						<div class="col-sm col p-1  text-right text-nowrap">
							<%="Date: " + lsOrderDate%>
						</div>
						<div class="col-sm col p-1 text-danger text-right text-nowrap">
							<%="Subtotal(" + loOrderList.get("TOT_ORDER_QTY") + " Items) : "
							+ ((BigDecimal) loOrderList.get("TOT_SELLING_PRICE")).setScale(2)%>
						</div>
					</div>
				</div>
			</div>
			<%
				}
				}
			%>
		</div>
		<div class="col-sm-2"></div>
	</div>

<div class="d-none d-md-block d-lg-block">
	<%@ include file="../Snippet/Snippet_HomeFooter.jsp"%>
	</div>
	<nav
		class="fixed-bottom  border-top primary bg-none d-lg-none d-md-none">
		<div class="row m-0">
			<button class="productlist btn btn-info btn-block" >Continue Shopping</button>
		</div>
		<%-- <div class="container col-sm-12">
			<%@ include file="../Snippet/Snippet_FooterActions.jsp"%>
			<%@ include file="../Snippet/Snippet_CartInfo.jsp"%>
		</div> --%>

	</nav>

</body>
<!-- <div class="d-lg-none d-md-none" style="height:25px;"></div> -->
<%@ include file="../common/footer.jsp"%>
