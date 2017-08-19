import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Universal 2.1


Item{
    anchors.left: parent.left
    anchors.right: parent.right
    Layout.fillHeight: true
    property bool isHome
    Text{
        anchors.centerIn: parent
        text: "'No test exists'"
        font.pixelSize: 14
        font.weight: Font.Thin
        font.italic: true
        opacity: 0.4
        color: Universal.foreground
        visible: testsListView.count == 0
    }
    ListView {
        id: testsListView
        anchors.fill: parent
        anchors.topMargin: 8
        anchors.bottomMargin: 8
        model: testModel
        delegate: testCardDelegate
        focus: true
        clip: true
        currentIndex: -1
        highlightMoveDuration: 0
        highlight:Item{
            Rectangle{
                anchors.fill: parent
                anchors.margins: 2
                color: "transparent"
                border.color: Universal.accent
                border.width: 1
                radius:4
            }
        }
    }
    Component{
        id: testCardDelegate
        Item{
            anchors.left:parent.left
            anchors.right: parent.right
            height:110
            Rectangle {
                id: wrapper
                anchors.fill: parent
                anchors.topMargin: 3
                anchors.bottomMargin: 3
                anchors.leftMargin: 11
                anchors.rightMargin: 11
                color: Universal.theme === Universal.Light ? Universal.background : "#222222"
                radius: 4                
                ColumnLayout{
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    anchors.topMargin: 10
                    clip: true
                    spacing: 0
                    RowLayout{
                        Text {
                            Layout.fillWidth: true
                            elide:Text.ElideRight
                            text: name
                            font.pixelSize: 18
                            font.weight: Font.Black
                            font.capitalization: Font.AllUppercase
                            font.family: robotoRegular.name
                            color: Universal.accent
                        }
                    }
                    Rectangle{
                        Layout.topMargin: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: 1
                        color: Universal.foreground
                        opacity: 0.1
                    }
                    Text {
                        Layout.topMargin: 5
                        Layout.fillWidth: true
                        elide:Text.ElideRight
                        text: "RECENT TEST RESULTS"
                        font.pixelSize: 12
                        font.weight: Font.Bold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.5
                    }
                    Text {
                        Layout.fillWidth: true
                        elide:Text.ElideRight
                        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut dapibus"
                        font.pixelSize: 12
                        font.weight: Font.Bold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.7
                    }
                }
            }
            MouseArea {
                anchors.fill: parent
                onPressed: parent.opacity = 0.7
                onReleased: parent.opacity = 1
                onCanceled: parent.opacity = 1
                onClicked:navigationModel.setCurrentView(navigationModel.getTargetView("_test", id), {"title":name, "id": id, "isHome": isHome});
            }
        }
    }
}
