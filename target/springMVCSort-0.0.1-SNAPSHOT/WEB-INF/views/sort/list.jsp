<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<body>
	<div id="create">
		<input type="button" id="createUser" value="新增用户">
		<div id="createForm" style="display: none;">
			用户名:<input type="text" id="loginName" name="name"/><br>
			姓名:<input type="text" id="name" name="name"/><br>
			密码:<input type="password" id="password" name="password"/><br>
			<input type="button" id="createUserSubmit" value="确认">
		</div>
	</div>
	
	<div id="update" style="display: none;">
		<div>修改姓名</div>
		姓名:<input type="text" id="updateName" name="updateName"/><br>
		<input type="text" class="updateIndexId" name="updateIndexId" style="display: none;"/><br>
		<input type="button" id="updateUserSubmit" value="确认">
	</div>
	
	<div id="sort">
		<input type="button" id="idAsc" value="按照ID顺序">
		<input type="button" id="idDesc" value="按照ID倒序">
		<input type="button" id="nameAsc" value="按照NAME顺序">
		<input type="button" id="nameDesc" value="按照NAME倒序">
		<table id="list">
			<tr>
				<td>ID</td>
				<td>name</td>
				<td>login_name</td>
				<td>password(MD5)</td>
				<td>操作</td>
				<td style="display: none;">indexId</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript" src="<%=basePath%>/source/js/jquery-1.10.1.min.js"></script>
	<script type="text/javascript">
		jQuery(function(){
			$(document).ready(function(){
				listByCondition("idAsc");
			})
			
			$("#createUser").click(function(){
				$("#sort").hide();
				$("#createForm").show();
			})
			$("#createUserSubmit").click(function(){
				var loginName = $("#loginName").val();
				var name = $("#name").val();
				var password = $("#password").val();
				if(loginName == null || name == null || password == null){
					alert("姓名，用户名，密码不能为空");
				}else{
					$.ajax({
						type: "get",
						url: "<%=basePath%>v1/con/createUser",
						data:{"loginName":loginName,"name":name,"password":password},
						success: function(data) {
							console.log(data);
							if(data == 'true'){
								alert("添加成功");
								$("#sort").show();
								$("#createForm").hide();
								$("#loginName").val("");
								$("#name").val("");
								$("password").val("");
								listByCondition("idAsc");
							}else{
								alert("登录错误，请 重试")
							}
						},
					});
				}
			})
			
			$("#idAsc").click(function(){
				listByCondition("idAsc");
			})
			
			$("#idDesc").click(function(){
				listByCondition("idDesc");
			})
			
			$("#nameAsc").click(function(){
				listByCondition("nameAsc");
			})
			
			$("#nameDesc").click(function(){
				listByCondition("nameDesc");
			})
		})
		
		function listByCondition(str){
			var condition = "";
			if(str == null){
				condition = "idAsc"
			}else{
				condition = str;
			}
			$.ajax({
				type: "get",
				url: "<%=basePath%>v1/con/listByCondition",
				data:{"condition":condition},
				success: function(data) {
					console.log(data);
					$("#list").empty();
					var listResult = "<tr><td>ID</td><td>name</td><td>login_name</td><td>password(MD5)</td></tr>";
					for(var i=0;i<data.length;i++){
						listResult += "<tr>";
						listResult += "<td>" + data[i].id + "</td>";
						listResult += "<td>" + data[i].name + "</td>";
						listResult += "<td>" + data[i].loginname + "</td>";
						listResult += "<td>" + data[i].password + "</td>";
						//listResult += "<td>" + "<a href=''>修改</a> &nbsp &nbsp <a href='<%=basePath%>v1/con/deleteUser?indexId=" + i+"'>删除</a>"  + "</td>";
						listResult += "<td>" + "<input type='button' class='delete' value='删除'>     <input type='button' class='update' value='修改'>"  + "</td>";
						listResult += "<td class='indexId' style='display: none;'>" + i + "</td>";
						listResult += "</tr>";
					}
					$("#list").append(listResult);
					$(".delete").on('click',function(){
						var indexId = $(this).parent().next().text();
						$.ajax({
							type: "get",
							url: "<%=basePath%>v1/con/deleteUser",
							data:{"indexId":indexId},
							success: function(data) {
								console.log(data);
								if(data == 'true'){
									alert("删除成功");
									listByCondition("idAsc");
								}else{
									alert("删除错误，请 重试")
								}
							},
						});
					});
					
					$(".update").on('click',function(){
						$("#update").show();
						$("#sort").hide();
						$("#create").hide();
						$(".updateIndexId").val($(this).parent().next().text());
					})
					
					$("#updateUserSubmit").click(function(){
						var indexId = $(".updateIndexId").val();
						var name = $("#updateName").val();
						if(name == null){
							alert("姓名不能为空");
						}else{
							$.ajax({
								type: "get",
								url: "<%=basePath%>v1/con/updateUser",
								data:{"indexId":indexId, "name": name},
								success: function(data) {
									console.log(data);
									if(data == 'true'){
										alert("修改成功");
										$("#updateName").val("");
										$("#update").hide();
										$("#sort").show();
										$("#create").show();
										listByCondition("idAsc");
									}else{
										alert("修改失败，请 重试")
									}
								},
							});
						}
						
					})
				},
				error: function() {
					alert("错误");
				}
			});
		}
	</script>
</body>
</html>
