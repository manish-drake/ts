import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Universal 2.1

Item {
    ColumnLayout{
        anchors.fill: parent
        Image {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 35
            source: "qrc:/img/img/profile-circle.png"
        }
        Text{
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 15
            text: currentUser
            font.pixelSize: 16
            font.weight: Font.Thin
            opacity: 0.5
            color: Universal.foreground
        }
        Rectangle{
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 35
            width: 40
            height: 1
            color: Universal.foreground
            opacity: 0.2
        }
        Item{
            anchors.left: parent.left
            anchors.right: parent.right
            Layout.fillHeight: true
            Text{
                anchors.centerIn: parent
                text: "'No test exists in home yet'"
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
                anchors.margins: 8
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
                        anchors.margins: 3
                        color: Universal.theme === Universal.Light ? Universal.background : "#222222"
                        radius: 4
                        MouseArea {
                            anchors.fill: parent
                            onClicked:navigationModel.setCurrentView(navigationModel.getTargetView("_test", id), {"title":name, "id": id, "isHome": true});
                        }
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
                                Item{
                                    width: 35
                                    height: 35
                                    Image {
                                        id: favImage
                                        anchors.centerIn: parent
                                        source: "qrc:/img/img/star-filled.png"
                                    }
                                    //                                    ColorOverlay {
                                    //                                        anchors.fill: favImage
                                    //                                        source: favImage
                                    //                                        color: Universal.theme === Universal.Dark ? "white" : Universal.accent
                                    //                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: testModel.removeFromHome(id)
                                        onPressed: parent.opacity = 0.5
                                        onReleased: parent.opacity = 1
                                    }
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
                }
            }
        }
    }
}
