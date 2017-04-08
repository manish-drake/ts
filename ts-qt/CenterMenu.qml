import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4

Item {
    id: item1
    GridLayout {
        id: grid
        columnSpacing: 0
        rowSpacing: 0
        anchors.fill: parent
        columns: 2
        Layout.margins:  0
        function prefWidth(item){
            return 136 * item.Layout.columnSpan
        }
        function prefHeight(item){
            return 90 * item.Layout.rowSpan
        }
        Rectangle {
            border.color: "#d3d3d3"
            Layout.preferredWidth : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            Text{
                id: header1
                anchors.horizontalCenter: parent.horizontalCenter
                text:"OPERATOR"
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Rectangle{
                color: "#00000000"
                anchors.top: header1.bottom
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                ComboBox{
                    width: 100
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    currentIndex: 1
                    model: ListModel{
                        id:cbOperatorItems
                        ListElement{text:"Operator1"}
                        ListElement{text:"Operator1"}
                        ListElement{text:"Operator1"}
                    }
                }
            }
        }
        Rectangle {
            border.color: "#d3d3d3"
            Layout.preferredWidth : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            Text{
                id: header2
                anchors.horizontalCenter: parent.horizontalCenter
                text:"THEME"
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Rectangle{
                color: "#00000000"
                anchors.top: header2.bottom
                anchors.bottom: label2.top
                anchors.left: parent.left
                anchors.right: parent.right
                Rectangle{
                    height:20
                    width: 20
                    color:"gray"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Text{
                id: label2
                text:"Indoor"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Rectangle {
            border.color: "#d3d3d3"
            Layout.preferredWidth : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            Text{
                id: header3
                anchors.horizontalCenter: parent.horizontalCenter
                text:"LANGUAGE"
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Rectangle{
                color: "#00000000"
                anchors.top: header3.bottom
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                ComboBox{
                    width: 100
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    currentIndex: 1
                    model: ListModel{
                        id:cbLaguageItems
                        ListElement{text:"English"}
                        ListElement{text:"French"}
                        ListElement{text:"Spanish"}
                    }
                }
            }
        }
        Rectangle {
            border.color: "#d3d3d3"
            Layout.preferredWidth : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            Text{
                id: header4
                anchors.horizontalCenter: parent.horizontalCenter
                text:"REMOTE CONNECT"
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Rectangle{
                color: "#00000000"
                anchors.top: header4.bottom
                anchors.bottom: ctrl4.top
                anchors.left: parent.left
                anchors.right: parent.right
                Rectangle{
                    height:20
                    width: 20
                    color:"gray"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            ComboBox{
                id: ctrl4
                width: 100
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                currentIndex: 1
                model: ListModel{
                    id:cbTestSetItems
                    ListElement{text:"TestSet#3"}
                    ListElement{text:"TestSet#4"}
                    ListElement{text:"TestSet#5"}
                }
            }
        }
        Rectangle {
            border.color: "#d3d3d3"
            Layout.preferredWidth : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            Text{
                id: header5
                anchors.horizontalCenter: parent.horizontalCenter
                text:"TEST SET ICAO ADDRE..."
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Rectangle{
                color: "#00000000"
                anchors.top: header5.bottom
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                ComboBox{
                    width: 100
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    currentIndex: 1
                    model: ListModel{
                        id:cbTestAddressItems
                        ListElement{text:"AC82EC"}
                        ListElement{text:"AC82DF"}
                        ListElement{text:"AC82FG"}
                    }
                }
            }
        }
        Rectangle {
            border.color: "#d3d3d3"
            Layout.preferredWidth : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            Text{
                id: header6
                anchors.horizontalCenter: parent.horizontalCenter
                text:"UUT DEVICE CLASS"
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Rectangle{
                color: "#00000000"
                anchors.top: header6.bottom
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                Text{
                    text:"CLASS A"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
        Rectangle {
            border.color: "#d3d3d3"
            Layout.preferredWidth : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            Text{
                id: header7
                anchors.horizontalCenter: parent.horizontalCenter
                text:"UUT ANTENNA"
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Rectangle{
                color: "#00000000"
                anchors.top: header7.bottom
                anchors.bottom: label7.top
                anchors.left: parent.left
                anchors.right: parent.right
                Rectangle{
                    height:20
                    width: 20
                    color:"gray"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Text{
                id: label7
                anchors.horizontalCenter: parent.horizontalCenter
                text:"Top"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
            }
        }

        Rectangle {
            border.color: "#d3d3d3"
            Layout.preferredWidth : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            Text{
                id: header8
                anchors.horizontalCenter: parent.horizontalCenter
                text:"TEST SET CONNECTION"
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Rectangle{
                color: "#00000000"
                anchors.top: header8.bottom
                anchors.bottom: ctrl8.top
                anchors.left: parent.left
                anchors.right: parent.right
                Rectangle{
                    height:20
                    width: 20
                    color:"gray"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            ComboBox{
                id: ctrl8
                width: 100
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
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
            border.color: "#d3d3d3"
            Layout.preferredWidth : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            Layout.columnSpan: 2;
            Text{
                id: header9
                anchors.horizontalCenter: parent.horizontalCenter
                text:"DISTANCE To UUT"
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Rectangle{
                color: "#00000000"
                anchors.top: header9.bottom
                anchors.bottom: sld.top
                anchors.left: parent.left
                anchors.right: parent.right
                Text{
                    text:"%1 Ft".arg(sld.value)
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            Slider {
                id: sld
                anchors.rightMargin: 15
                anchors.leftMargin: 15
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 25
                anchors.left: parent.left
                anchors.right: parent.right
                minimumValue: 10
                value: 200
                maximumValue: 250
            }
            Text{
                text:"10 Ft"
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
            }
            Text{
                text:"250 Ft"
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
            }
        }
    }

}
