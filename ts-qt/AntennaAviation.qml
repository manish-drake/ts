import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import com.ti.controls 1.0


Rectangle{
    anchors.fill: parent
    color: "transparent"
    border.color: "#0d000000"
    border.width: 1
    radius:5
    anchors.leftMargin: 10
    anchors.rightMargin: 10
    anchors.topMargin: 10
    anchors.bottomMargin: 10
    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        horizontalOffset: 1.1
        verticalOffset: 1.1
        radius: 4.0
        color: "#0d000000"
        spread: 0
    }
    Page {
        id: item1
        anchors.fill: parent
        header: Rectangle{
            id:testHeaderRect
            height: 40
            width: parent.width
            color: Universal.background
            Rectangle{
                id: rectangle1
                anchors.margins: 10
                Layout.fillHeight: true
                height:25
                width: 25
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                color:"transparent"
            }

            Column{
                topPadding: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: testDetailTitleText
                    text: "VSWR"
                    font.pointSize: 12
                    font.weight: Font.DemiBold
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Universal.foreground
                }
                //                PageIndicator {
                //                    id: pageIndicator
                //                    anchors.horizontalCenter: parent.horizontalCenter
                //                    count: pageIdx
                //                    currentIndex: summaryModel.currentPage
                //                    ColorOverlay{
                //                        anchors.fill: parent
                //                        source: parent
                //                        color: Universal.foreground
                //                        visible: Universal.theme == Universal.Dark
                //                    }
                //                }
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
                    onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
                }
            }


        }



        contentItem: Rectangle {
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
                    anchors.margins: 10
                    spacing: 30

                    GridLayout{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Rectangle{
                            Layout.columnSpan: 2
                            height: 30
                            width: 45
                            color: "lightgray"
                            Text{
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "Return<br>Loss"
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }
                        Rectangle{
                            Layout.column: 1
                            Layout.columnSpan: 2
                            Layout.alignment: Qt.AlignRight
                            height: 30
                            width: 45
                            color: "lightgray"
                            Text{
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: "VSWR"
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }
                        Image{
                            Layout.row: 1
                            Layout.column: 1
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Layout.topMargin: 5
                            source: "qrc:/img/img/graph-back.png"
                            fillMode: Image.Stretch
                        }

                        ListView{
                            id: rLValsList
                            Layout.row: 1
                            Layout.column: 0
                            Layout.fillHeight: true
                            width: 20
                            model: rLValsModel
                            delegate: Component{
                                Rectangle{
                                    width: parent.width
                                    height: (rLValsList.height - 10)/(rLValsModel.count - 1)
                                    Text{
                                        text: val
                                    }
                                }
                            }
                            ListModel{
                                id: rLValsModel
                                ListElement{ val: "0dB" }
                                ListElement{ val: "-5" }
                                ListElement{ val: "-10" }
                                ListElement{ val: "-15" }
                                ListElement{ val: "-20" }
                                ListElement{ val: "-25" }
                                ListElement{ val: "-30" }
                            }

                        }

                        ListView{
                            id: vswrValsList
                            Layout.row: 1
                            Layout.column: 2
                            Layout.fillHeight: true
                            width: 20
                            model: vswrValsModel
                            delegate: Component{
                                Rectangle{
                                    width: parent.width
                                    height: (vswrValsList.height - 10)/(vswrValsModel.count - 1)
                                    Text{
                                        text: val
                                    }
                                }
                            }
                            ListModel{
                                id: vswrValsModel
                                ListElement{ val: "" }
                                ListElement{ val: "3.6" }
                                ListElement{ val: "1.9" }
                                ListElement{ val: "1.4" }
                                ListElement{ val: "1.2" }
                                ListElement{ val: "1.1" }
                                ListElement{ val: "1.0" }
                            }
                        }

                        ListView{
                            id: impFreqList
                            Layout.row: 2
                            Layout.columnSpan: 2
                            Layout.fillWidth: true
                            height: 10
                            leftMargin: 15
                            rightMargin: 15
                            orientation: ListView.Horizontal
                            model: impFreqModel
                            delegate: Component{
                                Rectangle{
                                    height: parent.width
                                    width: (impFreqList.width - 30)/(impFreqModel.count - 1)
                                    Text{
                                        text: val
                                    }
                                }
                            }
                            ListModel{
                                id: impFreqModel
                            }
                        }

                        ListView{
                            id: freqValsList
                            Layout.row: 3
                            Layout.columnSpan: 2
                            Layout.fillWidth: true
                            leftMargin: 15
                            rightMargin: 15
                            orientation: ListView.Horizontal
                            model: freqValsModel
                            delegate: Component{
                                Rectangle{
                                    height: parent.width
                                    width: (freqValsList.width - 30)/(freqValsModel.count - 1)
                                    Text{
                                        text: val
                                    }
                                }
                            }
                            ListModel{
                                id: freqValsModel
                                ListElement{ val: "950" }
                                ListElement{ val: "1100 MHz" }
                                ListElement{ val: "1250" }
                            }
                        }
                    }
                }
            }
        }

        footer: Rectangle{
            id:testFooterRect
            height: 50
            width: parent.width
            color: Universal.background

            Rectangle {
                id: toggleButton
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                height: 40
                width: 40
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

        }
    }
}
