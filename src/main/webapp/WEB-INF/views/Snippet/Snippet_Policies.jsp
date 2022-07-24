<div class="row m-0 bg-info">

	<div class="col-sm pt-3 pb-3">
		<div class="col-12">
			<p class="mb-1">MAIL US</p>
		</div>
		<div class="col-12 font-xs comingsoon text-light">
			Address:
			<%=loCompanyUI != null ? loCompanyUI.getAddress() : ""%>
		</div>
		<div class="col-12 font-xs comingsoon text-light">
			Phone:<a class="text-light"
				href="tel: <%=loCompanyUI != null ? loCompanyUI.getMobile() : ""%>"><%=loCompanyUI != null ? loCompanyUI.getMobile() : ""%></a>
		</div>
		<div class="col-12 font-xs comingsoon text-light">
			Email:<a style="color: #ffffff;"
				href="mailto: <%=loCompanyUI != null ? loCompanyUI.getEmail() : ""%>"><%=loCompanyUI != null ? loCompanyUI.getEmail() : ""%></a>
		</div>
	</div>

	<%
		if (ReferenceUtils.getCnfigParamValue(session, "SHOW_POLICIES").equals("Y")) {
	%>


	<div class="col pt-3 pb-3">
		<div class="col-12">
			<p class="mb-1">ABOUT</p>
		</div>
		<div class="col-12 p-0">
			<div class="col-12">
				<a class="font-xs comingsoon text-light">About Us</a>
			</div>
			<div class="col-12">
				<a class="font-xs text-light" data-toggle="collapse" onclick="$('#submitinquiry #first_name').focus();"
					href="#section-inquiry">Write to us</a>
			</div>
		</div>
	</div>
	<div class="col pt-3 pb-3">
		<div class="col-12">
			<p class="mb-1">HELP</p>
		</div>
		<div class="col-12 p-0">
			<div class="col-sm">
				<a class="font-xs comingsoon text-light">Payment</a>
			</div>
			<div class="col-sm">
				<a class="font-xs comingsoon text-light">Refunds</a>
			</div>
			<div class="col-sm">
				<a class="font-xs comingsoon text-light">Cancellations</a>
			</div>
			<div class="col-sm">
				<a class="font-xs comingsoon text-light">FAQ</a>
			</div>
		</div>
	</div>
	<div class="col pt-3 pb-3">
		<div class="col-12">
			<p class="mb-1">POLICY</p>
		</div>
		<div class="col-12 p-0">
			<div class="col-sm">
				<a class="font-xs comingsoon text-light">Terms of Use</a>
			</div>
			<div class="col-sm">
				<a class="font-xs comingsoon text-light">Privacy</a>
			</div>
		</div>
	</div>

	<%
		}
	%>


</div>

<div class="row m-0 bg-info panel-collapse collapse"
	id="section-inquiry">
	<div class="col-sm"></div>
	<div class="col-sm p-1 bg-light">
	<%@ include file="../Snippet/Snippet_Inquiry.jsp"%>
	
	</div>
	<div class="col-sm"></div>
</div>

<div class=""></div>