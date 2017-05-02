import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1


Rectangle {
    color: Universal.theme == Universal.Dark ? "#333333" : "#f5f5f5"
    Layout.fillWidth: true
    height: 40
    GridLayout{
        anchors.fill: parent
        Text {
            anchors.verticalCenter: parent.verticalCenter
            leftPadding: 10
            font.pointSize: 10
            text: qsTr("MODE:")
            color: Universal.foreground
        }
        Rectangle{
            Layout.column: 1
            Layout.fillWidth: true
        }
        ComboBox {
            id: modeComboBox
            Layout.column: 2
            implicitWidth: 80
            model: ListModel {
                ListElement { text: "VSWR"; }
                ListElement { text: "LOSS"; }
                ListElement { text: "DTF"; }
                ListElement { text: "CAL"; }
            }
            onCurrentIndexChanged:{
                 console.log("------------------"+currentIndex)
                switch(currentIndex){
                case 0:
                    console.log("=======0=========="+navigationModel.currentView )
                    navigationModel.currentView = navigationModel.getTargetView("Ant-Aviation-VSWR")
                    break;
                case 1:
                    console.log("======1==========="+navigationModel.currentView )
                    navigationModel.currentView = navigationModel.getTargetView("Ant-Aviation-Cl")
                    break;
                case 2:
                    console.log("======2==========="+navigationModel.currentView )
                    navigationModel.currentView = navigationModel.getTargetView("Ant-Aviation-DTF")
                    break;
                case 3:
                    console.log("======3==========="+navigationModel.currentView )
                    navigationModel.currentView = navigationModel.getTargetView("Ant-Aviation-CAL-Short")
                    break;
                }
            }
        }
        Rectangle{
            Layout.column: 3
            Layout.fillWidth: true
        }
    }
}

