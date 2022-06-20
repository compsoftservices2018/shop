
<div id="modalProductSearch" class="modal" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="confirm-title">Product Search</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<%@ include file="Snippet/Snippet_SearchProduct.jsp"%>
			</div>
		</div>
	</div>
</div>


<div id="modalproductdetails" class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="confirm-title">Details</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<%@ include file="Snippet/Snippet_ProductDetail.jsp"%> 
			</div>
		</div>
	</div>
</div>

<div id="modalLocation" class="modal" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="confirm-title">Enter your location</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="SubmitPin" method="post" class="font-bold form-horizontal"
					action="SubmitPin" style="padding: 10px;">
					<div class="form-group form-group-sm">

						<div class="col-sm-12">
							<input id="location" name="location" type="number" maxlength="6"
								placeholder="Enter pin code" class="form-control pin"
								value="<%=AppUtils.convertNullToEmpty(session.getAttribute("CUSTOMER_LOCATION"))%>" />
						</div>
					</div>
					<div class="modal-footer justify-content-center">
						<button id="btnSubmit" accesskey="s" type="submit"
							class="btn btn-info btn-sm">OK</button>
						<button type="button" class="btn btn-secondary btn-sm"
							data-dismiss="modal">Cancel</button>
					</div>
				</form>
			</div>


		</div>

	</div>
</div>


