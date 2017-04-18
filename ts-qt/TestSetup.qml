import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

Item {
    Rectangle{
        anchors.fill: parent
        Page{
            anchors.fill: parent
            header: Rectangle{
                id:testHeaderRect
                height: 60
                width: parent.width
                color:"transparent"
                Image {
                    id: viewImage
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 20
                    source: "qrc:/img/img/Settings-25.png"
                }
                Column{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    Text {
                        id: title
                        text: "ADS-B Velocity Test"
                        font.pointSize: 12
                        font.weight: Font.DemiBold
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Text {
                        text: "SETUP"
                        font.pointSize: 12
                        anchors.topMargin: 40
                        font.weight: Font.DemiBold
                        anchors.horizontalCenter: parent.horizontalCenter

                    }
                }
            }

            contentItem: Column{
                id:colSetup
                spacing: 10

                Rectangle {
                    height: 20
                    width:colSetup.width
                    color: "transparent"
                    Row{
                        anchors.fill: parent
                        Text{
                            text:"Power"
                            anchors.left: parent.left
                            anchors.leftMargin:20
                            font.pixelSize: 14
                            color:"#377DF3"
                        }
                        Image {
                            id: arrowImage1
                            width:15
                            height: 15
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            powerSliderRect.visible = !powerSliderRect.visible
                            if(powerSliderRect.visible){
                                arrowImage1.source = "qrc:/img/img/Collapse Arrow-20.png"
                            }else{
                                arrowImage1.source = "qrc:/img/img/Expand Arrow-20.png"
                            }
                        }
                    }
                }
                Rectangle {
                    id:powerSliderRect
                    visible:false
                    height: 30
                    width:colSetup.width
                    color: "transparent"
                    Row{
                        anchors.fill: parent
                        Slider {
                            id: slider
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.right: slidervaluerect.left
                            anchors.rightMargin: 20
                            minimumValue: -70
                            maximumValue: 17
                            stepSize: 1
                            value:-39.9
                            updateValueWhileDragging: true
                            onValueChanged: {
                                console.log(slider.value)
                            }
                        }
                        Rectangle{
                            id:slidervaluerect
                            anchors.right: parent.right
                            anchors.rightMargin: 50
                            Row{
                                anchors.fill: parent

                                Text{
                                    text:slider.value
                                    font.pixelSize: 14
                                    color:"#377DF3"
                                }
                                Text{
                                    text:"dB"
                                    font.pixelSize: 14
                                    color:"#377DF3"
                                }
                            }
                        }
                    }
                }

                Rectangle {
                    height: 20
                    width:colSetup.width
                    color: "transparent"
                    Row{
                        anchors.fill: parent
                        Text{
                            text:"Distance"
                            anchors.left: parent.left
                            anchors.leftMargin:20
                            font.pixelSize: 14
                            color:"#377DF3"
                        }
                        Image {
                            id: arrowImage2
                            width:15
                            height: 15
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                    }
                }
                Rectangle {
                    height: 20
                    width:colSetup.width
                    color: "transparent"
                    Row{
                        anchors.fill: parent
                        Text{
                            text:"Flight-line"
                            anchors.left: parent.left
                            anchors.leftMargin:20
                            font.pixelSize: 14
                            color:"#377DF3"
                        }
                        Image {
                            id: arrowImage3
                            width:15
                            height: 15
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                    }
                }

                Rectangle {
                    height: 20
                    width:colSetup.width
                    color: "transparent"
                    Row{
                        anchors.fill: parent
                        Text{
                            text:"Delay"
                            anchors.left: parent.left
                            anchors.leftMargin:20
                            font.pixelSize: 14
                            color:"#377DF3"
                        }
                        Image {
                            id: arrowImage4
                            width: 15
                            height: 15
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                    }
                }
                Rectangle {
                    height: 20
                    width:colSetup.width
                    color: "transparent"
                    Row{
                        anchors.fill: parent
                        Text{
                            text:"Cable Loss"
                            anchors.left: parent.left
                            anchors.leftMargin:20
                            font.pixelSize: 14
                            color:"#377DF3"
                        }
                        Image {
                            id: arrowImage5
                            width:15
                            height: 15
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                    }
                }
                Rectangle {
                    height: 20
                    width:colSetup.width
                    color: "transparent"
                    Row{
                        anchors.fill: parent
                        Text{
                            text:"PIN Time"
                            anchors.left: parent.left
                            anchors.leftMargin:20
                            font.pixelSize: 14
                            color:"#377DF3"
                        }
                        Image {
                            id: arrowImage6
                            width:15
                            height: 15
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                    }
                }

                Rectangle {
                    height: 20
                    width:colSetup.width
                    color: "transparent"
                    Row{
                        anchors.fill: parent
                        Text{
                            text:"Lat"
                            anchors.left: parent.left
                            anchors.leftMargin:20
                            font.pixelSize: 14
                            color:"#377DF3"
                        }
                        Image {
                            id: arrowImage7
                            width:15
                            height: 15
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                    }
                }
                Rectangle {
                    height: 20
                    width:colSetup.width
                    color: "transparent"
                    Row{
                        anchors.fill: parent
                        Text{
                            text:"Lon"
                            anchors.left: parent.left
                            anchors.leftMargin:20
                            font.pixelSize: 14
                            color:"#377DF3"
                        }
                        Image {
                            id: arrowImage8
                            width:15
                            height: 15
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                    }
                }
            }

            footer:Rectangle{
                height: 40
                width: parent.width
                color:"transparent"
                Text{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    text: "CLOSE"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    MouseArea {
                        anchors.fill: parent
                        onClicked: testSetupPopup.close()
                    }
                }
            }
        }
    }
}

