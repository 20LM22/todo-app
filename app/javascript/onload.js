for (let checkBtn of document.getElementsByClassName("checkbox")) {
    // If checked, strike through the paragraph text 
    if (checkBtn.checked) { 
        let checkbox_id = checkBtn.id;
        console.log("the checkbox id is: " + checkbox_id);
        let strike_text = document.getElementById("label-" + checkbox_id);
        console.log(strike_text);
        strike_text.style.textDecoration = 
            "line-through"; 
    } 

    // If unchecked, remove the strikethrough 
    else { 
        let checkbox_id = checkBtn.id;
        let strike_text = document.getElementById("label-" + checkbox_id);
        strike_text.style.textDecoration = 
            "none";
    }
}