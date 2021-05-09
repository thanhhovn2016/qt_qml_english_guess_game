function getData() {
    var xmlhttp = new XMLHttpRequest();
    var url = "http://www.w3schools.com/website/Customers_MYSQL.php";

    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            myFunction(xmlhttp.responseText);
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}

function myFunction(response) {
    var arr = JSON.parse(response);
    for(var i = 0; i < arr.length; i++) {
        listview.model.append( {listdata: arr[i].Name +" "+ arr[i].City +" "+ arr[i].Country })
    }
}
function passpara(pagenum)
{
    return pagenum;
}
