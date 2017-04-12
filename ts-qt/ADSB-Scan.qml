import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import QtQuick 2.7



Rectangle{
    anchors.fill: parent
    border.color: "#0d000000"
    border.width: 1
    radius:5
    anchors.leftMargin: 10
    anchors.rightMargin: 10
    anchors.topMargin: 10
    anchors.bottomMargin: 10
    Page {
        id: item1
        anchors.fill: parent

        header: Rectangle{
            id:testHeaderRect
            height: 40
            width: parent.width
            color:"transparent"
            Rectangle{
                id: rectangle1
                anchors.margins: 10
                Layout.fillHeight: true
                width: 25
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                color:"transparent"
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/pointer.png"
                }


            }

            Column{
                topPadding: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: title
                    text: "Title"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    anchors.horizontalCenter: parent.horizontalCenter

                }
                PageIndicator {
                    id: pageIndicator
                    anchors.horizontalCenter: parent.horizontalCenter
                    count: 7
                    currentIndex: summaryModel.currentPage
                }
            }



            Rectangle{
                id: rectangle
                width: 25
                Layout.fillHeight: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 10
                anchors.right: parent.right
                color:"transparent"
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/close.png"
                }
            }


        }

        contentItem: Rectangle{
            anchors.top: Header.bottom
            anchors.bottom: Footer.top
            color: "transparent"
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
            Component{
                id:aircraftDetail
                Item{
                    width: parent.width
                    height: 100

                    Aircraft{
                        anchors.fill:parent
                        anchors.margins: 1
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked:{
                            listView.currentIndex = index
                        }
                    }
                }
            }
            ListView{
                id: listView
                anchors.fill:parent
                model:aircraftModel
                delegate:aircraftDetail
                spacing: 10
                anchors.margins: 10
                clip: true
                highlight:Rectangle{
                    color:"#377DF3"
                    radius:5
                }
            }
        }

        footer: Rectangle{
            id:testFooterRect
            height: 50
            width: parent.width
            Text{
                text:"< PREVIOUS"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                color: "#387EF5"
                font.pointSize: 10
                MouseArea {
                    anchors.fill: parent
                    onClicked:navigationModel.currentView = navigationModel.getTargetView("Previous")
                }

            }

            Rectangle {
                id: toggleButton
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                height: 38
                width: 38
                property alias imageSource: buttonImage.source
                signal selected()
                signal pushed()
                color: "transparent"
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
                }
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onPressed: {
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
                            imageSource: "qrc:/img/img/stop.png"
                        }
                    },
                    State {
                        name: "off"
                        PropertyChanges {
                            target: toggleButton
                            scale: 1/0.95
                            imageSource: "qrc:/img/img/play.png"
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
                font.pointSize: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                color: "#387EF5"
                MouseArea {
                    anchors.fill: parent
                    onClicked:{
                        navigationModel.currentView = navigationModel.getTargetView("Next")
                    }
                }
            }
        }
    }

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        horizontalOffset: 1.1
        verticalOffset: 1.1
        radius: 4.0
        color: "#0d000000"
        spread: 0
    }
}

