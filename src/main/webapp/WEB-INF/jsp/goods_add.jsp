<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>添加商品</title>
	</head>
  
	<body>
		
		<!-- 添加商品的表单元素 -->
		<form 
		action="${pageContext.request.contextPath}/servlet?op=addGood"
		method="post" enctype="multipart/form-data">
			
			商品名称：<input type="text" name="name" /><br/>
			市场价：<input type="text" name="marketprice" /><br/>
			商城价：<input type="text" name="estoreprice" /><br/>
			商品分类：<select name="category">
				<option value="">--请选择--</option>
				<option value="数码">数码</option>
				<option value="衣服">衣服</option>
				<option value="书">书</option>
			</select><br/>
			库存数量：<input type="text" name="num" /><br/>
			<!-- 如果表单中存在文件域，此时表单的 enctype="multipart/form-data"-->
			商品图片：<input type="file" name="imgurl" /><br/>
			商品描述：<textarea rows="5" cols="60" name="description"></textarea><br/><br/>
			
			<input type="submit" value=" 提 交 " />
		</form>
		
	</body>
</html>
