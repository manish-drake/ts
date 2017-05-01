import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import com.ti.controls 1.0



Item{
    property var selectedMarker: defaultMarkerSlider
    property int freqStartVal
    property int freqMiddleVal
    property int freqEndVal
    property double defaultMarkerVal: 0.0
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
                        id: testTitle
                        text: "DISTANCE TO FAULT"
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

                        ChartControl{}

                        GridLayout {
                            id: grid
                            anchors.left: parent.left
                            anchors.right: parent.right
                            columns: 2
                            columnSpacing: 15
                            rowSpacing: 20
                            Rectangle {
                                color: Universal.theme == Universal.Dark ? "#333333" : "#f5f5f5"
                                Layout.fillWidth: true
                                height: 40
                                GridLayout{
                                    anchors.fill: parent
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        leftPadding: 10
                                        font.pointSize: 10
                                        text: qsTr("TYPE:")
                                        color: Universal.foreground
                                    }
                                    Rectangle{
                                        Layout.column: 1
                                        Layout.fillWidth: true
                                    }
                                    ComboBox {
                                        id: typeComboBox
                                        Layout.column: 2
                                        implicitWidth: 80
                                        model: ListModel {
                                            id: typeList
                                            ListElement { text: "SHORT";}
                                            ListElement { text: "OPEN";}
                                            ListElement { text: "LOAD";}
                                            ListElement { text: "THRU";}
                                            ListElement { text: "PREV CAL";}
                                        }
                                        onCurrentIndexChanged:{

                                        }
                                    }
                                    Rectangle{
                                        Layout.column: 3
                                        Layout.fillWidth: true
                                    }
                                }
                            }

                            Rectangle {
                                color: Universal.theme == Universal.Dark ? "#333333" : "#f5f5f5"
                                Layout.fillWidth: true
                                height: 40
                                GridLayout{
                                    anchors.fill: parent
                                    Text {
                                        anchors.verticalCenter: parent.verticalCenter
                                        leftPadding: 10
                                        font.pointSize: 10
                                        text: qsTr("MODE:")
                                        color: Universal.foreground
                                    }
                                    Rectangle{
                                        Layout.column: 1
                                        Layout.fillWidth: true
                                    }
                                    ComboBox {
                                        id: modeComboBox
                                        Layout.column: 2
                                        implicitWidth: 80
                                        model: ListModel {
                                            ListElement { text: "VSWR"; }
                                            ListElement { text: "LOSS"; }
                                            ListElement { text: "DTF"; }
                                            ListElement { text: "CAL"; }
                                        }
                                        onCurrentIndexChanged:{

                                        }
                                    }
                                    Rectangle{
                                        Layout.column: 3
                                        Layout.fillWidth: true
                                    }
                                }
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Button{
                                    implicitWidth: parent.width
                                    text: "MEASURE"
                                }
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Button{
                                    implicitWidth: parent.width
                                    text: "DONE"
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
}
