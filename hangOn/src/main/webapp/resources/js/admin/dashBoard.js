window.onload = function(){
	roomCountArr();
};
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif', Chart.defaults.global.defaultFontColor = "#292b2c";
var lineCtx = document.getElementById("myAreaChart").getContext('2d');
var myLineChart = new Chart(lineCtx, {
        type: "line",
        data: {
            labels: ["Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"],
            datasets: [{
                label: "Sessions",
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
                data: [1e4, 30162, 26263, 18394, 18287, 28682, 31274, 33259, 25849, 24159, 32651, 31984, 38451]
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
                        maxTicksLimit: 7
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 4e4,
                        maxTicksLimit: 5
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
    });

   var barCtx = document.getElementById("myBarChart").getContext('2d');
    var roomCountArr = function(){
	$.ajax({
		url : "countRoomByMonth.json",
		data : {"userNo": 7}, 
		dataType : "json"
	}).done(function(result){
		console.log(result);
		myBarChart(result);
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
    myPieChart = new Chart(pieCtx, {
        type: "doughnut",
        data: {
            labels: ["Blue", "Red", "Yellow", "Green"],
            datasets: [{
                data: [12.21, 15.58, 11.25, 8.32],
                backgroundColor: ["#007bff", "#dc3545", "#ffc107", "#28a745"]
            }]
        }
    });