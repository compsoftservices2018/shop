<%@ include file="imports.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" />

<script>


</script>


<%
MstCustomer loCustomerUI = null; 
MstCustomer loCustomerType = null; 
BigDecimal loTotalQty = null;
BigDecimal loTotalAmount = null;
BigDecimal loTotalDiscAmount = null;
BigDecimal loTotalBillAmount = null;
BigDecimal loTotalProductCount = null;
BigDecimal loTotalLandingCost = null;
BigDecimal loTotalBv = null;
String msDownloads = null;
String msProductImg = null;
String msReport = null;
String msExternalReport = null;
String msImg =  null;
MstCompany loCompanyUI =  null;

String msLocationUI="";
String msCustNameUI="";
String msWelcomeMsgUI="";

	

if (session.getAttribute("CUSTOMER_LOCATION") != null 
&& !AppUtils.isValueEmpty((String)session.getAttribute("CUSTOMER_LOCATION")))
{
	msLocationUI = (String)session.getAttribute("CUSTOMER_LOCATION");
}

if (session.getAttribute("LOGGEDINCUSTOMER") != null) {
	loCustomerUI = (MstCustomer) session.getAttribute("LOGGEDINCUSTOMER");
	if (!loCustomerUI.getCustomer_type().equals("A"))
	{
		msLocationUI = loCustomerUI.getPin();
		msCustNameUI = loCustomerUI.getCustomer_name();
		msWelcomeMsgUI =  "Welcome!!!";
	}
}



 msDownloads = ReferenceUtils.getCnfigParamValue(session, "RELATIVEPATH_DOWNLOADS");
 msProductImg = ReferenceUtils.getCnfigParamValue(session, "RELATIVEPATH_PRODUCT_IMG");
 msReport = ReferenceUtils.getCnfigParamValue(session, "RELATIVEPATH_REPORT_OUTPUT");
 msExternalReport = ReferenceUtils.getCnfigParamValue(session, "RELATIVEPATH_EXTERNAL_REPORT_OUTPUT");
 
 msImg = ReferenceUtils.getCnfigParamValue(session, "RELATIVEPATH_IMG");
 loCompanyUI = (MstCompany) session.getAttribute("COMPANYOBJ");

	
	Map<String, Object> loCustCart = (Map<String, Object>) session.getAttribute("CART_SUMMARY");
	if (loCustCart != null) {
		loTotalQty = ((BigDecimal) loCustCart.get("TOT_QTY"));
		loTotalAmount = ((BigDecimal) loCustCart.get("TOT_MRP")).setScale(2);
		loTotalDiscAmount = ((BigDecimal) loCustCart.get("TOT_DISCOUNT")).setScale(2);
		loTotalBillAmount = ((BigDecimal) loCustCart.get("TOT_SELLING_PRICE")).setScale(2);
		loTotalProductCount = ((BigDecimal) loCustCart.get("TOT_PRODUCTS"));
		loTotalLandingCost = ((BigDecimal) loCustCart.get("TOT_LANDING_COST"));
		loTotalBv = ((BigDecimal) loCustCart.get("TOT_BV"));
	}


%>
<%@ include file="libraries.jsp"%>

<%@ include file="modals.jsp"%>
<%@ include file="NavBar.jsp"%>

</head>

