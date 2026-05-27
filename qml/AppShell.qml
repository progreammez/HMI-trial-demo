import QtQuick
import EvHmi

Item {
    id: root

    property int currentPageIndex: 0
    readonly property var pages: [
        { "label": "Home" },
        { "label": "Music" },
        { "label": "Settings" },
        { "label": "Diagnostics" }
    ]

    Rectangle {
        anchors.fill: parent
        color: Colors.backgroundPrimary

        Rectangle {
            anchors.fill: parent
            color: Colors.backgroundSecondary
            opacity: 0.72
        }
    }

    Item {
        id: topBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: Theme.topBarHeight

        Text {
            anchors.left: parent.left
            anchors.leftMargin: Theme.pageMargin
            anchors.verticalCenter: parent.verticalCenter
            text: "EV HMI"
            color: Colors.textPrimary
            font.family: Typography.family
            font.pixelSize: Typography.bodyLarge
            font.weight: Font.DemiBold
            letterSpacing: 0
        }

        Row {
            anchors.right: parent.right
            anchors.rightMargin: Theme.pageMargin
            anchors.verticalCenter: parent.verticalCenter
            spacing: Math.round(18 * Theme.scale)

            Text {
                text: vehicleData.simulationActive ? "SIM" : "OFF"
                color: vehicleData.simulationActive ? Colors.accentEco : Colors.textMuted
                font.family: Typography.family
                font.pixelSize: Typography.label
                font.weight: Font.DemiBold
                letterSpacing: 0
            }

            Text {
                text: vehicleData.driveMode
                color: vehicleData.driveMode === "Sport" ? Colors.accentSport
                    : vehicleData.driveMode === "City" ? Colors.accentCity
                    : Colors.accentEco
                font.family: Typography.family
                font.pixelSize: Typography.label
                font.weight: Font.DemiBold
                letterSpacing: 0
            }

            Text {
                text: Math.round(vehicleData.batteryPercent) + "%"
                color: Colors.textSecondary
                font.family: Typography.family
                font.pixelSize: Typography.label
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }
    }

    Loader {
        id: pageLoader
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: topBar.bottom
        anchors.bottom: navBar.top
        anchors.margins: Theme.pageMargin
        sourceComponent: root.currentPageIndex === 0 ? homePage
            : root.currentPageIndex === 1 ? musicPage
            : root.currentPageIndex === 2 ? settingsPage
            : diagnosticsPage
    }

    Rectangle {
        id: navBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: Theme.navBarHeight
        color: Colors.surfaceBase
        border.color: Colors.borderSubtle
        border.width: 1

        Row {
            anchors.centerIn: parent
            spacing: Math.round(8 * Theme.scale)

            Repeater {
                model: root.pages.length

                Rectangle {
                    width: Math.round(150 * Theme.scale)
                    height: Theme.touchTarget
                    radius: Theme.navRadius
                    color: root.currentPageIndex === index ? Colors.surfacePressed : "transparent"
                    border.color: root.currentPageIndex === index ? Colors.borderSubtle : "transparent"
                    border.width: 1

                    Behavior on color {
                        ColorAnimation {
                            duration: Theme.motionFast
                            easing.type: Easing.OutCubic
                        }
                    }

                    Text {
                        anchors.centerIn: parent
                        text: root.pages[index].label
                        color: root.currentPageIndex === index ? Colors.textPrimary : Colors.textMuted
                        font.family: Typography.family
                        font.pixelSize: Typography.bodyMedium
                        font.weight: root.currentPageIndex === index ? Font.DemiBold : Font.Medium
                        letterSpacing: 0
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: root.currentPageIndex = index
                    }
                }
            }
        }
    }

    Component {
        id: homePage
        HomePage {}
    }

    Component {
        id: musicPage
        MusicPage {}
    }

    Component {
        id: settingsPage
        SettingsPage {}
    }

    Component {
        id: diagnosticsPage
        DiagnosticsPage {}
    }
}
