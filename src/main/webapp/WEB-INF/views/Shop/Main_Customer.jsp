<%@ include file="../common/header.jsp"%>

<%
	MstCustomer loMstCustomer = (MstCustomer) request.getAttribute("MstCustomer");
	String lsStatus = loMstCustomer.getStatus();
	String lsCustomerCode = loMstCustomer.getMstCustomerKey().getCustomer_code();
	String lsMobile = loMstCustomer.getMobile();
	String lsPin = loMstCustomer.getPin();
%>

<script>
	$(document).ready(function() {
		<%if (!(session.getAttribute("LOGGEDINCUSTOMER") == null)) {%>
			$('.demog').removeClass("d-none");
				$('.demog').addClass("d-block");
		<%}%>
	});

$(document).on('click', '.sendotp', function() {
		showProgress("Sending OTP.");
		$('#demog-div').addClass("d-none");
			$.get('SendOTP', {
				mobile : $('#dummy-mobile').val()
			}, function(responseText) {
				hideProgress();
				if (responseText.status == 1) {
					$("#modalInformationError").html(responseText.msg);
					$('#div-validateotp').removeClass("d-none");
					$('#mobile').val($('#dummy-mobile').val());
					
				} else {
					$("#modalInformationError").html(responseText.error);
				}

				$("#modalInformation").modal("show");
			});
			
		});
	
	$(document).on('click', '.validateotp', function() {
		showProgress("Validating OTP.");
		$.post('ValidateOTP', {
			requestotp : $('.otp').val()
		}, function(responseText) {
			hideProgress();
			if (responseText.status == 1) {
				$("#modalInformationError").html(responseText.msg);
				$('#demog-div').removeClass("d-none");
			} else {
				$("#modalInformationError").html(responseText.error);
			}
			$("#modalInformation").modal("show");
		});
		
	});

</script>

<title><%=session.getAttribute("TITLE")%></title>
<body>
	<div class="row m-0">
		<div class="col-sm-4"></div>
		<div class="col-sm-4 shadow-sm p-0">
			<div class="">
				<img alt="image" class="img-fluid "
					src="<%=request.getContextPath()%>/img/regbanner.png?ver=1.03" />
			</div>
			<form:form id="MainForm" class="form p-2" method="post"
				modelAttribute="MstCustomer" action="SaveCustomer">
				<form:input path="MstCustomerKey.customer_code" key="Y"
					type="hidden" autofocus="true" required="true" class="form-control"
					id="customer_code" value="${customer_code}" />

				
				<div class="customer d-none">
					<form:input path="mobile" type="hidden" class="form-control cell"
						required="true" id="mobile" value="${mobile}"
						placeholder="*Mobile number" />
					<label><%="+91 " + lsMobile%></label>
				</div>

				<div class="form-group form-group-sm sendotpdiv no-customer d-none">
					<div class="form-group form-group-sm div-cust-mobile">
						<label>Mobile</label>
						<div class="input-group">
							<div style="width: 60px;" class="input-group-prepend">
								<input type="text" class="input-group-prepend form-control"
									maxlength="10" readonly="readonly" value="+91"></input>
							</div>
							<input id="dummy-mobile" type="text"
								class="input-group-prepend form-control cell" required="true"
								id="mobile" value="<%=lsMobile%>" /> <a
								class="input-group-append btn btn-info sendotp">Verify</a>
						</div>
					</div>
					<div class="form-group d-none" id="div-validateotp">
						<label>OTP</label>
						<div class="input-group">
							<form:input path="otp" type="text"
								class="input-group-prepend form-control otp" maxlength="6"
								id="otp" value="" />
							<a class="input-group-append validateotp btn btn-info">Validate
								OTP</a>
						</div>
					</div>
				</div>

				<div id="demog-div" class="customer d-none">
					<label>Password</label>
					<form:input path="password" type="password" class="form-control"
						maxlength="12" required="true" id="password" value="${password}"
						placeholder="required" />
					<label>Email Id</label>
					<form:input path="email" type="email"
						class="lowercase form-control email" id="email" value="${email}" />
					<label>Name</label>
					<form:input path="customer_name" type="text" maxlength="50"
						class="uppercase form-control" required="true" id="customer_name"
						value="${customer_name}" />
					<label>Address</label>
					<form:textarea path="address" class="uppercase form-control"
						maxlength="300" required="true" rows="3" value="${address}"></form:textarea>
					<label>Pin</label>

					<form:input path="pin" type="text" maxlength="6"
						class="form-control" id="pin" value="${pin}" />

					<div class=" mt-3 p-0 d-flex">
						<div class="col p-0">
							<button id="btnSubmit" type="submit"
								class="text-nowrap col btn btn-block btn-default-action">Submit</button>
						</div>
						<div class="col p-0">
							<button type="button" class="productlist text-nowrap col btn btn-info btn-block">Continue
								Shopping</button>
						</div>
					</div>
				</div>
			</form:form>
		</div>
		<div class="col-sm-4"></div>
	</div>
</body>
<%@ include file="../common/footer.jsp"%>