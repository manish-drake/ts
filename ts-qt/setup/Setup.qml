import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Item {
    anchors.fill: parent
    Flickable {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        contentWidth: parent.width;
        contentHeight: grid.height + 10
        Grid{
            id: grid
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 5
            columns: 2
             Item{
                width: grid.width/2
                height: 200
                Rectangle{
                    anchors.fill: parent
                    anchors.margins: 5
                    clip: true
                    color: Universal.background
                    border.color: "#0d000000"
                    border.width: 1
                    radius: 3
                    layer.enabled: true
                    layer.effect: DropShadow {
                        transparentBorder: true
                        horizontalOffset: 1.1
                        verticalOffset: 1.1
                        radius: 4.0
                        color: "#26000000"
                        spread: 0
                    }
                    Text {
                        anchors.centerIn: parent
                        id: user
                        text: qsTr("USER")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                        color: Universal.foreground
                    }
                    Column {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        Text {
                            font.pointSize: 10
                            text: qsTr("Current User: Operator")
                            color: Universal.foreground
                        }
                        Text {
                            font.pointSize: 10
                            text: qsTr("Language: English")
                            color: Universal.foreground
                        }

                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("User")
                    }
                }
            }
             Item{
                width: grid.width/2
                height: 200
                Rectangle{
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    color: Universal.background
                    border.color: "#0d000000"
                    border.width: 1
                    radius: 3
                    layer.enabled: true
                    layer.effect: DropShadow {
                        transparentBorder: true
                        horizontalOffset: 1.1
                        verticalOffset: 1.1
                        radius: 4.0
                        color: "#26000000"
                        spread: 0
                    }
                    Text {
                        anchors.centerIn: parent
                        id: display
                        text: qsTr("DISPLAY")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                        color: Universal.foreground
                    }
                    Column {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        Text {
                            font.pointSize: 10
                            text: qsTr("Current Theme: Indoor")
                            color: Universal.foreground
                        }
                        Text {
                            font.pointSize: 10
                            text: qsTr("Brightness: 5/10")
                            color: Universal.foreground
                        }

                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Display")
                    }
                }
            }
             Item{
                width: grid.width/2
                height: 200
                Rectangle{
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    color: Universal.background
                    border.color: "#0d000000"
                    border.width: 1
                    radius: 3
                    layer.enabled: true
                    layer.effect: DropShadow {
                        transparentBorder: true
                        horizontalOffset: 1.1
                        verticalOffset: 1.1
                        radius: 4.0
                        color: "#26000000"
                        spread: 0
                    }
                    Text {
                        anchors.centerIn: parent
                        id: gps
                        text: qsTr("GPS")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                        color: Universal.foreground
                    }
                    Column {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        Text {
                            font.pointSize: 10
                            text: qsTr("Current Source: Internal")
                            color: Universal.foreground
                        }
                        Text {
                            font.pointSize: 10
                            text: qsTr("Current Lat: 40° 43' 50.1960'' N")
                            color: Universal.foreground
                        }
                        Text {
                            font.pointSize: 10
                            text: qsTr("Current Lon: 73° 56' 6.8712'' W")
                            color: Universal.foreground
                        }

                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("GPS")
                    }
                }
            }
             Item{
                width: grid.width/2
                height: 200
                Rectangle{
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    color: Universal.background
                    border.color: "#0d000000"
                    border.width: 1
                    radius: 3
                    layer.enabled: true
                    layer.effect: DropShadow {
                        transparentBorder: true
                        horizontalOffset: 1.1
                        verticalOffset: 1.1
                        radius: 4.0
                        color: "#26000000"
                        spread: 0
                    }
                    Text {
                        anchors.centerIn: parent
                        id: network
                        text: qsTr("NETWORK")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                        color: Universal.foreground
                    }
                    Column {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        Text {
                            font.pointSize: 10
                            text: qsTr("WiFi Enabled: Yes")
                            color: Universal.foreground
                        }
                        Text {
                            font.pointSize: 10
                            text: qsTr("Allow local access: No")
                            color: Universal.foreground
                        }
                        Text {
                            font.pointSize: 10
                            text: qsTr("Allow remote access: No")
                            color: Universal.foreground
                        }

                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Network")
                    }
                }
            }
             Item{
                width: grid.width/2
                height: 200
                Rectangle{
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    color: Universal.background
                    border.color: "#0d000000"
                    border.width: 1
                    radius: 3
                    layer.enabled: true
                    layer.effect: DropShadow {
                        transparentBorder: true
                        horizontalOffset: 1.1
                        verticalOffset: 1.1
                        radius: 4.0
                        color: "#26000000"
                        spread: 0
                    }
                    Text {
                        anchors.centerIn: parent
                        id: sysInfo
                        text: qsTr("SYSTEM INFO")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                        color: Universal.foreground
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("System-Info")
                    }
                }
            }
             Item{
                width: grid.width/2
                height: 200
                Rectangle{
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    color: Universal.background
                    border.color: "#0d000000"
                    border.width: 1
                    radius: 3
                    layer.enabled: true
                    layer.effect: DropShadow {
                        transparentBorder: true
                        horizontalOffset: 1.1
                        verticalOffset: 1.1
                        radius: 4.0
                        color: "#26000000"
                        spread: 0
                    }
                    Text {
                        anchors.centerIn: parent
                        id: conn
                        text: qsTr("CONNECTION")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                        color: Universal.foreground
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Connection")
                    }
                }
            }
             Item{
                width: grid.width/2
                height: 200
                Rectangle{
                    anchors.fill: parent
                    anchors.margins: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    color: Universal.background
                    border.color: "#0d000000"
                    border.width: 1
                    radius: 3
                    layer.enabled: true
                    layer.effect: DropShadow {
                        transparentBorder: true
                        horizontalOffset: 1.1
                        verticalOffset: 1.1
                        radius: 4.0
                        color: "#26000000"
                        spread: 0
                    }
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("RUN MANUAL BIT")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                        color: Universal.foreground
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Run-Manual-Bit")
                    }
                }
            }
        }
    }
}
