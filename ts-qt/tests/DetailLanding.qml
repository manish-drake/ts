import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import com.ti.controls 1.0

Item{    
    Page {
        anchors.fill: parent

        header: DetailLandingHeader{}

        contentItem: Rectangle {
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            Flickable {
                anchors.fill: parent
                contentWidth: width;
                contentHeight: content.height + content.y + 10
                boundsBehavior: Flickable.StopAtBounds
                Column{
                    id: content
                    y: 60
                    anchors.left: parent.left
                    anchors.right: parent.right
                    spacing: 25
                    Text {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        horizontalAlignment: Text.AlignHCenter
                        text: navigationModel.navigationParameter.title
                        font.pixelSize: 24
                        font.weight: Font.Black
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.7
                    }
                    Text {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 45
                        anchors.rightMargin: 45
                        horizontalAlignment: Text.AlignHCenter
                        wrapMode: Text.WordWrap
                        text: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.6
                    }
                    Image{
                        id: guideImg
                        anchors.left: parent.left
                        anchors.right: parent.right
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/img/img/guide.png"
                    }
                }
            }
        }

        footer: Rectangle{
            id:testFooterRect
            height: 110
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            Rectangle{
                anchors.left: parent.left
                anchors.right: parent.right
                height: 1
                color: Universal.foreground
                opacity: 0.2
            }
            RowLayout{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                spacing: 0
                ColumnLayout{
                    Layout.alignment: Qt.AlignBottom
                    spacing: 0
                    Rectangle{
                        Layout.alignment: Qt.AlignHCenter
                        Layout.topMargin: 5
                        Layout.bottomMargin: 5
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        height: 50
                        width: 50
                        radius: 25
                        color: "transparent"
                        border.width: 2
                        border.color: Universal.accent
                        Image {
                            id: resultsImg
                            anchors.centerIn: parent
                            source: "qrc:/img/img/results.png"
                        }
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: "RESULTS"
                        font.pixelSize: 12
                        font.weight: Font.Black
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: navigationModel.setCurrentView(navigationModel.getTargetView(
                                                                     "_detailSummary",
                                                                     navigationModel.navigationParameter.id), {
                                                                     "id": navigationModel.navigationParameter.id,
                                                                     "title": navigationModel.navigationParameter.title,
                                                                     "runState": "idle",
                                                                     "isHome": navigationModel.navigationParameter.isHome
                                                                 });
                    }
                }
                Item{
                    Layout.fillWidth: true
                }
                ColumnLayout{
                    Layout.alignment: Qt.AlignBottom
                    spacing: 0
                    Rectangle{
                        Layout.alignment: Qt.AlignHCenter
                        Layout.topMargin: 5
                        Layout.bottomMargin: 5
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        height: 50
                        width: 50
                        radius: 25
                        color: "transparent"
                        border.width: 2
                        border.color: Universal.accent
                        Image {
                            id: setupImage
                            anchors.centerIn: parent
                            source: "qrc:/img/img/Settings-accent.png"
                        }
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: "SETUP"
                        font.pixelSize: 12
                        font.weight: Font.Black
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: testSetupPopup.open()
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                    }
                }
                ColumnLayout{
                    Layout.alignment: Qt.AlignBottom
                    spacing: 0
                    Rectangle{
                        Layout.alignment: Qt.AlignHCenter
                        Layout.topMargin: 5
                        Layout.bottomMargin: 5
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        height: 70
                        width: 70
                        radius: 35
                        color: Universal.accent
                        Image {
                            id: buttonImage
                            anchors.centerIn: parent
                            source: "qrc:/img/img/play-button.png"
                            smooth: true
                        }
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: "Start"
                        font.pixelSize: 12
                        font.capitalization: Font.AllUppercase
                        font.weight: Font.Black
                        font.family: robotoRegular.name
                        color: Universal.foreground
                        opacity: 0.8
                    }
                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        onPressed: parent.opacity = 0.5
                        onReleased: parent.opacity = 1
                        onClicked: navigationModel.setCurrentView(navigationModel.getTargetView(
                                                                      "_detailSummary",navigationModel.navigationParameter.id),
                                                                  {
                                                                      "id": navigationModel.navigationParameter.id,
                                                                      "title": navigationModel.navigationParameter.title,
                                                                      "runState": "start",
                                                                      "isHome": navigationModel.navigationParameter.isHome
                                                                  });
                    }
                }
            }
        }
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
        contentItem: DetailLandingMenu{}
    }
}
