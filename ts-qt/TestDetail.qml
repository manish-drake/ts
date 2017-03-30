import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    width: 300
    height: 300

    ListModel {
        id: nestedModel
        ListElement {
            summaryName: "summary 1"
            subItems: [
                ListElement { itemName: "Label 11"; itemValue:"Test Case 11"; myColumn : 0},
                ListElement { itemName: "Label 12"; itemValue:"Test Case 12"; myColumn : 1},
                ListElement { itemName: "Label 13"; itemValue:"Test Case 13"; myColumn : 2},
                ListElement { itemName: "Label 14"; itemValue:"Test Case 14"; myColumn : 0}
            ]
        }
        ListElement {
            summaryName: "summary 2"
            subItems: [
                ListElement { itemName: "Label 21"; itemValue:"Test Case 21"; myColumn : 3 },
                ListElement { itemName: "Label 22"; itemValue:"Test Case 22"; myColumn : 3 },
                ListElement { itemName: "Label 23"; itemValue:"Test Case 23"; myColumn : 3 },
                ListElement { itemName: "Label 24"; itemValue:"Test Case 24"; myColumn : 3 }
            ]
        }
        ListElement {
            summaryName: "summary 3"
            subItems: [
                ListElement { itemName: "Label 31"; itemValue:"Test Case 31"; myColumn : 1 },
                ListElement { itemName: "Label 32"; itemValue:"Test Case 32"; myColumn : 3 },
                ListElement { itemName: "Label 33"; itemValue:"Test Case 33"; myColumn : 5 },
                ListElement { itemName: "Label 34"; itemValue:"Test Case 34"; myColumn : 7 }
            ]
        }
    }

    // property variant subItemModel : subItems

    Component {
        id: summaryDelegate
        Rectangle {
            id: categoryItem
            height: 100
            width: parent.width
            Text {
                id:summaryHeader
                anchors.top: parent.top
                text: summaryName
            }
            ListView {
                anchors.top:summaryHeader.bottom
                anchors.topMargin: 10
                height: 100
                width: 100
                id: subItemRepeater
                model: subItems

                delegate: Rectangle {
                    height: 15
                    width: parent.width
                    GridLayout{
                        width: parent.width
                        anchors.fill:parent
                        //columns: 9
                        /* 0|1|2|3|4|5|6|7|8|9
                           -|-|s|-|-|s|-|-
                        */
                        //spacers
                        Rectangle{width: 30;height: 10;color: "#44FF0000";Layout.column: 0}
                        Rectangle{width: 30;height: 10;color: "#44FF0000";Layout.column: 1}
                        Rectangle{width: 30;height: 10;color: "#44FF0000";Layout.column: 2}
                        Rectangle{width: 30;height: 10;color: "#44FF0000";Layout.column: 3}
                        Rectangle{width: 30;height: 10;color: "#44FF0000";Layout.column: 4}
                        Rectangle{width: 30;height: 10;color: "#44FF0000";Layout.column: 5}


                        Text {
                            text: itemName + " : " + itemValue
                            Layout.column: myColumn
                        }

                        Text {
                            text: itemName + " : " + itemValue
                            Layout.column: myColumn
                        }

                        Text {
                            text: itemName + " : " + itemValue
                            Layout.column: myColumn
                        }
                    }
                }
            }
        }
    }
    
    ListView {
        anchors.fill: parent
        model: nestedModel
        delegate: summaryDelegate
    }

}
