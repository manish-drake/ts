import QtQuick 2.0

Item{
    Column{

        Rectangle{
            id: rectangle
            width:150
            height:50
          //  color:"#FF0000"
            Image {
                id:imageSetupTest
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/setuptest.png"
            }
            Text{
                text:"SETUP TEST"
                anchors.left: imageSetupTest.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle{
            id: rectangleSetupTest
            width:parent.width
            height:50
           // color:"#FF0000"
            Image {
                id:imageHelp
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/help.png"
            }
            Text{
                text:"HELP"
                anchors.left: imageHelp.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle{
            id: rectangleClear
            width:parent.width
            height:50
           // color:"#FF0000"
            Image {
                id:imageClear
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/clear.png"
            }
            Text{
                text:"CLEAR"
                anchors.left: imageClear.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle{
            id: rectangleDualPanel
            width:parent.width
            height:50
           // color:"#FF0000"
            Image {
                id:imageDualPanel
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/dualpanel.png"
            }
            Text{
                text:"DUAL"
                anchors.left: imageDualPanel.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle{
            id: rectangleFilter
            width:parent.width
            height:50
           // color:"#FF0000"
            Image {
                id:imageFilter
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/filter.png"
            }
            Text{
                text:"FILTER"
                anchors.left: imageFilter.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle{
            id: rectangleRunAll
            width:parent.width
            height:50
            //color:"#FF0000"
            Image {
                id:imageRunAll
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/runall.png"
            }
            Text{
                text:"RUN ALL"
                anchors.left: imageRunAll.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle{
            id: rectangleRepeat
            width:parent.width
            height:50
           // color:"#FF0000"
            Image {
                id:imageRepeat
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/repeat.png"
            }
            Text{
                text:"REPEAT"
                anchors.left: imageRepeat.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle{
            id: rectangleLogData
            width:parent.width
            height:50
            //color:"#FF0000"
            Image {
                id:imageLogData
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/img/img/logdata.png"
            }
            Text{
                text:"LOG DATA"
                anchors.left: imageLogData.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle{
            id: rectangleVersion
            width:parent.width
            height:30
            //color:"#FF0000"

            Text{
                text:"Version"
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

}
