import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0


Item{
    Column{
        anchors.fill: parent
        Rectangle{
            id: header
            anchors.left: parent.left
            anchors.right: parent.right
            height:40
            color:"transparent"
            Text {
                anchors.centerIn: parent
                text: qsTr("USERS")
                elide:Text.ElideRight
                font.pixelSize: 14
                font.weight: Font.DemiBold
                clip:true
            }
            Rectangle{
                id: rectangle
                width: 40
                height: parent.height
                anchors.right: parent.right
                color:"transparent"
                Text{
                    anchors.centerIn: parent
                    text: "X"
                    font.pixelSize: 14
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
                    }
                }
            }
        }

        Flickable {
            width: parent.width;
            anchors.top: header.bottom
            anchors.bottom: parent.bottom
            contentWidth: parent.width;
            contentHeight: grid.height
            clip: true
            Grid{
                id: grid
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.bottomMargin: 5
                columns: 2
                Rectangle{
                    width: grid.width/2
                    height: 200
                    color:"transparent"
                    Rectangle{
                        anchors.fill: parent
                        anchors.margins: 5
                        clip: true
                        border.color: "#0d000000"
                        border.width: 1
                        radius: 5
                        layer.enabled: true
                        layer.effect: DropShadow {
                            transparentBorder: true
                            horizontalOffset: 1.1
                            verticalOffset: 1.1
                            radius: 4.0
                            color: "#0d000000"
                            spread: 0
                        }
                        Text {
                            anchors.centerIn: parent
                            text: qsTr("OPERATOR")
                            elide:Text.ElideRight
                            font.pointSize: 12
                            font.weight: Font.DemiBold
                            clip:true
                        }
                        Row {
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 10
                            Text {
                                font.pointSize: 10
                                text: qsTr("LANGUAGE: ")
                            }
                            Text {
                                font.pointSize: 10
                                text: qsTr("English")
                            }

                        }
                    }
                }
                Rectangle{
                    width: grid.width/2
                    height: 200
                    color:"transparent"
                    Rectangle{
                        anchors.fill: parent
                        anchors.margins: 5
                        clip: true
                        border.color: "#0d000000"
                        border.width: 1
                        radius: 5
                        layer.enabled: true
                        layer.effect: DropShadow {
                            transparentBorder: true
                            horizontalOffset: 1.1
                            verticalOffset: 1.1
                            radius: 4.0
                            color: "#0d000000"
                            spread: 0
                        }

                        Text {
                            anchors.centerIn: parent
                            text: qsTr("KEN FILARDO")
                            elide:Text.ElideRight
                            font.pointSize: 12
                            font.weight: Font.DemiBold
                            clip:true
                        }
                        Row {
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 10
                            Text {
                                font.pointSize: 10
                                text: qsTr("LANGUAGE: ")
                            }
                            Text {
                                font.pointSize: 10
                                text: qsTr("English")
                            }

                        }
                    }
                }
                Rectangle{
                    width: grid.width/2
                    height: 200
                    color:"transparent"
                    Rectangle{
                        anchors.fill: parent
                        anchors.margins: 5
                        clip: true
                        border.color: "#0d000000"
                        border.width: 1
                        radius: 5
                        layer.enabled: true
                        layer.effect: DropShadow {
                            transparentBorder: true
                            horizontalOffset: 1.1
                            verticalOffset: 1.1
                            radius: 4.0
                            color: "#0d000000"
                            spread: 0
                        }
                        Text {
                            anchors.centerIn: parent
                            text: qsTr("DAVE KLAMET")
                            elide:Text.ElideRight
                            font.pointSize: 12
                            font.weight: Font.DemiBold
                            clip:true
                        }
                        Row {
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 10
                            Text {
                                font.pointSize: 10
                                text: qsTr("LANGUAGE: ")
                            }
                            Text {
                                font.pointSize: 10
                                text: qsTr("English")
                            }

                        }
                    }
                }
                Rectangle{
                    width: grid.width/2
                    height: 200
                    color:"transparent"
                    Rectangle{
                        anchors.fill: parent
                        anchors.margins: 5
                        clip: true
                        border.color: "#0d000000"
                        border.width: 1
                        radius: 5
                        layer.enabled: true
                        layer.effect: DropShadow {
                            transparentBorder: true
                            horizontalOffset: 1.1
                            verticalOffset: 1.1
                            radius: 4.0
                            color: "#0d000000"
                            spread: 0
                        }
                        Text {
                            anchors.centerIn: parent
                            text: qsTr("STEVE O'HARA")
                            elide:Text.ElideRight
                            font.pointSize: 12
                            font.weight: Font.DemiBold
                            clip:true
                        }
                        Row {
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 10
                            Text {
                                font.pointSize: 10
                                text: qsTr("LANGUAGE: ")
                            }
                            Text {
                                font.pointSize: 10
                                text: qsTr("English")
                            }

                        }
                    }
                }
            }
        }
    }
}


