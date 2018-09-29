<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/vue.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/vue-resource.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
  </head>
  
 <body>
	<div id="app" class="container">
		<h2 class="title">购物车</h2>
		<table class="tab" width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th colspan="2">商品信息</th>
					<th style="width: 14%;">商品金额</th>
					<th style="width: 14%;">商品数量</th>
					<th style="width: 14%;">总金额</th>
					<th>编辑</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="item in productList">
					<td style="width: 5%;"><input type="checkbox" :checked="item.check" @click="checkBox(item)"/></td>
					<td class="goods">
						<img :src="item.productImage" class="goods-left"/>
						<div class="goods-right">
							<p>{{item.productName}}</p>
							<p class="tip">赠送：<span style="margin-right: 5px;" v-for="part in item.parts" v-text="part.partsName"></span></p>
						</div>
					</td>
					<td>{{item.productPrice | formatMoney}}</td>
					<td class="num">
						<a href="javascript:;" @click="changeMoney(item,-1)">-</a>&nbsp;&nbsp;
						<input type="text" v-model="item.productQuentity" disabled />&nbsp;&nbsp;
						<a href="javascript:;" @click="changeMoney(item,1)">+</a>
					</td>
					<td class="redcolor">{{item.productPrice*item.productQuentity | formatMoney}}</td>
					<td class="del" @click="del(item);">删除</td>
				</tr>
			</tbody>
			<tfoot>
				<tr class="footer">
					<td><input type="checkbox" :checked="checkAllFlag" @click="checkAll"/></td>
					<td>
						<span class="redcolor">全选</span>&nbsp;&nbsp;
					</td>
					<td colspan="4">
						总计：<span>{{totalMoney | formatMoney}}</span>元
						<button type="button" class="btn">结账</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	
</body>
</html>
</html>
