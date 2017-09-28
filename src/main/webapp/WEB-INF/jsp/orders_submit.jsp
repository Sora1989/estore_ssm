<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="Generator" content="ECSHOP v2.7.3" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<title>提交订单</title>
<%@include file="inc/common_head.jsp"%>
</head>

<body>
	<%@include file="inc/header.jsp"%>
	<div class="block clearfix"><div class="AreaR">
	<div class="block box"><div class="blank"></div>
		<div id="ur_here">
			当前位置: <a href="index.jsp">首页</a><code>&gt;</code>购物流程
		</div>
	</div><div class="blank"></div><div class="box"><div class="box_1">
	<div class="userCenterBox boxCenterList clearfix" style="_height:1%;">
	<form action="${root}/servlet?op=submitOrder" method="post">
		<!---------收货人信息开始---------->
		<h5><span>收货人信息</span></h5>
		<table width="100%" align="center" border="0" cellpadding="5"
			cellspacing="1" bgcolor="#dddddd">
			<tr>
				<td bgcolor="#ffffff" align="right" width="120px">区域信息：</td>
				<td bgcolor="#ffffff">
					<!-- 省 -->
					<select id="province" onchange="loadCity(value);ppp.value=options[selectedIndex].innerHTML;">
						<option value="">-- 请选择省 --</option>
					</select>&nbsp;&nbsp;&nbsp;
					<!-- 市 -->
					<select id="city" onchange="loadDis(value);ccc.value=options[selectedIndex].innerHTML;">
						<option value="">-- 请选择市 --</option>
					</select>&nbsp;&nbsp;&nbsp;
					<!-- 县(区) -->
					<select id="district" onchange="ddd.value=options[selectedIndex].innerHTML;">
						<option value="">-- 请选择县(区) --</option>
					</select>
					
					<!-- 添加隐藏域，用来记录当前选中的区域的中文信息 -->
					<input type="hidden" name="ppp" id="ppp" />
					<input type="hidden" name="ccc" id="ccc" />
					<input type="hidden" name="ddd" id="ddd" />
				</td>
			</tr>
			<tr>
				<td bgcolor="#ffffff" align="right">详细地址：</td>
				<td bgcolor="#ffffff">
					<input style="width:347px;" id="detailAddress" name="detailAddress" />
				</td>
			</tr>
			<tr>
				<td bgcolor="#ffffff" align="right">邮政编码：</td>
				<td bgcolor="#ffffff"><input id="zipcode" name="zipcode"/></td>
			</tr>
			<tr>
				<td bgcolor="#ffffff" align="right">收货人姓名：</td>
				<td bgcolor="#ffffff"><input id="name" name="name" /></td>
			</tr>
			<tr>
				<td bgcolor="#ffffff" align="right">联系电话：</td>
				<td bgcolor="#ffffff"><input id="tel" name="tel" /></td>
			</tr>
		</table>
		<!---------收货人信息结束---------->
		
		<!----------商品列表开始----------->
		<div class="blank"></div>
		<h5><span>商品列表</span></h5>
		<table width="100%" border="0" cellpadding="5" cellspacing="1"
			bgcolor="#dddddd">
			<tr>
				<th width="30%" align="center">商品名称</th>
				<th width="22%" align="center">市场价格</th>
				<th width="22%" align="center">商品价格</th>
				<th width="15%" align="center">购买数量</th>
				<th align="center">小计</th>
			</tr>
			<c:set var="total" value="0" />
			<c:forEach items="${ cList }" var="c">
				<c:set var="total" value="${ total + c.good.estoreprice * c.buynum }" />
				<tr>
					<td>
						<a href="javascript:;" class="f6">${ c.good.name }</a>
					</td>
					<td>${ c.good.marketprice }元</td>
					<td>${ c.good.estoreprice }元</td>
					<td align="center">${ c.buynum }</td>
					<td>${ c.good.estoreprice * c.buynum  }元</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" style="text-align:right;padding-right:10px;font-size:25px;">
					商品总价&nbsp;<font color="red">&yen;${ total }</font>元
					<input type="submit" value="提交订单" class="btn" />
				</td>
			</tr>
		</table>
		<!----------商品列表结束----------->
	</form>
	</div></div></div></div></div>
	<%@include file="inc/footer.jsp"%>
</body>
</html>
<script type="text/javascript">
// 发送ajax请求，获取所有的省份信息
// 获取XMLHttpRequest对象
function getXMLHttpRequest() {
	var xmlhttp;
	// code for IE7+, Firefox, Chrome, Opera, Safari
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	}
	// code for IE6, IE5
	else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xmlhttp;
}

function load(pid, target) {
	if (!pid)return; // 如果没有值，直接返回
	// 1. 获取XMLHttpRequest对象
	var xmlhttp = getXMLHttpRequest();
	// 2. 监听服务器返回状态
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			// 获取后台返回的结果
			var result = xmlhttp.responseText;
			// 根据结果进行相应的处理
			// 将字符串装换成JS对象
			result = eval("(" + result + ")");
			for(var i = 0; i < result.length; i++) {
				// 创建option节点
				var option = document.createElement("option");
				option.setAttribute("value", result[i].id);
				option.innerHTML = result[i].name;
				target.appendChild(option);
			}
		}
	}
	// 3. 打开连接
	xmlhttp.open("POST", "${root}/servlet?op=load", true);
	// 使用表单的方式 POST 数据
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	// 4. 发送请求
	xmlhttp.send("pid=" + pid);
}
load("0", document.getElementById("province")); // 推荐!!
//load("0", province); // 如果确定浏览器的较新版本,可以直接使用标签的ID来获取标签

function loadCity(pid) {
	// 清空市和县的下拉选项
	city.length = 1;
	district.length = 1;
	load(pid, city);
}
function loadDis(pid) {
	// 清空县下拉选项
	district.length = 1;
	load(pid, district);
}

</script>
