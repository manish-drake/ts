import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
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
                spacing: 4
                Item{
                    height: 40
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 5
                    Layout.bottomMargin: 10
                    Text {
                        anchors.centerIn: parent
                        text: "OPTIONS"
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
                        anchors.rightMargin: 15
                        width: 35
                        Image {
                            id: closeImg
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Delete-25.png"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onPressed: parent.opacity = 0.5
                            onReleased: parent.opacity = 1
                            onClicked: menuPopup.close()
                        }
                    }
                }
                Rectangle{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    height: 45
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
                Rectangle{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    height: 45
                    color: Universal.accent
                    radius: 4
                    RowLayout{
                        anchors.fill: parent
                        Item{
                            height: attachImg.height
                            width: attachImg.width
                            Layout.leftMargin: 30
                            Layout.alignment: Qt.AlignVCenter
                            Image {
                                id: attachImg
                                source: "qrc:/img/img/List View.png"
                            }
                        }
                        Text{
                            Layout.leftMargin: 10
                            Layout.alignment: Qt.AlignVCenter
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            text: "APP LOGS"
                            font.pixelSize: 13
                            font.weight: Font.Bold
                            color: "white"
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: {
                            menuPopup.close()
                            navigationModel.currentView = navigationModel.getTargetView("App-Logs")
                            sideMenu.selectedMenuIndex = -1
                        }
                    }
                }
                Text{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    Layout.bottomMargin: 20
                    horizontalAlignment: Text.AlignRight
                    text: "App Version 0.0.01"
                    font.pixelSize: 12
                    color: Universal.foreground
                    opacity: 0.7
                    font.family: robotoRegular.name
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: {
                            menuPopup.close();
                            connectionReqPopup.open()
                        }
                    }
                }
            }
        }
    }
}

