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
            pageCount: 7
        }

        contentItem: Rectangle{
            color: Universal.theme === Universal.Light ? Universal.background : "#1A1A1A"
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: content.height + content.y + 10
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                Column{
                    id: content
                    y: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 15
                    spacing: 25
                    Repeater{
                        model: summaryModel
                        delegate:
                            ColumnLayout {
                            Layout.row: order
                            Layout.minimumHeight: 120
                            Layout.topMargin: 20
                            Text {
                                Layout.fillHeight: true
                                text: name
                                font.weight: Font.DemiBold
                                font.pixelSize: 13
                                color: Universal.foreground
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
                                                text:model.modelData.value
                                                font.pixelSize: 12
                                                font.family: robotoRegular.name
                                                Controls.style:model.modelData.valueStyle
                                                color: Universal.foreground
                                            }
                                            Text{
                                                text:model.modelData.unit
                                                font.pixelSize: 12
                                                font.family: robotoRegular.name
                                                Controls.style:model.modelData.unitStyle
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
        }
    }

    Popup {
        id: detailMenuPopup
        height: parent.height
        width: parent.width
        modal: true
        closePolicy: Popup.CloseOnEscape
        padding: 30
        background: Rectangle{
            color: Universal.theme === Universal.Light ? "#99000000" : "#cc666666"
        }
        contentItem: DetailMenu{}
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
