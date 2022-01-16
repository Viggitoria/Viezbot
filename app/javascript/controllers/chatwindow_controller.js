
var answer_button = document.getElementsByClassName("answer_button");
Object.keys(answer_button).map( function (key) {
    var button = answer_button[key]
    button.addEventListener("click", function(){
        alert("Yay!")
    });
});
