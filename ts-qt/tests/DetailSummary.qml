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

        header: DetailHeader{
            id: detailHeader
            pageCount: navigationModel.navigationParameter.id === 6 ? 9 : 7
        }

        contentItem: Rectangle{
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: content.height + content.y + 10
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                GridLayout{
                    id: content
                    y: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 15
                    columnSpacing: 25
                    Repeater{
                        model: summaryModel
                        delegate:
                            ColumnLayout {
                            Layout.fillWidth: true
                            Layout.topMargin: 20
                            Layout.row: order
                            Layout.column: col
                            Layout.columnSpan: colSpan
                            Text {
                                Layout.fillHeight: true
                                text: name
                                font.weight: Font.DemiBold
                                font.pixelSize: 13
                                color: Universal.accent
                                font.capitalization: Font.AllUppercase
                                font.family: robotoRegular.name
                            }
                            GridLayout {
                                Repeater {
                                    model: summaryModel.getTestParamsForsummary(id)
                                    delegate: Rectangle{
                                        color: "transparent"
                                        Layout.row: model.modelData.row
                                        Layout.column: model.modelData.col
                                        Layout.fillWidth: true
                                        Layout.minimumWidth: content.width /2
                                        //Layout.preferredWidth : 200
                                        Layout.rightMargin: 9
                                        Layout.columnSpan: model.modelData.colSpan
                                        Layout.rowSpan: model.modelData.rowSpan
                                        height: 15
                                        Controls.style:model.modelData.keyStyle
                                        Row{
                                            spacing: 4
                                            anchors.fill: parent
                                            Text{
                                                text:model.modelData.key
                                                font.pixelSize: 12
                                                font.family: robotoRegular.name
                                                Controls.style:model.modelData.keyStyle
                                                color: Universal.foreground
                                                opacity: 0.5
                                            }
                                            Text{
                                                text:model.modelData.value1
                                                font.pixelSize: 12
                                                font.family: robotoRegular.name
                                                Controls.style:model.modelData.value1Style
                                                color: Universal.foreground
                                            }
                                            Text{
                                                text:model.modelData.unit1
                                                font.pixelSize: 12
                                                font.family: robotoRegular.name
                                                Controls.style:model.modelData.unit1Style
                                                color: Universal.foreground
                                            }
                                            Text{
                                                text:model.modelData.value2
                                                font.pixelSize: 12
                                                font.family: robotoRegular.name
                                                Controls.style:model.modelData.value2Style
                                                color: Universal.foreground
                                            }
                                            Text{
                                                text:model.modelData.unit2
                                                font.pixelSize: 12
                                                font.family: robotoRegular.name
                                                Controls.style:model.modelData.unit2Style
                                                color: Universal.foreground
                                            }
                                            Text{
                                                text:model.modelData.value3
                                                font.pixelSize: 12
                                                font.family: robotoRegular.name
                                                Controls.style:model.modelData.value3Style
                                                color: Universal.foreground
                                            }
                                            Text{
                                                text:model.modelData.unit3
                                                font.pixelSize: 12
                                                font.family: robotoRegular.name
                                                Controls.style:model.modelData.unit3Style
                                                color: Universal.foreground
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        footer: DetailFooter{
            id: detailFooter
            function onRun(){
                console.log("onRun")
                footer.testStatus = "in progress";
                testRunTimer.running = true;
            }
            function onPause(){
                console.log("onPause")
                footer.testStatus = "stopped";
                testRunTimer.stop();
            }
            function onContinue(){
                console.log("onContinue")
                footer.testStatus = "in progress";
                testRunTimer.start();
            }
            Timer{
                id: testRunTimer
                interval: 1000
                repeat: true
                property int dur
                onTriggered:{
                    footer.testRunTime = dur.toString() + " s"
                    dur = dur + 1
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
        id: transponderTestsListPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: TransponderTestList{}
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
        contentItem: DetailMenu{ testID: navigationModel.navigationParameter.id}
    }
}
