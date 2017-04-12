import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0

Item {
    anchors.fill: parent
    Flickable {
        width: parent.width;
        height: parent.height
        contentWidth: parent.width;
        contentHeight: grid.height + 10
        Grid{
            id: grid
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 5
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
                        id: user
                        text: qsTr("USER")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                    }
                    Column {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        Text {
                            font.pointSize: 10
                            text: qsTr("Current User: Operator")
                        }
                        Text {
                            font.pointSize: 10
                            text: qsTr("Language: English")
                        }

                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("User")
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
                    anchors.horizontalCenter: parent
                    anchors.verticalCenter: parent
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
                        id: display
                        text: qsTr("DISPLAY")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                    }
                    Column {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        Text {
                            font.pointSize: 10
                            text: qsTr("Current Theme: Indoor")
                        }
                        Text {
                            font.pointSize: 10
                            text: qsTr("Brightness: 5/10")
                        }

                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Display")
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
                    anchors.horizontalCenter: parent
                    anchors.verticalCenter: parent
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
                        id: gps
                        text: qsTr("GPS")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                    }
                    Column {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        Text {
                            font.pointSize: 10
                            text: qsTr("Current Source: Internal")
                        }
                        Text {
                            font.pointSize: 10
                            text: qsTr("Current Lat: 40° 43' 50.1960'' N")
                        }
                        Text {
                            font.pointSize: 10
                            text: qsTr("Current Lon: 73° 56' 6.8712'' W")
                        }

                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("GPS")
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
                    anchors.horizontalCenter: parent
                    anchors.verticalCenter: parent
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
                        id: network
                        text: qsTr("NETWORK")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                    }
                    Column {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        Text {
                            font.pointSize: 10
                            text: qsTr("WiFi Enabled: Yes")
                        }
                        Text {
                            font.pointSize: 10
                            text: qsTr("Allow local access: No")
                        }
                        Text {
                            font.pointSize: 10
                            text: qsTr("Allow remote access: No")
                        }

                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Network")
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
                    anchors.horizontalCenter: parent
                    anchors.verticalCenter: parent
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
                        id: sysInfo
                        text: qsTr("SYSTEM INFO")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("System-Info")
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
                    anchors.horizontalCenter: parent
                    anchors.verticalCenter: parent
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
                        id: conn
                        text: qsTr("CONNECTION")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Connection")
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
                    anchors.horizontalCenter: parent
                    anchors.verticalCenter: parent
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
                        text: qsTr("RUN MANUAL BIT")
                        elide:Text.ElideRight
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        clip:true
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
