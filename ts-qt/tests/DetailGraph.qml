import QtQuick 2.7
//import QtGraphicalEffects 1.0
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
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: content.height + 10
                boundsBehavior: Flickable.StopAtBounds
                ColumnLayout{
                    id: content
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 10
                    Item{
                        height: 50
                        width: 50
                        Image {
                            id: image1
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            source: "qrc:/img/img/View Details-25.png"
                        }
//                        ColorOverlay{
//                            anchors.fill: image1
//                            source: image1
//                            color: Universal.foreground
//                        }
                        MouseArea {
                            anchors.fill: parent                            
                            onPressed: parent.opacity = 0.5
                            onReleased: parent.opacity = 1
                            onClicked:navigationModel.currentView = navigationModel.getTargetView("Scan")
                        }
                    }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "qrc:/img/img/waveform.png"
                    }
                }
            }
        }

        footer: DetailFooter{
            id: detailFooter
            function onRun(){
                console.log("onRun")
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
