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
//<<<<<<< HEAD
//        Item{
//            id: rectangle
//            anchors.top: parent.top
//            anchors.bottom: parent.bottom
//            anchors.right: parent.right
//            width: 50
//            Image {
//                id: closeImage
//                anchors.horizontalCenter: parent.horizontalCenter
//                anchors.verticalCenter: parent.verticalCenter
//                   source: "qrc:/img/img/Delete-25.png"
//            }
//            ColorOverlay{
//                anchors.fill: closeImage
//                source: closeImage
//                color: Universal.foreground
//            }
//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    onClicked:navigationModel.currentView = navigationModel.getTargetView("back");
//                }
//            }
//        }
//=======
////        Item{
////            id: rectangle
////            anchors.top: parent.top
////            anchors.bottom: parent.bottom
////            anchors.right: parent.right
////            width: 50
////            Image {
////                id: closeImage
////                anchors.horizontalCenter: parent.horizontalCenter
////                anchors.verticalCenter: parent.verticalCenter
////                source: "qrc:/img/img/Delete-25.png"
////            }
////            ColorOverlay{
////                anchors.fill: closeImage
////                source: closeImage
////                color: Universal.foreground
////            }
////            MouseArea {
////                anchors.fill: parent
////                onClicked: {
////                    onClicked:navigationModel.currentView = navigationModel.getTargetView("back")
////                }
////            }
////        }
//>>>>>>> e4d4f105a40531321ada4e66e5f7fc3a1906086c
//    }

    Item{
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        ListView{
            id: userListView
            anchors.fill: parent
            anchors.margins: 10
            model: usersModel
            delegate: userCardDelegate
            clip: true
            onCurrentIndexChanged: {
                currentUser = usersModel.get(currentIndex).userName
                currentUserEmail = usersModel.get(currentIndex).emailID
            }
            Component{
                id: userCardDelegate
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 65
                    Rectangle {
                        id: wrapper
                        anchors.fill: parent
                        anchors.margins: 4
                        color: Universal.theme == Universal.Light ? Universal.background : "#222222"
                        radius: 3
                        layer.enabled: true
                        layer.effect: DropShadow {
                            transparentBorder: true
                            horizontalOffset: 1.1
                            verticalOffset: 1.1
                            radius: 3
                            color: "#26000000"
                            spread: 0
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked:{
                                userListView.currentIndex = index
                            }
                        }
                        GridLayout{
                            anchors.fill: parent
                            Item{
                                Layout.rowSpan: 2
                                Layout.leftMargin: 15
                                Layout.fillHeight: true
                                width: checkedImg.height
                                opacity: userListView.currentIndex == index ? 1 : 0.1
                                Image{
                                    id: checkedImg
                                    anchors.centerIn: parent
                                    source: "qrc:/img/img/checked.png"
                                }
                                ColorOverlay{
                                    anchors.fill: checkedImg
                                    source: checkedImg
                                    color: userListView.currentIndex == index ? Universal.accent : Universal.foreground
                                }
                            }
                            Text {
                                Layout.column: 1
                                Layout.fillWidth: true
                                Layout.leftMargin: 15
                                Layout.topMargin: 10
                                text: qsTr(userName)
                                elide:Text.ElideRight
                                font.pixelSize: 14
                                font.weight: Font.DemiBold
                                font.family: robotoRegular.name
                                color: Universal.accent
                            }
                            Row {
                                Layout.column: 1
                                Layout.row: 1
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                Layout.leftMargin: 15
                                Text {
                                    font.pixelSize: 12
                                    text: qsTr("LANGUAGE: ")
                                    color: Universal.foreground
                                    opacity: 0.7
                                }
                                Text {
                                    Layout.fillWidth: true
                                    elide: Text.ElideRight
                                    font.pixelSize: 12
                                    text: qsTr(language)
                                    color: Universal.foreground
                                }
                            }
                            Rectangle{
                                Layout.column: 2
                                Layout.rowSpan: 2
                                Layout.fillHeight: true
                                color: Universal.accent
                                width: 50
                                radius: 3
                                Image {
                                    id: forwardImg
                                    anchors.centerIn: parent
                                    source: "qrc:/img/img/Forward-16.png"
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        navigationModel.setCurrentView(
                                                    navigationModel.getTargetView("UserDetail"),
                                                    {"user": usersModel.get(index)})
                                    }
                                }
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
        height: 50
        width: 50
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
            anchors.centerIn: parent
            text:"+"
            font.pixelSize: 28
            font.weight: Font.Bold
            font.family: robotoRegular.name
            color:"white"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                //usersModel.insert(0,{ "userID": "st", "userName": "ST", "language": "En","emailID": "st","isRemovable": true})
                setup.createNewUser();
                navigationModel.currentView = navigationModel.getTargetView("AddUser");
            }
        }
    }
}


