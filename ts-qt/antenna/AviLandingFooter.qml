import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle{
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
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        spacing: 0
        Item{
            Layout.fillHeight: true
            width: 70
            ColumnLayout{
                anchors.fill: parent
                anchors.bottomMargin: 10
                spacing: 0
                Item{
                    Layout.fillHeight: true
                }
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
                    Image{
                        id: resultsImg
                        anchors.centerIn: parent
                        source: "qrc:/img/img/results.png"
                        asynchronous: true
                    }
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "RESULTS"
                    font.pixelSize: 12
                    font.weight: Font.Black
                    font.family: robotoRegular.name
                    color: Universal.foreground
                    opacity: 0.8
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity = 0.5
                onReleased: parent.opacity = 1
                onClicked: navigationModel.setCurrentView(navigationModel.getTargetView("_detailSummary"),
                                                          {
                                                              "id": navigationModel.navigationParameter.id,
                                                              "title": navigationModel.navigationParameter.title,
                                                              "runState": "idle",
                                                              "isHome": navigationModel.navigationParameter.isHome
                                                          });
            }
        }
        Item{
            Layout.fillWidth: true
        }
        Item{
            Layout.fillHeight: true
            width: 70
            ColumnLayout{
                anchors.fill: parent
                anchors.bottomMargin: 10
                spacing: 0
                Item{
                    Layout.fillHeight: true
                }
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
                    Image{
                        id: setupImage
                        anchors.centerIn: parent
                        source: "qrc:/img/img/Settings-accent.png"
                        asynchronous: true
                    }
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "CAL"
                    font.pixelSize: 12
                    font.weight: Font.Black
                    font.family: robotoRegular.name
                    color: Universal.foreground
                    opacity: 0.8
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: calPopup.open()
                onPressed: parent.opacity = 0.5
                onReleased: parent.opacity = 1
            }
        }
        Item{
            Layout.fillHeight: true
            width: 90
            ColumnLayout{
                anchors.fill: parent
                anchors.bottomMargin: 10
                spacing: 0
                Item{
                    Layout.fillHeight: true
                }
                Rectangle{
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin: 5
                    Layout.bottomMargin: 5
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    height: 70
                    width: 70
                    radius: 35
                    color: Universal.accent
                    Image{
                        id: buttonImage
                        anchors.centerIn: parent
                        source: "qrc:/img/img/play-button.png"
                        asynchronous: true
                    }
                }
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Start"
                    font.pixelSize: 12
                    font.capitalization: Font.AllUppercase
                    font.weight: Font.Black
                    font.family: robotoRegular.name
                    color: Universal.foreground
                    opacity: 0.8
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity = 0.5
                onReleased: parent.opacity = 1
                onClicked: navigationModel.setCurrentView(navigationModel.getTargetView("_detailSummary"),
                                                          {
                                                              "id": navigationModel.navigationParameter.id,
                                                              "title": navigationModel.navigationParameter.title,
                                                              "runState": "start",
                                                              "isHome": navigationModel.navigationParameter.isHome
                                                          });
            }
        }
    }
}
