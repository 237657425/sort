<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<link rel="stylesheet" href="<%=basePath%>/source/css/mmGrid/mmGrid.css">
<link rel="stylesheet" href="<%=basePath%>/source/css/mmGrid/mmGrid-bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>/source/css/mmGrid/mmPaginator.css">
<body>
	<h2>Hello World!</h2>
	<form id="searchForm" class="form-horizontal">
		<input type="text" id="id" value="${directPurchaseRegionPrice.id}" hidden="hidden">
		区域ID:<input type="text" id="regionId" name="regionId" value="${directPurchaseRegionPrice.regionId}" readonly="readonly"/><br>
		区域:<input type="text" id="region" name="region" value="${directPurchaseRegionPrice.region}" readonly="readonly"/><br>
		班级id:<input type="text" id="classId" name="classId" value="${directPurchaseRegionPrice.classId}" readonly="readonly"/><br>
		班级类型:<input type="text" id="classType" name="classType" value="${directPurchaseRegionPrice.classType}" readonly="readonly"/><br>
		班级名称:<input type="text" id="className" name="className" value="${directPurchaseRegionPrice.className}" readonly="readonly"/><br>
		区域价格:<input type="text" id="regionPrice" name="regionPrice" value="${directPurchaseRegionPrice.regionPrice}"/></br>
		45岁以上价格:<input type="text" id="agePrice" name="agePrice" value="${directPurchaseRegionPrice.agePrice}"/><br>
		状态:<input type="text" id="status" name="status" value="" readonly="readonly"/><br>
		<input type="button" id="submit" value="提交"/>
		
	</form>
	<script type="text/javascript" src="<%=basePath%>/source/js/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/source/js/regoinPrice/regoinPrice.js"></script>
	<script type="text/javascript">
		jQuery(function(){
			$(document).ready(function(){
				var status = "${directPurchaseRegionPrice.status}";
				if(status=="0"){
					$("#status").attr("value","未激活");
				}else{
					$("#status").attr("value","已激活");
				}
			});
			$("#submit").click(function(){
				var id = $("#id").val();
				var regionPrice = $("#regionPrice").val();
				var agePrice = $("#agePrice").val();
				if(agePrice != null && agePrice>0 && regionPrice!=null && regionPrice>0){
					if(confirm("确定要提交吗")){
						$.ajax({
							url: "update",
							type: 'get',
							data:{'id' : id, 
								'regionPrice' : regionPrice,
								'agePrice': agePrice},
							success: function(data) {
								if(data=="success"){
									alert("修改成功")
									history.back();
								}else{
									alert("修改失败");
								}
								
							}
						});
					}
				}else{
					alert("区域价格和45岁以上价格不能为空");
				}
			})
		})
	</script>
</body>
</html>
