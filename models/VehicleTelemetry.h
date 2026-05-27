#pragma once

#include <QMetaType>
#include <QString>
#include <QtGlobal>

struct VehicleTelemetry
{
    qreal speedKph = 0.0;
    qreal rpm = 0.0;
    qreal batteryPercent = 82.0;
    qreal motorTemperatureC = 32.0;
    qreal batteryTemperatureC = 29.0;
    qreal odometerKm = 12458.2;
    qreal estimatedRangeKm = 332.0;
    QString gear = QStringLiteral("D");
    QString driveMode = QStringLiteral("Eco");
    quint64 timestampMs = 0;
};

Q_DECLARE_METATYPE(VehicleTelemetry)
