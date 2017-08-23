import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Universal 2.1

Item {
    ColumnLayout{
        anchors.fill: parent
        Image {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 25
            source: "qrc:/img/img/profile-circle.png"
        }
        Text{
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 5
            text: currentUser
            font.pixelSize: 16
            font.weight: Font.Thin
            opacity: 0.5
            color: Universal.foreground
        }
        Rectangle{
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 25
            Layout.bottomMargin: 15
            width: 40
            height: 1
            color: Universal.foreground
            opacity: 0.2
        }
        TestGroup{isHome: true}
    }
}
