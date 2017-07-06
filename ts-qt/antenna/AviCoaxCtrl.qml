import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item{
    Layout.row: 1
    Layout.column: 0
    Layout.fillWidth: true
    height: content1.height
    ColumnLayout{
        id: content1
        anchors.left: parent.left
        anchors.right: parent.right
        Text{
            text: "COAX"
            font.pixelSize: 13
            font.weight: Font.DemiBold
            opacity: 0.7
        }
        Item{
            Layout.row: 1
            Layout.fillWidth: true
            height: 50
            ComboBox {
                id: coaxComboBox
                implicitWidth: parent.width
                implicitHeight: parent.height
                style: ComboBoxStyle{
                    background: Rectangle{
                        height: coaxComboBox.height
                        width: coaxComboBox.width
                        color: Universal.accent
                        opacity: coaxComboBox.pressed ? 0.9 : 1.0
                        radius: 3
                        Image {
                            source: "qrc:/img/img/Expand Arrow-20.png"
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                        }
                    }
                    label:Item {
                        anchors.fill: parent
                        Text {
                            id: txt
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 10
                            anchors.rightMargin: 20
                            elide: Text.ElideRight
                            font.pixelSize: 14
                            color: "white"
                            font.weight: Font.DemiBold
                            text: control.currentText + "  VEL " + coaxList.get(coaxComboBox.currentIndex).vel
                        }
                    }
                }
                model: ListModel {
                    id: coaxList
                    ListElement { text: "PE Solid"; vel: "66%"}
                    ListElement { text: "PE Foam"; vel: "85%"}
                    ListElement { text: "Teflon"; vel: "70%"}
                    ListElement { text: "Teflon Foam"; vel: "80%"}
                    ListElement { text: "User"; vel: ""}
                }
            }

        }
    }
}



