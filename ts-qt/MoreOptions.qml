import QtQuick 2.0
import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Item{
    id: item1
    width: parent.width
    Column{
        id: columnLayout
        width: parent.width
        CustomSwitchDelegate{
            text: "SETUP TEST"
            source: "qrc:/img/img/setuptest.png"
        }
        CustomSwitchDelegate{
            text: "HELP"
            source: "qrc:/img/img/help.png"
        }
        CustomSwitchDelegate{
            text: "CLEAR"
            source: "qrc:/img/img/clear.png"
        }
        CustomSwitchDelegate{
            text: "DUAL PANEL"
            source: "qrc:/img/img/dualpanel.png"
        }
        CustomSwitchDelegate{
            text: "FILTER"
            source: "qrc:/img/img/filter.png"
        }
        CustomSwitchDelegate{
            text: "RUN ALL"
            source: "qrc:/img/img/runall.png"
        }
        CustomSwitchDelegate{
            text: "REPEAT"
            source: "qrc:/img/img/repeat.png"
        }
        CustomSwitchDelegate{
            text: "LOG DATA"
            source: "qrc:/img/img/logdata.png"
        }
        Text{
            text: "Version"
            anchors.right: parent.right
            padding: 10
        }
    }


}
