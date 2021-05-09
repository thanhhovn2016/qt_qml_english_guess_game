// More information:
// http://stackoverflow.com/questions/29446454/qt-qml-accessing-a-listview-after-a-loader-has-loaded-it-to-jump-to-a-specific/29463686#29463686


import QtQuick 2.4
import QtQuick.Controls 1.2


Rectangle {
    width: 1024
    height: 768

    Component {
        id: pageViewComponent
        ListView {
            id: pagesView

            property int chapterIndex: -1
            property ListView chapterView: null

            Connections {
                target: chapterView
                onSelectedPageChanged: {
                    if (chapterIndex === chapterView.selectedChapter) {
                        pagesView.positionViewAtIndex(chapterView.selectedPage, ListView.Beginning)
                    }
                }
            }

            onChapterIndexChanged: {
                if (chapterView && chapterIndex === chapterView.selectedChapter) {
                    pagesView.positionViewAtIndex(chapterView.selectedPage, ListView.Beginning)
                }
            }

            orientation: ListView.Horizontal; clip: true
            model: 20; snapMode: ListView.SnapToItem
            delegate: Rectangle {
                width: pagesView.width; height: pagesView.height
                color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                border.color: "black"
                Text { text: "Pagezzz " + modelData; anchors.centerIn: parent; color: "yellow" }
            }

        }
    }

    Component {
        id: rowViewComponent
        ListView {
            id: rowsView

            property int rchapterIndex: -1
            //property ListView chapterView: null

            Connections {
                target: chapterView
                onSelectedPageChanged: {
                    if (rchapterIndex === chapterView.selectedChapter) {
                        rowsView.positionViewAtIndex(chapterView.selectedRow, ListView.Beginning)
						
                    }
                }
            }

            onRchapterIndexChanged: {
                if (chapterView && rchapterIndex === chapterView.selectedChapter) {
                    rowsView.positionViewAtIndex(chapterView.selectedRow, ListView.Beginning)
                }
            }

            orientation: ListView.Horizontal; clip: true
            model: 20; snapMode: ListView.SnapToItem
            delegate: Rectangle {
                width: rowsView.width; height: rowsView.height
                color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                border.color: "black"
                Text { text: "Rows " + modelData; anchors.centerIn: parent; color: "yellow" }
            }

        }
    }
	

    Rectangle {
        color: "black"
        anchors.fill: parent

        // Chapters
        ListView {
            id: chapterView
            anchors.fill: parent
            snapMode: ListView.SnapToItem; model: 8

            property int selectedChapter: 0
            property int selectedPage: 0
            property int selectedRow: 0
            property int passpara: 0

            onSelectedChapterChanged: {
                console.log("Chapter changed!")
                positionViewAtIndex(selectedChapter, ListView.Beginning)
            }

            function goTo(chapter, page, row) {
                selectedChapter = chapter
                selectedPage = page
				selectedRow = row
                stackView.push({ item: stackView.items[1], destroyOnPop:false })

            }



            delegate: Rectangle {
                property Loader pageLoader: pageLoader
                color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                width: chapterView.width; height: chapterView.height

                Rectangle {
                    width: 100; height: 100
                    anchors.centerIn: parent
                    Loader {
                        id: pageLoader
                        anchors.fill: parent
                        sourceComponent: pageViewComponent
                        onLoaded: {
                            console.log("called onLoaded for page " + modelData)
                            item.chapterIndex = Qt.binding(function() { return modelData })
                            item.chapterView = chapterView
                        }
                    }
                }


                Rectangle {
                    width: 100; height: 100
                    
                    Loader {
                        id: rowLoader
                        //anchors.fill: parent
                        sourceComponent: rowViewComponent
                        onLoaded: {
                            console.log("called onLoaded for page " + modelData)
                            item.rchapterIndex = Qt.binding(function() { return modelData })
                            //item.chapterView = chapterView

                        }
                    }
                }


                Text {
                    x: 50; y: 50
                    color: "white"; font.pointSize: 30
                    text: "Chapteryyyyyyy " + modelData
                }

                Flow {
                    Button {
                        text: "Go to Chapter 2, Page 7"
                        onClicked: chapterView.goTo(2, 7, 9)
                    }

                    Button {
                        text: "Go to Chapter 1, Page 1"
                        onClicked: chapterView.goTo(1, 1, 11)
                    }

                    Button {
                        text: "Go to Chapter 5, Page 2"
                        onClicked: chapterView.goTo(5, 2, 15)
                    }
                }
            }

        }
    }
}
