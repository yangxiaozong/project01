<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/mui.min.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.min.js"></script>
<script src="js/mui.min.js"></script>
<script src="js/test2.js"></script>
<title>测试</title>
</head>
<body>
	<!--下拉刷新容器-->
	<div id="pullrefresh" class="mui-content mui-scroll-wrapper">
		<div class="mui-scroll">
			<!--数据列表-->
			<ul class="mui-table-view mui-table-view-chevron" id="ul_id" >
					<!-- <li style="font-size: 50px; margin-top: 20px;">测试</li> -->
			</ul>
		</div>
	</div>
</body>
<script type="text/javascript">
	mui.init({
		pullRefresh : {
			container : '#pullrefresh',
			down : {
				 contentdown : "下拉可以刷新",//可选，在下拉可刷新状态时，下拉刷新控件上显示的标题内容
			     contentover : "释放立即刷新",//可选，在释放可刷新状态时，下拉刷新控件上显示的标题内容
			     contentrefresh : "正在刷新...",//可选，正在刷新状态时，下拉刷新控件上显示的标题内容
				 callback : pulldownRefresh
			},
			up : {
				contentrefresh : "正在加载...",//可选，正在加载状态时，上拉加载控件上显示的标题内容
				contentnomore : '没有更多数据了',//可选，请求完毕若没有更多数据时显示的提醒内容；
				callback : pullupRefresh
			}
		}
	});
	function pulldownRefresh(){
	//	alert('下拉');
		mui('#pullrefresh').pullRefresh().refresh(true);
		setTimeout(function() {
			$("#ul_id").html("");
			test.pageNum = 1;
			testFun1();
			mui('#pullrefresh').pullRefresh().endPulldownToRefresh(); //refresh completed		
		},300);
		

	}
	function pullupRefresh(){
		setTimeout(function() {			
			testFun();
		},200); 
	}
	
 	 if (mui.os.plus) {
		mui.plusReady(function() {
			setTimeout(function() {
				mui('#pullrefresh').pullRefresh().pullupLoading();
			}, 1000);

		});
	} else {
		mui.ready(function() {
			alert('ready');
			mui('#pullrefresh').pullRefresh().pullupLoading();
		});
	}  
</script>
</html>