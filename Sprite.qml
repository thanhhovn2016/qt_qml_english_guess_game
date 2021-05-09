import QtQuick 2.4
import QtQuick.Controls 1.3
import "try.js" as JS


    Rectangle {
        id: background
        color: "#E5E4E0"

        Item {
            width: 300
            height: 400

            ListModel {
                id: model
            }

            ListView {
                id: listview
                anchors.fill: parent
                model: model
                delegate: Text {
                    text: listdata
                }
            }


            Button {
                anchors.bottom: parent.bottom
                width: parent.width
                text: "Get Data"
                onClicked: JS.getData()
            }
        }
    }




