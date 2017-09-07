import QtQuick 2.5
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
        spacing: 0
        Item{
            Layout.fillWidth: true
        }
        ColumnLayout{
            Layout.alignment: Qt.AlignBottom
            spacing: 0
            Rectangle{
                Layout.alignment: Qt.AlignBottom
                Layout.topMargin: 5
                Layout.bottomMargin: 5
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                height: 50
                width: 50
                radius: 25
                color: "transparent"
                border.width: 2
                border.color: Universal.accent
                Image {
                    id: setupImage
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Settings-accent.png"
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
                opacity: 0.8
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
                Layout.topMargin: 5
                Layout.bottomMargin: 5
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                height: 70
                width: 70
                radius: 35
                color: Universal.accent
                state: navigationModel.navigationParameter.runState
                Image {
                    id: testRunImage
                    anchors.centerIn: parent
                    smooth: true
                }
                states: [
                    State {
                        name: "idle"
                        PropertyChanges {
                            target: testRunImage
                            source: "qrc:/img/img/play-button.png"
                        }
                        PropertyChanges {
                            target: testRunText
                            text: "start"
                        }
                    },
                    State {
                        name: "start"
                        PropertyChanges {
                            target: testRunImage
                            source: "qrc:/img/img/pause-button.png"
                        }
                        PropertyChanges {
                            target: testRunText
                            text: "pause"
                        }
                        StateChangeScript{
                            script: commonCtrls.onRun();
                        }
                    },
                    State {
                        name: "pause"
                        PropertyChanges {
                            target: testRunImage
                            source: "qrc:/img/img/play-button.png"
                        }
                        PropertyChanges {
                            target: testRunText
                            text: "continue"
                        }
                        StateChangeScript{
                            script: commonCtrls.onPause();
                        }
                    },
                    State {
                        name: "continue"
                        PropertyChanges {
                            target: testRunImage
                            source: "qrc:/img/img/pause-button.png"
                        }
                        PropertyChanges {
                            target: testRunText
                            text: "pause"
                        }
                        StateChangeScript{
                            script: commonCtrls.onContinue();
                        }
                    }
                ]
            }
            Text {
                id: testRunText
                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: 12
                font.capitalization: Font.AllUppercase
                font.weight: Font.Black
                font.family: robotoRegular.name
                color: Universal.foreground
                opacity: 0.8
            }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onPressed: parent.opacity = 0.5
                onReleased: parent.opacity = 1
                onClicked: {
                    if(testRunButton.state == "idle"){
                        testRunButton.state = "start"
                    }
                    else if (testRunButton.state == "start") {
                        testRunButton.state = "pause"
                    }
                    else if(testRunButton.state == "pause"){
                        testRunButton.state = "continue"
                    }
                    else{
                        testRunButton.state = "pause"
                    }
                }
            }
        }
    }
}
