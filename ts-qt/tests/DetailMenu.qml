import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    property int testID
    RowLayout{
        anchors.left: parent.left
        anchors.right: parent.right
        Rectangle{
            Layout.fillWidth: true
            Layout.maximumWidth: 500
            Layout.alignment: Qt.AlignHCenter
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            radius: 4
            height: content.height
            ColumnLayout{
                id: content
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                spacing: 0
                Item{
                    height: 40
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 5
                    Layout.bottomMargin: 12
                    Text {
                        anchors.centerIn: parent
                        text: "OPTIONS"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                    Rectangle{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        width: 55
                        color: closeMouseArea.pressed ? "#80aaaaaa" : "transparent"
                        Image {
                            id: closeImg
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Delete-25.png"
                        }
                        MouseArea {
                            id: closeMouseArea
                            anchors.fill: parent
                            onPressed: parent.opacity = 0.5
                            onReleased: parent.opacity = 1
                            onClicked: menuPopup.close()
                        }
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 49
                    visible: testID == 6 ? true : false
                    Rectangle{
                        anchors.fill: parent
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.topMargin: 2
                        anchors.bottomMargin: 2
                        color: Universal.accent
                        radius: 4
                        RowLayout{
                            anchors.fill: parent
                            Item{
                                height: listImg.height
                                width: listImg.width
                                Layout.leftMargin: 30
                                Layout.alignment: Qt.AlignVCenter
                                Image {
                                    id: listImg
                                    source: "qrc:/img/img/List.png"
                                }
                            }
                            Text{
                                Layout.leftMargin: 10
                                Layout.alignment: Qt.AlignVCenter
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                                text: "TESTS LIST"
                                font.pixelSize: 13
                                font.weight: Font.Bold
                                color: "white"
                            }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: {
                            menuPopup.close()
                            transponderTestsListPopup.open()
                        }
                    }
                }
                Rectangle{
                    Layout.margins: 5
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 60
                    height: 1
                    color: Universal.foreground
                    opacity: 0.2
                    visible: testID == 6 ? true : false
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 49
                    Rectangle{
                        anchors.fill: parent
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.topMargin: 2
                        anchors.bottomMargin: 2
                        color: Universal.accent
                        radius: 4
                        RowLayout{
                            anchors.fill: parent
                            Item{
                                height: saveImg.height
                                width: saveImg.width
                                Layout.leftMargin: 30
                                Layout.alignment: Qt.AlignVCenter
                                Image {
                                    id: saveImg
                                    source: "qrc:/img/img/Download-white.png"
                                }
                            }
                            Text{
                                Layout.leftMargin: 10
                                Layout.alignment: Qt.AlignVCenter
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                                text: "SAVE TEST RESULTS"
                                font.pixelSize: 13
                                font.weight: Font.Bold
                                color: "white"
                            }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: {}
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 49
                    Rectangle{
                        anchors.fill: parent
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.topMargin: 2
                        anchors.bottomMargin: 2
                        color: Universal.accent
                        radius: 4
                        RowLayout{
                            anchors.fill: parent
                            Item{
                                height: exitImg.height
                                width: exitImg.width
                                Layout.leftMargin: 26
                                Layout.alignment: Qt.AlignVCenter
                                Image {
                                    id: exitImg
                                    source: "qrc:/img/img/exit.png"
                                }
                            }
                            Text{
                                Layout.leftMargin: 10
                                Layout.alignment: Qt.AlignVCenter
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                                text: "EXIT TO TEST LANDING PAGE"
                                font.pixelSize: 13
                                font.weight: Font.Bold
                                color: "white"
                            }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: {
                            navigationModel.currentView = navigationModel.getTargetView(
                                        "back",
                                        {"isHome": navigationModel.navigationParameter.isHome}
                                        )
                        }
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 49
                    visible: testID == 6 ? true : false
                    Rectangle{
                        anchors.fill: parent
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.topMargin: 2
                        anchors.bottomMargin: 2
                        color: Universal.accent
                        radius: 4
                        RowLayout{
                            anchors.fill: parent
                            Item{
                                height: restartImg.height
                                width: restartImg.width
                                Layout.leftMargin: 30
                                Layout.alignment: Qt.AlignVCenter
                                Image {
                                    id: restartImg
                                    source: "qrc:/img/img/SkiptoStart.png"
                                }
                            }
                            Text{
                                Layout.leftMargin: 10
                                Layout.alignment: Qt.AlignVCenter
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                                text: "RESTART TESTS"
                                font.pixelSize: 13
                                font.weight: Font.Bold
                                color: "white"
                            }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: {}
                    }
                }
                Rectangle{
                    Layout.margins: 5
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 60
                    height: 1
                    color: Universal.foreground
                    opacity: 0.2
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 49
                    Rectangle{
                        anchors.fill: parent
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.topMargin: 2
                        anchors.bottomMargin: 2
                        color: Universal.accent
                        radius: 4
                        RowLayout{
                            anchors.fill: parent
                            Item{
                                height: starImg.height
                                width: starImg.width
                                Layout.leftMargin: 30
                                Layout.alignment: Qt.AlignVCenter
                                Image {
                                    id: starImg
                                    source: testModel.isFavourite(navigationModel.navigationParameter.id) ?
                                                "qrc:/img/img/Star Filled.png" : "qrc:/img/img/star-white.png"
                                }
                            }
                            Text{
                                Layout.leftMargin: 10
                                Layout.alignment: Qt.AlignVCenter
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                                text: testModel.isFavourite(navigationModel.navigationParameter.id) ?
                                          "REMOVE FROM HOMEPAGE" : "ADD TO HOMEPAGE"
                                font.pixelSize: 13
                                font.weight: Font.Bold
                                color: "white"
                            }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: {
                            testModel.setFavourite(
                                        navigationModel.navigationParameter.id,
                                        !testModel.isFavourite(navigationModel.navigationParameter.id));
                            menuPopup.close()
                        }
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 49
                    Layout.bottomMargin: 15
                    Rectangle{
                        anchors.fill: parent
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.topMargin: 2
                        anchors.bottomMargin: 2
                        color: Universal.accent
                        radius: 4
                        RowLayout{
                            anchors.fill: parent
                            Item{
                                height: brighnessImg.height
                                width: brighnessImg.width
                                Layout.leftMargin: 30
                                Layout.alignment: Qt.AlignVCenter
                                Image {
                                    id: brighnessImg
                                    source: "qrc:/img/img/brightness.png"
                                }
                            }
                            Text{
                                Layout.leftMargin: 10
                                Layout.alignment: Qt.AlignVCenter
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                                text: "DISPLAY OPTIONS"
                                font.pixelSize: 13
                                font.weight: Font.Bold
                                color: "white"
                            }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: {
                            menuPopup.close()
                            displayOptionsPopup.open()
                        }
                    }
                }
            }
        }
    }
}

