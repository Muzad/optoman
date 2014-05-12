#ifndef PatientSqlModel_H
#define PatientSqlModel_H

#include <QtSql/QSqlQueryModel>
#include <QVariant>

class PatientSqlModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    explicit PatientSqlModel(QObject *parent,QString customerName, QString customerPhone);
    void reload( );
    QVariant data(const QModelIndex &item, int role) const;

//private:

    QHash<int, QByteArray> roleNames() const;
    const static char* COLUMN_NAMES[];
    QVariant patientPhone;
    //    const static char* SQL_SELECT;
    QString SQL_SELECT;
#if QT_VERSION < 0x050000
    QHash<int, QByteArray> roleNames;
#endif
//    void filter(QString customerName, QString customerPhone);
};

#endif // PatientSqlModel_H
