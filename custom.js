$(document).ready(function(){
	currentTime();
$('body').on('click', '[data-toggle="modal"]', function(){
        $($(this).data("target")+' .modal-body').load("create.jsp?event=trash");
    }); 	
});

$(function() {
        $.contextMenu({
            selector: '.icons-list',
            callback: function(key, options) {
                var m = "clicked: " + key;
				if(key=="delete"){
					$.post("create.jsp?event="+key+"&filename="+options.$trigger.attr('elem-name'), function(data){
						$(".icons-list-group").html("");
						$(".icons-list-group").html(data);
						console.log(options.$trigger.attr('elem-name')+" : "+data);
					})
				}
			},
            items: {
				//"Rename": {name: "Rename", icon: "edit"},
                "delete": {name: "Delete", icon: "delete"},
                "sep1": "---------",
                "quit": {name: "Quit", icon: function(){
                    return 'context-menu-icon context-menu-icon-quit';
                }}
            }
        });

        $.contextMenu({
            selector: '.desktop', 
			className:'desktop-active',
            callback: function(key, options) {
                var m = "clicked: " + key;
				if(key=="createFile"){
					$.post("create.jsp?event="+key, function(data){
						$(".icons-list-group").append("<div class='icons-list' elem-name='"+data+"'><span class='fa fa-file fa-icons'><label id='newfile'>"+data+"</label></span></div>");
					});
					
				}
				if(key=="createFolder"){
					$.post("create.jsp?event="+key, function(data){
						$(".icons-list-group").append("<div class='icons-list' elem-name='"+data+"'><span class='fa fa-folder fa-icons'><label id='newfile'>"+data+"</label></span></div>");
					});					
					
				}
                //window.console && console.log(m) || alert(m); 
            },
            items: {
				"createFolder": {name: "Create Folder"},
                "createFile": {name: "Create File"}
            }
        });


        $('.desktop').on('click', function(e){
			//$.post("/edit?event="+this);
            console.log('clicked', this);
			//alert("dd");
        })    
    });

function currentTime(){
	var weekday = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];
	var today = new Date();
	var h = today.getHours();
	var m = today.getMinutes();
	var s = today.getSeconds();
	m = runClock(m);
	s = runClock(s);
	var day = weekday[today.getDay()];
  $("#clock").html(day+" "+h + ":" + m + ":" + s);
  var t = setTimeout(currentTime, 1000);
}
function runClock(i){
  if (i < 10) {i = "0" + i};
  return i;
}