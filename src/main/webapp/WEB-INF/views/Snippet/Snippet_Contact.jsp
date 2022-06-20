
<div class="col-sm-12 p-1 text-center font-sm mb-1"
	style="padding-bottom: 10px;">
	<a  style="color:#ffffff;text-decoration: underline;" data-toggle="collapse" href="#contactus">Contact Us</a>
</div>
<div class="col-md-12 p-1 panel-collapse collapse" 
	id="contactus">
	<div class="text-center" style="border: 1px solid #ccc;">
		<p class="font-reg">
			<span style="color:#ffffff">Phone: </span> <a style="color:#ffffff;"
				href="tel: <%=loCompanyUI != null ? loCompanyUI.getMobile() : ""%>"><%=loCompanyUI != null ? loCompanyUI.getMobile() : ""%></a>
		</p>
		<p class="font-reg">
			<span style="color:#ffffff">Email: </span> <a style="color:#ffffff;"
				href="mailto: <%=loCompanyUI != null ? loCompanyUI.getEmail() : ""%>"><%=loCompanyUI != null ? loCompanyUI.getEmail() : ""%></a>
		</p>
		<p class="font-reg">
			<span style="color:#ffffff">Address: </span> <span style="color:#ffffff;"> <%=loCompanyUI != null ? loCompanyUI.getAddress() : ""%>
			</span>
		</p>
	</div>
</div>

