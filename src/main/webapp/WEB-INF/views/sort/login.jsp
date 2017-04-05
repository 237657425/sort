<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<body>
	<h2>Hello World!</h2>
	用户名:<input type="text" id="name" name="name"/>
	密码:<input type="password" id="password" name="password"/>
	<input type="button" id="submit" value="登录">
	<script type="text/javascript" src="<%=basePath%>/source/js/jquery-1.10.1.min.js"></script>
	<script type="text/javascript">
		jQuery(function(){
			var basePath = "<%=basePath%>";
			var name = $("#name").val();
			var password = $("password").val();
			$("#submit").click(function() {    
				$.ajax({
					type: "get",
					url: "<%=basePath%>v1/con/createUser",
					data:{"name":name,"password":password},
					success: function(data) {
						console.log(data);
						if(data == 'true'){
							alert("登录成功，跳转排序页")
							window.location.href = "<%=basePath%>v1/con/list_page";
						}else{
							alert("登录错误，请 重试")
						}
					},
					error: function() {
						alert("12");
					}
				});
	        });
			
		})
	</script>
</body>
</html>
