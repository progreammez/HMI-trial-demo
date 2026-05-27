#pragma once

#include <QObject>
#include <QString>

#include "models/VehicleTelemetry.h"

class VehicleDataManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double speedKph READ speedKph NOTIFY telemetryChanged)
    Q_PROPERTY(double rpm READ rpm NOTIFY telemetryChanged)
    Q_PROPERTY(double batteryPercent READ batteryPercent NOTIFY telemetryChanged)
    Q_PROPERTY(double motorTemperatureC READ motorTemperatureC NOTIFY telemetryChanged)
    Q_PROPERTY(double batteryTemperatureC READ batteryTemperatureC NOTIFY telemetryChanged)
    Q_PROPERTY(double odometerKm READ odometerKm NOTIFY telemetryChanged)
    Q_PROPERTY(double estimatedRangeKm READ estimatedRangeKm NOTIFY telemetryChanged)
    Q_PROPERTY(QString gear READ gear WRITE setGear NOTIFY gearChanged)
    Q_PROPERTY(QString driveMode READ driveMode WRITE setDriveMode NOTIFY driveModeChanged)
    Q_PROPERTY(bool simulationActive READ simulationActive NOTIFY simulationActiveChanged)

public:
    explicit VehicleDataManager(QObject *parent = nullptr);

    double speedKph() const;
    double rpm() const;
    double batteryPercent() const;
    double motorTemperatureC() const;
    double batteryTemperatureC() const;
    double odometerKm() const;
    double estimatedRangeKm() const;
    QString gear() const;
    QString driveMode() const;
    bool simulationActive() const;

public slots:
    void applyTelemetry(const VehicleTelemetry &telemetry);
    void setGear(const QString &gear);
    void setDriveMode(const QString &driveMode);
    void setSimulationActive(bool active);

signals:
    void telemetryChanged();
    void gearChanged();
    void driveModeChanged();
    void simulationActiveChanged();

    void gearRequested(const QString &gear);
    void driveModeRequested(const QString &driveMode);

private:
    static QString normalizedGear(const QString &gear);
    static QString normalizedDriveMode(const QString &driveMode);

    VehicleTelemetry m_telemetry;
    bool m_simulationActive = false;
};
