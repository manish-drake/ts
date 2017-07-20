import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    property string bandName
    property bool isEnabled: true
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
                        text: "BAND"
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
                            onClicked: bandSelectionPopup.close()
                        }
                    }
                }
                ListView{
                    id: bandListView
                    Layout.bottomMargin: 20
                    Layout.minimumHeight: 450
                    anchors.left:parent.left
                    anchors.right:parent.right
                    clip: true
                    spacing: 4
                    delegate: Component{
                        id: bandListItemDelegate
                        Rectangle{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.leftMargin: 20
                            anchors.rightMargin: 20
                            height: 45
                            color: index == bandListView.currentIndex ? "#1B75BC" :  Universal.accent
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
                                Text {
                                    Layout.fillWidth: true
                                    Layout.leftMargin: 10
                                    Layout.rightMargin: 25
                                    Layout.alignment: Qt.AlignVCenter
                                    font.pixelSize: 15
                                    font.family: robotoRegular.name
                                    color: "White"
                                    text: freq + " MHz"
                                    elide: Text.ElideRight
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: bandListView.currentIndex = index
                            }
                        }
                    }
                    model: ListModel {
                        id: bandList
                        ListElement { name: "ILS"; freq: "50 - 350"; start: 50; stop: 350; middle: 150; defaultmarker: 150 }
                        ListElement { name: "MB"; freq: "50 - 100"; start: 50; stop: 100; middle: 75; defaultmarker: 75 }
                        ListElement { name: "VHF NAV COM"; freq: "100 - 150"; start: 100; stop: 150; middle: 125; defaultmarker: 125 }
                        ListElement { name: "GS"; freq: "310 - 360"; start: 310; stop: 360; middle: 335; defaultmarker: 360 }
                        ListElement { name: "UHF COM"; freq: "200 - 450"; start: 200; stop: 450; middle: 325; defaultmarker: 450 }
                        ListElement { name: "DME/TACAN"; freq: "900 - 1300"; start: 900; stop: 1300; middle: 1100; defaultmarker: 1100 }
                        ListElement { name: "XPNDR/UAT"; freq: "1000 - 1120"; start: 1000; stop: 1120; middle: 1060; defaultmarker: 1060 }
                        ListElement { name: "GPS/GNSS"; freq: "1500 - 1650"; start: 1500; stop: 1650; middle: 1575; defaultmarker: 1575 }
                        ListElement { name: "FULL"; freq: "50 - 2000"; start: 50; stop: 2000; middle: 1025; defaultmarker: 1025 }
                    }
                    onCurrentIndexChanged: {
                        if(isEnabled){
                            graphCtrl.freqStartVal = bandList.get(currentIndex).start
                            graphCtrl.freqMiddleVal = bandList.get(currentIndex).middle
                            graphCtrl.freqEndVal = bandList.get(currentIndex).stop
                            graphCtrl.markerMinVal = bandList.get(currentIndex).start
                            graphCtrl.markerMaxVal = bandList.get(currentIndex).stop
                            markersModel.get(0)._val = bandList.get(currentIndex).defaultmarker
                            graphCtrl.selectedMarkerVal = bandList.get(currentIndex).defaultmarker
                        }
                        bandName = bandList.get(currentIndex).name
                        bandSelectionPopup.close()
                    }
                }
            }
        }
    }
}

