import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import QtQuick.Controls.Universal 2.1

Page {
    id: item1
    anchors.fill: parent
    header: Rectangle{
        height: 40
        anchors.left:parent.left
        anchors.right:parent.right
        color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
        Text {
            id: testTitle
            anchors.centerIn: parent
            text: qsTr("ADD USER")
            font.pixelSize: 16
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
            anchors.horizontalCenter: parent.horizontalCenter
            color: Universal.foreground
        }

//        Item{
//            anchors.top: parent.top
//            anchors.bottom: parent.bottom
//            anchors.right: parent.right
//            width: 50
//            Image {
//                id: closeImage
//                anchors.centerIn: parent
//                source: "qrc:/img/img/Delete-25.png"
//            }
//            ColorOverlay{
//                anchors.fill: closeImage
//                source: closeImage
//                color: Universal.foreground
//            }
//            MouseArea {
//                anchors.fill: parent
//                onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
//            }
//        }
    }

    contentItem: Rectangle {
        color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
        Flickable {
            id: flickable
            anchors.fill: parent
            contentWidth: parent.width;
            contentHeight: grid.height + grid.y + 10
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            GridLayout {
                id: grid
                y: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                rowSpacing: 22
                columnSpacing: 30

                Text {
                    text: qsTr("USER ID:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                TextField {
                    id: usedId
                    Layout.column: 1
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    placeholderText: "Enter User ID"
                    inputMethodHints: Qt.ImhNoAutoUppercase
                }

                Text {
                    Layout.row: 1
                    text: qsTr("NAME:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                TextField {
                    id: name
                    Layout.row: 1
                    Layout.column: 1
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    placeholderText: "Enter Name"
                    text: setup.newUser.name
                    Binding{
                        target: setup.newUser
                        property: "name"
                        value: name.text
                    }
                }

                Text {
                    Layout.row: 2
                    text: qsTr("LANGUAGE:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }
                ComboBox{
                    Layout.row: 2
                    Layout.column: 1
                    currentIndex: 0
                    model: ListModel{
                        ListElement{text:"English"}
                    }
                }

                Text {
                    Layout.row: 3
                    text: qsTr("EMAIL:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                TextField {
                    id: emailId
                    Layout.row: 3
                    Layout.column: 1
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    placeholderText: "Enter Email ID"
                    inputMethodHints: Qt.ImhEmailCharactersOnly
                }
                Text {
                    Layout.row: 4
                    text: qsTr("EMAIL SAVED TESTS:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                }

                Switch {
                    Layout.row: 4
                    Layout.column: 1
                }

                Button{
                    Layout.row: 6
                    Layout.column: 0
                    Layout.alignment: Qt.AlignRight
                    text: "Save"
                    enabled: true
                    onClicked: {
                        setup.addNewUser();
                    }
                }

                Button{
                    Layout.row: 6
                    Layout.column: 1
                    text: "Cancel"
                    onClicked: navigationModel.currentView = navigationModel.getTargetView("back")
                }
            }
        }
    }
}
