import QtQuick 2.5
import QtQuick.Controls.Universal 2.1
import com.ti.controls 1.0

Item {
    Text{
        anchors.centerIn: parent
        text: qsTr("No Content")
        font.pixelSize: 12
        color: Universal.foreground
        font.family: robotoRegular.name
        opacity: 0.6
    }
}
