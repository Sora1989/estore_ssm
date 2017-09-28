<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的订单</title>
<%@include file="inc/common_head.jsp"%>
</head>
<body>
	<%@include file="inc/header.jsp"%>
	<div class="block clearfix">
		<div class="AreaR">
			<div class="block box">
				<div class="blank"></div>
				<div id="ur_here">
					当前位置: <a href="index.jsp">首页</a><code>&gt;</code>我的订单
				</div>
			</div>
			<div class="blank"></div>
			<div class="box">
				<div class="box_1">
					<div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
						<h5><span>我的订单</span></h5>
						<table width="100%" border="0" cellpadding="5" cellspacing="1"
							bgcolor="#dddddd">
							<tr align="center">
								<td bgcolor="#ffffff">订单号</td>
								<td bgcolor="#ffffff" width="200px">下单时间</td>
								<td bgcolor="#ffffff">订单总金额</td>
								<td bgcolor="#ffffff">订单状态</td>
								<td bgcolor="#ffffff" width="200px">操作</td>
							</tr>
							<c:forEach items="${ oList }" var="o">
								<tr>
									<td align="center" bgcolor="#ffffff">
										<a href="servlet?op=detailOrder&id=${o.id }" class="f6">${ o.id }</a>
									</td>
									<td align="center" bgcolor="#ffffff">${ o.createtime }</td>
									<td align="right" bgcolor="#ffffff">${ o.totalprice }元</td>
									<td align="center" bgcolor="#ffffff">
										<c:choose>
											<c:when test="${ o.status == 1 }">
												<font color="red">未支付</font>
											</c:when>
											<c:when test="${ o.status == 2 }">
												<font color="green">已支付</font>
											</c:when>
											<c:otherwise>
												<font color="grey">已过期</font>
											</c:otherwise>
										</c:choose>
									</td>
									<td align="center" bgcolor="#ffffff">
										<c:if test="${ o.status == 1 }">
											<a href="servlet?op=detailOrder&id=${o.id}">在线支付</a>&nbsp;
										</c:if>
										<a href="javascript:if( confirm('是否确认删除？') )location='servlet?op=delOrder&oid=${o.id}';">取消订单(物理删除)</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="inc/footer.jsp"%>
</body>
</html>