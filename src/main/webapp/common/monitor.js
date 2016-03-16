$(function() {

	onloadurl();
	var main_one = echarts.init(document.getElementById('main_one'));
	var main_two = echarts.init(document.getElementById('main_two'));
	var main_three = echarts.init(document.getElementById('main_three'));
	one_option = {
		tooltip : {
			formatter : "{a} <br/>{b} : {c}%"
		},
		series : [ {
			title : {
				show : true,
				offsetCenter : [ 0, "95%" ],
			},
			pointer : {
				color : '#FF0000'
			},
			name : '监控指标',
			radius : [ 0, '95%' ],
			axisLine : { // 坐标轴线
				lineStyle : { // 属性lineStyle控制线条样式
					width : 20
				}
			},
			detail : {
				formatter : '{value}%'
			},
			type : 'gauge',
			data : [ {
				value : 50,
				name : 'JVM使用率'
			} ]
		} ]
	};
	two_option = {
		tooltip : {
			formatter : "{a} <br/>{b} : {c}%"
		},
		series : [ {
			name : '监控指标',
			type : 'gauge',
			startAngle : 180,
			endAngle : 0,
			center : [ '50%', '90%' ], // 默认全局居中
			radius : 180,
			axisLine : { // 坐标轴线
				lineStyle : { // 属性lineStyle控制线条样式
					width : 140
				}
			},
			axisTick : { // 坐标轴小标记
				splitNumber : 10, // 每份split细分多少段
				length : 12, // 属性length控制线长
			},
			axisLabel : { // 坐标轴文本标签，详见axis.axisLabel

				textStyle : { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					color : '#fff',
					fontSize : 15,
					fontWeight : 'bolder'
				}
			},

			pointer : {
				width : 10,
				length : '80%',
				color : 'rgba(255, 255, 255, 0.8)'
			},
			title : {
				show : true,
				offsetCenter : [ 0, 15 ], // x, y，单位px
			},
			detail : {
				show : true,
				backgroundColor : 'rgba(0,0,0,0)',
				borderWidth : 0,
				borderColor : '#ccc',
				offsetCenter : [ 0, -40 ], // x, y，单位px
				formatter : '{value}%',
				textStyle : { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					fontSize : 20
				}
			},
			data : [ {
				value : 50,
				name : 'cpu使用率'
			} ]
		} ]
	};

	main_one.setOption(one_option);
	main_two.setOption(two_option);
	
	one_option.series[0].data[0].name = '内存使用率';
	one_option.series[0].pointer.color = '#428bca'
	main_three.setOption(one_option);
	var axisData;
	clearInterval(timeTicket);
	var timeTicket = setInterval(function() {
		axisData = (new Date()).toLocaleTimeString().replace(/^\D*/, '');
		axisData = axisData.substr(axisData.indexOf(":") + 1);
		var jvm = [];
		var ram = [];
		var cpu = [];
		$.ajax({
			type : "POST",
			url : rootPath + '/sys/usage.shtml',
			async : false,
			dataType : 'json',
			success : function(json) {
				$("#td_jvmUsage").html(json.jvmUsage);
				$("#td_serverUsage").html(json.ramUsage);
				$("#td_cpuUsage").html(json.cpuUsage);

				jvm.push(json.jvmUsage);
				ram.push(json.ramUsage);
				cpu.push(json.cpuUsage);

				one_option.series[0].data[0].value = json.jvmUsage;
				one_option.series[0].data[0].name = 'JVM使用率';
				one_option.series[0].pointer.color = '#FF0000'
				main_one.setOption(one_option, true);

				two_option.series[0].data[0].value = json.cpuUsage;
				main_two.setOption(two_option, true);

				one_option.series[0].data[0].value = json.ramUsage;
				one_option.series[0].data[0].name = '内存使用率';
				one_option.series[0].pointer.color = '#428bca'
				main_three.setOption(one_option, true);
			}
		});
	}, 10000);

});