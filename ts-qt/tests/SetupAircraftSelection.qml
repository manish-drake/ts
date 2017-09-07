import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    property string selectedAircraft
    RowLayout{
        anchors.fill: parent
        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumWidth: 500
            Layout.maximumHeight: content.height
            Layout.alignment: Qt.AlignCenter
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            radius: 4
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
                    Layout.bottomMargin: 15
                    Item{
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        width: 35
                        Image {
                            id:leftImg
                            anchors.centerIn: parent
                            source: "qrc:/img/img/left.png"
                        }
                        MouseArea {
                            anchors.fill: parent
                            onPressed: parent.opacity = 0.5
                            onReleased: parent.opacity = 1
                            onClicked: aircraftSelectionPopup.close()
                        }
                    }
                    Text {
                        anchors.centerIn: parent
                        text: "TARGET AIRCRAFT"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                }
                ListView{
                    id: aircraftListView
                    Layout.bottomMargin: 25
                    anchors.left:parent.left
                    anchors.right:parent.right
                    height: 49 * aircraftList.count
                    spacing: 4
                    delegate: Component{
                        id: aircraftListItemDelegate
                        Rectangle{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 20
                            anchors.rightMargin: 20
                            height: 45
                            color: index == aircraftListView.currentIndex ? "#26909C" :  Universal.accent
                            radius: 4
                            RowLayout{
                                anchors.fill: parent
                                Text {
                                    Layout.fillWidth: true
                                    Layout.leftMargin: 15
                                    Layout.alignment: Qt.AlignVCenter
                                    elide: Text.ElideRight
                                    font.pixelSize: 15
                                    font.weight: Font.Black
                                    font.family: robotoRegular.name
                                    color: "White"
                                    text: name
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                onPressed: parent.opacity = 0.5
                                onReleased: parent.opacity = 1
                                onCanceled: parent.opacity = 1
                                onClicked: aircraftListView.currentIndex = index
                            }
                        }
                    }
                    model: ListModel {
                        id: aircraftList
                        ListElement { name: "Piper PA-28-161 Warrior II" }
                        ListElement { name: "Aircraft 2" }
                        ListElement { name: "Aircraft 3" }
                        ListElement { name: "Aircraft 4" }
                    }
                    onCurrentIndexChanged:{
                        selectedAircraft = aircraftList.get(currentIndex).name
                        aircraftSelectionPopup.close()
                    }
                }
            }
        }
    }
}


