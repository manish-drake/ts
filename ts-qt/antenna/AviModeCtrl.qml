import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Universal 2.1

Item{
    Layout.row: 2
    Layout.fillWidth: true
    height: content1.height
    property string mode
    ColumnLayout{
        id: content1
        anchors.left: parent.left
        anchors.right: parent.right
        Text{
            text: "MODE"
            font.pixelSize: 13
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
            color: Universal.foreground
            opacity: Universal.theme == Universal.Light ? 0.5 : 0.7
        }
        Item{
            Layout.fillWidth: true
            height: 45
            Rectangle{
                anchors.fill: parent
                color: "transparent"
                border.width: 2
                border.color: Universal.accent
                radius: 22.5
                RowLayout{
                    anchors.fill: parent
                    Text {
                        Layout.fillWidth: true
                        Layout.leftMargin: 15
                        Layout.alignment: Qt.AlignVCenter
                        elide: Text.ElideRight
                        font.pixelSize: 15
                        font.weight: Font.Black
                        font.family: robotoRegular.name
                        color: Universal.accent
                        text: mode
                    }
                    Image{
                        source: "qrc:/img/img/Expand Arrow.png"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        asynchronous: true
                    }
                }
            }
            MouseArea{
                anchors.fill: parent
                onPressed: parent.opacity = 0.5
                onReleased: parent.opacity = 1
                onClicked: modeSelectionPopup.open()
            }
        }
    }
}


