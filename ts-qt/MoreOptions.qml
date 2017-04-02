import QtQuick 2.0
import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

Item{    
    Column{
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
            text: "CLEAR"
            source: "qrc:/img/img/clear.png"
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
    }
}
