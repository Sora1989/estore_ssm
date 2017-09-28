<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'liandong.jsp' starting page</title>
		<script type="text/javascript" src="source/province.js"></script>
		<script type="text/javascript" src="source/city.js"></script>
		<script type="text/javascript" src="source/district.js"></script>
		<script type="text/javascript">
		//alert(JSON.stringify(province));
		function regisEvent(fn) {
			// 获取之前的页面加载完成事件
			var oldload = window.onload;
			if (oldload) {
				window.onload = function() {
					oldload();
					fn();
				};
			} else {
				window.onload = function() {
					fn();
				};
			}
		}
		
		// 在原来的事件的基础上加上自己的事件：加载所有的省份信息
		regisEvent(function() {
			// 获取省份下拉框
			var pp = document.getElementById("province");
			// 获取城市下拉框
			var cc = document.getElementById("city");
			// 获取县下拉框
			var dd = document.getElementById("district");
			
			for (var i = 0; i < province.length; i++) {
				// 创建option节点
				var option = document.createElement("option");
				option.setAttribute("value", province[i].id);
				option.innerHTML = province[i].name;
				pp.appendChild(option);
			}
			
			// 给省份下拉框绑定change事件
			pp.onchange = function() {
				var pid = this.value; // 获取当前选中的省份的值
				// 根据pid去city对象中找所有城市信息
				for (var i = 0; i < city.length; i++) {
					var c = city[i];
					// 判断当前城市是否是该省下的城市
					if (c.pid == pid) {
						// 创建option节点
						var option = document.createElement("option");
						option.setAttribute("value", c.id);
						option.innerHTML = c.name;
						cc.appendChild(option);
					}
				}
			}
			
			// 绑定城市的change事件
			cc.onchange = function() {
				var pid = this.value;
				// 根据pid去district对象中找所有县（区）信息
				for (var i = 0; i < district.length; i++) {
					var d = district[i];
					// 判断当前城市是否是该省下的城市
					if (d.pid == pid) {
						// 创建option节点
						var option = document.createElement("option");
						option.setAttribute("value", d.id);
						option.innerHTML = d.name;
						dd.appendChild(option);
					}
				}
			}
		});
		</script>
	</head>
  
	<body>
		<!-- 省 -->
		<select id="province">
			<option value="">-- 请选择省 --</option>
		</select>&nbsp;&nbsp;&nbsp;
		<!-- 市 -->
		<select id="city">
			<option value="">-- 请选择市 --</option>
		</select>&nbsp;&nbsp;&nbsp;
		<!-- 县(区) -->
		<select id="district">
			<option value="">-- 请选择县(区) --</option>
		</select>
	</body>
</html>
