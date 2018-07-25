window.onload = function(){
	myPieChart();	
	roomCountArr();
	lineChartDate();
//	conferenceCetter();
//	personalCallGetter;
};
	Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif', Chart.defaults.global.defaultFontColor = "#292b2c";
	
	/**선그래프*/
	var lineCtx = document.getElementById("myAreaChart").getContext('2d');
	
	/*일일 통화량 x축 값 받는 함수*/
	function lineChartDate(){
		
		var month = new Date().getMonth()+1;
		var year = new Date().getYear();
		var dateArr = [];
		var maxDate = 31;
		
		switch(month){
		case 4: case 6: case 9: case 11: 
			maxDate=30; 
			break; 
		case 2 :  
			if( year%4==0 && year%100!=0 || year%400==0 ) {
				maxDate = 29;
			}else 
				maxDate =28;
				break;
		}
		
		for(let i = 0; i <maxDate; i++){
			dateArr.push(i+1);
		}
		personalCallGetter(dateArr);
//		console.log("이번달 일수:", dateArr);
//		myLineChart(dateArr);
		
	};
	/*일일 통화량 받아오는 함수*/
	function personalCallGetter(dateArr){
		var month = new Date().getMonth()+1;
		var year = new Date().getYear()+1900;
		$.ajax({
			url : "personalCallInfo.json",
			data : {"userNo" :userNo, "selectMonth" : month}, 
			dataType : "json"
		})
		.done(function(call){
//			console.log(call);
			myLineChart(dateArr, call);
		});
	};
	var myLineChart = function(dateArr, call){ 
		new Chart(lineCtx, {
	        type: "line",
	        data: {
	            labels: dateArr,
	            datasets: [{
	                label: "통화량",
	                lineTension: .3,
	                backgroundColor: "rgba(2,117,216,0.2)",
	                borderColor: "rgba(2,117,216,1)",
	                pointRadius: 5,
	                pointBackgroundColor: "rgba(2,117,216,1)",
	                pointBorderColor: "rgba(255,255,255,0.8)",
	                pointHoverRadius: 5,
	                pointHoverBackgroundColor: "rgba(2,117,216,1)",
	                pointHitRadius: 20,
	                pointBorderWidth: 2,
	                data: call
	            }]
	        },
	        options: {
	            scales: {
	                xAxes: [{
	                    time: {
	                        unit: "date"
	                    },
	                    gridLines: {
	                        display: !1
	                    },
	                    ticks: {
	                        maxTicksLimit: 31
	                    }
	                }],
	                yAxes: [{
	                    ticks: {
	                        min: 0,
	                        max: 160,
	                        maxTicksLimit: 10
	                    },
	                    gridLines: {
	                        color: "rgba(0, 0, 0, .125)"
	                    }
	                }]
	            },
	            legend: {
	                display: !1
	            }
	        }
	    })
	};

	/**막대그래프*/
   var barCtx = document.getElementById("myBarChart").getContext('2d');
   /*회의방 생성 갯수 데이터 받아오는 함수*/
    var roomCountArr = function(){
	$.ajax({
		url : "countRoomByMonth.json",
		data : {"userNo": userNo}, 
		dataType : "json"
	}).done(function(result){
		myBarChart(result);
		var count = new Date().getMonth();
		if(result[count] != 0){
			conferenceGetter();
		}
//		console.log(result[count]);
		
//		if(result)
	})
	.fail(function(e){
		console.log(e);
	});
};
    myBarChart =function(result){ 
    	new Chart(barCtx, {
        type: "bar",
        data: {
            labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월","11월", "12월"],
            datasets: [{
                label: "회의방갯수",
                backgroundColor: "rgba(2,117,216,1)",
                borderColor: "rgba(2,117,216,1)",
                data: result
            }]
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: "month"
                    },
                    gridLines: {
                        display: !1
                    },
                    ticks: {
                        maxTicksLimit: 12
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 20,
                        maxTicksLimit: 10
                    },
                    gridLines: {
                        display: !0
                    }
                }]
            },
            legend: {
                display: !1
            }
        }
    })
    }; 
    
    
	var  pieCtx = document.getElementById("myPieChart").getContext('2d');
	
	function conferenceGetter(){
		var month = new Date().getMonth()+1;
		var year = new Date().getYear()+1900;
		$.ajax({
			url : "conferenceTimeInfo.json",
			data :{"userNo": userNo, "selectYear":year, "selectMonth":month, "actStartCode":"da01","actEndCode":"da04" }, 
			dataType : "json"
		})
		.done(function(result){
			console.log("방이름", result.roomNameList);
			console.log("회의시간", result.conferList);
			var pieLabels = result.roomNameList;
			var pieDate= result.conferList;
//			console.log(pieDate.length);
//			if(p)
			myPieChart(pieLabels, pieDate);
			
		});
	};
	
	function myPieChart(pieLabels, pieDate){
		 new Chart(pieCtx, {
	     type: "doughnut",
	     data: {
	         labels: pieLabels,
	         datasets: [{
	             data: pieDate,
	             backgroundColor: ["#007bff", "#dc3545", "#ffc107", "#28a745", "#ff4b01", "#ffd801", "#ff6702", "#078f85", "#00812f", "#ffecb7", "#75d1dc", "#847a7b"]
	         }]
	     }
	 });
	 };
	 
	 
	 document.body.onclick = function(e){
			if(e.target.id!= null){
				switch(e.target.id){
				case "areaBtnRight": break;
				case "barBtnRight": break;
				case "doughnutBtnRight": break;
				
				case "areaBtnLeft": break;
				case "barBtnLeft": break;
				case "doughnutBtnLeft": break;
			
				}	
			}
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 