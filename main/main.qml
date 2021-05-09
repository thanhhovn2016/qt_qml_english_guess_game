import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Window 2.1

ApplicationWindow {
    title: qsTr("My super app")
    width: 640
    height: 480
    visible: true
    property var pageindex: new Object({pagenum: 0})
    StackView {
         id: stackView
         anchors.fill: parent
         Component.onCompleted: {
             push( { item: items[0], destroyOnPop:false })
         }
         property variant items: [Qt.resolvedUrl("listv.qml"),Qt.resolvedUrl("ssview.qml"),Qt.resolvedUrl("Sprite.qml"),comp3.createObject()]  // objects from the components
     }


    Component {
        id: comp1
        Rectangle {
            color: "red"

           property ListModel qwe: ListModel {}
            Button {
                anchors.bottom: parent.bottom
                width: parent.width
                text: "Get Data"
                onClicked: JS.makeList()
                //onClicked: JS.createSpriteObjects()
            }
        }
   }
    Component {
         id: comp3
         Rectangle {
             color: "red"

             Text {
                 id: mtext
                 anchors.centerIn: parent
                 text: "Third Page"
             }
         }
     }
     Component {
         id: comp2
         Rectangle {
             color: "lightgreen"

             Text {
                 id: mtext
                 anchors.centerIn: parent
                 text: "Second Page"
             }

             MouseArea {
                 id: mouseArea
                 anchors.fill: parent
                 onClicked: mtext.text += " Clicked"
             }
         }
     }

     Row {
         anchors.left: parent.left
         anchors.right: parent.right
         anchors.bottom: parent.bottom
         Button {
             id: next
             text: "Next"
             onClicked: {
                 if(pageindex.pagenum < 2){
                    pageindex.pagenum = pageindex.pagenum + 1
                 }
                 if(pageindex.pagenum === 2){
                    pageindex.pagenum = 2
                     enabled = false
                     prev.enabled = true
                 }

                 stackView.push({ item: stackView.items[pageindex.pagenum], destroyOnPop:false })
                 //enabled = false
                 //prev.enabled = true
             }
         }

         Button {
             id: prev
             text: "Prev"
             //enabled: false
             onClicked: {
                 if(pageindex.pagenum > 0){
                    pageindex.pagenum = pageindex.pagenum - 1
                 }
                 if(pageindex.pagenum === 0){
                    pageindex.pagenum = 0
                     enabled = false
                     next.enabled = true
                 }
                 //stackView.pop()
                 stackView.push({ item: stackView.items[pageindex.pagenum], destroyOnPop:false })
                 //enabled = false
                 //next.enabled = true
             }
         }

     }
}
