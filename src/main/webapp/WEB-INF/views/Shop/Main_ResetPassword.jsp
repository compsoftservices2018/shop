<%@ include file="../common/header.jsp"%>

<script>
	$(document).ready(function() {
<%if (!(session.getAttribute("LOGGEDINCUSTOMER") == null)) {%>
	$('.demog').removeClass("hide");
		$('.demog').addClass("show");
<%}%>
	jQuery('#sendotp').click(function() {
		showProgress("Sending OTP");
			$.get('SendOTPReset', {
				mobile : $('#mobile').val()
			}, function(responseText) {
				hideProgress();
				if (responseText.response_status == 1) {
					showSuccess(responseText.response_success);
					$('.demog').removeClass("hide");
					$('.demog').addClass("show");
				} else {
					showError(responseText.error);
				}
			});
		});
	});
</script>


<title><%=session.getAttribute("TITLE")%></title>

<body>

	<div class="row m-0">

		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="col-sm-12">
				<img alt="image" class="img-responsive center-block"
					src="<%=request.getContextPath()%>/img/resetpassword.png?ver=1.03" />
			</div>
			<form id="MainForm" class="form-horizontal" method="post"
				action="ResetPassword">
				<div class="col-sm-12 ">
					<div class="form-group form-group-sm">
						<div class="col-sm-12">
							<label class="control-label" for="inputsm" 
								style="text-align: left;">Enter registered mobile number
							</label>
						</div>
						<div class="col-sm-12">
							<input type="text" class="form-control cell" id="mobile"
								name="mobile" value="${mobile}" placeholder="*Mobile number" />
						</div>
					</div>
					<div class="form-group form-group-sm">
						<div class="col-sm-12">
							<a id="sendotp" style="color: #ffffff; text-decoration: none;"
								accesskey="x" class="btn btn-info">Send OTP</a>

						</div>
					</div>

					<div class="form-group form-group-sm">
						<div class="col-sm-12">
							<label class="control-label" for="inputsm" 
								style="text-align: left;">OTP</label>
						</div>
						<div class="col-sm-12">
							<input type="text" class="form-control otp" 
								id="otp" name="otp" value="${otp}" />
						</div>
					</div>


				</div>
				<div class="col-sm-12" style="margin-bottom: 50px;">
					<button id="btnSubmit" accesskey="s" type="submit"
						class="btn btn-form  btn-info">Reset Password</button>

				</div>
			</form>
		</div>
		<div class="col-sm-4"></div>
	</div>
</body>
<%@ include file="../common/footer.jsp"%>