import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Item {
    Page{
        anchors.fill: parent
        header: Rectangle{
            id:testHeaderRect
            height: 60
            anchors.left: parent.left
            anchors.right: parent.right
            color: Universal.background
            Item{
                id: rectangle1
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.leftMargin: 25
                opacity: 0.4
                Image {
                    id: viewImage
                    anchors.centerIn: parent
                    source: "qrc:/img/img/Settings-25.png"
                }
                ColorOverlay{
                    anchors.fill: viewImage
                    source: viewImage
                    color: Universal.foreground
                }
            }
            Column{
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: title
                    text: "ADS-B Velocity Test"
                    font.pixelSize: 16
                    font.weight: Font.DemiBold
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Universal.foreground
                }
                Text {
                    text: "SETUP"
                    font.pixelSize: 16
                    anchors.topMargin: 40
                    font.weight: Font.DemiBold
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Universal.foreground
                }
            }
            Item{
                id: rectangle
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                width: 50
                Image {
                    id: closeImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/img/Delete-25.png"
                }
                ColorOverlay{
                    anchors.fill: closeImage
                    source: closeImage
                    color: Universal.foreground
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: testSetupPopup.close()
                }
            }
        }

        contentItem:Rectangle{
            color: Universal.background
            Flickable {
                anchors.fill: parent
                contentWidth: parent.width;
                contentHeight: content.height + content.y + 10
                clip: true
                boundsBehavior: Flickable.StopAtBounds
                Column{
                    id: content
                    y: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 25
                    spacing: 0
                    Item{
                        height: 40
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Text{
                            anchors.verticalCenter: parent.verticalCenter
                            text:"Power"
                            font.pixelSize: 14
                            color: Universal.foreground
                        }
                        Image {
                            id: arrowImage1
                            anchors.verticalCenter: parent.verticalCenter
                            width:15
                            height: 15
                            anchors.right: parent.right
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                        ColorOverlay{
                            anchors.fill: arrowImage1
                            source: arrowImage1
                            color: Universal.foreground
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                slidePanel1.visible = !slidePanel1.visible
                                if(slidePanel1.visible){
                                    arrowImage1.source = "qrc:/img/img/Collapse Arrow-20.png"
                                }else{
                                    arrowImage1.source = "qrc:/img/img/Expand Arrow-20.png"
                                }
                            }
                        }
                    }
                    RowLayout{
                        id:slidePanel1
                        visible:false
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Slider {
                            id: slider
                            Layout.column: 0
                            Layout.fillWidth: true
                            Layout.leftMargin: 10
                            Layout.rightMargin: 10
                            Layout.alignment: Qt.AlignVCenter
                            minimumValue: -70
                            maximumValue: 17
                            stepSize: 1
                            value:-39.9
                            updateValueWhileDragging: true
                        }
                        Text{
                            Layout.column: 1
                            Layout.alignment: Qt.AlignVCenter
                            text:slider.value + "dB"
                            font.pixelSize: 14
                            color: Universal.foreground
                        }
                    }

                    Item{
                        height: 40
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Text{
                            anchors.verticalCenter: parent.verticalCenter
                            text:"Distance"
                            anchors.left: parent.left
                            font.pixelSize: 14
                            color: Universal.foreground
                        }
                        Image {
                            id: arrowImage2
                            anchors.verticalCenter: parent.verticalCenter
                            width:15
                            height: 15
                            anchors.right: parent.right
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                        ColorOverlay{
                            anchors.fill: arrowImage2
                            source: arrowImage2
                            color: Universal.foreground
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                slidePanel2.visible = !slidePanel2.visible
                                if(slidePanel2.visible){
                                    arrowImage2.source = "qrc:/img/img/Collapse Arrow-20.png"
                                }else{
                                    arrowImage2.source = "qrc:/img/img/Expand Arrow-20.png"
                                }
                            }
                        }
                    }
                    Item{
                        id:slidePanel2
                    }

                    Item{
                        height: 40
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Text{
                            anchors.verticalCenter: parent.verticalCenter
                            text:"Flight-line"
                            anchors.left: parent.left
                            font.pixelSize: 14
                            color: Universal.foreground
                        }
                        Image {
                            id: arrowImage3
                            anchors.verticalCenter: parent.verticalCenter
                            width:15
                            height: 15
                            anchors.right: parent.right
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                        ColorOverlay{
                            anchors.fill: arrowImage3
                            source: arrowImage3
                            color: Universal.foreground
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                slidePanel3.visible = !slidePanel3.visible
                                if(slidePanel3.visible){
                                    arrowImage3.source = "qrc:/img/img/Collapse Arrow-20.png"
                                }else{
                                    arrowImage3.source = "qrc:/img/img/Expand Arrow-20.png"
                                }
                            }
                        }
                    }
                    Item{
                        id:slidePanel3
                    }

                    Item{
                        height: 40
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Text{
                            anchors.verticalCenter: parent.verticalCenter
                            text:"Delay"
                            anchors.left: parent.left
                            font.pixelSize: 14
                            color: Universal.foreground
                        }
                        Image {
                            id: arrowImage4
                            anchors.verticalCenter: parent.verticalCenter
                            width: 15
                            height: 15
                            anchors.right: parent.right
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                        ColorOverlay{
                            anchors.fill: arrowImage4
                            source: arrowImage4
                            color: Universal.foreground
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                slidePanel4.visible = !slidePanel4.visible
                                if(slidePanel4.visible){
                                    arrowImage4.source = "qrc:/img/img/Collapse Arrow-20.png"
                                }else{
                                    arrowImage4.source = "qrc:/img/img/Expand Arrow-20.png"
                                }
                            }
                        }
                    }
                    Item{
                        id:slidePanel4
                    }

                    Item{
                        height: 40
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Text{
                            anchors.verticalCenter: parent.verticalCenter
                            text:"Cable Loss"
                            anchors.left: parent.left
                            font.pixelSize: 14
                            color: Universal.foreground
                        }
                        Image {
                            id: arrowImage5
                            anchors.verticalCenter: parent.verticalCenter
                            width:15
                            height: 15
                            anchors.right: parent.right
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                        ColorOverlay{
                            anchors.fill: arrowImage5
                            source: arrowImage5
                            color: Universal.foreground
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                slidePanel5.visible = !slidePanel5.visible
                                if(slidePanel5.visible){
                                    arrowImage5.source = "qrc:/img/img/Collapse Arrow-20.png"
                                }else{
                                    arrowImage5.source = "qrc:/img/img/Expand Arrow-20.png"
                                }
                            }
                        }
                    }
                    Item{
                        id:slidePanel5
                    }

                    Item{
                        height: 40
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Text{
                            anchors.verticalCenter: parent.verticalCenter
                            text:"PIN Time"
                            anchors.left: parent.left
                            font.pixelSize: 14
                            color: Universal.foreground
                        }
                        Image {
                            id: arrowImage6
                            anchors.verticalCenter: parent.verticalCenter
                            width:15
                            height: 15
                            anchors.right: parent.right
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                        ColorOverlay{
                            anchors.fill: arrowImage6
                            source: arrowImage6
                            color: Universal.foreground
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                slidePanel6.visible = !slidePanel6.visible
                                if(slidePanel6.visible){
                                    arrowImage6.source = "qrc:/img/img/Collapse Arrow-20.png"
                                }else{
                                    arrowImage6.source = "qrc:/img/img/Expand Arrow-20.png"
                                }
                            }
                        }
                    }
                    Item{
                        id:slidePanel6
                    }

                    Item{
                        height: 40
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Text{
                            anchors.verticalCenter: parent.verticalCenter
                            text:"Lat"
                            anchors.left: parent.left
                            font.pixelSize: 14
                            color: Universal.foreground
                        }
                        Image {
                            id: arrowImage7
                            anchors.verticalCenter: parent.verticalCenter
                            width:15
                            height: 15
                            anchors.right: parent.right
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                        ColorOverlay{
                            anchors.fill: arrowImage7
                            source: arrowImage7
                            color: Universal.foreground
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                slidePanel7.visible = !slidePanel7.visible
                                if(slidePanel7.visible){
                                    arrowImage7.source = "qrc:/img/img/Collapse Arrow-20.png"
                                }else{
                                    arrowImage7.source = "qrc:/img/img/Expand Arrow-20.png"
                                }
                            }
                        }
                    }
                    Item{
                        id:slidePanel7
                    }

                    Item{
                        height: 40
                        anchors.left: parent.left
                        anchors.right: parent.right
                        Text{
                            anchors.verticalCenter: parent.verticalCenter
                            text:"Lon"
                            anchors.left: parent.left
                            font.pixelSize: 14
                            color: Universal.foreground
                        }
                        Image {
                            id: arrowImage8
                            anchors.verticalCenter: parent.verticalCenter
                            width:15
                            height: 15
                            anchors.right: parent.right
                            source: "qrc:/img/img/Expand Arrow-20.png"
                        }
                        ColorOverlay{
                            anchors.fill: arrowImage8
                            source: arrowImage8
                            color: Universal.foreground
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                slidePanel8.visible = !slidePanel8.visible
                                if(slidePanel8.visible){
                                    arrowImage8.source = "qrc:/img/img/Collapse Arrow-20.png"
                                }else{
                                    arrowImage8.source = "qrc:/img/img/Expand Arrow-20.png"
                                }
                            }
                        }
                    }
                    Item{
                        id:slidePanel8
                    }
                }
            }
        }
    }
}


