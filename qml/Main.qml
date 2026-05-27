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
        width: Math.round(122 * Theme.scale)
        height: Math.round(52 * Theme.scale)
        label: "MODE"
        value: vehicleData.driveMode.toUpperCase()
        valueColor: root.modeColor
    }

    MetricTile {
        anchors.right: parent.right
        anchors.rightMargin: Math.round(84 * Theme.scale)
        anchors.top: parent.top
        anchors.topMargin: Math.round(170 * Theme.scale)
        width: Math.round(122 * Theme.scale)
        height: Math.round(52 * Theme.scale)
        label: "POWER"
        value: Math.round(Math.min(99, vehicleData.rpm / 82)) + "%"
        valueColor: Colors.textWarm
    }

    Column {
        id: speedCluster
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: Math.round(22 * Theme.scale)
        spacing: Math.round(5 * Theme.scale)

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: Math.round(vehicleData.speedKph)
            color: Colors.textPrimary
            font.family: Typography.family
            font.pixelSize: Math.round(82 * Theme.scale)
            font.weight: Font.DemiBold
            letterSpacing: 0
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "km/h"
            color: Colors.textMuted
            font.family: Typography.family
            font.pixelSize: Typography.bodySmall
            font.weight: Font.Medium
            letterSpacing: 0
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: Math.round(vehicleData.rpm) + " rpm"
            color: Colors.textWarm
            font.family: Typography.family
            font.pixelSize: Typography.bodySmall
            font.weight: Font.Medium
            letterSpacing: 0
        }
    }

    Row {
        id: lowerGear
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: speedCluster.bottom
        anchors.topMargin: Math.round(14 * Theme.scale)
        spacing: Math.round(13 * Theme.scale)

        Repeater {
            model: ["s", "d", "n", "p", "r"]

            Text {
                text: modelData
                color: modelData.toUpperCase() === vehicleData.gear ? root.modeColor : Colors.textMuted
                opacity: modelData.toUpperCase() === vehicleData.gear ? 1.0 : 0.50
                font.family: Typography.family
                font.pixelSize: Typography.bodySmall
                font.weight: Font.DemiBold
                letterSpacing: 0
            }
        }
    }

    Text {
        anchors.left: parent.left
        anchors.leftMargin: Math.round(195 * Theme.scale)
        anchors.bottom: energyBar.top
        anchors.bottomMargin: Math.round(14 * Theme.scale)
        text: "Avg. 12.5 u/km"
        color: Colors.textMuted
        font.family: Typography.family
        font.pixelSize: Typography.bodySmall
        letterSpacing: 0
    }

    Text {
        anchors.right: parent.right
        anchors.rightMargin: Math.round(190 * Theme.scale)
        anchors.bottom: energyBar.top
        anchors.bottomMargin: Math.round(14 * Theme.scale)
        text: "ODO. " + vehicleData.odometerKm.toFixed(1) + " km"
        color: Colors.textMuted
        font.family: Typography.family
        font.pixelSize: Typography.bodySmall
        letterSpacing: 0
    }

    EnergyBar {
        id: energyBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: Math.round(205 * Theme.scale)
        anchors.rightMargin: Math.round(85 * Theme.scale)
        anchors.bottomMargin: Math.round(18 * Theme.scale)
        value: vehicleData.batteryPercent
        rangeKm: vehicleData.estimatedRangeKm
        activeColor: root.modeColor
    }
}
