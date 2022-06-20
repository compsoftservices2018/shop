<%@ include file="../../common/header.jsp"%>


<title><%=session.getAttribute("TITLE")%></title>

<body>
	<div class="p-0 d-lg-none d-md-none">
		<%@ include file="../../Snippet/Snippet_SearchProductBasic.jsp"%>
	</div>

	<div class="">
		<img class="img-fluid"
			src="<%=request.getContextPath()%>/app<%=msImg%>banner.png?ver=1.03">
	</div>



	<div class="row m-0">
		<%
		List<Map<String, Object>> loDiscProducts = (List<Map<String, Object>>) session.getAttribute("TO_PRODUCTS");
			if (loDiscProducts != null && loDiscProducts.size() >= 6) {

				for (int i = 0; i < 6; i++) {
					Map<String, Object> loProductRow = loDiscProducts.get(i);
		%>
		<div class="text-center col-6 col-md-2 shadow-sm">
			<div class="p-1">
				<img alt="image" style="width: 28px; border-radius: 14px;"
					src="<%=request.getContextPath()%>/img/discount.png?ver=1.03" />
				<%=loProductRow.get("discount") + "%"%>
			</div>
			<div class="card-body p-0 m-0">
				<p class="card-text text-truncate p-1 m-0 "><%=loProductRow.get("product_name")%></p>
			</div>
			<div class="align-items-center p-1 m-0">
				<img product_code="<%=loProductRow.get("product_code")%>"
				vendor_code="<%=loProductRow.get("vendor_code")%>"
				selling_price="<%=loProductRow.get("selling_price")%>"
					src="<%=request.getContextPath()%>/app<%=msProductImg%>/<%=loProductRow.get("image_name")%>.jpg"
					onerror="this.src='<%=request.getContextPath()%>/img/noimage.png?ver=1.03'"
					class="productdetail img-fluid rounded" style="width: 120px; height: 120px;">
			</div>
		</div>

		<%
			}
			}
		%>
	</div>
	<hr class="border-top border-info">

	<div class="" style="display: flex; overflow-x: auto;">
		<%
			loDiscProducts = (List<Map<String, Object>>) session.getAttribute("PR_PRODUCTS");
			if (loDiscProducts != null && loDiscProducts.size() >= 6) {

				for (int i = 0; i < 6; i++) {
					Map<String, Object> loProductRow = loDiscProducts.get(i);
		%>
		<div class="text-center col-md-2">
			<div class="align-items-center p-1 m-0">
				<img product_code="<%=loProductRow.get("product_code")%>"
				 vendor_code="<%=loProductRow.get("vendor_code")%>"
				 selling_price="<%=loProductRow.get("selling_price")%>"
					src="<%=request.getContextPath()%>/app<%=msProductImg%>/<%=loProductRow.get("image_name")%>.jpg"
					onerror="this.src='<%=request.getContextPath()%>/img/noimage.png?ver=1.03'"
					class="productdetail img-fluid rounded" style="width: 100px; height: 100px;">
			</div>
			<div class="card-body p-1 m-0">
				<%-- <h5 class="card-title"><img alt="image" style="width: 28px; border-radius: 14px;"
								src="<%=request.getContextPath()%>/img/discount.png?ver=1.03" />
							<%=loProductRow.get("discount") + "%"%></h5> --%>
				<p class="card-text p-0 m-0 text-truncate "><%=loProductRow.get("product_name")%></p>
				<p class="card-text p-1 m-0 text-truncate">
					<span class="text-muted font-sm"><del><%=((BigDecimal) loProductRow.get("mrp")).setScale(2)%>
						</del></span> <span><%=((BigDecimal) loProductRow.get("selling_price")).setScale(2)%></span>
				</p>

				<a class="btn btn-info btn-sm addtocart" product_code="<%=loProductRow.get("product_code")%>"
				selling_price="<%=loProductRow.get("selling_price")%>"
				 vendor_code="<%=loProductRow.get("vendor_code")%>" order_qty="1">Buy Now</a>
			</div>
		</div>

		<%
			}
			}
		%>
	</div>

	<hr class="border-top border-info">

	<div class="overflow-auto d-flex">
		<%
			List<Map<String, Object>> loProducts = (List<Map<String, Object>>) session.getAttribute("OP_PRODUCTS");
			if (loProducts != null) {

				for (Map<String, Object> loProductRow : loProducts) {
		%>
		<div class="productdetail  px-2 text-center">
			<img 
			product_code="<%=loProductRow.get("product_code")%>"
			vendor_code="<%=loProductRow.get("vendor_code")%>"
			selling_price="<%=loProductRow.get("selling_price")%>"
				src="<%=request.getContextPath()%>/app<%=msProductImg%>/<%=loProductRow.get("image_name")%>.jpg"
				onerror="this.src='<%=request.getContextPath()%>/img/noimage.png?ver=1.03'"
				class="productdetail  shadow-sm p-2 rounded" style="width: 75px; height: 75px;">
			<p class="p-0 m-0 font-sm"><%=((BigDecimal) loProductRow.get("selling_price")).setScale(2)%></p>
			<p class="p-0 m-0 font-xs"><%=(String) loProductRow.get("product_name")%></p>


		</div>
		<%
			}
			}
		%>
	</div>
<hr class="border-top border-info">
	<div class="bg-info">
		<%@ include file="../../Snippet/Snippet_HomeFooter.jsp"%>
	</div>
	<nav 
		class="p-1 fixed-bottom bg-none border-top primary d-lg-none d-md-none">
		<div class="container col-sm-12">
			<%-- <%@ include file="../Snippet/Snippet_FooterActions.jsp"%> --%>
			<%@ include file="../../Snippet/Snippet_CartInfo.jsp"%>
		</div>
	</nav>



</body>
<%@ include file="../../common/footer.jsp"%>