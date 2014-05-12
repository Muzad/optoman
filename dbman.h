#ifndef DBMAN_H
#define DBMAN_H

#include <QObject>
#include <QtQuick/QQuickView>
#include "patientsqlmodel.h"

class DbMan : public QObject
{
    Q_OBJECT

public:
    DbMan(QObject *parent = 0);


public slots:
    void addInfo(QString, QString, QString, qreal, qreal ,qreal , qreal, qreal ,qreal ,QString ,QString ,bool );

    bool createConnection();
    PatientSqlModel *model(QString customerName="", QString customerPhone="");
    void reloadModel();
    void setGlobalViewer(QQuickView *view);
    void reloadModel(QString customerName, QString customerPhone);
public:
    PatientSqlModel *patientModel;
    QQuickView *viewer;

};

#endif // DBMAN_H
