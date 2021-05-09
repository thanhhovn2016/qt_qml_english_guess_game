import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import "test.js" as JS
ApplicationWindow {
    title: qsTr("My super app")
    width: 640
    height: 480
    visible: true
    property var pageindex: new Object({pagenum: 0})
    Label {
          visible:false
          id: labelTest
          text: "testthanhhostep0"
      }

    Label {
          visible:false
          id: labelTeststep1
          text: "testthanhhostep1"
      }
    Label {
          visible:false
          id: nextstepattachment
          text: ""
          states: State {
              name: "showme"
              PropertyChanges { target: nextstep;text:"aaaaaaabbbbcc";visible:true }
          }
      }
    Label {
          visible:false
          id: nextstepcontent
          text: ""
      }

    StackView {
         id: stackView
         anchors.fill: parent
         Component.onCompleted: {
             push( { item: items[0], destroyOnPop:false })
         }
         property variant items: [Qt.resolvedUrl("PlaceDetails.qml"),Qt.resolvedUrl("PlaceDetailsstep1.qml"),Qt.resolvedUrl("Details.qml"),comp3.createObject()]  // objects from the components
     }
    Rectangle {
        id: someComponent
        visible: false
         Text { id: mytext;text: "a"}
        function someSlot(v) {
            mytext.text = v
            console.log(v)
        }
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
                 someComponent.visible = false
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
                     //enabled = false
                     //next.enabled = true
                 }
                 //stackView.pop()
                 //var myloader = Qt.createQmlObject('import QtQuick 2.4; Loader {source : "zone.qml"}', parent);
                 //labelTest.text = "zzzzzzzzzzzzzzzzzzzzzzzzz"
                 //stackView.push({ item: stackView.items[pageindex.pagenum],properties: { "mycomp" : someComponent } , destroyOnPop:true })
                 stackView.push({ item: stackView.items[0],properties: { "mycomp" : someComponent } , destroyOnPop:true })
                 //enabled = false
                 //next.enabled = true
             }
         }

     }
}
