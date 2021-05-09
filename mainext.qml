import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import "test.js" as JS

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    Rectangle {
        id: root
        width: 200
        height: 200
        Rectangle {
            id: someComponent
             Text { id: mytext;text: "a"}
            function someSlot(v) {
                mytext.text = v
            }
        }

        Component.onCompleted: {
            JS.internalQmlObject.someSignal.connect(someComponent.someSlot);
            JS.doSomething();
        }


        ListView {
            id: listTest;
            clip: true;
            currentIndex: -1;
            model: ListModel {
                id: modelTest;

                ListElement { name: "Banana";page:"yellow";link:"http://192.168.1.111/mytestjson/index.php?para=banana" }
                ListElement { name: "Apple";page:"pink";link:"http://192.168.1.111/mytestjson/index.php?para=apple"  }
                ListElement { name: "Orange";page:"orange";link:"http://192.168.1.111/mytestjson/index.php?para=orange" }
                ListElement { name: "Pear";page:"white";link:"http://192.168.1.111/mytestjson/index.php?para=pear"   }
            }
            delegate: Item {
                id: item;
                height: 60;
                anchors {
                    left: parent.left;
                    right: parent.right;
                }

                property bool isCurrent : (model.index === listTest.currentIndex);
                onIsCurrentChanged: {
                    if (isCurrent) {
                        input.forceActiveFocus ();
                    }
                    else {
                        input.focus = false;
                    }
                }

                Text {
                    id: label;
                    font.pixelSize: 14;
                    text: model.name;
                    visible: !item.isCurrent;
                    anchors {
                        left: parent.left;
                        right: btnUp.left;
                        margins: 20;
                        verticalCenter: parent.verticalCenter;
                    }
                }
                TextInput {
                    id: input;
                    text: model.name;
                    visible: item.isCurrent;
                    onTextChanged: { modelTest.setProperty (model.index, "name", text); }
                    anchors {
                        left: parent.left;
                        right: btnUp.left;
                        margins: 20;
                        verticalCenter: parent.verticalCenter;
                    }

                    Rectangle {
                        z: -1;
                        radius: 5;
                        antialiasing: true;
                        border {
                            width: 1;
                            color: "blue";
                        }
                        anchors {
                            fill: parent;
                            margins: -5;
                        }
                    }
                }
                MouseArea {
                    id: clicker;
                    anchors.fill: parent;
                    visible: !item.isCurrent;
                    onClicked: {
                        console.log(model.index);
                        console.log(listTest.model.get(model.index).link)
                        var mypageloader = listTest.model.get(model.index).page + ".qml";
                        if(mypageloader != "yellow.qml"){
                            mypageloader = "none.qml";
                        }

                        //console.log(mypageloader);
                        //JS.newpage(mypageloader);
                        JS.getdatajson(listTest.model.get(model.index).link);
                    }
                }
                MouseArea {
                    id: btnUp;
                    width: height;
                    anchors {
                        top: parent.top;
                        right: parent.right;
                        bottom: parent.verticalCenter;
                    }
                    onClicked: {
                        if (model.index > 0) {
                            modelTest.move (model.index, model.index -1, 1);
                        }
                    }

                    Text {
                        text: "V";
                        color: "gray";
                        rotation: -180;
                        anchors.centerIn: parent;
                    }
                }
                MouseArea {
                    id: btnDown;
                    width: height;
                    anchors {
                        top: parent.verticalCenter;
                        right: parent.right;
                        bottom: parent.bottom;
                    }
                    onClicked: {
                        if (model.index < modelTest.count -1) {
                            modelTest.move (model.index, model.index +1, 1);
                        }
                    }

                    Text {
                        text: "V";
                        color: "gray";
                        anchors.centerIn: parent;
                    }
                }
                Rectangle {
                    height: 1;
                    color: "lightgray";
                    anchors {
                        left: parent.left;
                        right: parent.right;
                        bottom: parent.bottom;
                    }
                }
            }
            anchors.fill: parent;
        }

}
}
/*
        Button {
            anchors.bottom: parent.bottom
            text: "Click"
            onClicked: JS.listViewC()
        }

    }
    */




