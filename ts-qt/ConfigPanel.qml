import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4

Item {
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
                Image{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/Sun Filled-25.png"
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
                Image{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/wifi-signal-waves.png"
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
                id: header10
                anchors.horizontalCenter: parent.horizontalCenter
                text:"DISPLAY BRIGHTNESS"
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Rectangle{
                color: "#00000000"
                anchors.top: header10.bottom
                anchors.bottom: sld2.top
                anchors.left: parent.left
                anchors.right: parent.right
                Text{
                    text: sld2.value
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            Slider {
                id: sld2
                anchors.rightMargin: 15
                anchors.leftMargin: 15
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 25
                anchors.left: parent.left
                anchors.right: parent.right
                minimumValue: 1
                maximumValue: 10
                stepSize: 1
                value: 7
            }
            Text{
                text: sld2.minimumValue
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
            }
            Text{
                text: sld2.maximumValue
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
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
                id: header11
                anchors.horizontalCenter: parent.horizontalCenter
                text:"GPS SOURCE"
                anchors.top: parent.top
                anchors.topMargin: 10
            }
            Rectangle{
                color: "#00000000"
                anchors.top: header11.bottom
                anchors.bottom: label11.top
                anchors.left: parent.left
                anchors.right: parent.right
                Image{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/Marker-25.png"
                }
            }
            Text{
                id: label11
                anchors.horizontalCenter: parent.horizontalCenter
                text:"Internal"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
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
                Image{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/Circled Up-25.png"
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
                Image{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/filter-results-button.png"
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
                maximumValue: 250
                stepSize: 1
                value: 200
            }
            Text{
                text:"%1 Ft".arg(sld.minimumValue)
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
            }
            Text{
                text:"%1 Ft".arg(sld.maximumValue)
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
            }
        }


//        Rectangle {
//            border.color: "#d3d3d3"
//            Layout.preferredWidth : grid.prefWidth(this)
//            Layout.preferredHeight : grid.prefHeight(this)
//            Text{
//                id: header3
//                anchors.horizontalCenter: parent.horizontalCenter
//                text:"LANGUAGE"
//                anchors.top: parent.top
//                anchors.topMargin: 10
//            }
//            Rectangle{
//                color: "#00000000"
//                anchors.top: header3.bottom
//                anchors.bottom: parent.bottom
//                anchors.left: parent.left
//                anchors.right: parent.right
//                ComboBox{
//                    width: 100
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    anchors.verticalCenter: parent.verticalCenter
//                    currentIndex: 1
//                    model: ListModel{
//                        id:cbLaguageItems
//                        ListElement{text:"English"}
//                        ListElement{text:"French"}
//                        ListElement{text:"Spanish"}
//                    }
//                }
//            }
//        }
    }
}