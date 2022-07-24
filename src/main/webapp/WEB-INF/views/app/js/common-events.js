$(document).ready(function() {
	
	if ("${location}" == " ")
	{
		$("#modalLocation").modal("show");
	$('#modalLocation #location').focus();
	}
	
	
	<%
	if (ReferenceUtils.getCnfigParamValue(session, "PAYMENT_GATEWAY").equals("Y")) {
	%>
		$('.onlinepayment').removeClass("d-none"); 
		$('.onlinepayment').addClass("d-flex"); 
	<%
	}
	%>
	
	<% if (msLocationUI != null) {%>
		$('.location').removeClass("d-none");
		$('.location').addClass("d-block");
	<%}%>
	
	
	<%
	if (ReferenceUtils.getCnfigParamValue(session, "OTP_ON_REG").equals("Y")) {
	%>
		$('.sendotpdiv').removeClass("d-none"); 
		$('.sendotpdiv').addClass("d-block"); 
	<%
	}
	%>
	 
	<% if (loCustomerUI != null) 
	{
		%>
		$('.sign-off').removeClass("d-none");
		$('.sign-off').addClass("d-block");
		
		$('.no-customer').addClass("d-none");
		$('.no-customer').removeClass("d-block");
		
		<%	if (loCustomerUI.getCustomer_type().equals("C"))
		{
	%>
			$('.customer').removeClass("d-none");
			$('.customer').addClass("d-block");
		<%
		}
		else if (loCustomerUI.getCustomer_type().equals("A"))
		{
		%>
			$('.sysuser').removeClass("d-none");
			$('.sysuser').addClass("d-block");
	<%
		}
	} else {
	%>
	$('.sign-in').removeClass("d-none");
	$('.sign-in').addClass("d-block");
	$('.no-customer').removeClass("d-none");
	$('.no-customer').addClass("d-block");
	
	<%}%>
	
	
	
	<%
	if (loTotalProductCount!=null)
	{
		String lsTotalBillAmount = "Subtotal( " + loTotalQty + " Items ): " + (loTotalBillAmount.setScale(2)).toString();
		String lsTotalBv = "BV: " + (loTotalBv).toString();
		String lsDiscount = "Discount: " + loTotalDiscAmount.toString();
	%>
	$('.cartinfo').removeClass("d-none");
	$('.cartinfo').addClass("d-block");
		$('.cartamt').html("<%=lsTotalBillAmount%>");
		$('.cartbv').html("<%=lsTotalBv%>");
		$('.cartdiscount').html("<%=lsDiscount%>");
	<%
	}
	%>
	
	$(document).on('focus', '.amount, .number', function(e){
		$(this).select();
	});

	hideProgress();
	
});


	