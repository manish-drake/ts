import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Rectangle{
    id:testFooterRect
    height: 110
    anchors.left: parent.left
    anchors.right: parent.right
    color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
    RowLayout{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        spacing: 0
        ColumnLayout{
            Layout.alignment: Qt.AlignBottom
            spacing: 0
            visible: detailHeader.pageCount > 1
            Rectangle{
                Layout.alignment: Qt.AlignHCenter
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
                    anchors.centerIn: parent
                    source: "qrc:/img/img/left-arrow.png"
                }
            }
            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "PREV"
                font.pixelSize: 12
                font.weight: Font.Black
                font.family: robotoRegular.name
                color: Universal.foreground
                opacity: 0.8
            }
            MouseArea {
                anchors.fill: parent
                onClicked:navigationModel.currentView = navigationModel.getTargetView("Previous",{"id": navigationModel.navigationParameter.id})
                onPressed: parent.opacity = 0.5
                onReleased: parent.opacity = 1
            }
        }

        ColumnLayout{
            Layout.alignment: Qt.AlignBottom
            spacing: 0
            visible: detailHeader.pageCount > 1
            Rectangle{
                Layout.alignment: Qt.AlignHCenter
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
                    anchors.centerIn: parent
                    source: "qrc:/img/img/right-arrow.png"
                }
            }
            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "NEXT"
                font.pixelSize: 12
                font.weight: Font.Black
                font.family: robotoRegular.name
                color: Universal.foreground
                opacity: 0.8
            }
            MouseArea {
                anchors.fill: parent
                onClicked:{
                    navigationModel.setCurrentView(navigationModel.getTargetView("Next"), {
                                                       "id": navigationModel.navigationParameter.id,
                                                       "title": navigationModel.navigationParameter.title,
                                                       "runState": testRunButton.state
                                                   })
                }
                onPressed: parent.opacity = 0.5
                onReleased: parent.opacity = 1
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
                    id: homeImage
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Home.png"
                }
            }
            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "HOME"
                font.pixelSize: 12
                font.weight: Font.Black
                font.family: robotoRegular.name
                color: Universal.foreground
                opacity: 0.8
            }
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity = 0.5
                onReleased: parent.opacity = 1
                onClicked: {
                    navigationModel.currentView = navigationModel.getTargetView("_section", 1)
                    headerTitle = "Home"
                    sideMenu.selectedMenuIndex = 1
                }
            }
        }
        ColumnLayout{
            Layout.alignment: Qt.AlignBottom
            spacing: 0
            Rectangle{
                Layout.alignment: Qt.AlignHCenter
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
                text: "SETUP"
                font.pixelSize: 12
                font.weight: Font.Black
                font.family: robotoRegular.name
                color: Universal.foreground
                opacity: 0.8
            }
            MouseArea {
                anchors.fill: parent
                onClicked: testSetupPopup.open()
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
                            script: detailFooter.onRun();
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
                            script: detailFooter.onPause();
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
                            script: detailFooter.onContinue();
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

