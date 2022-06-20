$(window).on("load", function() {
	
			<%if (AlertUtils.hasAppSuccess(session)) {%>
			$('#modalInformation').modal("show");
				$('#d-blockerrors').css('display', 'none');
				$('#d-blockinfo').css('display', 'none');
				$('#d-blocksuccess').css('display', 'block');
			<%} else if (AlertUtils.hasAppInfo(session)) {%>
			$('#modalInformation').modal("show");
				$('#d-blockerrors').css('display', 'none');
				$('#d-blockinfo').css('display', 'block');
				$('#d-blocksuccess').css('display', 'none');
			<%} else if (AlertUtils.hasAppErrors(session)) {%>
			$('#modalInformation').modal("show");
				$('#d-blockerrors').css('display', 'block');
				$('#d-blockinfo').css('display', 'none');
				$('#d-blocksuccess').css('display', 'none');
			<%} else {%>
			$('#d-blockerrors').css('display', 'none');
				$('#d-blockinfo').css('display', 'none');
				$('#d-blocksuccess').css('display', 'none');
			<%}%>
		$('[data-toggle="tooltip"]').tooltip();  
		
		setMaskFix();
	
		
});

	