import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1

Rectangle {
    border.color: "gray"
    border.width: 1
    Page{
        anchors.fill: parent
        anchors.margins: 1
        header: Rectangle{
            id:testHeaderRect
            height: 50
            anchors.left:parent.left
            anchors.right:parent.right
            color: Universal.background
            Item{
                height:25
                width: 25
                Layout.fillHeight: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 10
                anchors.left: parent.left
                visible: dataListView.currentIndex != -1
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/Delete2-25.png"
                    ColorOverlay{
                        anchors.fill: parent
                        source: parent
                        color: Universal.foreground
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {}
                }
            }
            Text {
                id: title
                text: "Saved Data"
                font.pixelSize: 16
                font.weight: Font.DemiBold
                anchors.centerIn: parent
                color: Universal.foreground
            }
            Item{
                height:25
                width: 25
                Layout.fillHeight: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 10
                anchors.right: parent.right
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/Delete-25.png"
                    ColorOverlay{
                        anchors.fill: parent
                        source: parent
                        color: Universal.foreground
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: savedDataPopup.close()
                }
            }
        }

        contentItem:Rectangle{
            color: Universal.background
            ListView{
                id: dataListView
                anchors.fill: parent
                spacing: 10
                clip: true
                anchors.margins: 10
                highlightMoveDuration: 0
                highlight:Rectangle{
                    color:"transparent"
                    border.color: Universal.theme == Universal.Dark ? "white" : Universal.accent
                    border.width: 1
                    radius:3
                }
                model: snapshotModel
                delegate:Component{
                    Item{
                        anchors.left:parent.left
                        anchors.right:parent.right
                        height: 50
                        Rectangle {
                            id: rectangle
                            anchors.fill: parent
                            color: Universal.theme == Universal.Dark ? "#333333" : "#fcfcfc"
                            border.color: "#0d000000"
                            border.width: 1
                            radius: 3
                            layer.enabled: true
                            layer.effect: DropShadow {
                                transparentBorder: true
                                horizontalOffset: 1.1
                                verticalOffset: 1.1
                                radius: 4.0
                                color: "#33000000"
                                spread: 0
                            }
                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 10
                                text: Qt.formatDateTime(dtSnapshot,"MMM d yyyy hh:mm:ss")
                                fontSizeMode: Text.Fit
                                font.pixelSize: 14
                                font.weight: Font.DemiBold
                                color: Universal.foreground
                            }

                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.right: parent.right
                                anchors.rightMargin: 10
                                text: qsTr("USER: " + user)
                                fontSizeMode: Text.HorizontalFit
                                font.pixelSize: 14
                                color: Universal.foreground
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked:{
                                    dataListView.currentIndex = index
                                }
                            }
                        }
                    }
                }
            }
            Binding{
                target: snapshotModel
                property: "idx"
                value: dataListView.currentIndex
            }
        }

        footer:Rectangle{
            height: 40
            anchors.left:parent.left
            anchors.right:parent.right
            color: Universal.background
            Text{
                enabled: dataListView.currentIndex != -1
                anchors.centerIn: parent
                text: "VIEW"
                font.pixelSize: 16
                font.weight: Font.DemiBold
                color: Universal.foreground
                opacity: enabled ? 1.0 : 0.4
                MouseArea {
                    anchors.fill: parent
                    onClicked:{
                        savedDataPopup.close();
                    }
                }
            }
        }
    }
}

