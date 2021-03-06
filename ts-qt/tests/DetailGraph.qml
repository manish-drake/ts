import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1

Item{
    Page {
        anchors.fill: parent

        header: DetailSummaryHeader{
            id: detailHeader
            pageCount: 7
        }

        contentItem: Rectangle{
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            Flickable {
                anchors.fill: parent
                contentWidth: width;
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
                        Image{
                            id: image1
                            anchors.centerIn: parent
                            source: "qrc:/img/img/View Details-25.png"
                            asynchronous: true
                        }
                        MouseArea {
                            anchors.fill: parent                            
                            onPressed: parent.opacity = 0.5
                            onReleased: parent.opacity = 1
                            onClicked:navigationModel.currentView = navigationModel.getTargetView("Scan")
                        }
                    }
                    Image{
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "qrc:/img/img/waveform.png"
                        asynchronous: true
                    }
                }
            }
        }

        footer: DetailSummaryFooter{
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
        contentItem: DetailSummaryMenu{testID: navigationModel.navigationParameter.id}
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
