import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    property int selectedIndex
    RowLayout{
        anchors.left: parent.left
        anchors.right: parent.right
        Rectangle{
            Layout.fillWidth: true
            Layout.maximumWidth: 500
            Layout.alignment: Qt.AlignHCenter
            color: Universal.theme == Universal.Light ? Universal.background : "#1A1A1A"
            radius: 4
            height: content.height
            ColumnLayout{
                id: content
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: 4
                Item{
                    height: 40
                    anchors.left:parent.left
                    anchors.right:parent.right
                    Layout.topMargin: 5
                    Layout.bottomMargin: 10
                    Text {
                        anchors.centerIn: parent
                        text: "MODE"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        width: 35
                        Image {
                            id: closeImg
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Delete-25.png"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: modeSelectionPopup.close()
                        }
                    }
                }
                ListView{
                    id: modeListView
                    Layout.minimumHeight: 150
                    Layout.bottomMargin: 20
                    anchors.left:parent.left
                    anchors.right:parent.right
                    clip: true
                    spacing: 4
                    currentIndex: selectedIndex
                    delegate: Component{
                        id: modeListItemDelegate
                        Rectangle{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 20
                            anchors.rightMargin: 20
                            height: 45
                            color: index == modeListView.currentIndex ? "#1B75BC" :  Universal.accent
                            radius: 4
                            RowLayout{
                                anchors.fill: parent
                                Text {
                                    Layout.leftMargin: 15
                                    Layout.alignment: Qt.AlignVCenter
                                    font.pixelSize: 15
                                    font.weight: Font.Black
                                    font.family: robotoRegular.name
                                    color: "White"
                                    text: name
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: modeListView.currentIndex = index
                            }
                        }
                    }
                    model: ListModel {
                        id: modeList
                        ListElement { name: "VSWR"; }
                        ListElement { name: "LOSS"; }
                        ListElement { name: "DTF"; }
                    }
                    onCurrentIndexChanged:{
                        switch(currentIndex){
                        case 0:
                            navigationModel.currentView = navigationModel.getTargetView("Aviation-Vswr")
                            break;
                        case 1:
                            navigationModel.currentView = navigationModel.getTargetView("Aviation-Cl")
                            break;
                        case 2:
                            navigationModel.currentView = navigationModel.getTargetView("Aviation-Dtf")
                            break;
                        }
                        modeSelectionPopup.close()
                    }
                }
            }
        }
    }
}

