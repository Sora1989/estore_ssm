<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>管理员查看商品</title>
		<style type="text/css">
			/** ID选择器 */
			#mytable {
				
			}
			/** 标签选择器 */
			table {
				border: 1px solid black;
				border-collapse: collapse;
				width: 90%;
			}
			
			td,th {
				border:1px solid black;
				padding: 3px;
			}
			/*奇数行*/
			.odd {
				background-color: yellow;
			}
			
			/*偶数行*/
			.even {
				background-color: #f1f1f1;
			}
			
			th {
				background-color:orange;
			}
			
			/** 类选择器 */
			.myclass {
				
			}
		</style>
	</head>
  
	<body>
		<!-- 
			align="center"  	align：对其方式
			class="mytable"		引用在css中定义的类样式
			
			cellpadding="0"		单元格中的内容的于单元格边框之间的间距
			cellspacing="0"		单元格与单元格之间的间距
			上面两句话相当于在css中定义 border-collapse: collapse;
		 -->
		<table align="center" class="mytable" id="mytable" cellpadding="0" cellspacing="0">
			<tr>
				<th width="100px">商品名称</th>
				<th width="80px">市场价</th>
				<th width="80px">优惠价</th>
				<th width="80px">分类</th>
				<th width="80px">库存数量</th>
				<th>描述</th>
				<th width="100px">操作</th>
			</tr>
			<c:forEach items="${ gList }" var="g" varStatus="sta">
				<tr class="${ sta.count % 2 == 0 ? 'even' : 'odd' }">
					<td>${ g.name }</td>
					<td>${ g.marketprice }</td>
					<td>${ g.estoreprice }</td>
					<td>${ g.category }</td>
					<td>${ g.num }</td>
					<td>
						<!-- 如果描述信息超过20个字符，只显示20个字符，剩下的字符用......来表示 -->
						<c:if test="${ fn:length(g.description) > 20 }">
							${ fn:substring(g.description, 0, 20) }......
						</c:if>
						<c:if test="${ fn:length(g.description) <= 20 }">
							${ g.description }
						</c:if>
					</td>
					<td>
						<a href="#">删除</a>
						<a href="#">编辑</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>
