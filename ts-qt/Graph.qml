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
                height:25
                width: 25
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                color:"transparent"
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/View Details-25.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:navigationModel.currentView = navigationModel.getTargetView("Scan")
                }
            }

            Column{
                topPadding: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: title                    
                    text: navigationModel.navigationParameter.title
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
                height:25
                width: 25
                Layout.fillHeight: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 10
                anchors.right: parent.right
                color:"transparent"
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/Delete-25.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
                }
            }
        }

        contentItem: Rectangle{
            color: "transparent"
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
