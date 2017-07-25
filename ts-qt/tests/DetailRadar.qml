import QtQuick 2.7
//import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    Page {
        anchors.fill: parent

        header: DetailHeader{
            id: detailHeader
            pageCount: 7
        }

        contentItem: Rectangle{
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: content.height + 10
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                ColumnLayout{
                    id: content
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 10
                    spacing: 5
                    Item{
                        height: 50
                        width: 50
                        Image {
                            id: graphImg
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            source: "qrc:/img/img/Area Chart-25.png"
                        }
//                        ColorOverlay{
//                            anchors.fill: graphImg
//                            source: graphImg
//                            color: Universal.foreground
//                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:navigationModel.currentView = navigationModel.getTargetView("Graph")
                        }
                    }
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

        footer: DetailFooter{
            id: detailFooter
        }
    }

    Popup {
        id: detailMenuPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: DetailMenu{}
    }
    Popup {
        id: testSetupPopup
        height: parent.height
        width: parent.width
        modal: true
        padding: 0
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: TestSetup{}
    }
}

