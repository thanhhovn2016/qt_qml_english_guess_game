var internalQmlObject = Qt.createQmlObject('import QtQuick 2.0; QtObject { signal someSignal(string value) }', Qt.application, 'InternalQmlObject');
var internalQmlObjectarr = Qt.createQmlObject('import QtQuick 2.0; QtObject { signal someSignal(ListModel value) }', Qt.application, 'InternalQmlObject');

function doSomething() {
    var mytext = labelTest.text;
    internalQmlObject.someSignal(mytext);
}

function doSomethingstep1() {
    var mytext = labelTeststep1.text;
    internalQmlObject.someSignal(mytext);
}

function getData(jsonurl) {
    var xmlhttp = new XMLHttpRequest();
    var url = jsonurl;
    //console.log("aaaaaaaaaaa");

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
    var totalobj = arr["posts"].length;
    var i=0;

    var listView = Qt.createQmlObject ('import QtQuick 2.4; ListView {anchors.fill: parent}', parent);
    var modelposts = Qt.createQmlObject('import QtQuick 2.4; ListModel {}', parent);
    var comp = Qt.createQmlObject('import QtQuick 2.4; Component { Text { text: "(" + index + ") " +postid + " " + title + " " + url + " " + content + " " + attachments} }', parent);
    //var comp = Qt.createQmlObject('import QtQuick 2.4; Component { Text { text: "(" + index + ") " +postid + " " + title + " " + url + " " + content + " " + attachments},onClicked:console.log(index) }', parent);
    var comp = Qt.createComponent("mycomp.qml");
    //modelposts.append({"cost": 15.95, "name":"Pizza"});
    //console.log(modelposts[0]);

    for(i=0;i<totalobj;i++){
        console.log(arr["posts"][i]["id"]);
        console.log(arr["posts"][i]["title"]);
        modelposts.append({"postid": arr["posts"][i]["id"], "title": arr["posts"][i]["title"],"url":arr["posts"][i]["url"],"content":arr["posts"][i]["content"],"attachments":arr["posts"][i]["attachments"][0]["url"]});
    }
    listView.model = modelposts;
    listView.delegate = comp;

    console.log(listView.model.get(0).postid) //Problem 4: I hope :)
//console.log(modelposts[1]["postid"]);

    //var mycmd = 'import QtQuick 2.4; Text { text: "' + arr["content"] + '" }';
    //var myloader = Qt.createQmlObject(mycmd, myloaderid,"dynamicSnippet1");
    internalQmlObject.someSignal(arr["content"]);
}

function listViewC() {
    var listView = Qt.createQmlObject ('import QtQuick 2.4; ListView {anchors.fill: parent}', root);
    var model = Qt.createQmlObject('import QtQuick 2.4; ListModel {}', root);
    var myloader = Qt.createQmlObject('import QtQuick 2.4; Loader {source : "zone.qml"}', root);
    var comp = Qt.createQmlObject('import QtQuick 2.4; Component { Text { text: "(" + index + ") " +name + " " + cost } }', root);
    model.append({"cost": 15.95, "name":"Pizza"});
    model.append({"cost": 3.95, "name":"Doughnut"});
    listView.model = model;
    listView.delegate = comp;

    console.log(listView.model.get(0).name) //Problem 4: I hope :)
    console.log(listView.headerPositioning) //Problem 2
}

function logindex(){
    //listTest.currentIndex = model.index;
    console.log();
}
function newpage(mypage){
    var mypagestr = 'import QtQuick 2.4; Loader {source : "' + mypage + '"}';
    console.log(mypagestr);
    //var myloader = Qt.createQmlObject(mypagestr, root);
    //getData();
    //var mycomp = Qt.createQmlObject('import QtQuick 2.4; Component { Text { text: "(" + index + ") " +name + " " + cost } }', root); //Problem 1 same as you said, Problem 3: index only in delgate, Problem 4: Just the only way I know
}
function getdatajson(urljson){
    getData(urljson);
}

function pushtest(){
    var myloader = Qt.createQmlObject('import QtQuick 2.4; Loader {source : "zone.qml"}', root);
    stackView.push({ item: Qt.resolvedUrl("PlaceDetails.qml") ,properties: {"myloader":myloader}, destroyOnPop:false })

}
