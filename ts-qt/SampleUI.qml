import QtQuick 2.0

Item {
    Rectangle{
        Row{
            id: row
            Column{
                anchors.verticalCenter: parent.verticalCenter
                Text{text:"text1";visible: false}
                Text{text:"text2"}
                Text{text:"text3";visible: false}
                Text{text:"text4"}
                Text{text:"text5";visible: false}
            }
            Column{
                anchors.verticalCenter: parent.verticalCenter
                Text{text:"text6"}
                Text{text:"text7";visible: false}
                Text{text:"text8"}
                Text{text:"text9";visible: false}
                Text{text:"text0"}
            }
        }
    }
}
