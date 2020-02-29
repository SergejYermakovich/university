const textareaValue = document.querySelector("#textarea");
const saveReport = document.querySelector("#save_report");

saveReport.addEventListener("click", () => {
    const saveReport = save_report(textareaValue.value);
});

//кнопки изменения размера текста , шрифта и тд

function save_report(text) {
    alert(text);

}

