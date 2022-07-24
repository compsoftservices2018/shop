<div class="overflow-auto d-flex justify-content-center">
	<%
		List<Map<String, Object>> loProducts = (List<Map<String, Object>>) session.getAttribute("PRODUCT_GROUP");
		if (loProducts != null) {

			for (Map<String, Object> loProductRow : loProducts) {
	%>

	<div class="m-2" >

		<form id="productsearchbasic" class="form-horizontal" method="POST"
			action="SearchProducts">
			<div class="input-group input-group-sm">
				<input maxlength="100" type="hidden"
					class="form-control input-group-sm" id="product_name"
					name="product_name" placeholder="Product Name"
					value="${product_name}" /> <input maxlength="100" type="hidden"
					class="form-control input-group-sm" id="product_cat"
					name="product_cat" placeholder="Product Name"
					value="<%=loProductRow.get("group_name")%>" />
				<div class="input-group-append">
					<button class="font-xs btn btn-default-action btn-sm rounded-pill text-success font-weight-bold" style="width:100px;height:50px;" type="submit"><%=loProductRow.get("group_name")%></button>
				</div>
			</div>
		</form>
	</div>

	<%
		}
		}
	%>
</div>