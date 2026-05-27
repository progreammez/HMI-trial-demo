import QtQuick
import QtQuick.Controls
import EvHmi

ApplicationWindow {
    id: window

    width: Theme.baseWidth
    height: Theme.baseHeight
    minimumWidth: 800
    minimumHeight: 480
    visible: true
    title: "EV HMI"
    color: Colors.backgroundPrimary

    Binding {
        target: Theme
        property: "scale"
        value: Math.max(0.78, Math.min(window.width / Theme.baseWidth, window.height / Theme.baseHeight))
    }

    Binding {
        target: Typography
        property: "scale"
        value: Theme.scale
    }

    AppShell {
        anchors.fill: parent
    }
}
