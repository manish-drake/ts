import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1

Item {
    Rectangle{
        anchors.fill: parent
        color: "transparent"
        Page{
            anchors.fill: parent
            header: Rectangle{
                id:testHeaderRect
                height: 50
                width: parent.width
                color: Universal.background
                Text {
                    id: title
                    text: "Saved Data"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Universal.foreground
                }
                Rectangle{
                    id: rectangle
                    height:25
                    width: 25
                    Layout.fillHeight: true
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 10
                    anchors.right: parent.right
                    color:"transparent"
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
                    currentIndex: -1
                    anchors.fill: parent
                    spacing: 10
                    anchors.margins: 10
                    clip: true
                    highlight:Rectangle{
                        color:"transparent"
                        border.color: Universal.theme == Universal.Dark ? "white" : Universal.accent
                        border.width: 1
                        radius:5
                    }
                    model: snapshotModel
                    ListModel{
                        id: dataListModel
                        ListElement {
                            datetime: "5/5/2017 11:43:78"
                            user: "Operator"
                        }
                        ListElement {
                            datetime: "5/5/2017 12:11:09"
                            user: "Operator"
                        }
                    }
                    delegate:Component{
                        Item{
                            width: parent.width
                            height: 60
                            Rectangle {
                                id: rectangle
                                anchors.fill: parent
                                color: Universal.theme == Universal.Dark ? "#333333" : "#fcfcfc"
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
                                    id: text1
                                    x: 8
                                    y: 9
                                    text: Qt.formatDateTime(dtSnapshot,"MMM d yyyy hh:mm:ss")
                                    fontSizeMode: Text.Fit
                                    font.pixelSize: 14
                                    font.weight: Font.DemiBold
                                    color: Universal.foreground
                                }

                                Text {
                                    id: text3
                                    x: 8
                                    y: 29
                                    text: qsTr("USER:")
                                    fontSizeMode: Text.HorizontalFit
                                    font.pixelSize: 14
                                    color: Universal.foreground
                                }

                                Text {
                                    id: text4
                                    x: 90
                                    y: 29
                                    text: user
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
            }

            footer:Rectangle{
                height: 40
                width: parent.width
                color: Universal.background
                Text{
                    enabled: dataListView.currentIndex != -1
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    text: "Show"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    color: Universal.foreground
                    opacity: enabled ? 1.0 : 0.4
                    MouseArea {
                        anchors.fill: parent
                        onClicked: savedDataPopup.close()
                    }
                }
            }
        }
    }
}
