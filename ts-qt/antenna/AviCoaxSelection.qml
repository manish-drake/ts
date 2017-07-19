import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    property string selectedCableType
    property double selectedCableVelocity
    RowLayout{
        anchors.left: parent.left
        anchors.right: parent.right
        Rectangle{
            Layout.fillWidth: true
            Layout.maximumWidth: 500
            Layout.alignment: Qt.AlignHCenter
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            radius: 4
            height: content.height
            ColumnLayout{
                id: content
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: 4
                Item{
                    height: 40
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 5
                    Layout.bottomMargin: 10
                    Text {
                        anchors.centerIn: parent
                        text: "COAX"
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
                            id: closeImg
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Delete-25.png"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: coaxSelectionPopup.close()
                        }
                    }
                }
                ListView{
                    id: coaxListView
                    Layout.minimumHeight: 250
                    Layout.bottomMargin: 20
                    anchors.left:parent.left
                    anchors.right:parent.right
                    clip: true
                    spacing: 4
                    delegate: Component{
                        id: coaxListItemDelegate
                        Rectangle{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 20
                            anchors.rightMargin: 20
                            height: 45
                            color: index == coaxListView.currentIndex ? "#1B75BC" :  Universal.accent
                            radius: 4
                            RowLayout{
                                anchors.fill: parent
                                Text {
                                    Layout.leftMargin: 10
                                    Layout.alignment: Qt.AlignVCenter
                                    font.pixelSize: 14
                                    font.weight: Font.Black
                                    font.family: robotoRegular.name
                                    color: "White"
                                    text: name + "  VEL " + vel + "%"
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: coaxListView.currentIndex = index
                            }
                        }
                    }
                    model: ListModel {
                        id: coaxList
                        ListElement { name: "PE Solid"; vel: 66}
                        ListElement { name: "PE Foam"; vel: 85}
                        ListElement { name: "Teflon"; vel: 70}
                        ListElement { name: "Teflon Foam"; vel: 80}
                        ListElement { name: "User"; vel: 0}
                    }
                    onCurrentIndexChanged: {
                        selectedCableType = coaxList.get(currentIndex).name
                        selectedCableVelocity = coaxList.get(currentIndex).vel
                        coaxSelectionPopup.close()
                    }
                }
            }
        }
    }
}

