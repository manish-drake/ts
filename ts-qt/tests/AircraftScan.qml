import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Page {
    id: item1
    anchors.fill: parent
    header: Rectangle{
        id:testHeaderRect
        height: 45
        anchors.left: parent.left
        anchors.right: parent.right
        color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
        Item{
            id: rectangle1
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: 50
            Image {
                id: image1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/Radar-25.png"
            }
            ColorOverlay{
                anchors.fill: image1
                source: image1
                color: Universal.foreground
            }
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("Radar")
            }
        }

        Text {
            id: testDetailTitleText
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            text: navigationModel.navigationParameter.title
            font.pixelSize: 18
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
            color: Universal.foreground
        }
        PageIndicator {
            id: pageIndicator
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            count: 7
            currentIndex: summaryModel.currentPage
        }
        ColorOverlay{
            anchors.fill: pageIndicator
            source: pageIndicator
            color: Universal.foreground
            visible: Universal.theme == Universal.Dark
        }

        Item{
            id: rectangle
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: 50
            Image {
                id: closeImage
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/Delete-25.png"
            }
            ColorOverlay{
                anchors.fill: closeImage
                source: closeImage
                color: Universal.foreground
            }
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
            }
        }


    }

    contentItem: Rectangle{
        id:scanResults
        color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
        ListView{
            id: aircraftListView
            currentIndex: -1
            anchors.fill:parent
            //model:zmq.scanResults
            model: aircraftModel
            delegate:aircraftDetail
            spacing: 5
            anchors.margins: 15
            clip: true
            highlightMoveDuration: 0
            highlight:Rectangle{
                color:"transparent"
                border.color: Universal.theme == Universal.Dark ? "white" : Universal.accent
                border.width: 1
                radius:5
            }
            Component{
                id:aircraftDetail
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 100
                    AircraftDelegate{
                        anchors.fill:parent
                        anchors.margins: 1
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            aircraftListView.currentIndex = index
                        }
                    }
                }
            }
            ListModel {//as per discussion only top four values will be displayed here
                id:aircraftModel
                ListElement {
                    aircraftId: "#1"
                    address: "2345AA (H) /23734510 (0)"
                    flight: "N 1246W"
                    bsdrevd: "0,5 0.8 0,9 6,0 6.1 6.5"
                    rflevel: "Strong"
                }
                ListElement {
                    aircraftId: "#2"
                    address: "CA310A (H) I 74361202 (0)"
                    flight: "Device1"
                    bsdrevd: "0.6 0.8 6,5"
                    rflevel: "Medium"
                }
                ListElement {
                    aircraftId: "#3"
                    address: "9CDA34 (H)/47800213 (0)"
                    flight: "VIPER1"
                    bsdrevd: "0,5 0.8 0,8 0.9 6.5"
                    rflevel: "Weak"
                }
                ListElement {
                    aircraftId: "#4"
                    address: "3BCA14 (H) /12800208 (0)"
                    flight: "Device2"
                    bsdrevd: "0,3 0,7 0.7 0.8 6.4"
                    rflevel: "Strong"
                }
            }
        }
    }

    footer: Rectangle{
        id:testFooterRect
        height: 60
        anchors.left: parent.left
        anchors.right: parent.right
        color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
        RowLayout{
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            Rectangle{
                Layout.alignment: Qt.AlignBottom
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
                    onClicked:navigationModel.currentView = navigationModel.getTargetView("Previous")
                }
            }

            Rectangle{
                Layout.column: 1
                Layout.alignment: Qt.AlignBottom
                Layout.leftMargin: 10
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
                                                           "title": navigationModel.navigationParameter.title,
                                                           "playState": toggleButton.state
                                                       })
                    }
                }
            }

            Item{
                Layout.column: 2
                Layout.fillWidth: true
                Layout.fillHeight: true
                Rectangle{
                    id: toggleButton
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    height: 60
                    width: 60
                    radius: 30
                    color: Universal.accent
                    property alias imageSource: buttonImage.source
                    state: "play"
                    Image {
                        id: buttonImage
                        anchors.centerIn: parent
                        smooth: true
                    }
                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        onPressed: {
                            zmq.toggleScan()
                            console.log(zmq.scanResults)
                            if (parent.state == "play") {
                                parent.state = "pause"
                            }
                            else if(parent.state == "pause"){
                                parent.state = "stop"
                            }
                            else{
                                parent.state = "play"
                            }
                        }
                    }
                    states: [
                        State {
                            name: "play"
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
                }
            }
        }
    }
}

