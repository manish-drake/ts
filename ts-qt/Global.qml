import QtQuick 2.0
import QtQuick.Controls.Universal 2.1
import com.ti.controls 1.0

Item {
    anchors.fill: parent
    Text{
        anchors.centerIn: parent
        text: qsTr("No Content")
        font.pixelSize: 12
        color: Universal.foreground
        font.family: robotoRegular.name
        opacity: 0.6
    }
}
