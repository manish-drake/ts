import QtQuick 2.7
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1

Item{
    Layout.row: 1
    Layout.column: 1
    Layout.rowSpan: 2
    Layout.fillWidth: true
    Layout.fillHeight: true
    RowLayout{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        Item{
            Layout.fillWidth: true
        }
        ColumnLayout{
            Layout.alignment: Qt.AlignBottom
            spacing: 0
            Rectangle{
                Layout.alignment: Qt.AlignBottom
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
                font.capitalization: Font.AllUppercase
                font.weight: Font.Black
                font.family: robotoRegular.name
                color: Universal.foreground
                opacity: 0.6
            }
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity = 0.5
                onReleased: parent.opacity = 1
                onClicked: calPopup.open()
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
                        commonCtrls.onRun();
                    }
                    else if(testRunButton.state == "pause"){
                        testRunButton.state = "continue"
                        commonCtrls.onPause();
                    }
                    else{
                        testRunButton.state = "pause"
                        commonCtrls.onContinue();
                    }
                }
            }
        }
    }
}
