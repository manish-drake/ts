import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2

Item {
    id: item1
     anchors.fill:parent

     Flow{
         id: grid
         anchors.right: parent.right
        anchors.rightMargin: 0
        //anchors.fill:parent.right

        //     columns: 2
       // anchors.centerIn: parent.right

        Button {
            iconSource: "qrc:/img/img/battery-half.png"
            height:50
            style: ButtonStyle {
                padding {
                    left: 0
                    right: 0
                    top: 0
                    bottom: 0
                }
            }
            onClicked: {
                console.log("clicked0!!!")
            }
            Rectangle {
                color: "black"
                anchors.fill: parent
                opacity: parent.pressed ? 0.5 : 0
            }
        }

        //                    Button{
        //                        width: 30
        //                        height: 30
        //                        style: ButtonStyle {
        //                            label:

        Rectangle{
            color: "#004466"
          //  anchors.left: parent.left
        //    anchors.leftMargin: 0
            id:mouseclickRect
             width: 45
             height: 50
            // Grid{
            //  columns:1
            Image {
                id:imageBattery
                anchors.horizontalCenter: parent.horizontalCenter
                source: "qrc:/img/img/battery-half.png"
                fillMode: Image.PreserveAspectFit  // ensure it fits
            }
            Text {
                anchors.top:imageBattery.bottom
                id: name1
                text: qsTr("click me")
                anchors.horizontalCenter: parent.horizontalCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("clicked1!!!")
                }
            }

        }

        Rectangle{
            color: "#004466"
          //  anchors.left: parent.left
          //  anchors.leftMargin: 0
            id:mouseclickRect2
             width: 45
             height: 50
            // Grid{
            //  columns:1
            Image {
                id:imageBattery2
                anchors.horizontalCenter: parent.horizontalCenter
                source: "qrc:/img/img/battery-half.png"
                fillMode: Image.PreserveAspectFit  // ensure it fits
            }
            Text {
                anchors.top:imageBattery2.bottom
                id: name2
                text: qsTr("click me")
                anchors.horizontalCenter: parent.horizontalCenter
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("clicked2!!!")
                }
            }
        }
        //   }
        //                        }
        //                 }
    }
}
