import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    property string selectedConnection
    RowLayout{
        anchors.fill: parent
        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumWidth: 400
            Layout.maximumHeight: 200
            Layout.alignment: Qt.AlignCenter
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            radius: 4
            ColumnLayout{
                id: content
                anchors.fill: parent
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
                            onClicked: connectionSelectionPopup.close()
                        }
                    }
                    Text {
                        anchors.centerIn: parent
                        text: "CONNECTION"
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                }
                ListView{
                    id: connectionListView
                    Layout.fillHeight: true
                    Layout.bottomMargin: 25
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 25
                    orientation: ListView.Horizontal
                    clip: true
                    spacing: 25
                    delegate: Component{
                        id: connectionListItemDelegate
                        Rectangle{
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            width: (connectionListView.width/3) - 18
                            color: "transparent"
                            border.width: 1
                            border.color: index == connectionListView.currentIndex ? "#26909C" :  Universal.accent
                            radius: 3
                            ColumnLayout{
                                anchors.fill: parent
                                anchors.margins: 5
                                Item{
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    Image {
                                        id: antennaImg1
                                        anchors.fill: parent
                                        anchors.margins: 2
                                        source: index == connectionListView.currentIndex ? "qrc:/img/img/antenna2.png" : "qrc:/img/img/antenna.png"
                                        fillMode: Image.PreserveAspectFit
                                    }
                                }
                                Text{
                                    Layout.fillWidth: true
                                    horizontalAlignment: Text.AlignHCenter
                                    elide: Text.ElideRight
                                    text: name
                                    font.pixelSize: 14
                                    font.weight: Font.Black
                                    font.family: robotoRegular.name
                                    color: index == connectionListView.currentIndex ? "#26909C" :  Universal.accent
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                onPressed: parent.opacity = 0.5
                                onReleased: parent.opacity = 1
                                onCanceled: parent.opacity = 1
                                onClicked: connectionListView.currentIndex = index
                            }
                        }
                    }
                    model: ListModel {
                        id: connectionList
                        ListElement { name: "PORT A" }
                        ListElement { name: "PORT B" }
                        ListElement { name: "PORT C" }
                    }
                    onCurrentIndexChanged:{
                        selectedConnection = connectionList.get(currentIndex).name
                        connectionSelectionPopup.close()
                    }
                }
            }
        }
    }
}

