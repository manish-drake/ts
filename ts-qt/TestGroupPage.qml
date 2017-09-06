import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    property string guideTestName
    ColumnLayout{
        anchors.fill: parent
        Item{
            anchors.left: parent.left
            anchors.right: parent.right
            height: tghContent.height
            GridLayout{
                id: tghContent
                Layout.topMargin: 15
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                Rectangle{
                    Layout.rowSpan: 2
                    y:10
                    width:65
                    height: 65
                    color:"white"
                    radius: 35
                    Image {
                        anchors.centerIn: parent
                        width: 55
                        height: 55
                        source: "qrc:/img/img/test-logo.png"
                    }
                }
                Text {
                    Layout.column: 1
                    Layout.leftMargin: 10
                    Layout.fillWidth: true
                    text: headerTitle
                    font.pixelSize: 18
                    font.weight: Font.Black
                    font.family: robotoRegular.name
                    color: Universal.foreground
                    opacity: 0.7
                }
                Text {
                    Layout.column: 1
                    Layout.row: 1
                    Layout.leftMargin: 10
                    Layout.fillWidth: true
                    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut dapibus, ante tristique blandit convallis."
                    wrapMode: Text.WordWrap
                    font.pixelSize: 14
                    font.weight: Font.DemiBold
                    font.family: robotoRegular.name
                    color: Universal.foreground
                    opacity: 0.6
                }
            }
        }
        TestGroup{isHome: false}
    }
}
