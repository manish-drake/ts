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
                    y: 60
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: 25
                    Text {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        horizontalAlignment: Text.AlignHCenter
                        text: navigationModel.navigationParameter.title
                        font.pixelSize: 24
                        font.weight: Font.Black
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.7
                    }
                    Text {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 45
                        anchors.rightMargin: 45
                        horizontalAlignment: Text.AlignHCenter
                        wrapMode: Text.WordWrap
                        text: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.6
                    }
                    Image{
                        id: guideImg
                        anchors.left: parent.left
                        anchors.right: parent.right
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/img/img/guide.png"
                    }
                }
            }
        }

        footer: Rectangle{
            id:testFooterRect
            height: 90
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            Rectangle{
                anchors.left: parent.left
                anchors.right: parent.right
                height: 1
                color: Universal.foreground
                opacity: 0.2
            }
            RowLayout{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                Rectangle{
                    Layout.alignment: Qt.AlignBottom
                    height: 50
                    width: 50
                    radius: 25
                    color: Universal.accent
                    Image {
                        id: resultsImg
                        anchors.centerIn: parent
                        source: "qrc:/img/img/results.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.9
                        onReleased: parent.opacity = 1
                        onClicked:navigationModel.setCurrentView(navigationModel.getTargetView(
                                                                     "_detailLanding",
                                                                     navigationModel.navigationParameter.id), {
                                                                     "title": navigationModel.navigationParameter.title,
                                                                     "playState": toggleButton.state
                                                                 });
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
                        onClicked:navigationModel.setCurrentView(navigationModel.getTargetView(
                                                                     "_detailLanding",
                                                                     navigationModel.navigationParameter.id), {
                                                                     "title": navigationModel.navigationParameter.title,
                                                                     "playState": toggleButton.state
                                                                 });
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
