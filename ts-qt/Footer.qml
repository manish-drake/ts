import QtQuick 2.5
import QtQuick.Layouts 1.3
import QtQml 2.2
import QtQuick.Controls.Universal 2.1

Rectangle {
    id: rectangle4
    height: 40
    color: Universal.theme === Universal.Light ? "#A7A9AC" : "#333333"
    property bool isController: true
    property string connectionType: "port"
    property string testStatus: "end"
    property string testRunTime
    RowLayout{
        anchors.fill: parent
        spacing: 0
        RowLayout{
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: !navigationModel.isTestRunPage
            Text {
                Layout.alignment: Qt.AlignVCenter
                Layout.leftMargin: 10
                font.pixelSize: 15
                text: currentUser
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
                elide:  Text.ElideRight
                color: "white"
            }
            Text {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter
                Layout.leftMargin: 30
                elide: Text.ElideRight
                font.pixelSize: 15
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
                text: deviceName
                color: "white"
            }
        }
        RowLayout{
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: navigationModel.isTestRunPage
            Text {
                Layout.alignment: Qt.AlignVCenter
                Layout.leftMargin: 10
                font.pixelSize: 15
                text: testStatus
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
                font.capitalization: Font.AllUppercase
                elide:  Text.ElideRight
                color: "white"
            }
            Text {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter
                Layout.leftMargin: 30
                elide: Text.ElideRight
                font.pixelSize: 15
                font.weight: Font.DemiBold
                font.family: robotoRegular.name
                text: testRunTime
                color: "white"
            }
        }
        RowLayout{
            Layout.fillHeight: true
            Image{
                Layout.alignment: Qt.AlignVCenter
                Layout.rightMargin: 20
                source: connectionType == "port" ? "qrc:/img/img/port.png" : "qrc:/img/img/wifi-direct.png"
                asynchronous: true
            }
            Image{
                Layout.alignment: Qt.AlignVCenter
                Layout.rightMargin: 20
                source: "qrc:/img/img/Full Battery-25.png"
                asynchronous: true
            }
            Image{
                Layout.alignment: Qt.AlignVCenter
                Layout.rightMargin: 20
                source: "qrc:/img/img/wifi-signal-waves.png"
                asynchronous: true
            }
        }
    }
}
