const textareaValue = document.querySelector("#textarea");
const saveReport = document.querySelector("#save_report");
saveReport.addEventListener("click", () => {
  alert(document.querySelector("#textarea").value);
    const saveReport = save_report(document.querySelector("#textarea").value);
});

// обработать кнопки изменения размера текста , шрифта и тд

$(document).ajaxSend(function (e, xhr) {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    xhr.setRequestHeader(header, token);
});

function save_report(text) {
    $.ajax({
        //url: "student/courses/"+id+"/report/"+ filename,
        // dataType: "json", // Для использования JSON формата получаемых данных
        method: "POST",
        data: {
            "text": text
        },
        success: function () {
            alert("Report is saved!");
            //alert(this.url);
        }
    });
}

