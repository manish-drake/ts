import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item{
    Layout.row: 1
    Layout.column: 1
    Layout.fillWidth: true
    property int currentModeIndex
    height: content1.height
    ColumnLayout{
        id: content1
        anchors.left: parent.left
        anchors.right: parent.right
        Text{
            text: "MODE"
            font.pixelSize: 13
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
            opacity: 0.7
        }
        Item{
            Layout.row: 1
            Layout.fillWidth: true
            height: 50
            ComboBox {
                id: modeComboBox
                implicitWidth: parent.width
                implicitHeight: parent.height
                currentIndex: currentModeIndex
                style: ComboBoxStyle{
                    background: Rectangle{
                        color: Universal.accent
                        opacity: modeComboBox.pressed ? 0.9 : 1.0
                        radius: 3
                        Image {
                            source: "qrc:/img/img/Expand Arrow-20.png"
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
                            anchors.right: parent.right
                            anchors.leftMargin: 10
                            anchors.rightMargin: 20
                            elide: Text.ElideRight
                            font.pixelSize: 14
                            font.weight: Font.DemiBold
                            font.family: robotoRegular.name
                            color: "white"
                            text: control.currentText
                        }
                    }
                }
                model: ListModel {
//                    ListElement { text: "CAL"; }
                    ListElement { text: "VSWR"; }
                    ListElement { text: "LOSS"; }
                    ListElement { text: "DTF"; }
                }
                onCurrentIndexChanged:{
                    switch(currentIndex){
//                    case 0:
//                        console.log(currentModeIndex+": "+currentIndex)
//                        navigationModel.currentView = navigationModel.getTargetView("Aviation-Cal-Short")
//                        break;
                    case 0:
                        console.log(currentModeIndex+": "+currentIndex)
                        navigationModel.currentView = navigationModel.getTargetView("Aviation-Vswr")
                        break;
                    case 1:
                        console.log(currentModeIndex+": "+currentIndex)
                        navigationModel.currentView = navigationModel.getTargetView("Aviation-Cl")
                        break;
                    case 2:
                        console.log(currentModeIndex+": "+currentIndex)
                        navigationModel.currentView = navigationModel.getTargetView("Aviation-Dtf")
                        break;
                    }
                }
            }
        }
    }
}


