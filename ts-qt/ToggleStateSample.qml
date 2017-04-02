import QtQuick 2.6
import QtQuick.Controls 2.1

Item {

    Rectangle{
        height: 100
        width: 100
       // color:"silver"


        SwitchDelegate {
          //  id: control
            text: qsTr("SwitchDelegate")
            checked: false

            indicator: Image {
                id:image
                //implicitWidth: 48
               // implicitHeight: 26
               // x: control.width - width - control.rightPadding
              //  y: parent.height / 2 - height / 2
                //  radius: 13
                //  color: control.checked ? "#17a81a" : "transparent"
                //   border.color: control.checked ? "#17a81a" : "#cccccc"
                source: "qrc:/img/img/clear.png"
                opacity:  control.checked ? .5 : 1
                anchors.verticalCenter: control.verticalCenter
                anchors.left: control.left;
                 anchors.leftMargin: 10
              //                Rectangle {
//                    x: control.checked ? parent.width - width : 0
//                    width: 26
//                    height: 26
//                    radius: 13
//                    color: control.down ? "#cccccc" : "#ffffff"
//                    border.color: control.checked ? (control.down ? "#17a81a" : "#21be2b") : "#999999"
//                }
            }

            contentItem: Text {
                rightPadding: control.indicator.width + control.spacing
                text: control.text
                font: control.font
                opacity: !control.checked ? 1.0 : 0.5
              //  color: control.down ? "#17a81a" : "#21be2b"
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.left:control.indicator.right
                anchors.leftMargin: 10
                //opacity:  control.checked ? .5 : 1
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                visible: control.down || control.highlighted
                color: control.down ? "#FF0000" : "#0000FF"
            }
        }

        //CheckDelegate {
        //    id: checkDelegate
        //    x: 13
        //    y: 40
        //    delegate:Item{    Image {
        //        id: nameImage
        //        source: "qrc:/img/img/clear.png"
        //    }}
        //    text: qsTr("Check Delegate")
        //}
    }
}
