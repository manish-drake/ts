import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
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
                    source: "qrc:/img/img/View Details-25.png"
                }
                ColorOverlay{
                    anchors.fill: image1
                    source: image1
                    color: Universal.foreground
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:navigationModel.currentView = navigationModel.getTargetView("Scan")
                }
            }

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
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: content.height + content.y + 10
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                Column{
                    id: content
                    y: 20
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 10
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "qrc:/img/img/waveform.png"
                    }
                }
            }
        }

        footer: Rectangle{
            id:testFooterRect
            height: 70
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
            color: Universal.theme == Universal.Light ? "#66000000" : "#66ffffff"
        }
        contentItem: TestSetup{}
    }
}
