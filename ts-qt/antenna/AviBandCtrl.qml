import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Universal 2.1

Item{
    Layout.row: 1
    Layout.fillWidth: true
    height: content1.height
    ColumnLayout{
        id: content1
        anchors.left: parent.left
        anchors.right: parent.right
        Text{
            text: "BAND"
            font.pixelSize: 13
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
            color: Universal.foreground
            opacity: 0.7
        }
        Item{
            Layout.row: 1
            Layout.fillWidth: true
            height: 45
            Rectangle{
                anchors.fill: parent
                color: Universal.theme === Universal.Light ? Universal.accent : "#38363C"
                radius: 3
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
                        color: "White"
                        text: bandSelection.bandName
                    }
                    Image {
                        source: "qrc:/img/img/Expand Arrow-20.png"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed: parent.opacity = 0.9
                    onReleased: parent.opacity = 1
                    onClicked: bandSelectionPopup.open()
                }
            }
        }
    }
}
