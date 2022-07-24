$(document).on('click', '.add_payment', function(a) {
	addNewRow($('#PaymentTable tr:last'), false);
});

$(document).on('change', '.lookup_product_code', function(a) {
	var jsProductCode = $(this).val();
	var jsSellingPrice = $(this).attr('selling_price');
	var jsVendorCode = $(this).attr('vendor_code');
	$.get('GetBillProductInfo', {
		requestData : JSON.stringify({
			"product_code" : jsProductCode,
			"selling_price" :  jsSellingPrice,
			"vendor_code" :  jsVendorCode
		})
	}, function(response) {
		if (response.response_status == -1) {
			$("#ModalSelectList_modal-body #source").val('lookup_product_code');
			$('#SelectListTable').DataTable().clear().destroy();
			$("#SelectListBody").html(response.product_list);
			$('#ModalSelectList').modal("show");
			$('#SelectListTable').DataTable({
				dom : 'Bfrtip',
				buttons : [],
				"pageLength" : 15, 
				 "order": []
			});
		} else if (response.response_status == 1) {
			$(".lookup_product_code").val("");
			var jsRowFound = false;
			$(".data_row_product").each(function(index) {
				if ($(this).find(".product_info_row").val() == jsProductCode
						&& (jsSellingPrice == undefined 
								||jsSellingPrice=='' 
									|| $(this).find(".selling_price").val() == jsSellingPrice)) 
				{

					$(this).find(".bill_qty")
						.val(parseFloat($(this).find(".bill_qty").val()) + 1);
					$(this).find(".bill_qty").change();
					jsRowFound = true;
				}
			});
			if (!jsRowFound) {
				if ($('#EditableTable tr:last').find(".product_info_row").val() != '') {
					console.log("new record");
					addNewRow($('#EditableTable tr:last'), false);
				}
				$('#EditableTable tr:last').find(".product_info_row").val(jsProductCode);
				$('#EditableTable tr:last').find('input[attr_name = vendor_code]').val(response.VENDOR_CODE);
				$('#EditableTable tr:last').find('input[attr_name = product_name]').val(response.PRODUCT_NAME);
				$('#EditableTable tr:last').find('input[attr_name = mrp]').val(response.MRP);
				$('#EditableTable tr:last').find('input[attr_name = discount]').val(response.DISCOUNT);
				$('#EditableTable tr:last').find('input[attr_name = bv]').val(response.BV);
				$('#EditableTable tr:last').find('input[attr_name = selling_price]').val(response.SELLING_PRICE);
				$('#EditableTable tr:last').find('input[attr_name = cess_percentage]').val(response.CESS_PERCENTAGE);
				$('#EditableTable tr:last').find('input[attr_name = gst_percentage]').val(response.GST_PERCENTAGE);
				$('#EditableTable tr:last').find('input[attr_name = hsn_code]').val(response.HSN_CODE);
				$('#EditableTable tr:last').find('input[attr_name = landing_cost]').val(response.LANDING_COST);
				$('#EditableTable tr:last').find('input[attr_name = disc_per]').val(response.DISC_PER);
				$('#EditableTable tr:last').find('input[attr_name = bv_per]').val(response.BV_PER);
				$('#EditableTable tr:last').find('input[attr_name = bill_qty]').val(1);
				$('#EditableTable tr:last').find('input[attr_name = bill_qty]').change();
				$('#EditableTable tr:last').find(".bill_qty").val(1);
				$('#EditableTable tr:last').find(".bill_qty").change();
			}
		} else {
			showError(response.response_error);
		}
		$(".lookup_product_code").focus();
	});
});

$(document).on('change', '.customer_info', function(a) {
	var index = $(this).attr("index");
	$.get('GetCustomerInfo', {
		requestData : JSON.stringify({
			"customer_code" : $(this).val()
		})
	}, function(response) {
		console.log(response);
		$('input[ref_name = customer_name]').val(response.CUSTOMER_NAME);
		$('input[ref_name = mobile]').val(response.MOBILE);
		$('input[ref_name = email]').val(response.EMAIL);
		$('input[ref_name = delivery_address]').val(response.ADDRESS);
		$('input[ref_name = pin]').val(response.PIN);
	});
});



