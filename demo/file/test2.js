var test={};
test.isflag = true;
test.pageNum = 1;


function testFun(){
//	alert("testFun");
	$.ajax({ 
		url: "PageServlet",
		data: {pageNum:test.pageNum},
		dataType:"json",
		success: function(data){			
			XSFX(data);
			
			
    }});
}

function XSFX(data){
//	alert(data.length);
	if(data.length>0){
		var appIndex = "";
		for (var i = 0; i < data.length; i++) {	
			appIndex+='<li style="font-size: 50px; margin-top: 20px;">'+data[i]+'</li>';
		}
		$("#ul_id").append(appIndex);
		if(data.length<2){
			test.isflag=true;
			mui('#pullrefresh').pullRefresh().endPullupToRefresh(test.isflag);
		
		}else{
			test.isflag=false;
			mui('#pullrefresh').pullRefresh().endPullupToRefresh(test.isflag);
			test.pageNum+=1;
			mui('#pullrefresh').pullRefresh().refresh(true);
		}
	}	
}
/**
 * 下拉
 */
function testFun1(){
//	alert("testFun1");
	$.ajax({ 
		url: "PageServlet",
		data: {pageNum:test.pageNum},
		dataType:"json",
		success: function(data){			
			XSFX1(data);
			
			
    }});
}

function XSFX1(data){
//	alert("XSFX1======="+data.length);
	if(data.length>0){
		var appIndex = "";
		for (var i = 0; i < data.length; i++) {	
			appIndex+='<li style="font-size: 50px; margin-top: 20px;">'+data[i]+'</li>';
		}
		$("#ul_id").append(appIndex);
		if(data.length<2){
			
		}else{
			test.isflag=false;
			alert('是否是这句话起作用了');
			mui('#pullrefresh').pullRefresh().endPullupToRefresh(test.isflag);
			mui('#pullrefresh').pullRefresh().refresh(true);
			test.pageNum+=1;
		}
	}	
}