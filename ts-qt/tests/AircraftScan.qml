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
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right
        color: Universal.background
        Item{
            id: rectangle1
            height:25
            width: 25
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/Radar-25.png"
                ColorOverlay{
                    anchors.fill: parent
                    source: parent
                    color: Universal.foreground
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("Radar")
            }
        }

        Column{
            topPadding: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: testDetailTitleText
                text: navigationModel.navigationParameter.title
                font.pixelSize: 16
                font.weight: Font.DemiBold
                anchors.horizontalCenter: parent.horizontalCenter
                color: Universal.foreground
            }
            PageIndicator {
                id: pageIndicator
                anchors.horizontalCenter: parent.horizontalCenter
                count: 7
                currentIndex: summaryModel.currentPage
                ColorOverlay{
                    anchors.fill: parent
                    source: parent
                    color: Universal.foreground
                    visible: Universal.theme == Universal.Dark
                }
            }
        }

        Item{
            id: rectangle
            height:25
            width: 25
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: 10
            anchors.right: parent.right
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
        color: Universal.background
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
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right
        color: Universal.background
        Text{
            text:"< PREVIOUS"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            color: Universal.foreground
            font.pixelSize: 14
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("Previous")
            }

        }
        Item{
            id: toggleButton
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            height: 40
            width: 40
            property alias imageSource: buttonImage.source
            signal selected()
            signal pushed()
            state: "off"
            onStateChanged: {
                if (state == "on") {
                    selected()
                }
                else{
                    pushed()
                }
            }
            Image {
                id: buttonImage
                smooth: true
                anchors.fill: parent
                ColorOverlay{
                    anchors.fill: parent
                    source: parent
                    color: Universal.theme == Universal.Dark ? "white" : Universal.accent
                }
            }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onPressed: {
                    zmq.toggleScan()
                    console.log(zmq.scanResults)
                    if (parent.state == "off") {
                        parent.state = "on"
                    }
                    else{
                        parent.state = "off"
                    }
                }
            }
            states: [
                State {
                    name: "on"
                    PropertyChanges {
                        target: toggleButton
                        scale: 0.95
                        imageSource: "qrc:/img/img/stop-button.png"
                    }
                    //                        PropertyChanges {
                    //                            target: scanResults
                    //                            visible:true
                    //                        }
                },
                State {
                    name: "off"
                    PropertyChanges {
                        target: toggleButton
                        scale: 1/0.95
                        imageSource: "qrc:/img/img/play-button.png"
                    }
                }
            ]
            transitions: [
                Transition {
                    from: "off"
                    to: "on"
                    reversible: true
                    PropertyAnimation {
                        target: toggleButton
                        properties: "scale"
                        duration: 100
                    }
                }
            ]
        }


        Text {
            text: qsTr("NEXT >")
            font.pixelSize: 14
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            color: Universal.foreground
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
    }
}

