import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Item {
    id: item1
    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: Universal.theme == Universal.Dark ? "#333333" : "#fcfcfc"
        border.color: "#0d000000"
        border.width: 1
        radius: 3
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 1.1
            verticalOffset: 1.1
            radius: 4
            color: "#26000000"
            spread: 0
        }

        Text {
            id: text1
            x: 8
            y: 9
            text: qsTr("Aircraft/Vehicle #"+(index+1))
            fontSizeMode: Text.Fit
            font.pixelSize: 14
            font.weight: Font.DemiBold
            color: Universal.foreground
        }

        Text {
            id: text3
            x: 8
            y: 29
            text: qsTr("address:")
            font.capitalization: Font.AllUppercase
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 14
            color: Universal.foreground
        }

        Text {
            id: text4
            x: 106
            y: 29
            text: address
            fontSizeMode: Text.HorizontalFit
            font.capitalization: Font.AllUppercase
            font.pixelSize: 14
            color: Universal.foreground
        }

        Text {
            id: text5
            x: 8
            y: 49
            text: qsTr("flight:")
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 14
            font.capitalization: Font.AllUppercase
            color: Universal.foreground
        }

        Text {
            id: text6
            x: 106
            y: 49
            text: flight
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 14
            font.capitalization: Font.AllUppercase
            color: Universal.foreground
        }

        Text {
            id: text7
            x: 8
            y: 69
            text: qsTr("BSD Revd:")
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 14
            font.capitalization: Font.MixedCase
            color: Universal.foreground
        }

        Text {
            id: text8
            x: 106
            y: 69
            text: bsdrevd
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 14
            font.capitalization: Font.MixedCase
            color: Universal.foreground
        }

        Grid {
            id: grid
            x: 0
            y: 0
            columns: 2
            width: 0
            height: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id: text9
                text: qsTr("RF Level:")
                font.pixelSize: 14
                color: Universal.foreground
            }

            Text {
                id: text10
                text: rflevel
                font.pixelSize: 14
                color: Universal.foreground
            }
        }
    }
}
