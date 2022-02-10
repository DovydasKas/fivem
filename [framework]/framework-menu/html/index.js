$(function (){
    function display(bool){
        if (bool) {
            $("#container").show();
        }else {
            $("#container").hide();
        }
    }
    display(false)
    window.addEventListener("message", function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status === true) {
                display(true)
            
            }else{
                display(false)
            }
        }
    })

    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post("http://framework-menu/exit", JSON.stringify({}));
            return
        }
    };

   $("#close").click(function(){
       $.post("http://framework-menu/exit", JSON.stringify({}));
       return
   })

   $("#submit").click(function (){
       let value = $("#modelInput").val()
       if (value.length >= 100){
            $.post("http://framework-menu/error", JSON.stringify({
                error: "Name is too long"
            }))
            return
       } else if (!modelInput) {
        $.post("http://framework-menu/error", JSON.stringify({
            error: "You didnt enter model name"
        }))
        return
       }
       $.post("http://framework-menu/pedModel", JSON.stringify({
           text: modelInput
       }));
       return;
   })
})