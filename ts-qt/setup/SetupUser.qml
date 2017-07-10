import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Universal 2.1
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item{
    Item{
        id: header
        anchors.left: parent.left
        anchors.right: parent.right
        height:40
        Text {
            anchors.centerIn: parent
            text: qsTr("USERS")
            elide:Text.ElideRight
            font.pixelSize: 16
            font.weight: Font.DemiBold
            font.family: robotoRegular.name
            color: Universal.foreground
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
                onClicked: {
                    onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
                }
            }
        }
    }

    Item{
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        ListView{
            id: userGridView
            anchors.fill: parent
            anchors.margins: 8
            model: usersModel
            delegate: userCardDelegate
            currentIndex: -1
            clip: true
            Component{
                id: userCardDelegate
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 80
                    Rectangle {
                        id: wrapper
                        anchors.fill: parent
                        anchors.margins: 2
                        color: Universal.theme == Universal.Light ? Universal.background : "#222222"
                        border.color: "#0d000000"
                        border.width: 1
                        radius: 3
                        layer.enabled: true
                        layer.effect: DropShadow {
                            transparentBorder: true
                            horizontalOffset: 1.1
                            verticalOffset: 1.1
                            radius: 3
                            color: "#0d000000"
                            spread: 0
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                navigationModel.setCurrentView(
                                            navigationModel.getTargetView("UserDetail"),
                                            {"user": usersModel.get(index)})
                            }
                        }

                        Text {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.margins: 10
                            text: qsTr(userName)
                            elide:Text.ElideRight
                            font.pixelSize: 14
                            font.weight: Font.DemiBold
                            font.family: robotoRegular.name
                            color: Universal.accent
                        }
                        Row {
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 10
                            Text {
                                font.pixelSize: 12
                                text: qsTr("LANGUAGE: ")
                                color: Universal.foreground
                                opacity: 0.7
                            }
                            Text {
                                font.pixelSize: 12
                                text: qsTr(language)
                                color: Universal.foreground
                                elide: Text.ElideRight
                            }
                        }
                    }
                }
            }
            ListModel {//as per discussion only top four values will be displayed here
                id:usersModel
                ListElement {
                    userID: "Default"
                    userName: "OPERATOR"
                    language: "English"
                    emailID: "operator@mail.com"
                    isRemovable: false
                }
                ListElement {
                    userID: "ken"
                    userName: "KEN FILARDO"
                    language: "English"
                    emailID: "ken@mail.com"
                    isRemovable: true
                }
                ListElement {
                    userID: "dave"
                    userName: "DAVE KLAMET"
                    language: "English"
                    emailID: "dave@mail.com"
                    isRemovable: true
                }
                ListElement {
                    userID: "steve"
                    userName: "STEVE O'HARA"
                    language: "English"
                    emailID: "steve@mail.com"
                    isRemovable: true
                }
            }
        }
    }

    Rectangle{
        id: addUserButton
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 20
        height: 40
        width: 40
        radius: width*0.5
        color: Universal.accent
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 1.1
            verticalOffset: 1.1
            radius: 4.0
            color: "#80000000"
            spread: 0
        }
        Text{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 1
            anchors.leftMargin: 10
            text:"+"
            font.pixelSize: 28
            font.weight: Font.bold
            font.family: robotoRegular.name
            color:"white"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                //usersModel.insert(0,{ "userID": "st", "userName": "ST", "language": "En","emailID": "st","isRemovable": true})
                navigationModel.currentView = navigationModel.getTargetView("AddUser")
            }

        }
    }

    //    Rectangle{
    //        anchors.bottom: parent.bottom
    //        anchors.bottomMargin: 10
    //        anchors.right: parent.right
    //        anchors.rightMargin: 80
    //        height: 40
    //        width: 40
    //        radius: width*0.5
    //        color: "red"
    //        layer.enabled: true
    //        layer.effect: DropShadow {
    //            transparentBorder: true
    //            horizontalOffset: 1.1
    //            verticalOffset: 1.1
    //            radius: 4.0
    //            color: "#80000000"
    //            spread: 0
    //        }
    //        Text{
    //            anchors.top: parent.top
    //            anchors.left: parent.left
    //            anchors.topMargin: 1
    //            anchors.leftMargin: 10
    //            text:""
    //            font.pixelSize: 28
    //            font.weight: Font.bold
    //            font.family: robotoRegular.name
    //            color:"white"
    //        }
    //        MouseArea{
    //            anchors.fill: parent
    //            onClicked: {usersModel.remove(0,1)}

    //        }
    //    }

}


