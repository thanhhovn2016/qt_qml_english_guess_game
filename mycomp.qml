import QtQuick 2.0
import "clicked.js" as CJS

Item {
    width: parent.width
    height: 40
    Column {
        //Text { text: 'Postid:' + postid }
        Text { text: 'Title:' + title }
    }
    MouseArea {
        anchors.fill: parent

        //onClicked: list.currentIndex = index
        onClicked: {
            console.log(index); //Problem 4: I hope :)
            nextstepattachment.text = attachments;
            nextstepcontent.text = content;
            stackView.push({ item: stackView.items[2], destroyOnPop:false })
        }
    }

}



