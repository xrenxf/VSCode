function appendCharacter(char){
    document.getElementById("display").value += char;
}

function clearDisplay(){
    document.getElementById("display").value = '';
}

function deleteLast(){
    const currentDisplay = document.getElementById("display");
    currentDisplay.value = currentDisplay.value.slice(0, -1);
}

function calculateResult(){
    const currentDisplay = document.getElementById("display");
    try{
        currentDisplay.value = eval(currentDisplay.value);
    } catch (error){
        currentDisplay.value = "Error"
    }
}

function calculateRank(){
    const currentDisplay = document.getElementById("display");
    currentDisplay.value = (eval(currentDisplay.value))*(eval(currentDisplay.value));
}

function calculatePercentage(){
    const currentDisplay = document.getElementById("display");
    currentDisplay.value = eval(currentDisplay.value)/100;
}

function calculateSquareRoot(){
    const currentDisplay = document.getElementById("display");
    currentDisplay.value = Math.sqrt(eval(currentDisplay.value));
}

function calculateReciprocal() {
    const currentDisplay = document.getElementById("display");
    currentDisplay.value = 1 / eval(currentDisplay.value);
  }