$(document).on(
	'click',
	'.mgpcustomerinvoice',
	function() {

		window.open(
			'<%=request.getContextPath()%>/app<%=msExternalReport%>'
			+ formatMMYYYY($(this).attr("distribution_month"))
			+ '~' + $(this).attr("customer_code") + '.pdf',
			'_self');

	});



$(document).on('click', '.productdetail', function() {
	showProgress("Getting product information");
	var ljsProductCode = $(this).attr('product_code');
	$.get('GetProductInfo', {
		requestData : JSON.stringify({
			product_code : $(this).attr('product_code'),
			vendor_code : $(this).attr('vendor_code'),
			selling_price : $(this).attr('selling_price')
		})
	}, function(responseText) {
		console.log(responseText);
		hideProgress();
		if (responseText.response_status == 1) {
			var addText = "";
			console.log("testing");
			if (parseFloat(responseText.DISCOUNT) <= 0) {
				$("#modalproductdetails #mrp_field").addClass("d-none");
				$("#modalproductdetails #discount_field").addClass("d-none");
			}
			console.log("testing2 " + responseText.ORDER_NO);
			if (responseText.ORDER_NO != null) {
				$("#modalproductdetails .addtocart").removeClass("d-inline-block");
				$("#modalproductdetails .addtocart").addClass("d-none");
				$("#modalproductdetails #addedincart").addClass("d-inline-block");
				$("#modalproductdetails #addedincart").removeClass("d-none");
			} else {
				$("#modalproductdetails .addtocart").addClass("d-inline-block");
				$("#modalproductdetails .addtocart").removeClass("d-none");
				$("#modalproductdetails #addedincart").removeClass("d-inline-block");
				$("#modalproductdetails #addedincart").addClass("d-none");
			}
			console.log("testing3 " + responseText.ORDER_NO);
			$("#modalproductdetails #product_name").html(responseText.PRODUCT_NAME);
			$("#modalproductdetails #selling_price").html(responseText.SELLING_PRICE.toFixed(2));
			$("#modalproductdetails #add_info").html(responseText.ADD_INFORMATION);
			$("#modalproductdetails #mrp").html((responseText.MRP).toFixed(2));
			$("#modalproductdetails #discount").html((responseText.DISCOUNT).toFixed(2));
			$("#modalproductdetails #bv").html(responseText.BV);
			$("#modalproductdetails #prod_image").attr("src", "<%=request.getContextPath()%>/app<%=msProductImg%>/" + responseText.IMAGE_NAME + ".jpg")
			$("#modalproductdetails .addtocart").attr("product_code", ljsProductCode);
			$("#modalproductdetails .addtocart").attr("vendor_code", responseText.VENDOR_CODE);
			$("#modalproductdetails .addtocart").attr("selling_price", responseText.SELLING_PRICE.toFixed(2));
			$("#modalproductdetails").modal("show");
		}

	});

});

$(document).on('click', '#signoff', function() {
	$("#signoffapp").click();
});

$(document).on('change', '.order_qty', function() {
	$(this).attr("order_qty", $(this).val());
	$('#' + $(this).attr('attr_item_total')).html(
		(parseFloat($(this).val()) * parseFloat($(this).attr('selling_price'))).toFixed(2));
	addToCart($(this));
});

$(document).on('click', '.incqty', function() {
	$('#' + $(this).attr('attr_order_qty')).val(parseInt($('#' + $(this).attr('attr_order_qty')).val()) + 1);
	$(this).attr("order_qty", $('#' + $(this).attr('attr_order_qty')).val());
	$('#' + $(this).attr('attr_item_total')).html(
		(parseFloat($('#' + $(this).attr('attr_order_qty')).val()) * parseFloat($(this).attr('selling_price'))).toFixed(2));
	addToCart($(this));
});

