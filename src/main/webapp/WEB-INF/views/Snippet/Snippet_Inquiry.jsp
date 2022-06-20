
		<div class="text-primary text-center">
			<h5>We would love to hear from you !</h5>
		</div>
		<form id="submitinquiry" class="form p-1">
			<div class="form-group form-group-sm">
				<label>Name</label> 
				<input type="text" class="form-control"
					id="first_name" name="first_name" value="" /> 
					<label>Email</label> 
					<input
					type="text" class="form-control " id="email_id" name="email_id" value="" />
				<label>Phone Number</label> 
				<input type="text" class="form-control "
					id="phone_no" name="phone_no" value="" /> <label>Comments</label>
				<textarea class="form-control" placeholder="" rows="4" id="comment" name="comment"></textarea>
			</div>
			<div class="text-center">
				<a class="btn btn-info inquiry">Submit</a>
			</div>

			<input type="hidden" class="form-control " id="sender_email"
				name="sender_email"
				value="<%=ReferenceUtils.getCnfigParamValue(session, "EMAIL_SENDER")%>" />
			<input type="hidden" class="form-control " id="sender_key"
				name="sender_key"
				value="<%=ReferenceUtils.getCnfigParamValue(session, "EMAIL_SENDER_KEY")%>" />
			<input type="hidden" class="form-control " id="receiver_email"
				name="receiver_email"
				value="<%=ReferenceUtils.getCnfigParamValue(session, "EMAIL_RECEIVER")%>" />


		</form>
	