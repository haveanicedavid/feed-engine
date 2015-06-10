$(document).ready(function() {	
		
		var positive = JSON.parse($(".positive").html());
		console.log(positive);
		
		var negative = JSON.parse($(".negative").html());
		var neutral = JSON.parse($(".neutral").html());
		
		var negativeData = dataStuff(negative, "negative");
		var positiveData = dataStuff(positive, "positive");
		var neutralData = dataStuff(neutral, "neutral");
		
		
  function dataStuff(data, name){
		var array = [];
		  array.push(name);
			for (i=0; i < data.length; i ++) {
			  array.push(parseInt(data[i]));
	  	};
		 return array
	};
	
	var chart = c3.generate({
    bindto: '#chart',
    data: {
      columns: [
        negativeData,
				positiveData,
				neutralData
      ],
      axes: {
        data2: 'y2' // ADD
      }
    },
  
});
	
		
// 		graph(negativeData, "red");
// 		graph(positiveData, "green");
// 		graph(neutralData, "yellow");
// 		
// 		
// 		function graph(data, color){
// 				
// 			var vis = d3.select('#visualisation'),
// 		    WIDTH = 1000,
// 		    HEIGHT = 500,
// 		    MARGINS = {
// 		      top: 20,
// 		      right: 20,
// 		      bottom: 20,
// 		      left: 50
// 		    },
// 		    xRange = d3.scale.linear().range([MARGINS.left, WIDTH - MARGINS.right]).domain([d3.min(data, function(d) {
// 		      return d.x;
// 		    }), d3.max(data, function(d) {
// 		      return d.x;
// 		    })]),
// 		    yRange = d3.scale.linear().range([HEIGHT - MARGINS.top, MARGINS.bottom]).domain([d3.min(data, function(d) {
// 		      return d.y;
// 		    }), d3.max(data, function(d) {
// 		      return d.y;
// 		    })]),
// 		    xAxis = d3.svg.axis()
// 		      .scale(xRange)
// 		      .tickSize(5)
// 		      .tickSubdivide(true),
// 		    yAxis = d3.svg.axis()
// 		      .scale(yRange)
// 		      .tickSize(5)
// 		      .orient('left')
// 		      .tickSubdivide(true);
// 		 
// 			vis.append('svg:g')
// 			  .attr('class', 'x axis')
// 			  .attr('transform', 'translate(0,' + (HEIGHT - MARGINS.bottom) + ')')
// 			  .call(xAxis);
// 			 
// 			vis.append('svg:g')
// 			  .attr('class', 'y axis')
// 			  .attr('transform', 'translate(' + (MARGINS.left) + ',0)')
// 			  .call(yAxis);
// 				
// 
// 				var lineFunc = d3.svg.line()
// 		  .x(function(d) {
// 		    return xRange(d.x);
// 		  })
// 		  .y(function(d) {
// 		    return yRange(d.y);
// 		  })
// 		  .interpolate('linear');
// 			
// 			vis.append('svg:path')
// 		  .attr('d', lineFunc(data))
// 		  .attr('stroke', color)
// 		  .attr('stroke-width', 2)
// 		  .attr('fill', 'none');
// 		};
});