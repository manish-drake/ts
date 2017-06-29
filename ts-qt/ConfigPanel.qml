import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Universal 2.1
import QtGraphicalEffects 1.0

Item {
    property string currentOperator
    Rectangle{
        implicitWidth: grid.implicitWidth
        implicitHeight: grid.implicitHeight
        color: Universal.background
        GridLayout {
            id: grid
            columnSpacing: 0
            rowSpacing: 0
            anchors.fill: parent
            columns: 2
            Layout.margins:  0
            function prefWidth(item){
                return 160 * item.Layout.columnSpan
            }
            function prefHeight(item){
                return 100 * item.Layout.rowSpan
            }
            Rectangle {
                color: "transparent"
                border.color: "#d3d3d3"
                Layout.preferredWidth : grid.prefWidth(this)
                Layout.preferredHeight : grid.prefHeight(this)
                Text{
                    id: header1
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"OPERATOR"
                    font.pixelSize: 12
                    font.weight: Font.DemiBold
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    color: Universal.accent
                }
                ComboBox{
                    id: operatorCombobox
                    width: 120
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 10
                    currentIndex: 0
                    model: ListModel{
                        id:cbOperatorItems
                        ListElement{text:"Operator"}
                        ListElement{text:"Ken Filardo"}
                        ListElement{text:"Dave Klamet"}
                        ListElement{text:"Steve O'Hara"}
                    }
                    onCurrentIndexChanged: {
                        currentOperator = cbOperatorItems.get(operatorCombobox.currentIndex).text
                    }
                }
            }
            Rectangle {
                color: "transparent"
                border.color: "#d3d3d3"
                Layout.preferredWidth : grid.prefWidth(this)
                Layout.preferredHeight : grid.prefHeight(this)
                Text{
                    id: header2
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"THEME"
                    font.pixelSize: 12
                    font.weight: Font.DemiBold
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    color: Universal.accent
                }
                Rectangle{
                    color: "#00000000"
                    anchors.top: header2.bottom
                    anchors.bottom: label2.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Image{
                        id:sunImage
                        anchors.centerIn: parent
                        source: "qrc:/img/img/Sun Filled-25.png"
                    }
                    ColorOverlay {
                        anchors.fill: sunImage
                        source: sunImage
                        color: Universal.foreground
                    }
                }
                Text{
                    id: label2
                    text: Universal.theme == Universal.Light ? "Indoor":"Outdoor"
                    font.pixelSize: 14
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Universal.foreground
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Universal.theme == Universal.Light) {
                            _theme = Universal.Dark
                        }
                        else {_theme = Universal.Light}
                    }
                }
            }

            Rectangle {
                color: "transparent"
                border.color: "#d3d3d3"
                Layout.preferredWidth : grid.prefWidth(this)
                Layout.preferredHeight : grid.prefHeight(this)
                Text{
                    id: header10
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"DISPLAY BRIGHTNESS"
                    font.pixelSize: 12
                    font.weight: Font.DemiBold
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    color: Universal.accent
                }
                Text{
                    anchors.top: header10.bottom
                    anchors.topMargin: 7
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: sld2.value
                    font.pixelSize: 14
                    color: Universal.foreground
                }
                Slider {
                    id: sld2
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    minimumValue: 1
                    maximumValue: 10
                    stepSize: 1
                    value: 7
                }
                Text{
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    text: sld2.minimumValue
                    font.pixelSize: 12
                    color: Universal.foreground
                }
                Text{
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    text: sld2.maximumValue
                    font.pixelSize: 12
                    color: Universal.foreground
                }
            }

            Rectangle {
                color: "transparent"
                border.color: "#d3d3d3"
                Layout.preferredWidth : grid.prefWidth(this)
                Layout.preferredHeight : grid.prefHeight(this)
                Text{
                    id: header5
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"TEST SET ICAO ADDRESS"
                    font.pixelSize: 12
                    font.weight: Font.DemiBold
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    color: Universal.accent
                }
                ComboBox{
                    width: 120
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 10
                    currentIndex: 1
                    model: ListModel{
                        id:cbTestAddressItems
                        ListElement{text:"AC82EC"}
                        ListElement{text:"AC82DF"}
                        ListElement{text:"AC82FG"}
                    }
                }
            }

            Rectangle {
                color: "transparent"
                border.color: "#d3d3d3"
                Layout.preferredWidth : grid.prefWidth(this)
                Layout.preferredHeight : grid.prefHeight(this)
                Text{
                    id: header11
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"GPS SOURCE"
                    font.pixelSize: 12
                    font.weight: Font.DemiBold
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    color: Universal.accent
                }
                Rectangle{
                    color: "#00000000"
                    anchors.top: header11.bottom
                    anchors.bottom: label11.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Image{
                        id: markerImage
                        anchors.centerIn: parent
                        source: "qrc:/img/img/Marker-25.png"
                    }
                    ColorOverlay {
                        anchors.fill: markerImage
                        source: markerImage
                        color: Universal.foreground
                    }
                }
                Text{
                    id: label11
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    text:"Internal"
                    font.pixelSize: 14
                    color: Universal.foreground
                }
            }
            Rectangle {
                color: "transparent"
                border.color: "#d3d3d3"
                Layout.preferredWidth : grid.prefWidth(this)
                Layout.preferredHeight : grid.prefHeight(this)
                Text{
                    id: header6
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"UUT DEVICE CLASS"
                    font.pixelSize: 12
                    font.weight: Font.DemiBold
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    color: Universal.accent
                }
                Rectangle{
                    color: "#00000000"
                    anchors.top: header6.bottom
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        text:"CLASS A"
                        font.pixelSize: 14
                        color: Universal.foreground
                    }
                }
            }

            Rectangle {
                color: "transparent"
                border.color: "#d3d3d3"
                Layout.preferredWidth : grid.prefWidth(this)
                Layout.preferredHeight : grid.prefHeight(this)
                Text{
                    id: header7
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"UUT ANTENNA"
                    font.pixelSize: 12
                    font.weight: Font.DemiBold
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    color: Universal.accent
                }
                Rectangle{
                    color: "#00000000"
                    anchors.top: header7.bottom
                    anchors.bottom: label7.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Image{
                        id: uutImage
                        anchors.centerIn: parent
                        source: "qrc:/img/img/Circled Up-25.png"
                    }
                    ColorOverlay {
                        anchors.fill: uutImage
                        source: uutImage
                        color: Universal.foreground
                    }
                }
                Text{
                    id: label7
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    text:"Top"
                    font.pixelSize: 14
                    color: Universal.foreground
                }
            }

            Rectangle {
                color: "transparent"
                border.color: "#d3d3d3"
                Layout.preferredWidth : grid.prefWidth(this)
                Layout.preferredHeight : grid.prefHeight(this)
                Text{
                    id: header8
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"TEST SET CONNECTION"
                    font.pixelSize: 12
                    font.weight: Font.DemiBold
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    color: Universal.accent
                }
                Item{
                    anchors.top: header8.bottom
                    anchors.topMargin: 12
                    anchors.left: parent.left
                    anchors.right: parent.right
                    Image{
                        id: connImage
                        anchors.centerIn: parent
                        source: "qrc:/img/img/filter-results-button.png"
                    }
                    ColorOverlay {
                        anchors.fill: connImage
                        source: connImage
                        color: Universal.foreground
                    }
                }
                ComboBox{
                    width: 120
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 15
                    currentIndex: 1
                    model: ListModel{
                        id:cbTestSetConItems
                        ListElement{text:"Part A Antenna"}
                        ListElement{text:"Part B Antenna"}
                        ListElement{text:"Part C Antenna"}
                    }
                }
            }

            Rectangle {
                color: "transparent"
                border.color: "#d3d3d3"
                Layout.preferredWidth : grid.prefWidth(this)
                Layout.preferredHeight : grid.prefHeight(this)
                Layout.columnSpan: 2
                Text{
                    id: header9
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"DISTANCE To UUT"
                    font.pixelSize: 12
                    font.weight: Font.DemiBold
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    color: Universal.accent
                }
                Text{
                    anchors.top: header9.bottom
                    anchors.topMargin: 7
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"%1 Ft".arg(sld.value)
                    font.pixelSize: 14
                    color: Universal.foreground
                }
                Slider {
                    id: sld
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    minimumValue: 10
                    maximumValue: 250
                    stepSize: 1
                    value: 200
                }
                Text{
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    text:"%1 Ft".arg(sld.minimumValue)
                    font.pixelSize: 12
                    color: Universal.foreground
                }
                Text{
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    text:"%1 Ft".arg(sld.maximumValue)
                    font.pixelSize: 12
                    color: Universal.foreground
                }
            }
        }
    }
}
