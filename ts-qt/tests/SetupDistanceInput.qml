import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    property double uutDistance: 98
    RowLayout{
        anchors.fill: parent
        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumWidth: 400
            Layout.maximumHeight: content.height
            Layout.alignment: Qt.AlignCenter
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            radius: 4
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
                    Layout.bottomMargin: 15
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        width: 35
                        Image {
                            id:leftImg
                            anchors.centerIn: parent
                            source: "qrc:/img/img/left.png"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: distanceInputPopup.close()
                        }
                    }
                    Text {
                        anchors.centerIn: parent
                        text: "DISTANCE TO UUT"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                }
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 20
                    Layout.bottomMargin: 25
                    height: 40
                    RowLayout{
                        anchors.fill: parent
                        Rectangle{
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            color: "transparent"
                            border.width: 1
                            border.color: Universal.accent
                            radius: 3
                            TextInput{
                                anchors.fill: parent
                                anchors.leftMargin: 15
                                anchors.rightMargin: 15
                                verticalAlignment: TextInput.AlignVCenter
                                font.pixelSize: 16
                                clip: true
                                validator: IntValidator{bottom: 0;top: 250}
                                inputMethodHints: Qt.ImhPreferNumbers
                                color: Universal.foreground
                                opacity: 0.7
                                text: uutDistance
                                onEditingFinished: uutDistance = text
                            }
                        }
                        Text{
                            Layout.leftMargin: 10
                            text: "FT"
                            font.pixelSize: 16
                            color: Universal.accent
                        }
                    }
                }
            }
        }
    }
}

