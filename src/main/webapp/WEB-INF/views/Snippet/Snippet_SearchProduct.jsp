
<%
	String lsProductGroup = (String) request.getParameter("product_cat");
	String lsSort = (String) request.getParameter("sort_by");
%>

	<form class="form-horizontal" method="POST" action="SearchProducts">

		<div class="form-group form-group-sm">
			<div class="col-sm-12 p-0">
				<label class="control-label" for="inputsm" style="text-align: left;">Category:</label>
			</div>
			<div class="col-sm-12 p-0">
				<select id="product_cat" name="product_cat" class="form-control">
					<%=AppReferenceUtils.buildListProductGroupNames(session, lsProductGroup, true)%></select>
			</div>
		</div>

		<div class="form-group form-group-sm">
			<div class="col-sm-12 p-0">
				<label class="control-label" for="inputsm" style="text-align: left;">Product
					Name:</label>
			</div>
			<div class="col-sm-12 p-0">
				<input maxlength="100" type="text" class=" form-control"
					id="product_name" name="product_name"
					placeholder="Enter few words of product to search"
					value="${product_name }" />
			</div>
		</div>

		<div class="form-group form-group-sm">
			<div class="row m-0">
				<div class="col p-0">
					<button type="submit" class="btn btn-info btn-block"
						onclick="showProgress('Loading..')">Search</button>
				</div>
				<div class="col p-0">
					<button type="button" class="btn btn-secondary btn-block"
						data-dismiss="modal" onclick="$('#modalProductSearch').modal('hide');">Close</button>
				</div>
			</div>
		</div>
	</form>
