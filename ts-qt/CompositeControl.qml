import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.1

Item {
    property string key
    property string value
    property string unit
    property int keyWidth
    //    property var keyAlign
    property font keyFont
    property int valueWidth
    //    property var valueAlign
    property font valueFont
    property int unitWidth
    //    property var unitAlign
    property font unitFont

    GridLayout{
        Rectangle{
            color: "transparent"
            width: keyWidth
            Text{
                id: keyText
                Layout.column: 0                
                color: Universal.foreground
                text: key
                font: keyFont
//              Layout.alignment: keyAlign
            }
        }
        Rectangle{
            width: valueWidth
            color: "transparent"
            Text{
                id: valueText
                Layout.column: 1
                color: Universal.foreground
                text:value
                width: valueWidth
                font: valueFont
  //            Layout.aligment:valueAlign
            }
        }
        Rectangle{
            width: unitWidth
            color: "transparent"
            Text{
                id: unitText
                Layout.column: 2
                color: Universal.foreground
                text:unit
                font: unitFont
  //            Layout.aligment:unitAlign
            }
        }
    }
}
