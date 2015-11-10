#ifndef DBMAN_H
#define DBMAN_H

#include <QObject>
#include "patientsqlmodel.h"

class QQmlApplicationEngine;

class DbMan : public QObject
{
    Q_OBJECT

public:
    DbMan(QObject *parent);

public slots:
    void addInfo(QString, QString, QString, qreal, qreal ,qreal , qreal, qreal ,qreal ,QString ,QString ,bool );
    void deleteRecord(QString id);

    bool createConnection();
    PatientSqlModel *model(QString customerName="", QString customerPhone="");
    void reloadModel();
    void setGlobalViewer(QQmlApplicationEngine &engine);
    void reloadModel(QString customerName, QString customerPhone);
public:
    PatientSqlModel *patientModel;
    QQmlApplicationEngine *viewer;
};

#endif // DBMAN_H

