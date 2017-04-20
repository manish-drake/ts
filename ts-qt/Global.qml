import QtQuick 2.0
import com.ti.controls 1.0

Item {

    anchors.centerIn: parent
//    CompositeControl{
//        anchors.centerIn: parent
//        Controls.style: 1
//    }

    Text{
        Controls.style: 0
        anchors.centerIn: parent
        text: qsTr("Start placeholder")
    }
}
