import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1

Item{
    RowLayout{
        anchors.fill: parent
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: 650
            Layout.alignment: Qt.AlignHCenter
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            radius: 4
            border.color: "gray"
            border.width: 1
            ColumnLayout{
                id: content
                anchors.fill: parent
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                anchors.bottomMargin: 15
                Item{
                    height: 40
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 5
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        width: 25
                        visible: dataListView.currentIndex != -1
                        Image {
                            id: deleteImg
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Delete2-25.png"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onPressed: parent.opacity = 0.5
                            onReleased: parent.opacity = 1
                            onClicked: {}
                        }
                    }
                    Text {
                        anchors.centerIn: parent
                        text: "SAVED RECORD"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        width: 25
                        Image {
                            id: closeImage
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Delete-25.png"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onPressed: parent.opacity = 0.5
                            onReleased: parent.opacity = 1
                            onClicked: savedDataPopup.close()
                        }
                    }
                }
                ListView{
                    id: dataListView
                    Layout.fillHeight: true
                    anchors.left:parent.left
                    anchors.right:parent.right
                    spacing: 10
                    highlightMoveDuration: 0
                    highlight:Rectangle{
                        color:"transparent"
                        border.color: Universal.theme === Universal.Dark ? "white" : Universal.accent
                        border.width: 2
                        radius:3
                    }
                    model: snapshotModel
                    delegate:Component{
                        Rectangle {
                            id: rectangle
                            anchors.left:parent.left
                            anchors.right:parent.right
                            height: 60
                            color: Universal.theme === Universal.Dark ? "#333333" : "#fcfcfc"
                            border.color: Universal.theme === Universal.Light ? "#0d000000" : "#4dffffff"
                            border.width: 2
                            radius: 4
                            MouseArea {
                                anchors.fill: parent
                                onPressed: parent.opacity = 0.5
                                onReleased: parent.opacity = 1
                                onCanceled: parent.opacity = 1
                                onClicked:{
                                    dataListView.currentIndex = index
                                }
                            }
                            RowLayout{
                                anchors.fill: parent
                                ColumnLayout{
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Text {
                                        Layout.fillWidth: true
                                        Layout.leftMargin: 10
                                        elide: Text.ElideRight
                                        text: Qt.formatDateTime(dtSnapshot,"MMM d yyyy hh:mm:ss")
                                        fontSizeMode: Text.Fit
                                        font.pixelSize: 14
                                        font.weight: Font.DemiBold
                                        font.family: robotoRegular.name
                                        color: Universal.foreground
                                    }
                                    Text {
                                        Layout.fillWidth: true
                                        Layout.leftMargin: 10
                                        elide: Text.ElideRight
                                        text: qsTr("USER: " + user)
                                        fontSizeMode: Text.HorizontalFit
                                        font.pixelSize: 14
                                        font.family: robotoRegular.name
                                        color: Universal.foreground
                                    }
                                }
                                Rectangle{
                                    Layout.fillHeight: true
                                    color: Universal.accent
                                    width: 50
                                    radius: 4
                                    visible: dataListView.currentIndex == index
                                    Image {
                                        id: forwardImg
                                        anchors.centerIn: parent
                                        source: "qrc:/img/img/Forward-16.png"
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        onPressed: parent.opacity = 0.5
                                        onReleased: parent.opacity = 1
                                        onCanceled: parent.opacity = 1
                                        onClicked: savedDataPopup.close()
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
        }
    }
}

