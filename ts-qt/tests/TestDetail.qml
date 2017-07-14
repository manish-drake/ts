import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import com.ti.controls 1.0

Item{
    Page {
        anchors.fill: parent
        header: Rectangle{
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            height: 45
            Text {
                id: title
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
                anchors.rightMargin: 5
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
        contentItem: Rectangle {
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
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
                    anchors.margins: 15
                    spacing: 25
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
                                font.pixelSize: 13
                                color: Universal.foreground
                                font.capitalization: Font.AllUppercase
                                font.family: robotoRegular.name
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
                                                font.family: robotoRegular.name
                                                Controls.style:model.modelData.keyStyle
                                                color: Universal.foreground
                                                opacity: 0.65
                                            }
                                            Text{
                                                text:model.modelData.value
                                                font.pixelSize: 12
                                                font.family: robotoRegular.name
                                                Controls.style:model.modelData.valueStyle
                                                color: Universal.foreground
                                            }
                                            Text{
                                                text:model.modelData.unit
                                                font.pixelSize: 12
                                                font.family: robotoRegular.name
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
            height: 80
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
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
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
                        onClicked: navigationModel.currentView = navigationModel.getTargetView("Next")
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
                    }
                }
                Item{
                    Layout.fillWidth: true
                }
                Rectangle{
                    Layout.alignment: Qt.AlignBottom
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
                Rectangle{
                    id: toggleButton
                    Layout.alignment: Qt.AlignBottom
                    Layout.leftMargin: 10
                    height: 70
                    width: 70
                    radius: 35
                    color: Universal.accent
                    property alias imageSource: buttonImage.source
                    state: navigationModel.navigationParameter.playState
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
                        onReleased: parent.opacity = 1
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
