import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

//Item {
//    anchors.fill: parent
    GridLayout {
        id: grid1
       // rows: 5
        columns: 2
        anchors.fill: parent

        Card{
            id:sgc1
           // Layout.fillWidth: true
           // Layout.fillHeight: true
          //  width: parent.width/2
           // Layout.alignment: Qt.AlignLeft | Qt.AlignTop
           // Layout.alignment: Qt.AlignLeft | Qt.AlignTop
//            Layout.column: 0
//            Layout.row: 0
        }
        Card{
            id:sgc2
            //Layout.fillWidth: true
          //  Layout.fillHeight: true
          //  width: parent.width/2
           // Layout.alignment: Qt.AlignLeft | Qt.AlignTop
           // Layout.alignment: Qt.AlignRight | Qt.AlignTop
//            Layout.column: 1
//            Layout.row: 0
        }
       Card{
            id:sgc3
         //   width: parent.width/2
          //  Layout.alignment: Qt.AlignLeft | Qt.AlignTop
         //   Layout.fillWidth: true
           // Layout.fillHeight: true
          //  Layout.alignment: Qt.AlignLeft | Qt.AlignTop
//            Layout.column: 0
//            Layout.row: 1
        }
      Card{
            id:sgc4
          //  width: parent.width/2
           // Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        //    Layout.fillWidth: true
          //  Layout.fillHeight: true
           // Layout.alignment: Qt.AlignRight | Qt.AlignTop
//            Layout.row: 1
//            Layout.column: 1
        }
        Card{
            id:sgc5
          //  width: parent.width/2
          //  Layout.fillWidth: true
           // Layout.fillHeight: true
          //  Layout.alignment: Qt.AlignLeft | Qt.AlignTop
//            Layout.column: 0
//            Layout.row:2
        }
        Card{
            id:sgc6
           // width: parent.width/2
         //   Layout.fillWidth: true
         //   Layout.fillHeight: true
           // Layout.alignment: Qt.AlignRight | Qt.AlignTop
//            Layout.row: 2
//            Layout.column: 1
        }
    }
//}
