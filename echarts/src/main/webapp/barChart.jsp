<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>echarts-java</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
	<div>
		<div id="barChart" style="width: 400px; height: 400px"></div>
	</div>
	<script type="text/javascript" src="echarts/echarts.js"></script>
	<script type="text/javascript">
		var barChar = echarts.init(document.getElementById('barChart'));
		function loadChart() {
			barChar.clear();
			barChar.showLoading({
				text : "正在努力加载中....."
			});
			$.getJSON("echarts/barChart.do", function(data) {
				alert(data.data);
				for(var i = 0;i<data.data.length;i++)
					{
					alert(data.data);
					}
				if (data != null) {
					barChar.setOption($.parseJSON(data.data), true);
					barChar.hideLoading();
				} else {
					alert('提示', data.msg);
				}
			});
		}
		loadChart(); 
		 // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('barChart'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '图'
            },
            tooltip: {},
            legend: {
                data:['销量']
            },
            xAxis: {
                data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: [5, 20, 36, 10, 10, 20]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option); 
	</script>
</body>
</html>
