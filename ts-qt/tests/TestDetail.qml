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
    radius:3
    anchors.leftMargin: 10
    anchors.rightMargin: 10
    anchors.topMargin: 10
    anchors.bottomMargin: 10
    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        horizontalOffset: 1.1
        verticalOffset: 1.1
        radius: 4
        color: "#26000000"
        spread: 0
    }
    Page {
        anchors.fill: parent
        header: Rectangle{
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.background
            height: 40
            Column{
                topPadding: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: title
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
                }
                ColorOverlay{
                    anchors.fill: pageIndicator
                    source: pageIndicator
                    color: Universal.foreground
                    visible: Universal.theme == Universal.Dark
                }
            }

             Item{
                id: rectangle
                height:25
                width: 25
                Layout.fillHeight: true
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
        contentItem: Rectangle {
            color: Universal.background
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: content.height + content.y + 10
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                Column{
                    id: content
                    y: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 10
                    spacing: 30
                    Repeater{
                        model: summaryModel
                        delegate:
                            ColumnLayout {
                            Layout.row: order
                            Layout.minimumHeight: 120
                            Layout.topMargin: 20
                            Text {
                                Layout.fillHeight: true
                                text: name
                                font.weight: Font.DemiBold
                                font.pixelSize: 16
                                color: Universal.foreground
                            }
                            GridLayout {

                                Repeater {
                                    model: summaryModel.getTestParamsForsummary(id)
                                    delegate: Rectangle{
                                        color: "transparent"
                                        Layout.row: model.modelData.row
                                        Layout.column: model.modelData.col
                                        Layout.fillWidth: true
                                        Layout.minimumWidth: content.width /2
                                        //Layout.preferredWidth : 200
                                        Layout.rightMargin: 9
                                        Layout.columnSpan: model.modelData.colSpan
                                        Layout.rowSpan: model.modelData.rowSpan
                                        height: 15

                                        Row{
                                            spacing: 4
                                            anchors.fill: parent
                                            Text{
                                                text:model.modelData.key
                                                font.pixelSize: 12
                                                Controls.style:model.modelData.keyStyle
                                                color: Universal.foreground
                                            }
                                            Text{
                                                text:model.modelData.value
                                                font.pixelSize: 12
                                                Controls.style:model.modelData.valueStyle
                                                color: Universal.foreground
                                            }
                                            Text{
                                                text:model.modelData.unit
                                                font.pixelSize: 12
                                                Controls.style:model.modelData.unitStyle
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
                font.pointSize: 10
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
                state: navigationModel.navigationParameter.playState
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
                ColorOverlay{
                    anchors.fill: buttonImage
                    source: buttonImage
                    color: Universal.theme == Universal.Dark ? "white" : Universal.accent
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


            Text {
                text: qsTr("NEXT >")
                font.pointSize: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                color: Universal.foreground
                MouseArea {
                    anchors.fill: parent
                    onClicked:{
                        navigationModel.currentView = navigationModel.getTargetView("Next")
                    }
                }
            }
        }
    }
}
