<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<body>
	<h2>Hello World!</h2>
	<a href="http://localhost:8680/okweb" target="_blank">ok</a>
	
	<div id="btn">aaa</div>
	<script type="text/javascript" src="<%=basePath%>/source/js/jquery-1.10.1.min.js"></script>
	<script type="text/javascript">
		
	jQuery(function(){
		
		var flag = true;
		$("#btn").click(function(){
			if(flag){
				alert("123");
				flag=false;
				$.ajax({
					url: "<%=basePath%>v1/con/getDDAccessToken",
					type: 'get',
					dataType: 'json',
					success: function(data) {
						if(data){
							flag = true;
							alert("asdf");
						}
					}
				});
			}
		})
	})
	</script>
</body>
</html>
