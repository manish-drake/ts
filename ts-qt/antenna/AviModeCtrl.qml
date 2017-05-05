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
                ListElement { text: "CAL"; }
                ListElement { text: "VSWR"; }
                ListElement { text: "LOSS"; }
                ListElement { text: "DTF"; }
            }
            onCurrentIndexChanged:{
                switch(currentIndex){
                case 0:
                    console.log(currentModeIndex+"-=-=--=-=-=-=-=---=-=-0:::"+currentIndex)
                    navigationModel.currentView = navigationModel.getTargetView("Aviation-Cal-Short")
                    break;
                case 1:
                    console.log(currentModeIndex+"-=-=--=-=-=-=-=---=-=-1:::"+currentIndex)
                    currentModeIndex: 1
                    navigationModel.currentView = navigationModel.getTargetView("Aviation-Vswr")
                    vswrClHeader.detailTitle = "VSWR";
                    console.log(vswrClHeader.detailTitle);

                    break;
                case 2:
                    console.log(currentModeIndex+"-=-=--=-=-=-=-=---=-=-2:::"+currentIndex);
                    currentModeIndex: 2
                    navigationModel.currentView = navigationModel.getTargetView("Aviation-Cl")
                    vswrClHeader.detailTitle = "CABLE LOSS";
                    console.log(vswrClHeader.detailTitle);
                    break;
                case 3:
                    console.log(currentModeIndex+"-=-=--=-=-=-=-=---=-=-3:::"+currentIndex);
                    navigationModel.currentView = navigationModel.getTargetView("Aviation-Dtf")
                    break;

                }

            }
        }
    }
}


