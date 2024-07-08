for (let checkBtn of document.getElementsByClassName("checkbox")) {
    // If decorative, skip it
    if (checkBtn.id != "new-check") {
        // If checked, strike through the paragraph text 
        if (checkBtn.checked) { 
            let checkbox_id = checkBtn.id;
            let strike_text = document.getElementById("label-" + checkbox_id);
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
}