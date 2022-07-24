<%@ include file="../common/header.jsp"%>



<title><%=session.getAttribute("TITLE")%></title>

<body>

	<div class="p-0 d-lg-none d-md-none">
		<%@ include file="../Snippet/Snippet_SearchProductBasic.jsp"%>
	</div>

	
		<%@ include file="../Snippet/Snippet_ProductGroups.jsp"%>


	<div class="row m-0 justify-content-center">

		<%
			List<Map<String, Object>> loProductList = (List<Map<String, Object>>) request.getAttribute("ProductList");
			if (loProductList != null) {
				BigDecimal lbdMRP = BigDecimal.ZERO;
				BigDecimal lbdDiscount = BigDecimal.ZERO;
				BigDecimal lbdSellingPrice = BigDecimal.ZERO;
				BigDecimal lbdBv = BigDecimal.ZERO;
				BigDecimal lbdQty = BigDecimal.ZERO;
				BigDecimal lbdItemTotal = BigDecimal.ZERO;
				String lsProductName = "";
				String lsProductCode = "";
				String lsVendorCode = "";
				String lsImageName = "";
				int i = 0;
				for (Map<String, Object> row : loProductList) {
					i++;
					lbdMRP = ((BigDecimal) row.get("MRP")).setScale(2);
					lbdDiscount = ((BigDecimal) row.get("DISCOUNT")).setScale(2);
					lbdSellingPrice = ((BigDecimal) row.get("SELLING_PRICE")).setScale(2);
					lbdBv = ((BigDecimal) row.get("BV"));
					lbdQty = ((BigDecimal) row.get("ORDER_QTY"));
					lsProductName = (String) row.get("PRODUCT_NAME");
					lsProductCode = (String) row.get("PRODUCT_CODE");
					lsVendorCode = (String) row.get("VENDOR_CODE");
					lsImageName = (String) row.get("IMAGE_NAME");
					lbdItemTotal = (lbdSellingPrice.multiply(lbdQty)).setScale(2);
					String lsAddedToCart = "";
					if (lbdQty.compareTo(BigDecimal.ZERO) == 0) {
						lsAddedToCart = "d-none";
					} else {
						lsAddedToCart = "d-inline-block";
					}
		%>

		<div class="card m-3" style="width: 18rem;border: 0px;">
			<img class="productdetail img-fluid rounded"
				product_code="<%=lsProductCode%>" vendor_code="<%=lsVendorCode%>"
				selling_price="<%=lbdSellingPrice%>"
				src="<%=request.getContextPath()%>/app<%=msProductImg%><%=lsImageName%>.jpg"
				onerror="this.src='<%=request.getContextPath()%>/img/noimage.png?ver=1.03'">
			<div class="card-body">
				<h5 class="card-title text-center"><%=lsProductName%></h5>
				<!--    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  -->
				<%
					if (lbdBv.compareTo(BigDecimal.ZERO) != 0) {
				%>

				<div class="col-sm col text-nowrap text-center pr-1 pl-1">
					<span class="text-right bv "><%="BV: " + lbdBv%></span>
				</div>

				<%
					}
				%>

				<%
					if (lbdDiscount.compareTo(BigDecimal.ZERO) != 0) {
				%>
				<div class="col-sm col text-nowrap text-center pr-1 pl-1">
					<span class="text-right text-muted"> <del><%="MRP: " + lbdMRP%></del>
					</span>
				</div>
				<div class="col-sm col text-nowrap text-center pr-1 pl-1">
					<span class="text-right text-success"><%="Saving : " + lbdDiscount%></span>
				</div>
				<%
					}
				%>
				<div class="col-sm col text-nowrap text-center pr-1 pl-1">
					<span class="font-weight-bold"><%="Price: " + lbdSellingPrice%></span>
				</div>

				<div class="">
					<%@ include file="../Snippet/Snippet_Quantity.jsp"%>
				</div>

				<div
					class="col-12 p-0 text-center customer hide">
					<div class="font-weight-bold">
						Total: <span id="item_total<%=i%>"> <%=lbdItemTotal%>
						</span>
					</div>
				</div>

				<div id="addedincart<%=i%>" class="<%=lsAddedToCart%>">
					<img class="img-fluid icon-sm"
						src="<%=request.getContextPath()%>/img/correct.png?ver=1.03'">
					<span id="" class="text-success font-sm">Added in cart</span>
				</div>
			</div>
		</div>



		<%-- <div class="col-md-4 shadow-sm p-2">

			<h6 class="text-truncate"><%=lsProductName%></h6>
			<div class="row m-0">
				<div class="col-4 p-1">
					<div>
						<img class="productdetail img-fluid rounded"
							product_code="<%=lsProductCode%>" vendor_code="<%=lsVendorCode%>"
							style="height: 100px;"
							src="<%=request.getContextPath()%>/app<%=msProductImg%><%=lsImageName%>.jpg"
							onerror="this.src='<%=request.getContextPath()%>/img/noimage.png?ver=1.03'">
					</div>
					
					<div id="addedincart<%=i%>" class="<%=lsAddedToCart%>">
						<img class="img-fluid icon-sm"
							src="<%=request.getContextPath()%>/img/correct.png?ver=1.03'">
						<span id="" class="text-success font-sm">Added in cart</span>
					</div>

				</div>

				<div class="col p-1">
					<div class="row m-0">
					<%
							if (lbdBv.compareTo(BigDecimal.ZERO) != 0) {
						%>
						
						<div class="col-sm col text-nowrap text-right pr-1 pl-1">
							<span class="text-right bv "><%="BV: " + lbdBv%></span>
						</div>
						
						<%
							}
						%>
						
						<%
							if (lbdDiscount.compareTo(BigDecimal.ZERO) != 0) {
						%>
						<div class="col-sm col text-nowrap text-right pr-1 pl-1">
							<span class="text-right text-muted">
								<del><%="MRP: " + lbdMRP%></del>
							</span>
						</div>
						<div class="col-sm col text-nowrap text-right pr-1 pl-1">
							<span class="text-right text-success"><%="Saving : " + lbdDiscount%></span>
						</div>
						<%
							}
						%>
						<div class="col-sm col text-nowrap text-right pr-1 pl-1">
							<span class="text-right"><%="Price: " + lbdSellingPrice%></span>
						</div>
						<div class="col-12 p-0">
							<%@ include file="../Snippet/Snippet_Quantity.jsp"%>
						</div>
						<div class="col-12 p-0 input-group customer hide justify-content-end">
							<div class="input-group-append" style="float: right;">
								Total: <span id="item_total<%=i%>"> <%=lbdItemTotal%>
								</span>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="text-right customer hide">
				<button type="button" id="addtocartbtn<%=i%>" class="btn btn-secondary btn-sm addtocart"
					product_code="<%=lsProductCode%>" vendor_code="<%=lsVendorCode%>"
					order_qty="<%=lbdQty%>">Add to Cart</button>
			</div>
		</div> --%>
		<%
			}
			}
		%>
	</div>

	<nav
		class="p-1 fixed-bottom bg-none border-top primary d-lg-none d-md-none">
		<div class="container col-sm-12">
			<%-- 		<%@ include file="../Snippet/Snippet_FooterActions.jsp"%>
 --%>
			<%@ include file="../Snippet/Snippet_CartInfo.jsp"%>

		</div>

	</nav>



</body>
<%@ include file="../common/footer.jsp"%>