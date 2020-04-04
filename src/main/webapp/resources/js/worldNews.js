alert("This code shows you top headlines across the world,regarding various categories.\nTry this code and Stay Updated\nGive a few seconds for news articles to load.Click on the categories to get the Headlines!");
function helo(se)
{
    var d = new Date();
    var yr=d.getFullYear();
    var n=d.getMonth();
    var dd=d.getDate();
    var s=yr+"-"+(n+1)+"-"+dd;
    var l=0;
    if(se=="Entertainment")
        l=1;
    else if(se=="Science"||se=="Technology")
        l=3;
    else
        l=5; $.getJSON('https://newsapi.org/v2/top-headlines?q='+se+'&from='+s+'&apiKey=61c726b347cd4055a51d15d2ab9956bf',
    function(data)
    {
        var dt=data.articles;
        for(var i=0;i<l;i++)
        {
            var nid="news"+(i+1);

            document.getElementById(nid).style.display="block";
            var d=dt[i].source;
            var pbid="pb"+(i+1);
            var lid="li"+(i+1);
            var tid="tit"+(i+1);
            var did="des"+(i+1);

            if(d!=null)
            {
                document.getElementById(pbid).innerHTML="Published by:"+d.name;
                document.getElementById(lid).innerHTML="Read full news in:"+ '<a href="'+dt[i].url+'">'+"News url"+'</a>';
                document.getElementById(tid).innerHTML=dt[i].title;
                document.getElementById(did).innerHTML=dt[i].description+"...";
            }
        }
        for(var i=l;i<5;i++)
        {
            var nid="news"+(i+1);
            document.getElementById(nid).style.display="none";
        }

    });

}