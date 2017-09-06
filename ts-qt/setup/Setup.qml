import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item {
    anchors.fill: parent
    ColumnLayout{
        anchors.fill: parent
        Flickable {
            anchors.left: parent.left
            anchors.right: parent.right
            Layout.fillHeight: true
            contentWidth: parent.width;
            contentHeight: content.height + 10
            ColumnLayout{
                id: content
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.topMargin: 5
                spacing: 0
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 80
                    Rectangle{
                        anchors.fill: parent
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.leftMargin: 11
                        anchors.rightMargin: 11
                        color: Universal.theme === Universal.Light ? Universal.background : "#222222"
                        radius: 4
                        Text {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: 10
                            text: qsTr("DISPLAY")
                            elide:Text.ElideRight
                            font.pixelSize: 18
                            font.weight: Font.Black
                            font.capitalization: Font.AllUppercase
                            font.family: robotoRegular.name
                            color: Universal.accent
                        }
                        GridLayout {
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 10
                            columnSpacing: 5
                            Text {
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                text: qsTr("THEME:")
                                color: Universal.foreground
                                opacity: 0.7
                            }
                            Text {
                                Layout.column: 1
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                text: _theme === Universal.Dark ? "Outdoor" : "Indoor"
                                color: Universal.foreground
                            }
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.7
                        onReleased: parent.opacity = 1
                        onCanceled: parent.opacity = 1
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Display")
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 80
                    Rectangle{
                        anchors.fill: parent
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.leftMargin: 11
                        anchors.rightMargin: 11
                        color: Universal.theme === Universal.Light ? Universal.background : "#222222"
                        radius: 4
                        Text {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: 10
                            id: user
                            text: qsTr("USER")
                            elide:Text.ElideRight
                            font.pixelSize: 18
                            font.weight: Font.Black
                            font.capitalization: Font.AllUppercase
                            font.family: robotoRegular.name
                            color: Universal.accent
                        }
                        GridLayout {
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 8
                            columnSpacing: 5
                            Text {
                                font.family: robotoRegular.name
                                font.pixelSize: 12
                                text: qsTr("USER:")
                                color: Universal.foreground
                                opacity: 0.7
                            }
                            Text {
                                Layout.column: 1
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                text: currentUser
                                color: Universal.foreground
                            }
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.7
                        onReleased: parent.opacity = 1
                        onCanceled: parent.opacity = 1
                        onClicked: {
                            zmq.queryUsers();
                            navigationModel.currentView = navigationModel.getTargetView("User");
                        }
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 80
                    Rectangle{
                        anchors.fill: parent
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.leftMargin: 11
                        anchors.rightMargin: 11
                        color: Universal.theme === Universal.Light ? Universal.background : "#222222"
                        radius: 4
                        Text {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: 10
                            text: qsTr("GPS")
                            elide:Text.ElideRight
                            font.pixelSize: 18
                            font.weight: Font.Black
                            font.capitalization: Font.AllUppercase
                            font.family: robotoRegular.name
                            color: Universal.accent
                        }
                        GridLayout {
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 10
                            columnSpacing: 5
                            Text {
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                text: qsTr("SOURCE:")
                                color: Universal.foreground
                                opacity: 0.7
                            }
                            Text {
                                font.family: robotoRegular.name
                                Layout.column: 1
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                                font.pixelSize: 12
                                text: qsTr("Internal")
                                color: Universal.foreground
                            }
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.7
                        onReleased: parent.opacity = 1
                        onCanceled: parent.opacity = 1
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("GPS")
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 80
                    Rectangle{
                        anchors.fill: parent
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.leftMargin: 11
                        anchors.rightMargin: 11
                        color: Universal.theme === Universal.Light ? Universal.background : "#222222"
                        radius: 4
                        Text {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: 10
                            text: qsTr("NETWORK")
                            elide:Text.ElideRight
                            font.pixelSize: 18
                            font.weight: Font.Black
                            font.capitalization: Font.AllUppercase
                            font.family: robotoRegular.name
                            color: Universal.accent
                        }
                        GridLayout {
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 10
                            columnSpacing: 5
                            Text {
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                text: qsTr("WIFI:")
                                color: Universal.foreground
                                opacity: 0.7
                            }
                            Text {
                                Layout.column: 1
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                                font.pixelSize: 12
                                font.family: robotoRegular.name
                                text: qsTr("On")
                                color: Universal.foreground
                            }
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.7
                        onReleased: parent.opacity = 1
                        onCanceled: parent.opacity = 1
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Network")
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 80
                    Rectangle{
                        anchors.fill: parent
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.leftMargin: 11
                        anchors.rightMargin: 11
                        color: Universal.theme === Universal.Light ? Universal.background : "#222222"
                        radius: 4
                        Text {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: 10
                            text: qsTr("SYSTEM INFO")
                            elide:Text.ElideRight
                            font.pixelSize: 18
                            font.weight: Font.Black
                            font.capitalization: Font.AllUppercase
                            font.family: robotoRegular.name
                            color: Universal.accent
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.7
                        onReleased: parent.opacity = 1
                        onCanceled: parent.opacity = 1
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("System-Info")
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 80
                    Rectangle{
                        anchors.fill: parent
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.leftMargin: 11
                        anchors.rightMargin: 11
                        color: Universal.theme === Universal.Light ? Universal.background : "#222222"
                        radius: 4
                        Text {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: 10
                            text: qsTr("CONNECTION")
                            elide:Text.ElideRight
                            font.pixelSize: 18
                            font.weight: Font.Black
                            font.capitalization: Font.AllUppercase
                            font.family: robotoRegular.name
                            color: Universal.accent
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.7
                        onReleased: parent.opacity = 1
                        onCanceled: parent.opacity = 1
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Connection")
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 80
                    Rectangle{
                        anchors.fill: parent
                        anchors.topMargin: 3
                        anchors.bottomMargin: 3
                        anchors.leftMargin: 11
                        anchors.rightMargin: 11
                        color: Universal.theme === Universal.Light ? Universal.background : "#222222"
                        radius: 4
                        Text {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: 10
                            text: qsTr("RUN MANUAL BIT")
                            elide:Text.ElideRight
                            font.pixelSize: 18
                            font.weight: Font.Black
                            font.capitalization: Font.AllUppercase
                            font.family: robotoRegular.name
                            color: Universal.accent
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.7
                        onReleased: parent.opacity = 1
                        onCanceled: parent.opacity = 1
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Run-Manual-Bit")
                    }
                }
            }
        }
        Text{
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            Layout.bottomMargin: 3
            horizontalAlignment: Text.AlignRight
            text: "App Version 0.0.01"
            font.pixelSize: 13
            font.weight: Font.Bold
            elide: Text.ElideRight
            color: Universal.foreground
            opacity: 0.6
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
