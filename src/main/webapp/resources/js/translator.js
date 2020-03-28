
window.onload = () => {

    ttext.addEventListener('input', e => {

        var fromLang = document.getElementById("fromLang").value;
        var toLang = document.getElementById("toLang").value;
        var text = document.getElementById("ttext").value;
        var output = document.getElementById("output");
        var url = "https://translate.yandex.net/api/v1.5/tr.json/translate";
        var keyAPI = "trnsl.1.1.20190803T115559Z.908e79c70b9b708b.928873fade76022faec2c1e283e17dc80a1d538f";
        var xhr = new XMLHttpRequest();
        var textAPI = text;
        var langAPI = fromLang + "-" + toLang;

        var data = "key="+keyAPI+"&text="+textAPI+"&lang="+langAPI;

        xhr.open("POST",url,true);
        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xhr.send(data);
        xhr.onreadystatechange = function() {
            if (this.readyState==4 && this.status==200) {
                var res = this.responseText;
                var json = JSON.parse(res);
                if(json.code == 200) {
                    document.getElementById("output-text-area").value = json.text[0];
                    //output.innerHTML = json.text[0];
                }
                else {
                    console.log("Error Code: " + json.code);
                }
            }
        }
    });
}
