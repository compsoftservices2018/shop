<form id="productsearchbasic" class="form-horizontal" method="POST" 
	action="SearchProducts">
	<div class="input-group input-group-sm">
		<div class="input-group-prepend input-group-sm	" style="width:60px;">
			<select id="product_cat" name="product_cat"
				class="product_cat form-control input-group-sm buttonimage" 
				style="border-top-right-radius: 0px;border-bottom-right-radius: 0px;"
				data-toggle="collapse">
				<%=AppReferenceUtils.buildListProductGroupNames(session, null, true)%></select>
		</div>
		
		<input maxlength="100" type="text" class="form-control input-group-sm"
			id="product_name" name="product_name" placeholder="Product Name"
			value="${product_name}" />
		<div class="input-group-append">
			<button class="btn btn-info btn-sm border-white" type="submit">Search</button>
		</div>
	</div>
</form>	
