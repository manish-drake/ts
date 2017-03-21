import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
Item {
    Grid{
        columns: 2
        anchors.centerIn: parent

        Button {
            iconSource: "qrc:/img/img/battery-half.png"
            height:30
            style: ButtonStyle {
                padding {
                    left: 0
                    right: 0
                    top: 0
                    bottom: 0
                }
            }
            onClicked: {
                console.log("clicked!!!")
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
            color: "#ac00ac"
            id:mouseclickRect
            width: 30
            height: 50
           // Grid{
              //  columns:1
                Image {
                    id:imageBattery
                    source: "qrc:/img/img/battery-half.png"
                    fillMode: Image.PreserveAspectFit  // ensure it fits
                }
                Text {
                    anchors.top:imageBattery.bottom
                    id: name1
                    text: qsTr("click me")
                }
          //  }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    console.log("clicked!!!")
                }
            }
        }
        //                        }
        //                 }
    }

}
