import QtQuick 2.5
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1

Item {
    id: item1
    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: Universal.theme === Universal.Light ? "#fafafa" : "#333333"
        border.color: Universal.theme === Universal.Light ? "#1a000000" : "#4dffffff"
        border.width: 1
        radius: 4
        GridLayout{
            anchors.fill: parent
            anchors.margins: 10
            rowSpacing: 5
            columnSpacing: 20
            Text {
                id: text1
                Layout.columnSpan: 2
                text: qsTr("Aircraft/Vehicle #"+(index+1))
                font.capitalization: Font.AllUppercase
                fontSizeMode: Text.Fit
                font.pixelSize: 14
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
                color: Universal.foreground
            }

            Text {
                id: text3
                Layout.row: 1
                text: qsTr("address")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                color: Universal.foreground
                opacity: 0.65
            }
            Text {
                id: text4
                Layout.row: 1
                Layout.column: 1
                Layout.columnSpan: 2
                text: address
                font.capitalization: Font.AllUppercase
                font.pixelSize: 12
                color: Universal.foreground
            }

            Text {
                id: text5
                Layout.row: 2
                text: qsTr("flight")
                font.pixelSize: 12
                font.capitalization: Font.AllUppercase
                color: Universal.foreground
                opacity: 0.65
            }
            Text {
                id: text6
                Layout.row: 2
                Layout.column: 1
                text: flight
                font.pixelSize: 12
                font.capitalization: Font.AllUppercase
                color: Universal.foreground
            }

            Text {
                id: text9
                Layout.row: 2
                Layout.column: 2
                text: qsTr("RF Level")
                font.pixelSize: 12
                color: Universal.foreground
                opacity: 0.65
            }
            Text {
                id: text10
                Layout.row: 2
                Layout.column: 3
                Layout.fillWidth: true
                text: rflevel
                font.pixelSize: 12
                color: Universal.foreground
            }

            Text {
                id: text7
                Layout.row: 3
                text: qsTr("BSD Revd")
                font.pixelSize: 12
                font.capitalization: Font.MixedCase
                color: Universal.foreground
                opacity: 0.65
            }
            Text {
                id: text8
                Layout.row: 3
                Layout.column: 1
                Layout.columnSpan: 2
                text: bsdrevd
                font.pixelSize: 12
                font.capitalization: Font.MixedCase
                color: Universal.foreground
            }
        }
    }
}
