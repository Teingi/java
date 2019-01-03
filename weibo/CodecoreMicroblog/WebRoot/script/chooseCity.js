//JavaScript text
var onecount=0;
var subcat=new Array();
function changeProvince(selectid){
	document.region.length=0;
	var locationid=selectid;
	var i;
	document.region.options[0]=new Option("所有城市");
	document.region.options[0].selected=true;
	for ( i = 0;  i< onecount; i++) {
		if (subcat[i][1]==locationid) {
			document.region.options[document.region.length]=new Option(subcat[i][0], subcat[i][2]);
		}
	}
}
subcat[0]=new Array("北京市","366", "367");
subcat[1]=new Array("天津市","386", "387");
onecount=25;