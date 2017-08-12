import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    RowLayout{
        anchors.fill: parent
        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumWidth: 500
            Layout.maximumHeight: content.height
            Layout.alignment: Qt.AlignCenter
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            radius: 4
            clip: true
            ColumnLayout{
                id: content
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: 4
                clip: true
                Item{
                    height: 40
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 5
                    Layout.bottomMargin: 15
                    Text {
                        anchors.centerIn: parent
                        text: "TRANSPONDER TESTS"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        width: 35
                        Image {
                            id:leftImg
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Delete-25.png"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: transponderTestsListPopup.close()
                        }
                    }
                }
                ListView{
                    id: testsListView
                    Layout.bottomMargin: 25
                    anchors.left:parent.left
                    anchors.right:parent.right
                    height: 49 * transponderTestsModel.count
                    clip: true
                    spacing: 4
                    currentIndex: -1
                    delegate: Component{
                        id: testItemDelegate
                        Rectangle{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 20
                            anchors.rightMargin: 20
                            height: 45
                            color: index == testsListView.currentIndex ? "#1B75BC" :  Universal.accent
                            radius: 4
                            RowLayout{
                                anchors.fill: parent
                                Text {
                                    Layout.fillWidth: true
                                    Layout.leftMargin: 15
                                    Layout.alignment: Qt.AlignVCenter
                                    elide: Text.ElideRight
                                    font.pixelSize: 16
                                    font.weight: Font.Black
                                    font.family: robotoRegular.name
                                    font.capitalization: Font.AllUppercase
                                    color: "White"
                                    text: key
                                }
                                Text {
                                    Layout.rightMargin: 15
                                    Layout.alignment: Qt.AlignVCenter
                                    elide: Text.ElideRight
                                    font.pixelSize: 16
                                    font.weight: Font.Black
                                    font.family: robotoRegular.name
                                    font.capitalization: Font.AllUppercase
                                    color:  text == "pass" ? "green" : "red"
                                    text: result
                                    visible: result != ""
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: aircraftListView.currentIndex = index
                            }
                        }
                    }
                    model: ListModel{
                        id: transponderTestsModel
                        ListElement{key: "summary"; result: "fail"}
                        ListElement{key: "reply frequency"; result: "pass"}
                        ListElement{key: "suppression"; result: "pass"}
                        ListElement{key: "receiver sensitivity (MTL)"; result: "pass"}
                        ListElement{key: "peak output power (ERP)"; result: "pass"}
                        ListElement{key: "mode s diversity isolution"; result: "fail"}
                        ListElement{key: "mode s address"; result: "pass"}
                        ListElement{key: "mode s surv formats"; result: "pass"}
                        ListElement{key: "mode s comm formats"; result: "pass"}
                        ListElement{key: "mode s all-call"; result: "pass"}
                        ListElement{key: "ATCRBS only all-call"; result: "pass"}
                        ListElement{key: "squitter"; result: "pass"}
                    }
                }
            }
        }
    }
}


