$(function (){
    function display(bool){
        if (bool) {
            $("#container").show();
        }else {
            $("#container").hide();
        }
    }
  display(false)
    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            
            }else{
                display(false)
            }
        }
    })

    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post('https://cfx-nui-framework-menu/exit', JSON.stringify({}));
            return
        }
    };

   $("#close").click(function(){
       $.post('https://cfx-nui-framework-menu/exit', JSON.stringify({}));
       return
   })

   $("#submit").click(function (){
       let inputValue = $("#modelInput").val()
       if (inputValue.length >= 100){
            $.post('https://cfx-nui-framework-menu/error', JSON.stringify({
                error: "Name is too long"
            }))
            return
       } else if (!inputValue) {
        $.post('https://cfx-nui-framework-menu/error', JSON.stringify({
            error: "You didnt enter model name"
        }))
        return
       }
       $.post('https://cfx-nui-framework-menu/pedModel', JSON.stringify({
           text: inputValue,
       }));
       return;
   })
})