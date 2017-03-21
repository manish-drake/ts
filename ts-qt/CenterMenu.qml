import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls 1.4

Item {
    id: item1
    Rectangle{
        height:424//605//*0.6;
        width:270// 193*2+4// * .6;
        color:"#d3d3d3"
        clip:true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 5
        GridLayout {
            columnSpacing: 1
            rowSpacing: 1
            anchors.horizontalCenter: parent.horizontalCenter
            columns: 2
            Layout.margins:  0

            Rectangle { id: rectangle; color: "#F4F4F4"; Layout.fillHeight: false;
                Layout.fillWidth: false; width: 136; height: 84;
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"OPERATOR"
                    anchors.top: parent.top
                    anchors.topMargin: 5
                }

                ComboBox{
                    width: 80
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
            Rectangle { id: rectangle5; color: "#F4F4F4"; width: 136; height: 84;
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"THEME"
                    anchors.top: parent.top
                    anchors.topMargin: 5
                }
                Rectangle{
                    height:20
                    width: 20
                    color:"gray"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text{
                    text:"Indoor"
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            Rectangle { color: "#F4F4F4"; width: 136; height: 84;
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"LANGUAGE"
                    anchors.top: parent.top
                    anchors.topMargin: 5
                }
                ComboBox{
                    width: 80
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
            Rectangle { id: rectangle3; color: "#F4F4F4"; width: 136; height: 84;
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"REMOTE CONNECT"
                    anchors.top: parent.top
                    anchors.topMargin: 5
                }
                Rectangle{
                    height:20
                    width: 20
                    color:"gray"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                ComboBox{
                    width: 80
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    currentIndex: 1
                    model: ListModel{
                        id:cbTestSetItems
                        ListElement{text:"TestSet#3"}
                        ListElement{text:"TestSet#4"}
                        ListElement{text:"TestSet#5"}
                    }
                }
            }
            Rectangle { color: "#F4F4F4"; width: 136; height: 84;
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"TEST SET ICAO ADDRE..."
                    anchors.top: parent.top
                    anchors.topMargin: 5
                }
                ComboBox{
                    width: 80
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
            Rectangle { id: rectangle6; color: "#F4F4F4"; width: 136; height: 84;
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"UUT DEVICE CLASS"
                    anchors.top: parent.top
                    anchors.topMargin: 5
                }
                Text{
                    text:"CLASS A"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            Rectangle { id: rectangle4; color: "#F4F4F4"; width: 136; height: 84;
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"UUT ANTENNA"
                    anchors.top: parent.top
                    anchors.topMargin: 5
                }Rectangle{
                    height:20
                    width: 20
                    color:"gray"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"Top"
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                }
            }

            Rectangle { id: rectangle2; color: "#F4F4F4"; width: 136; height: 84;
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"TEST SET CONNECTION"
                    anchors.top: parent.top
                    anchors.topMargin: 5
                }
                Rectangle{
                    height:20
                    width: 20
                    color:"gray"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                ComboBox{
                    width: 80
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
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

            Rectangle { id: rectangle1; color: "#F4F4F4"; width: 136*2+5; height: 84; Layout.columnSpan: 2;
                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"DISTANCE To UUT"
                    anchors.top: parent.top
                    anchors.topMargin: 5
                }
                Slider {
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 25
                    anchors.left: parent.left
                    anchors.right: parent.right
                    minimumValue: 10
                    value: 200
                    maximumValue: 250
                }
                Text{
                    text:"200 Ft"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text{
                    text:"10 Ft"
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                }
                Text{
                    text:"250 Ft"
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                }
            }
        }
    }
}
