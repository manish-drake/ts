import QtQuick 2.0

Rectangle{
    anchors.fill: parent
    color: "#f9ecec"
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
    Component{
        id:aircraftDetail
        Item{
            width:480
            height: 100
            anchors.margins: 5
            Aircraft{
                anchors.fill:parent
            }
        }
    }
    ListView{
        anchors.fill:parent
        model:aircraftModel
        delegate:aircraftDetail
        highlight:Rectangle{
            color:"lightsteelblue"
            radius:5
        }
    }

    Item {
        id: navigation
        anchors.bottom: parent.bottom
        width: parent.width
        height: 30
        Text {
            anchors.left: parent.left
            anchors.margins: 20
            id: prev
            text: qsTr("Previous")
        }

        Text {
            anchors.right: parent.right
            anchors.margins: 20
            id: nxt
            text: qsTr("Next")
            MouseArea {
                anchors.fill: parent
                onClicked: navigationModel.currentView = navigationModel.getTargetView("Next")
            }
        }
    }
}

