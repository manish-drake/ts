import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    property string guideTestName
    ColumnLayout{
        anchors.fill: parent
        RowLayout{
            Layout.topMargin: 15
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 15
            Rectangle{
                y:10
                width:65
                height: 65
                color:"white"
                radius: 35
                Image {
                    anchors.centerIn: parent
                    width: 55
                    height: 55
                    source: "qrc:/img/img/test-logo.png"
                }
            }
            ColumnLayout{
                Layout.column: 1
                Layout.fillWidth: true
                Layout.leftMargin: 10
                Text {
                    Layout.fillWidth: true
                    text: headerTitle
                    font.pixelSize: 18
                    font.weight: Font.Black
                    font.family: robotoRegular.name
                    color: Universal.foreground
                    opacity: 0.7
                }
                Text {
                    Layout.row: 1
                    Layout.fillWidth: true
                    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut dapibus, ante tristique blandit convallis."
                    wrapMode: Text.WordWrap
                    font.pixelSize: 14
                    font.weight: Font.DemiBold
                    font.family: robotoRegular.name
                    color: Universal.foreground
                    opacity: 0.6
                }
            }
        }
        Item{
            Layout.row: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            ListView {
                id: grid
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
                            onClicked:navigationModel.setCurrentView(navigationModel.getTargetView("_test", id), {"title":name, "id": id});
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

//                                Item{
//                                    width: 35
//                                    height: 35
//                                    Image {
//                                        id: favImage
//                                        anchors.centerIn: parent
//                                        source: "qrc:/img/img/star.png"
//                                    }
//                                    //                                    ColorOverlay {
//                                    //                                        anchors.fill: favImage
//                                    //                                        source: favImage
//                                    //                                        color: Universal.theme === Universal.Dark ? "white" : Universal.accent
//                                    //                                    }
//                                    MouseArea {
//                                        anchors.fill: parent
//                                        onClicked: testModel.addToHome(name, 1);
//                                        onPressed: parent.opacity = 0.5
//                                        onReleased: parent.opacity = 1
//                                    }
//                                }

                                //                                Item{
                                //                                    Layout.column: 2
                                //                                    width: 35
                                //                                    height: 35
                                //                                    Image {
                                //                                        id: guideImage
                                //                                        anchors.centerIn: parent
                                //                                        source: "qrc:/img/img/Info-24.png"
                                //                                    }
                                //                                    ColorOverlay {
                                //                                        anchors.fill: guideImage
                                //                                        source: guideImage
                                //                                        color: Universal.theme === Universal.Dark ? "white" : Universal.accent
                                //                                    }
                                //                                    MouseArea {
                                //                                        anchors.fill: parent
                                //                                        onClicked: {
                                //                                            guideTestName = name
                                //                                            guidePopup.open()
                                //                                        }
                                //                                        onPressed: parent.opacity = 0.5
                                //                                        onReleased: parent.opacity = 1
                                //                                    }
                                //                                }

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
    Popup {
        id: guidePopup
        height: parent.height
        width: parent.width
        topPadding: 60
        bottomPadding: 60
        leftPadding: 20
        rightPadding: 20
        modal: true
        closePolicy: Popup.CloseOnEscape
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: TestGuide{}
    }
}
