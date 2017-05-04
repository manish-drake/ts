import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

Rectangle{
    Layout.column: 1
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: "transparent"
    property int currentModeIndex
    Rectangle {        
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        height: 50
        color: "transparent"
        ComboBox {
            id: modeComboBox
            implicitWidth: parent.width
            implicitHeight: parent.height
            currentIndex: currentModeIndex
            style: ComboBoxStyle{
                background: Rectangle{
                    height: modeComboBox.height
                    width: modeComboBox.width
                    color: modeComboBox.pressed ? "#D0D0D0" : "#E0E0E0"
                    Image {
                        source: "qrc:/img/img/Expand Arrow-25.png"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                    }
                }
                label:Item {
                    anchors.fill: parent
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        font.pointSize: 11
                        color: "#333333"
                        text: "MODE: " + control.currentText
                    }
                }
            }
            model: ListModel {
                ListElement { text: "VSWR"; }
                ListElement { text: "LOSS"; }
                ListElement { text: "DTF"; }
                ListElement { text: "CAL"; }
            }
            onCurrentIndexChanged:{
                switch(currentIndex){
                case 0:
                    navigationModel.currentView = navigationModel.getTargetView("Aviation-Vswr")
                    currentModeIndex: 0;
                    vswrClHeader.detailTitle = "VSWR";
                    break;
                case 1:
                    navigationModel.currentView = navigationModel.getTargetView("Aviation-Cl")
                    currentModeIndex: 1
                    vswrClHeader.detailTitle = "CABLE LOSS";
                    break;
                case 2:
                    navigationModel.currentView = navigationModel.getTargetView("Aviation-Dtf")
                    break;
                case 3:
                    navigationModel.currentView = navigationModel.getTargetView("Aviation-Cal-Short")
                    break;
                }
            }
        }
    }
}


