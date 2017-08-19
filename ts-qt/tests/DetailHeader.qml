import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

//import QtGraphicalEffects 1.0

Rectangle{
    height: 58
    anchors.left: parent.left
    anchors.right: parent.right
    color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
    property int pageCount: 1
    ColumnLayout{
        anchors.fill: parent
        spacing: 0
        Item{
            Layout.alignment: Qt.AlignHCenter
            height: pageIndicator.height
            width: pageIndicator.width
            visible: pageIndicator.visible
            PageIndicator {
                id: pageIndicator
                count: pageCount
                currentIndex: summaryModel.currentPage
                visible: count > 1
            }
//            ColorOverlay{
//                anchors.fill: pageIndicator
//                source: pageIndicator
//                color: Universal.foreground
//                visible: Universal.theme === Universal.Dark
//            }
        }
        Text {
            id: testDetailTitleText
            Layout.alignment: Qt.AlignCenter
            text: navigationModel.navigationParameter.title
            font.pixelSize: 20
            font.weight: Font.Black
            font.family: robotoRegular.name
            color: Universal.foreground
            opacity: 0.7
        }
    }
    Item{
        anchors.right: parent.right
        anchors.leftMargin: 5
        height: 48
        width: 48
        Column{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter:  parent.verticalCenter
            spacing: 3
            Rectangle{
                color:Universal.accent
                height: 5
                width: 5
                radius: 2
            }
            Rectangle{
                color:Universal.accent
                height: 5
                width: 5
                radius: 2
            }
            Rectangle{
                color:Universal.accent
                height: 5
                width: 5
                radius: 2
            }
        }
        MouseArea {
            anchors.fill: parent
            onPressed: parent.opacity = 0.5
            onReleased: parent.opacity = 1
            onClicked: menuPopup.open()
        }
    }
}