$(document).on('click', '.decqty', function() {
	if (parseInt($('#' + $(this).attr('attr_order_qty')).val()) == 0) {
		return;
	}
	$('#' + $(this).attr('attr_order_qty')).val(parseInt($('#' + $(this).attr('attr_order_qty')).val()) - 1);
	$(this).attr("order_qty", $('#' + $(this).attr('attr_order_qty')).val());
	$('#' + $(this).attr('attr_item_total')).html(
		(parseFloat($('#' + $(this).attr('attr_order_qty')).val()) * parseFloat($(this).attr('selling_price'))).toFixed(2));
	addToCart($(this));
});

$(document).on('click', '.addtocart', function() {
	addToCart($(this));
});

function addToCart(data) {
	showProgress("Adding selected item to cart.");
	//alert(data.attr('order_qty'));
	if (data.attr('order_qty') != "0") {
		$('#' + data.attr('attr_addedtocart')).addClass("d-inline-block");
		$('#' + data.attr('attr_addedtocart')).removeClass("d-none");
	} else {
		$('#' + data.attr('attr_addedtocart')).removeClass("d-inline-block");
		$('#' + data.attr('attr_addedtocart')).addClass("d-none");
	}

	$.get('AddToCart', {
		requestData : JSON.stringify({
			product_code : data.attr('product_code'),
			vendor_code : data.attr('vendor_code'),
			order_qty : data.attr('order_qty'),
			selling_price : data.attr('selling_price')
		})
	}, function(responseText) {
		hideProgress();
		//alert(responseText);
		//alert(responseText.TOT_SELLING_PRICE);
		console.log(responseText);
		if (responseText.status == "success") {
			$('#modalproductdetails').modal("hide");
			$('.cartinfo').removeClass("d-none");
			$('.cartinfo').addClass("d-block");
			if (responseText.TOT_SELLING_PRICE != undefined) {
				$('.cartdiscount').html("Items: " + responseText.TOT_QTY);
				$('.cartamt').html("Subtotal( " + responseText.TOT_QTY + " Items): " + parseFloat(responseText.TOT_SELLING_PRICE).toFixed(2));
				$('.cartbv').html("BV: " + responseText.TOT_BV);
			}
		} else {
			$('#modalproductdetails').modal("hide");
			;
			$("#modalInformationError").html(responseText.error);
			$("#modalInformation").modal("show");
		}
	});
}


function submitCart() {
	showProgress("Processing order");
	var loPaymentMode = $('input[name=paymentmode]:checked').val();
	if (loPaymentMode == undefined) {
		$("#modalInformationError").html("Please select payment mode");
		$("#modalInformation").modal("show");
		return;
	}
	$.post('SubmitCart', {
		requestData : JSON.stringify({
			address : $('#address').val(),
			payment_mode : loPaymentMode,
			pin : $('#pin').val(),
			scheduled_delivery_time : $('#scheduled_delivery_time').val(),
			scheduled_delivery_date : $('#scheduled_delivery_date').val()
		})
	}, function(responseText) {
		hideProgress();
		if (responseText.status == "success") {
			if (loPaymentMode == "CH") {
				window.open('<%=request.getContextPath()%>/OrderDetail?were23wer=' + responseText.order_no_enc, '_self');
			} else {
				window.open('<%=request.getContextPath()%>/Checkout?method=get&order=' + responseText.order_no, '_self')
			}
		} else {
			$("#modalInformationError").html(responseText.errors);
			$("#modalInformation").modal("show");
		}
	});
}


$(document).on('click', '.updateorderstatus', function() {
	showProgress("Updating order status.");
	var loAttrStatus = $(this).attr("attr_status");
	$.get('UpdateOrderStatus', {
		requestData : JSON.stringify({
			customer_code : $(this).attr('customer_code'),
			order_no : $(this).attr('order_no'),
			status : $(this).attr('status')
		})
	}, function(responseText) {
		hideProgress();
		if (responseText.status == "success") {
			$("#modalInformationError").html(responseText.message);
			$("#modalInformation").modal("show");
			$("#" + loAttrStatus).html(responseText.order_status);
		//location.reload();
		} else {
			$("#modalInformationError").html(responseText.error);
			$("#modalInformation").modal("show");
		}

	});
});

