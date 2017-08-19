import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import com.ti.controls 1.0

Item{
    Page {
        anchors.fill: parent

        header: AviLandingHeader{}

        contentItem: Rectangle {
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
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
            height: 110
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
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
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                ColumnLayout{
                    Layout.alignment: Qt.AlignBottom
                    spacing: 0
                    Rectangle{
                        Layout.alignment: Qt.AlignHCenter
                        Layout.margins: 5
                        height: 50
                        width: 50
                        radius: 25
                        color: Universal.accent
                        Image {
                            id: resultsImg
                            anchors.centerIn: parent
                            source: "qrc:/img/img/results.png"
                        }
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: "RESULTS"
                        font.pixelSize: 12
                        font.weight: Font.Black
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.6
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: navigationModel.currentView = navigationModel.getTargetView("_detailSummary",
                                                                                               {
                                                                                                   "id": navigationModel.navigationParameter.id,
                                                                                                   "runState": testRunButton.state
                                                                                               });
                    }
                }
                Item{
                    Layout.fillWidth: true
                }
                ColumnLayout{
                    Layout.alignment: Qt.AlignBottom
                    spacing: 0
                    Rectangle{
                        Layout.alignment: Qt.AlignHCenter
                        Layout.margins: 5
                        height: 50
                        width: 50
                        radius: 25
                        color: Universal.accent
                        Image {
                            id: setupImage
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Settings-25.png"
                        }
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: "CAL"
                        font.pixelSize: 12
                        font.weight: Font.Black
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.6
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: calPopup.open()
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                    }
                }
                ColumnLayout{
                    Layout.alignment: Qt.AlignBottom
                    spacing: 0
                    Rectangle{
                        id: testRunButton
                        Layout.alignment: Qt.AlignHCenter
                        Layout.margins: 5
                        height: 70
                        width: 70
                        radius: 35
                        color: Universal.accent
                        property alias imageSource: buttonImage.source
                        state: "start"
                        Image {
                            id: buttonImage
                            anchors.centerIn: parent
                            smooth: true
                        }
                        states: [
                            State {
                                name: "start"
                                PropertyChanges {
                                    target: testRunButton
                                    imageSource: "qrc:/img/img/play-button.png"
                                }
                            },
                            State {
                                name: "pause"
                                PropertyChanges {
                                    target: testRunButton
                                    imageSource: "qrc:/img/img/pause-button.png"
                                }
                            },
                            State {
                                name: "continue"
                                PropertyChanges {
                                    target: testRunButton
                                    imageSource: "qrc:/img/img/play-button.png"
                                }
                            }
                        ]
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: testRunButton.state
                        font.pixelSize: 12
                        font.capitalization: Font.AllUppercase
                        font.weight: Font.Black
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.6
                    }
                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: {
                            if (testRunButton.state == "start") {
                                testRunButton.state = "pause"
                            }
                            else if(testRunButton.state == "pause"){
                                testRunButton.state = "continue"
                            }
                            else{
                                testRunButton.state = "pause"
                            }
                            navigationModel.currentView = navigationModel.getTargetView("_detailSummary",
                                                                                        {
                                                                                            "id": navigationModel.navigationParameter.id,
                                                                                            "runState": testRunButton.state
                                                                                        });
                        }
                    }
                }
            }
        }
    }

    Popup {
        id: calPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: AviCalibration{ mode: "VSWR/CL" }
    }

    Popup {
        id: menuPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: AviLandingMenu{}
    }

    Popup {
        id: displayOptionsPopup
        height: parent.height
        width: parent.width
        modal: true
        padding: 0
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: DisplayOptions{}
    }
}

