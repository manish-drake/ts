import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls.Styles 1.4

Page {
    id: item1
    anchors.fill: parent
    header: Rectangle{
        height: 40
        anchors.left:parent.left
        anchors.right:parent.right
        color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
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
    }

    contentItem: Rectangle {
        color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
        Flickable {
            id: flickable
            anchors.fill: parent
            contentWidth: width;
            contentHeight: grid.height + grid.y + 10
            boundsBehavior: Flickable.StopAtBounds
            GridLayout {
                id: grid
                y: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                rowSpacing: 22
                columnSpacing: 30

                Text {
                    Layout.row: 1
                    Layout.fillWidth: true
                    text: qsTr("NAME:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                    elide: Text.ElideRight
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
                    Layout.fillWidth: true
                    text: qsTr("LANGUAGE:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                    elide: Text.ElideRight
                }
                ComboBox{
                    id:languageComboBox
                    Layout.row: 2
                    Layout.column: 1
                    currentIndex: setup.newUser.language - 1
                    model: ListModel{
                        ListElement{text:"English"}
                    }
                    Binding{
                        target: setup.newUser
                        property:"language"
                        value: languageComboBox.currentIndex + 1
                    }
                }

                Text {
                    Layout.row: 3
                    Layout.fillWidth: true
                    text: qsTr("EMAIL:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                    elide: Text.ElideRight
                }

                TextField {
                    id: emailId
                    Layout.row: 3
                    Layout.column: 1
                    font.pixelSize: 12
                    font.family: robotoRegular.name
                    placeholderText: "Enter Email ID"
                    text: setup.newUser.email
                    inputMethodHints: Qt.ImhEmailCharactersOnly
                    Binding{
                        target: setup.newUser
                        property: "email"
                        value: emailId.text
                    }
                }
                Text {
                    Layout.row: 4
                    Layout.fillWidth: true
                    text: qsTr("EMAIL SAVED TESTS:")
                    font.pixelSize: 12
                    font.bold: Font.Medium
                    font.family: robotoRegular.name
                    color: Universal.foreground
                    elide: Text.ElideRight
                }

                Switch {
                    id:emailSavedTest
                    Layout.row: 4
                    Layout.column: 1
                    checked: setup.newUser.emailSavedTests
                    Binding{
                        target: setup.newUser
                        property: "emailSavedTests"
                        value: emailSavedTest.checked
                    }
                    style: SwitchStyle {
                        groove: Rectangle {
                            implicitWidth: 60
                            implicitHeight: 30
                            radius: 15
                            color: "lightgray"
                        }
                        handle: Rectangle {
                            implicitWidth: 30
                            implicitHeight: 30
                            radius: 15
                            color: control.checked ? Universal.accent : "gray"
                        }
                    }
                }

                Rectangle{
                    Layout.row: 6
                    Layout.columnSpan: 2
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin: 50
                    height: 35
                    width: 120
                    radius: 4
                    color: Universal.accent
                    Text{
                        anchors.centerIn: parent
                        text: "SAVE"
                        color: "white"
                        font.weight: Font.Bold
                        font.pixelSize: 16
                    }
                    MouseArea{
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: setup.addNewUser();
                    }
                }
            }
        }
    }
}