$(document).on('click', '.location', function() {
	$("#modalLocation").modal("show");
});

$(document).on('click', '.searchproducts', function() {
	$("#modalProductSearch").modal("show");
});
$(document).on('click', '.home', function() {
	window.open('<%=request.getContextPath()%>/Home', '_self');
});
$(document).on('click', '.cartinfo', function() {
	window.open('<%=request.getContextPath()%>/ViewCart', '_self')
});

$(document).on('click', '.confirmorder', function() {
	var lsPaymentMode = $('input[name=paymentmode]:checked').val();
	var lsMsg;
	if (lsPaymentMode == "CH") {
		lsMsg = 'You have selected to pay by cash on delivery. Are you sure you want to confirm order?'
	} else {
		lsMsg = 'You have selected to pay online. You will be redirected to secure payment gateway to complete the payment. Are you sure you want to confirm order?'
	}
	ConfirmYesNo('Confirmation!!!', lsMsg, 'submitorder');
});
$(document).on('click', '.orderlist', function() {
	window.open('<%=request.getContextPath()%>/OrderList', '_self');
});

$(document).on('click', '#modalConfirmYesNo #btnYes', function() {
	$("#modalConfirmYesNo").modal("hide");
	$("#" + $(this).attr("action")).click();
});

$(document).on('click', '.sign-in', function() {
	window.open('<%=request.getContextPath()%>/SignIn', '_self');
});

$(document).on('click', '.sign-off', function() {
	window.open('<%=request.getContextPath()%>/ShopOnlineSignout', '_self');
});

$(document).on('click', '.comingsoon', function() {
	$("#comingsoon").modal("show");

});

$(document).on('change', '.product_cat', function() {
	$("#productsearchbasic").submit();
});

$(document).on('click', '.productlist', function() {
	$("#productsearchbasic").submit();
});


$(document).on('click', '.newcustomer', function() {
	window.open('<%=request.getContextPath()%>/AddCustomer', '_self');
});

$(document).on('click', '.resetpassword', function() {
	window.open('<%=request.getContextPath()%>/PageResetPassword', '_self');
});


$(document).on('keydown', '.lov', function(e) {
	var keyCode = e.keyCode || e.which;
	if (e.keyCode == 112) {
		e.preventDefault();
		$("#progresswindow").show();
		$('#SelectListTable').DataTable().clear().destroy();
		$("#ModalSelectList_modal-body #source").val($(this).attr('ref_name'))

		$.get('GetLOV', {
			requestData : JSON.stringify({
				"lov_type" : $(this).attr('lov')
			})
		}, function(response) {
			$("#SelectListBody").html(response);
			$('#ModalSelectList').modal("show");
			$('#SelectListTable').DataTable({
				dom : 'Bfrtip',
				buttons : [],
				"pageLength" : 10
			});
			//document.getElementById('SelectListBody').rows[0].cells[0].firstChild.focus();
			$('input[type=search]').focus();
			$('#ModalSelectList_modal-body #source').focus();
			$("#progresswindow").hide();
		});
	}
});

$(document).on('click', '#SelectListTable .selectvalue', function() {
	$('input[ref_name =' + $('#ModalSelectList_modal-body #source').val() + ']')
		.val($(this).attr('value'));
	$('#ModalSelectList').modal("hide");
	$('input[ref_name =' + $('#ModalSelectList_modal-body #source').val() + ']')
		.focus();
	var data_key = JSON.parse($(this).parent().parent().find("#lvl_datakey").html());

	$.each(data_key, function(key, val) {
		var newattr = document.createAttribute(key);
		newattr.value = val;
		document.getElementById($('#ModalSelectList_modal-body #source').val())
			.setAttributeNode(newattr);
	});

	$('input[ref_name =' + $('#ModalSelectList_modal-body #source').val() + ']')
	.change();

	$.each(data_key, function(key, val) {
		var newattr = document.createAttribute(key);
		newattr.value = "";
		document.getElementById($('#ModalSelectList_modal-body #source').val())
			.setAttributeNode(newattr);
	});


});

