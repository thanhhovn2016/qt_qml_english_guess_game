import QtQuick 2.4

Rectangle{
    width: 200
    height: 50
    color: ListView.isCurrentItem ? "#003366" : "#585858"
    border.color: "gray"
    border.width: 1

    Text{
        anchors.centerIn: parent
        color: "white"

    }
}
