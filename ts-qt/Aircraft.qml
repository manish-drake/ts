import QtQuick 2.0

Item {
    id: item1
    Rectangle {
        id: rectangle
        height: 100
        color: "#ffffff"
        border.color: "darkgray"
        border.width:1
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        Text {
            id: text1
            x: 8
            y: 9
            text: qsTr("Aircraft/Vehicle:")
            fontSizeMode: Text.Fit
            font.pixelSize: 12
        }

        Text {
            id: text2
            x: 106
            y: 9
            text:aircraftId
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 12
        }

        Text {
            id: text3
            x: 8
            y: 29
            text: qsTr("address:")
            font.capitalization: Font.AllUppercase
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 12
        }

        Text {
            id: text4
            x: 106
            y: 29
            text: address
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 12
            font.capitalization: Font.AllUppercase
        }

        Text {
            id: text5
            x: 8
            y: 49
            text: qsTr("flight:")
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 12
            font.capitalization: Font.AllUppercase
        }

        Text {
            id: text6
            x: 106
            y: 49
            text: flight
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 12
            font.capitalization: Font.AllUppercase
        }

        Text {
            id: text7
            x: 8
            y: 69
            text: qsTr("BSD Revd:")
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 12
            font.capitalization: Font.MixedCase
        }

        Text {
            id: text8
            x: 106
            y: 69
            text: bsdrevd
            fontSizeMode: Text.HorizontalFit
            font.pixelSize: 12
            font.capitalization: Font.MixedCase
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
                font.pixelSize: 12
            }

            Text {
                id: text10
                text: rflevel
                font.pixelSize: 12
            }
        }
    }
}
