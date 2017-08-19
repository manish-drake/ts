import QtQuick 2.0
import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
//import QtGraphicalEffects 1.0

Rectangle{
    anchors.left: parent.left
    anchors.right: parent.right
    color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
    radius: 4
    Column{
        id: columnLayout
        anchors.left: parent.left
        anchors.right: parent.right
        CustomSwitchDelegate{
            text: Universal.theme === Universal.Light ? "INDOOR" : "OUTDOOR"
            source: Universal.theme === Universal.Light ? "qrc:/img/img/Sun Filled-25.png" : "qrc:/img/img/Sun Filled-white.png"
            isChecked: true
            MouseArea{
                anchors.fill: parent                
                onPressed: parent.opacity = 0.5
                onReleased: parent.opacity = 1
                onClicked: {
                    if(Universal.theme === Universal.Light) {
                        _theme = Universal.Dark
                    }
                    else {_theme = Universal.Light}
                    menuPopup.close()
                }
            }
        }
        RowLayout{
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 10
            height: 30
            Item{
                Layout.fillWidth: true
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                Row{
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    spacing: 5
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        width: 20
                        Image{
                            id: imageAttach
                            anchors.verticalCenter: parent.verticalCenter
                            source: "qrc:/img/img/Attach-18.png"
                        }
//                        ColorOverlay{
//                            anchors.fill: imageAttach
//                            source: imageAttach
//                            color: Universal.foreground
//                        }
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: "App Logs"
                        font.pixelSize: 12
                        font.family: robotoRegular.name
                        color: Universal.foreground
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed: parent.opacity = 0.5
                    onReleased: parent.opacity = 1
                    onClicked:{
                        menuPopup.close()
                        navigationModel.currentView = navigationModel.getTargetView("App-Logs")
                    }
                }
            }
            Text{
                Layout.column: 1
                text: "Version 0.0.01"
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

