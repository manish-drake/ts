import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Rectangle{
    id:testFooterRect
    height: 110
    anchors.left: parent.left
    anchors.right: parent.right
    color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
    property bool isScanPage
    RowLayout{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        ColumnLayout{
            Layout.alignment: Qt.AlignBottom
            visible: detailHeader.pageCount > 1
            Rectangle{
                Layout.alignment: Qt.AlignHCenter
                height: 50
                width: 50
                radius: 25
                color: Universal.accent
                Image {
                    anchors.centerIn: parent
                    source: "qrc:/img/img/previous.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:navigationModel.currentView = navigationModel.getTargetView("Previous",{"id": navigationModel.navigationParameter.id})
                    onPressed: parent.opacity = 0.9
                    onReleased: parent.opacity = 1
                }
            }
            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "PREV"
                font.pixelSize: 12
                font.weight: Font.Black
                font.family: robotoRegular.name
                color: Universal.foreground
                opacity: 0.6
            }
        }

        ColumnLayout{
            Layout.alignment: Qt.AlignBottom
            Layout.leftMargin: 10
            visible: detailHeader.pageCount > 1
            Rectangle{
                Layout.alignment: Qt.AlignHCenter
                height: 50
                width: 50
                radius: 25
                color: Universal.accent
                Image {
                    anchors.centerIn: parent
                    source: "qrc:/img/img/next.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:{
                        navigationModel.setCurrentView(navigationModel.getTargetView("Next"), {
                                                           "id": navigationModel.navigationParameter.id,
                                                           "title": navigationModel.navigationParameter.title,
                                                           "runState": toggleButton.state
                                                       })
                    }
                    onPressed: parent.opacity = 0.9
                    onReleased: parent.opacity = 1
                }
            }
            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "NEXT"
                font.pixelSize: 12
                font.weight: Font.Black
                font.family: robotoRegular.name
                color: Universal.foreground
                opacity: 0.6
            }
        }
        Item{
            Layout.fillWidth: true
        }
        ColumnLayout{
            Layout.alignment: Qt.AlignBottom
            Rectangle{
                Layout.alignment: Qt.AlignHCenter
                height: 50
                width: 50
                radius: 25
                color: Universal.accent
                Image {
                    id: setupImage
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Settings-25.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: testSetupPopup.open()
                    onPressed: parent.opacity = 0.9
                    onReleased: parent.opacity = 1
                }
            }
            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "SETUP"
                font.pixelSize: 12
                font.weight: Font.Black
                font.family: robotoRegular.name
                color: Universal.foreground
                opacity: 0.6
            }
        }
        ColumnLayout{
            Layout.alignment: Qt.AlignBottom
            Layout.leftMargin: 10
            Rectangle{
                id: toggleButton
                Layout.alignment: Qt.AlignHCenter
                height: 70
                width: 70
                radius: 35
                color: Universal.accent
                property alias imageSource: buttonImage.source
                state: navigationModel.navigationParameter.runState
                Image {
                    id: buttonImage
                    anchors.centerIn: parent
                    smooth: true
                }
                states: [
                    State {
                        name: "start"
                        PropertyChanges {
                            target: toggleButton
                            imageSource: "qrc:/img/img/play-button.png"
                        }
                    },
                    State {
                        name: "stop"
                        PropertyChanges {
                            target: toggleButton
                            imageSource: "qrc:/img/img/stop-button.png"
                        }
                    },
                    State {
                        name: "pause"
                        PropertyChanges {
                            target: toggleButton
                            imageSource: "qrc:/img/img/pause-button.png"
                        }
                    }
                ]
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onPressed: {
                        parent.opacity = 0.9
                        if (parent.state == "start") {
                            parent.state = "pause"
                        }
                        else if(parent.state == "pause"){
                            parent.state = "stop"
                        }
                        else{
                            parent.state = "start"
                        }
                        if(isScanPage){
                            zmq.toggleScan()
                            console.log(zmq.scanResults)
                        }
                    }
                    onReleased: parent.opacity = 1
                }
            }
            Text {
                Layout.alignment: Qt.AlignHCenter
                text: toggleButton.state
                font.pixelSize: 12
                font.capitalization: Font.AllUppercase
                font.weight: Font.Black
                font.family: robotoRegular.name
                color: Universal.foreground
                opacity: 0.6
            }
        }
    }
}

