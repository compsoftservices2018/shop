<div class="input-group customer hide d-flex justify-content-center">
	<div class="input-group-prepend">
		<span class="input-group-text"
			style="font-size: inherit; height: 26px; width: 50px;">Qty:</span>
	</div>
	<div class="decqty input-group-prepend" id="decqty<%=i%>" attr_addedtocart="addedincart<%=i%>"
		selling_price="<%=lbdSellingPrice%>" product_code="<%=lsProductCode%>"
		vendor_code="<%=lsVendorCode%>" order_qty="<%=lbdQty%>"
		attr_order_qty="order_qty<%=i%>" attr_item_total="item_total<%=i%>">
		<span class="input-group-text" style="height: 26px; cursor: pointer;">-</span>
	</div>
	<input type="text"
		class="text-right order_qty form-control input-group-sm"
		selling_price="<%=lbdSellingPrice%>" product_code="<%=lsProductCode%>" attr_addedtocart="addedincart<%=i%>"
		vendor_code="<%=lsVendorCode%>" order_qty="<%=lbdQty%>"
		attr_item_total="item_total<%=i%>"
		style="height: 26px; width: 58px !important; flex: none;"
		id="order_qty<%=i%>" value="<%=lbdQty%>">

	<div class="incqty input-group-append" id="incqty<%=i%>" attr_addedtocart="addedincart<%=i%>"
		selling_price="<%=lbdSellingPrice%>" product_code="<%=lsProductCode%>"
		vendor_code="<%=lsVendorCode%>" order_qty="<%=lbdQty%>"
		attr_order_qty="order_qty<%=i%>" attr_item_total="item_total<%=i%>">
		<span class="input-group-text" style="height: 26px; cursor: pointer;">+</span>
	</div>

</div>