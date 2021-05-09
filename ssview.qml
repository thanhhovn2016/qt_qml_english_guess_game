import QtQuick 2.4
import QtQuick.Controls 1.2
import "test.js" as TJS
Rectangle {
     id: container
     width: 500; height: 400
     color: "#343434"
     visible:true

     ListModel {
         id: fruitModel

         ListElement {
             name: "Apple"; cost: 2.45
             attributes: [
                 ListElement { description: "Core" },
                 ListElement { description: "Deciduous" }
             ]
         }
         ListElement {
             name: "Banana"; cost: 1.95
             attributes: [
                 ListElement { description: "Tropical" },
                 ListElement { description: "Seedless" }
             ]
         }
         ListElement {
             name: "Cumquat"; cost: 3.25
             attributes: [
                 ListElement { description: "Citrus" }
             ]
         }
         ListElement {
             name: "Durian"; cost: 9.95
             attributes: [
                 ListElement { description: "Tropical" },
                 ListElement { description: "Smelly" }
             ]
         }
     }
     Component {
         id: nameDelegate
         Text {
             text: name;
             font.pixelSize: 24
         }

     }
     ListView {
         anchors.fill: parent
         clip: true
         model: fruitModel
         delegate: nameDelegate


     }


}
