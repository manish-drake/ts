import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    Page {
        anchors.fill: parent

        header: DetailHeader{
            id: detailHeader
            pageCount: 7
        }

        contentItem: Rectangle{
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            ColumnLayout{
                anchors.fill: parent
                Item{
                    Layout.leftMargin: 10
                    height: 50
                    width: 50
                    Image {
                        id: image1
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/img/img/Radar-25.png"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked:navigationModel.currentView = navigationModel.getTargetView("Radar")
                    }
                }
                ListView{
                    id: aircraftListView
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Layout.fillHeight: true
                    currentIndex: -1
                    //model:zmq.scanResults
                    model: aircraftModel
                    delegate:aircraftDetail
                    spacing: 5
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15
                    highlightMoveDuration: 0
                    highlight:Rectangle{
                        color:"transparent"
                        border.color: Universal.theme === Universal.Dark ? "white" : Universal.accent
                        border.width: 1
                        radius:5
                    }
                    Component{
                        id:aircraftDetail
                        Item{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            height: 100
                            AircraftDelegate{
                                anchors.fill:parent
                                anchors.margins: 1
                            }
                            MouseArea {
                                anchors.fill: parent
                                onPressed: parent.opacity = 0.5
                                onReleased: parent.opacity = 1
                                onCanceled: parent.opacity = 1
                                onClicked: aircraftListView.currentIndex = index
                            }
                        }
                    }
                    ListModel {//as per discussion only top four values will be displayed here
                        id:aircraftModel
                        ListElement {
                            aircraftId: "#1"
                            address: "2345AA (H) /23734510 (0)"
                            flight: "N 1246W"
                            bsdrevd: "0,5 0.8 0,9 6,0 6.1 6.5"
                            rflevel: "Strong"
                        }
                        ListElement {
                            aircraftId: "#2"
                            address: "CA310A (H) I 74361202 (0)"
                            flight: "Device1"
                            bsdrevd: "0.6 0.8 6,5"
                            rflevel: "Medium"
                        }
                        ListElement {
                            aircraftId: "#3"
                            address: "9CDA34 (H)/47800213 (0)"
                            flight: "VIPER1"
                            bsdrevd: "0,5 0.8 0,8 0.9 6.5"
                            rflevel: "Weak"
                        }
                        ListElement {
                            aircraftId: "#4"
                            address: "3BCA14 (H) /12800208 (0)"
                            flight: "Device2"
                            bsdrevd: "0,3 0,7 0.7 0.8 6.4"
                            rflevel: "Strong"
                        }
                    }
                }
            }
        }

        footer: DetailFooter{
            id: detailFooter
            function onRun(){
                console.log("onRun")
                zmq.toggleScan()
                console.log(zmq.scanResults)
            }
            function onPause(){
                console.log("onPause")
            }
            function onContinue(){
                console.log("onContinue")
            }
        }
    }

    Popup {
        id: menuPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: DetailMenu{testID: navigationModel.navigationParameter.id}
    }
    Popup {
        id: testSetupPopup
        height: parent.height
        width: parent.width
        modal: true
        padding: 0
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: TestSetup{}
    }
}

