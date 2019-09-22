
// Cashflow bar using morris

Morris.Bar({
  element: 'bar-cashflow',
  data: [
    { y: '2006', a: 100, b: 90 },
    { y: '2007', a: 75,  b: 65 },
    { y: '2008', a: 50,  b: 40 },
    { y: '2009', a: 75,  b: 65 },
    { y: '2010', a: 50,  b: 40 },
    { y: '2011', a: 75,  b: 65 },
    { y: '2012', a: 100, b: 90 }
  ],
  xkey: 'y',
  ykeys: ['a', 'b'],
  labels: ['Series A', 'Series B']
});


//******* PIE CHART Data (for Spending Breakdown)

var dataSet = [
    {label: "Server Cost", data: 172000, color: "#DE000F" },
    { label: "Office Rent", data: 55000, color: "#00A36A" },
    { label: "Utilities & Bills", data: 14000, color: "#7D0096" }
];

var options = {
    series: {
        pie: {
            show: true,
            label: {
                show: true,
                radius: 180,
                formatter: function (label, series) {
                    return '<div style="border:1px solid grey;font-size:8pt;text-align:center;padding:5px;color:white;">' +
                    label + ' : ' +
                    Math.round(series.percent) +
                    '%</div>';
                },
                background: {
                    opacity: 0.8,
                    color: '#000'
                }
            }
        }
    },
    legend: {
        show: true
    },
    grid: {
        hoverable: true
    }
};


var spendOptions = {
    series: {
        pie: {
            show: true,
            innerRadius: 0.5,
            label: {
                show: true
            }
        }
    }
};


$(document).ready(function () {

	//Spending Breakdown Pie
    $.plot($("#spend-pie"), dataSet, spendOptions);

    // Select2 for invoice

});



