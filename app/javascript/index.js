function strike () {
    // If checked, strike through the paragraph text 
    if (this.checked) { 
        let checkbox_id = this.id;
        let strike_text = document.getElementById("label-" + checkbox_id);
        strike_text.style.textDecoration = 
            "line-through"; 
    } 

    // If unchecked, remove the strikethrough 
    else { 
        let checkbox_id = this.id;
        let strike_text = document.getElementById("label-" + checkbox_id);
        strike_text.style.textDecoration = 
            "none";
    } 
}

for (let checkBtn of document.getElementsByClassName("checkbox")) {
    checkBtn.addEventListener("click", strike);
}