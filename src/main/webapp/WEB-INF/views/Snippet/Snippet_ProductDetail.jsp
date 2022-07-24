
<div>
	<h5 id="product_name"></h5>
</div>

<div style="max-height: calc(100vh - 162px); overflow-y: auto;">
	<div class="text-center">
		<img class="img-responsive" id="prod_image" src=""
			onerror="this.src='<%=request.getContextPath()%>/img/noimage.png?ver=1.03'"
			style="height: 100px; border-radius: 10px;">
	</div>

	<div>

		<div class="col p-1">
			<div class="row m-0">
				<div class="col-sm col  bv">
					<h6 class="text-right  ">
						BV: <span id="bv"></span>
					</h6>
				</div>

				<div class="col-sm col " id="mrp_field">
					<span class="text-right text-muted font-sm">
						MRP:
						<del>
							<span id="mrp"></span>
						</del>

					</span>
				</div>
				<div class="col-sm col discount" id="discount_field">
					<span class="text-right text-success">
						Saving: <span id="discount"></span>
					</span>
				</div>

				<div class="col-sm col ">
					<span class="text-right">
						Price: <span id="selling_price"></span>
					</span>
				</div>
				<div class="col-12 text-center">
					<button product_code="" vendor_code="" selling_price="" order_qty="1" type="button"
						class="btn btn-info btn-sm addtocart d-none">Add to Cart</button>
					<div id="addedincart" class="d-none">	
						<img class="img-fluid icon-sm"
							src="<%=request.getContextPath()%>/img/correct.png?ver=1.03'">
						<span id="" class="text-success font-sm">Added in cart</span>
					</div>
				</div>
				<div class="col-sm">
					<p class="font-sm" id="add_info"></p>
				</div>
			</div>
		</div>

	</div>
</div>
