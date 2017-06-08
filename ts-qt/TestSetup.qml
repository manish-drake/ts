import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item {
    Rectangle{
        anchors.fill: parent
        color: "transparent"
        Page{
            anchors.fill: parent
            header: Rectangle{
                id:testHeaderRect
                height: 60
                width: parent.width
                color: Universal.background
                Image {
                    id: viewImage
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 20
                    source: "qrc:/img/img/Settings-25.png"
                    ColorOverlay{
                        anchors.fill: parent
                        source: parent
                        color: Universal.foreground
                    }
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
                        color: Universal.foreground
                    }
                    Text {
                        text: "SETUP"
                        font.pointSize: 12
                        anchors.topMargin: 40
                        font.weight: Font.DemiBold
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: Universal.foreground
                    }
                }
                Rectangle{
                    id: rectangle
                    height:25
                    width: 25
                    Layout.fillHeight: true
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.margins: 10
                    anchors.right: parent.right
                    color:"transparent"
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
                        onClicked: testSetupPopup.close()
                    }
                }
            }

            contentItem:Rectangle{
                color: Universal.background
                Flickable {
                    width: parent.width;
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    contentWidth: parent.width;
                    contentHeight: content.height + content.y + 10
                    clip: true
                    boundsBehavior: Flickable.StopAtBounds
                    Column{
                        id: content
                        y: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 20
                        spacing: 20
                        Rectangle {
                            height: 20
                            anchors.left: parent.left
                            anchors.right: parent.right
                            color: "transparent"
                            Text{
                                text:"Power"
                                font.pixelSize: 14
                                color: Universal.foreground
                            }
                            Image {
                                id: arrowImage1
                                width:15
                                height: 15
                                anchors.right: parent.right
                                source: "qrc:/img/img/Expand Arrow-20.png"
                                ColorOverlay{
                                    anchors.fill: parent
                                    source: parent
                                    color: Universal.foreground
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
                            anchors.left: parent.left
                            anchors.right: parent.right
                            color: "transparent"
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
                                        color: Universal.foreground
                                    }
                                    Text{
                                        text:"dB"
                                        font.pixelSize: 14
                                        color: Universal.foreground
                                    }
                                }
                            }
                        }

                        Rectangle {
                            height: 20
                            anchors.left: parent.left
                            anchors.right: parent.right
                            color: "transparent"
                            Text{
                                text:"Distance"
                                anchors.left: parent.left
                                font.pixelSize: 14
                                color: Universal.foreground
                            }
                            Image {
                                id: arrowImage2
                                width:15
                                height: 15
                                anchors.right: parent.right
                                source: "qrc:/img/img/Expand Arrow-20.png"
                                ColorOverlay{
                                    anchors.fill: parent
                                    source: parent
                                    color: Universal.foreground
                                }
                            }
                        }
                        Rectangle {
                            height: 20
                            anchors.left: parent.left
                            anchors.right: parent.right
                            color: "transparent"
                            Text{
                                text:"Flight-line"
                                anchors.left: parent.left
                                font.pixelSize: 14
                                color: Universal.foreground
                            }
                            Image {
                                id: arrowImage3
                                width:15
                                height: 15
                                anchors.right: parent.right
                                source: "qrc:/img/img/Expand Arrow-20.png"
                                ColorOverlay{
                                    anchors.fill: parent
                                    source: parent
                                    color: Universal.foreground
                                }
                            }
                        }

                        Rectangle {
                            height: 20
                            anchors.left: parent.left
                            anchors.right: parent.right
                            color: "transparent"
                            Text{
                                text:"Delay"
                                anchors.left: parent.left
                                font.pixelSize: 14
                                color: Universal.foreground
                            }
                            Image {
                                id: arrowImage4
                                width: 15
                                height: 15
                                anchors.right: parent.right
                                source: "qrc:/img/img/Expand Arrow-20.png"
                                ColorOverlay{
                                    anchors.fill: parent
                                    source: parent
                                    color: Universal.foreground
                                }
                            }
                        }
                        Rectangle {
                            height: 20
                            anchors.left: parent.left
                            anchors.right: parent.right
                            color: "transparent"
                            Text{
                                text:"Cable Loss"
                                anchors.left: parent.left
                                font.pixelSize: 14
                                color: Universal.foreground
                            }
                            Image {
                                id: arrowImage5
                                width:15
                                height: 15
                                anchors.right: parent.right
                                source: "qrc:/img/img/Expand Arrow-20.png"
                                ColorOverlay{
                                    anchors.fill: parent
                                    source: parent
                                    color: Universal.foreground
                                }
                            }
                        }
                        Rectangle {
                            height: 20
                            anchors.left: parent.left
                            anchors.right: parent.right
                            color: "transparent"
                            Text{
                                text:"PIN Time"
                                anchors.left: parent.left
                                font.pixelSize: 14
                                color: Universal.foreground
                            }
                            Image {
                                id: arrowImage6
                                width:15
                                height: 15
                                anchors.right: parent.right
                                source: "qrc:/img/img/Expand Arrow-20.png"
                                ColorOverlay{
                                    anchors.fill: parent
                                    source: parent
                                    color: Universal.foreground
                                }
                            }
                        }

                        Rectangle {
                            height: 20
                            anchors.left: parent.left
                            anchors.right: parent.right
                            color: "transparent"
                            Text{
                                text:"Lat"
                                anchors.left: parent.left
                                font.pixelSize: 14
                                color: Universal.foreground
                            }
                            Image {
                                id: arrowImage7
                                width:15
                                height: 15
                                anchors.right: parent.right
                                source: "qrc:/img/img/Expand Arrow-20.png"
                                ColorOverlay{
                                    anchors.fill: parent
                                    source: parent
                                    color: Universal.foreground
                                }
                            }
                        }
                        Rectangle {
                            height: 20
                            anchors.left: parent.left
                            anchors.right: parent.right
                            color: "transparent"
                            Text{
                                text:"Lon"
                                anchors.left: parent.left
                                font.pixelSize: 14
                                color: Universal.foreground
                            }
                            Image {
                                id: arrowImage8
                                width:15
                                height: 15
                                anchors.right: parent.right
                                source: "qrc:/img/img/Expand Arrow-20.png"
                                ColorOverlay{
                                    anchors.fill: parent
                                    source: parent
                                    color: Universal.foreground
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

