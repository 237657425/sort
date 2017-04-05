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
	<form id="searchForm">
		状态：
		<select id="status">
			<option value="">请选择</option>
			<option value="1">激活</option>
			<option value="0">未激活</option>
		</select>
		区域ID:<input type="text" id="regionId" name="regionId"/>
		区域:<input type="text" id="region" name="region"/>
		<a class="btn" href="javascript:void(0);" onclick="RegoinPrice.loadGrid()">搜索</a>
	</form>
	<div id="regoin-price"></div>
	<div id="pg" style="text-align: right;"></div>
	<script type="text/javascript" src="<%=basePath%>/source/js/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/source/js/mmGrid/mmGrid.js"></script>
	<script type="text/javascript" src="<%=basePath%>/source/js/mmGrid/json2.js"></script>
	<script type="text/javascript" src="<%=basePath%>/source/js/mmGrid/mmPaginator.js"></script>
	<script type="text/javascript" src="<%=basePath%>/source/js/mmGrid/plugins.js"></script>
	<script type="text/javascript" src="<%=basePath%>/source/js/regoinPrice/regoinPrice.js"></script>
	<script type="text/javascript">
		jQuery(function(){
			var basePath = "<%=basePath%>";
			$(document).ready(function() {    
				RegoinPrice.init();
	        });
			
		})
	</script>
</body>
</html>
