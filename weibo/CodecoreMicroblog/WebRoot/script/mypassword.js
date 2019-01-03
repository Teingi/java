//填充日期
window.onload = function(){	
	var year = document.getElementById("year");
	var month = document.getElementById("month");
	year.onchange = changeDate;
	month.onchange = changeDate;
	fillDate();
}

function fillDate(){	
	var now = new Date();
	var yy = now.getFullYear();	
	var year = document.getElementById("year");
	var month = document.getElementById("month");
	var day = document.getElementById("day");
	for(i=yy-50; i<=yy; i++){
		year.options.add(new Option(i,i));
	}
	for(i=1; i<=12; i++){
		month.options.add(new Option(i,i));
	}
	for(i=1; i<=31; i++){
		day.options.add(new Option(i,i));
	}
}
function changeDate(){
	var yy = document.getElementById("year").value;
	var mm = document.getElementById("month").value;
	var dd = document.getElementById("day");
	var days = getDays(yy,mm);
	for(i=1; i<=days; i++){
		dd.options.add(new Option(i,i));
	}
}
function getDays(y,m){
	var days = 0;
	if(m==2){
		if(y%400==0 || y%4==0&&y%100!=0)
			days=29;
		else
			days=28;
	}else if(m==4 || m==6 || m==9 || m==11){
		days=30;
	}else{
		days=31;
	}
	return days;
}