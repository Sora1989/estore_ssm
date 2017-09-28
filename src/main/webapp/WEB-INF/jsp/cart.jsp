<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的购物车</title>
<%@include file="inc/common_head.jsp"%>
<script type="text/javascript">
	function changeNum(gid, buynum) {
		location.href = "${root}/servlet?op=changeNum&gid="+gid+"&buynum="+buynum;
	}
</script>
</head>
<body>
	<%@include file="inc/header.jsp"%>
	<div class="block table">
		<div class="AreaR">
			<div class="block box">
				<div class="blank"></div>
				<div id="ur_here">
					当前位置: <a href="index.jsp">首页</a><code>&gt;</code>我的购物车
				</div>
			</div>
			<div class="blank"></div>
			<div class="box">
				<div class="box_1">
					<div class="userCenterBox boxCenterList clearfix"
						style="_height:1%;">
						<h5><span>我的购物车</span></h5>
						<c:if test="${ empty cList }">
							<a href="${root}/servlet?op=goodsList">去逛逛</a>
						</c:if>
						<c:if test="${ not empty cList }">
						<table width="100%" align="center" border="0" cellpadding="5"
							cellspacing="1" bgcolor="#dddddd">
							<tr>
								<th bgcolor="#ffffff">商品名称</th>
								<th bgcolor="#ffffff">市场价</th>
								<th bgcolor="#ffffff">本店价</th>
								<th bgcolor="#ffffff">购买数量</th>
								<th bgcolor="#ffffff">小计</th>
								<th bgcolor="#ffffff" width="160px">操作</th>
							</tr>
							<c:set var="totalprice" value="0" />
							<c:set var="json" value="0" />
							<c:forEach items="${cList }" var="c">
								<!-- 对总价和节省的金额进行累加计算 -->
								<c:set var="totalprice" value="${ totalprice + c.good.estoreprice * c.buynum }" />
								<c:set var="json" value="${ json + (c.good.marketprice - c.good.estoreprice) * c.buynum }" />
								
								<tr>
									<td bgcolor="#ffffff" align="center" style="width:300px;">
										<!-- 商品图片 -->
										<a href="javascript:;" target="_blank">
											<img style="width:80px; height:80px;"
											src="${root}${c.good.imgurl}"
											border="0" title="${c.good.name}" />
										</a><br />
										<!-- 商品名称 -->
										<a href="javascript:;" target="_blank" class="f6">${c.good.name}</a>
									</td>
									<td align="center" bgcolor="#ffffff">${c.good.marketprice }元</td>
									<td align="center" bgcolor="#ffffff">${c.good.estoreprice }元</td>
									<td align="center" bgcolor="#ffffff">
										<input value="${c.buynum }" onchange="changeNum(${c.gid}, value);" size="4" class="inputBg" style="text-align:center;" />
									</td>
									<td align="center" bgcolor="#ffffff">${ c.good.estoreprice * c.buynum }元</td>
									<td align="center" bgcolor="#ffffff">
										<a href="javascript:if (confirm('手贱？')){location='${root}/servlet?op=deleteCart&gid=${c.gid}';}" class="f6">删除</a>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="6" style="text-align:right;padding-right:10px;font-size:25px;">
									购物金额总计&nbsp;<font color="red">${ totalprice }</font>元，
									共为您节省了&nbsp;<font color="red">${ json }</font>元
									<a href="servlet?op=toSubmitOrder"><input value="去结算" type="button" class="btn" /></a>
								</td>
							</tr>
						</table>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="blank"></div>
		<div class="blank5"></div>
	</div>
	<%@include file="inc/footer.jsp"%>
</body>
</html>
