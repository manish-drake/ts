import QtQuick 2.0
import QtQuick.Layouts 1.3
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
            width: keyWidth
            Text{
                id: keyText
                Layout.column: 0
                text: key
                font: keyFont
//              Layout.alignment: keyAlign
            }
        }
        Rectangle{
            width: valueWidth
            Text{
                id: valueText
                Layout.column: 1
                text:value
                width: valueWidth
                font: valueFont
  //            Layout.aligment:valueAlign
            }
        }
        Rectangle{
            width: unitWidth
            Text{
                id: unitText
                Layout.column: 2
                text:unit
                font: unitFont
  //            Layout.aligment:unitAlign
            }
        }
    }
}
