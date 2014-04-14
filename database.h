#ifndef DATABASE_H
#define DATABASE_H

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>

#include <QDebug>

static bool createDatabaseConnection()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");

    db.setDatabaseName("database.dbs");

    if (!db.open()){
        //qDebug()<<db.lastError();
        return false;
    }

    QSqlQuery query;

//    query.exec("create table user (username varchar(10) unique, password varchar(10))");

    query.exec("create table patientinfo (deviceCode varchar(4), name varchar(10), phone varchar(15) , leftEye NUMERIC(2,2), rightEye NUMERIC(2,2), lensType varchar(6),"
               "detail varchar(200), synced bool DEFAULT ('false'))");


//    query.exec("create table serial (id INTEGER,date varchar(10))");

    return true;
}

#endif // DATABASE_H
