




window.addEventListener('input', function() {
    var numberInput = this.document.getElementById("numberInput");
    if(numberInput.value > 0){
        document.getElementById("numberSubmit").disabled = false;
    }else {
        document.getElementById("numberSubmit").disabled = true;
    }
  
  })


function submitForm(){
document.location.href="last.html";
}

function saveQuestion(name, value) {
    let answers = getCookie("answers");
    if (answers == ""){
        answers = {}
    } else {
        answers = JSON.parse(answers);
    }

    answers[name] = value;
    setCookie("answers", JSON.stringify(answers), 1);
}

function nextQuest(button, nextQuestion){
    if(button.value == "numberInput")
    {
        saveQuestion(button.name, document.getElementById("numberInput").valueAsNumber);
    } else if(button.value == "textInput"){
        saveQuestion(button.name, document.getElementById("textInput").value);
    } else {
        saveQuestion(button.name, button.value);
    }
    goToQuestion(nextQuestion);
}

function back(questionID) {
    let jsonData = { "previousQuestion": questionID }
    $.ajax({
        url: "/question",
        type: 'POST',
        contentType: "application/json",
        data : JSON.stringify(jsonData),
        success: function(result) {
            document.location.reload(false)
        }
    });
}


function goToQuestion(questionID) {
    let jsonData = { "nextQuestion": questionID };
    $.ajax({
        url: "/question",
        type: 'POST',
        contentType: "application/json",
        data : JSON.stringify(jsonData),
        success: function(result) {
            document.location.reload(false)
        }
    });
}

function sendCookie(){
    let answers = getCookie("answers");
    console.log(answers);
    $.ajax({
        url: "/send-form",
        type: 'POST',
        contentType: "application/json",
        data : answers,
        success: function(result) {
            document.location.href="/last"
        }
    });
}

    function getSelectedValue(){
        var selectedValue = document.getElementById("answer").value;
        console.log(selectedValue);
    }

    