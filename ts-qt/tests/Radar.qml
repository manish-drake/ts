import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    Page {
        id: item1
        anchors.fill: parent

        header: Rectangle{
            id:testHeaderRect
            height: 45
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            Item{
                id: rectangle1
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 5
                width: 50
                Image {
                    id: image1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/Area Chart-25.png"
                }
                ColorOverlay{
                    anchors.fill: image1
                    source: image1
                    color: Universal.foreground
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:navigationModel.currentView = navigationModel.getTargetView("Graph")
                }
            }
            Text {
                id: title
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                text: navigationModel.navigationParameter.title
                font.pixelSize: 18
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
                color: Universal.foreground

            }
            PageIndicator {
                id: pageIndicator
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                count: 7
                currentIndex: summaryModel.currentPage
            }
            ColorOverlay{
                anchors.fill: pageIndicator
                source: pageIndicator
                color: Universal.foreground
                visible: Universal.theme == Universal.Dark
            }

//            Item{
//                id: rectangle
//                anchors.top: parent.top
//                anchors.bottom: parent.bottom
//                anchors.right: parent.right
//                anchors.rightMargin: 5
//                width: 50
//                Image {
//                    id: closeImage
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    anchors.verticalCenter: parent.verticalCenter
//                    source: "qrc:/img/img/Delete-25.png"
//                }
//                ColorOverlay{
//                    anchors.fill: closeImage
//                    source: closeImage
//                    color: Universal.foreground
//                }
//                MouseArea {
//                    anchors.fill: parent
//                    onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
//                }
//            }
        }

        contentItem: Rectangle{
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: content.height + content.y + 10
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                ColumnLayout{
                    id: content
                    y: 20
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 10
                    spacing: 5
                    RowLayout{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        spacing: 0
                        Item{
                            Layout.column: 0
                            Layout.fillWidth: true
                        }

                        GridLayout{
                            Layout.column: 1
                            Layout.maximumWidth: 420
                            columnSpacing: 5
                            rowSpacing: 5
                            Text{
                                Layout.column: 1
                                Layout.alignment: Qt.AlignHCenter
                                horizontalAlignment: Text.AlignHCenter
                                text:"0 deg"
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                color: Universal.foreground
                            }
                            Text{
                                Layout.row: 1
                                Layout.column: 2
                                Layout.alignment: Qt.AlignVCenter
                                text:"90 deg"
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                color: Universal.foreground
                            }
                            Text{
                                Layout.row: 2
                                Layout.column: 1
                                Layout.alignment: Qt.AlignHCenter
                                horizontalAlignment: Text.AlignHCenter
                                text:"180 deg"
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                color: Universal.foreground
                            }
                            Text{
                                Layout.row: 1
                                Layout.column: 0
                                Layout.alignment: Qt.AlignVCenter
                                text:"270 deg"
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                color: Universal.foreground
                            }
                            Text{
                                Layout.row: 1
                                Layout.column: 1
                                Layout.columnSpan: 2
                                Layout.alignment: Qt.AlignRight | Qt.AlignTop
                                text:"Scale: 1NM"
                                color: Universal.foreground
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                font.weight: Font.DemiBold
                            }
                            Item{
                                id:middle
                                Layout.row: 1
                                Layout.column: 1
                                width: 320
                                height:width
                                Rectangle{
                                    id:firstRec
                                    anchors.centerIn: parent
                                    width: parent.width
                                    height: parent.height
                                    color: "transparent"
                                    radius: width/2
                                    border.width: 1
                                    border.color: Universal.foreground
                                    opacity: 0.6
                                    Rectangle{
                                        id:secondRec
                                        anchors.centerIn: parent
                                        width: firstRec.width * 0.79
                                        height: firstRec.height * 0.79
                                        color: "transparent"
                                        radius: width/2
                                        border.width: 1
                                        border.color: Universal.foreground
                                        Rectangle{
                                            id:thirdRec
                                            anchors.centerIn: parent
                                            width: firstRec.width * 0.58
                                            height: firstRec.height * 0.58
                                            color: "transparent"
                                            radius: width/2
                                            border.width: 1
                                            border.color: Universal.foreground
                                            Rectangle{
                                                id:fourthRec
                                                anchors.centerIn: parent
                                                width: firstRec.width * 0.37
                                                height: firstRec.height * 0.37
                                                color: "transparent"
                                                radius: width/2
                                                border.width: 1
                                                border.color: Universal.foreground
                                                Rectangle{
                                                    anchors.centerIn: parent
                                                    width: firstRec.width * 0.17
                                                    height: firstRec.height * 0.17
                                                    color: "transparent"
                                                    radius: width/2
                                                    border.width: 1
                                                    border.color: Universal.foreground
                                                }
                                            }
                                        }
                                    }
                                }
                                Repeater{
                                    model: objectsList
                                    Rectangle{
                                        id: object
                                        x: parent.width/2 + parent.width/2 * Math.sin(longitude * (Math.PI /180)) - width/2
                                        y: parent.height/2 - (latitude * (2 * parent.height/2)/180) * (Math.cos(longitude * (Math.PI / 180))) - height/2
                                        width: 7
                                        height: 7
                                        color:Universal.foreground
                                        transform: Rotation { origin.x: width/2; origin.y: height/2; angle: 45}
                                        Text {
                                            x: -20
                                            text: modesaddr
                                            font.pixelSize: 10
                                            color: Universal.foreground
                                            transform: Rotation { origin.x: 0; origin.y: 0; angle: -45}
                                        }
                                    }
                                }

                                ListModel{
                                    id: objectsList
                                    ListElement{modesaddr: "2345AA"; latitude: 40.741893768310547; longitude:-73.989311218261719}
                                    ListElement{modesaddr: "CA310A"; latitude:55.755826; longitude:37.6173}
                                    ListElement{modesaddr: "9CDA34"; latitude:-22.906847; longitude:-43.172896}
                                    ListElement{modesaddr: "3BCA14"; latitude:51.507351; longitude:-0.127758}
                                }
                            }
                        }
                        Item{
                            Layout.column: 2
                            Layout.fillWidth: true
                        }
                    }
                }
            }
        }

        footer: Rectangle{
            id:testFooterRect
            height: 80
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            RowLayout{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                Rectangle{
                    Layout.alignment: Qt.AlignBottom
                    height: 50
                    width: 50
                    radius: 25
                    color: Universal.accent
                    Image {
                        anchors.centerIn: parent
                        source: "qrc:/img/img/previous.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Previous")
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
                    }
                }
                Rectangle{
                    Layout.column: 1
                    Layout.alignment: Qt.AlignBottom
                    Layout.leftMargin: 10
                    height: 50
                    width: 50
                    radius: 25
                    color: Universal.accent
                    Image {
                        anchors.centerIn: parent
                        source: "qrc:/img/img/next.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: navigationModel.currentView = navigationModel.getTargetView("Next")
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
                    }
                }
                Item{
                    Layout.fillWidth: true
                }
                Rectangle{
                    Layout.alignment: Qt.AlignBottom
                    height: 50
                    width: 50
                    radius: 25
                    color: Universal.accent
                    Image {
                        id: setupImage
                        anchors.centerIn: parent
                        source: "qrc:/img/img/Settings-25.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: testSetupPopup.open()
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
                    }
                }
                Rectangle{
                    id: toggleButton
                    Layout.alignment: Qt.AlignBottom
                    Layout.leftMargin: 10
                    height: 70
                    width: 70
                    radius: 35
                    color: Universal.accent
                    property alias imageSource: buttonImage.source
                    state: "play"
                    Image {
                        id: buttonImage
                        anchors.centerIn: parent
                        smooth: true
                    }
                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        onPressed: {
                            parent.opacity = 0.9
                            if (parent.state == "play") {
                                parent.state = "pause"
                            }
                            else if(parent.state == "pause"){
                                parent.state = "stop"
                            }
                            else{
                                parent.state = "play"
                            }
                        }
                        onReleased: parent.opacity = 1
                    }
                    states: [
                        State {
                            name: "play"
                            PropertyChanges {
                                target: toggleButton
                                imageSource: "qrc:/img/img/play-button.png"
                            }
                        },
                        State {
                            name: "stop"
                            PropertyChanges {
                                target: toggleButton
                                imageSource: "qrc:/img/img/stop-button.png"
                            }
                        },
                        State {
                            name: "pause"
                            PropertyChanges {
                                target: toggleButton
                                imageSource: "qrc:/img/img/pause-button.png"
                            }
                        }
                    ]
                }
            }
        }
    }
    Popup {
        id: testSetupPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: Universal.theme == Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: TestSetup{}
    }
}

