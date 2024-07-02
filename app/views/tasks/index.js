const checkedBtns = document.getElementsByClassName("checked");

checkedBtns.forEach(function(checkedBtn) {
    let labelId = "label-" + checkedBtn.id;
    if (checkedBtn.checked) {
        document.getElementById(labelId).classList.add("crossed-out");
    } else {
        document.getElementById(labelId).classList.remove("crossed-out");     
    }
});

