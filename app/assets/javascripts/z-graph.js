$(document).ready(function() {	
		
		var positive = JSON.parse($(".positive").html());
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
    bindto: '.chart',
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
	
});