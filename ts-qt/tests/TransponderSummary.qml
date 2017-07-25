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
                    y: 20
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 15
                    spacing: 25
                    ListModel{
                        id: transponderTestModel
                        ListElement{key: "XPNDR Type"; value: "Mode S EHS"; unit: ""; isResult: false}
                        ListElement{key: "COMM Capability"; value: "A, B, C, D"; unit: ""; isResult: false}
                        ListElement{key: "Frequency"; value: "1090.12"; unit: "MHz"; isResult: true; isPassed: true}
                        ListElement{key: "Power"; value: "+58.0"; unit: "dBm"; isResult: true; isPassed: true}
                        ListElement{key: "Mode A"; value: "1234"; unit: ""; isResult: true; isPassed: true}
                        ListElement{key: "Mode C"; value: "10,100"; unit: ""; isResult: true; isPassed: true}
                        ListElement{key: "Mode A SLS"; value: ""; unit: ""; isResult: true; isPassed: true}
                        ListElement{key: "Mode A All Call"; value: ""; unit: ""; isResult: true; isPassed: true}
                        ListElement{key: "Mode C All Call"; value: ""; unit: ""; isResult: true; isPassed: true}
                        ListElement{key: "Sl Lockout"; value: ""; unit: ""; isResult: true; isPassed: true}
                        ListElement{key: "Mode S Surv ID"; value: "1234"; unit: "FS:AIR"; isResult: true; isPassed: true}
                    }

                    GridLayout {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 15
                        rowSpacing: 20
                        columnSpacing: 12
                        Repeater{
                            model: transponderTestModel
                            Text{
                                Layout.row: index
                                Layout.column: 0
                                text: key
                                font.pixelSize: 16
                                font.family: robotoRegular.name
                                font.weight: Font.DemiBold
                                color: Universal.foreground
                                opacity: 0.5
                            }
                        }
                        Repeater{
                            model: transponderTestModel
                            Text{
                                Layout.row: index
                                Layout.column: 1
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                                text: value + " " + unit
                                font.pixelSize: 16
                                font.family: robotoRegular.name
                                font.weight: Font.DemiBold
                                color: Universal.foreground
                            }
                        }
                        Repeater{
                            model: transponderTestModel
                            Text{
                                Layout.row: index
                                Layout.column: 2
                                visible: isResult
                                text: isPassed ? "PASS" : "FAIL"
                                font.pixelSize: 16
                                font.family: robotoRegular.name
                                font.weight: Font.Black
                                color: isPassed ? "Green" : "Red"
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
