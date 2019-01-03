cur = 1; //定义全局变量
function bigsmall(id){
   cur = cur * (-1);
   var imgid=document.getElementById("imgid"+id);
   //var a = document.getElementById("img");
   if(cur == 1)
   {
	//width="89" height="120" 
	   imgid.height="120"
	   imgid.width="89"
	   imgid.style.cursor = "mouse/0001.ani"; //以前写成"url(mouse/0001.ani)" 出现了问题,注意此情况，浪费了我好久时间。
   }else{
	   imgid.width="267"
	   imgid.height="360"
	   imgid.style.cursor = "mouse/0132.ani";
   }
   //alert(cur);
}