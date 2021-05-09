import QtQuick 2.0

Rectangle {
    width: 300
    height: 400
    Rectangle {
        width: 300
        height: 200
        id:rect1
        Image {
            source: nextstepattachment.text
        }
    }

    Text{
        anchors.top: rect1.bottom
        text:nextstepcontent.text
    }
}

