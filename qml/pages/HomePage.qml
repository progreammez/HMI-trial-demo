import QtQuick
import EvHmi

Item {
    id: root

    readonly property color modeColor: vehicleData.driveMode === "Sport" ? Colors.accentSport
        : vehicleData.driveMode === "City" ? Colors.accentCity
        : Colors.accentEco

    Text {
        id: title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Math.round(2 * Theme.scale)
        text: "Electric Car Dashboard"
        color: Colors.textWarm
        opacity: 0.92
        font.family: Typography.family
        font.pixelSize: Math.round(38 * Theme.scale)
        font.weight: Font.DemiBold
        letterSpacing: 0
    }

    Text {
        anchors.left: title.right
        anchors.leftMargin: Math.round(24 * Theme.scale)
        anchors.baseline: title.baseline
        text: "EV"
        color: Colors.textWarm
        opacity: 0.86
        font.family: Typography.family
        font.pixelSize: Math.round(30 * Theme.scale)
        font.weight: Font.DemiBold
        letterSpacing: 0
    }

    CockpitFrame {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: title.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: Math.round(12 * Theme.scale)
        lineColor: Colors.accentCopper
        dimLineColor: Colors.accentCopperDim
    }

    Row {
        id: statusRow
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: title.bottom
        anchors.topMargin: Math.round(72 * Theme.scale)
        spacing: Math.round(70 * Theme.scale)

        Text {
            text: "11:25 AM"
            color: Colors.textPrimary
            font.family: Typography.family
            font.pixelSize: Typography.bodySmall
            font.weight: Font.DemiBold
            letterSpacing: 0
        }

        Text {
            text: "PUNE 31 C"
            color: Colors.textPrimary
            font.family: Typography.family
            font.pixelSize: Typography.bodySmall
            font.weight: Font.DemiBold
            letterSpacing: 0
        }
    }

    Row {
        id: gearStrip
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: statusRow.bottom
        anchors.topMargin: Math.round(12 * Theme.scale)
        spacing: Math.round(12 * Theme.scale)

        Repeater {
            model: ["P", "R", "N", "D"]

            Text {
                text: modelData
                color: modelData === vehicleData.gear ? root.modeColor : Colors.textMuted
                opacity: modelData === vehicleData.gear ? 1.0 : 0.48
                font.family: Typography.family
                font.pixelSize: Typography.titleMedium
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }
    }

    MetricTile {
        anchors.left: parent.left
        anchors.leftMargin: Math.round(84 * Theme.scale)
        anchors.top: parent.top
        anchors.topMargin: Math.round(170 * Theme.scale)
