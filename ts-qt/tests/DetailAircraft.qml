import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    Page {
        anchors.fill: parent

        header: DetailHeader{}

        contentItem: Rectangle{
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            ColumnLayout{
                anchors.fill: parent
                Item{
                    Layout.leftMargin: 10
                    height: 50
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
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Radar", { "runState": toggleButton.state })
                    }
                }
                ListView{
                    id: aircraftListView
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Layout.fillHeight: true
                    currentIndex: -1
                    //model:zmq.scanResults
                    model: aircraftModel
                    delegate:aircraftDetail
                    spacing: 5
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15
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
        }

        footer: Rectangle{
            id:testFooterRect
            height: 110
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            RowLayout{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                ColumnLayout{
                    Layout.alignment: Qt.AlignBottom
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
                            onClicked:navigationModel.currentView = navigationModel.getTargetView("Previous")
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
                        MouseArea {
                            id: mouseArea
                            anchors.fill: parent
                            onPressed: {
                                parent.opacity = 0.9
                                zmq.toggleScan()
                                console.log(zmq.scanResults)
                                if (parent.state == "start") {
                                    parent.state = "pause"
                                }
                                else if(parent.state == "pause"){
                                    parent.state = "stop"
                                }
                                else{
                                    parent.state = "start"
                                }
                            }
                            onReleased: parent.opacity = 1
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
    }
    Popup {
        id: testSetupPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: Universal.theme == Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: TestSetup{}
    }
}

