#ifndef DBMAN_H
#define DBMAN_H

#include <QObject>

class DbMan : public QObject
{
    Q_OBJECT

public:
     DbMan(QObject *parent = 0);

public slots:
    void addInfo(QString, QString, QString, qreal, qreal ,qreal , qreal, qreal ,qreal ,QString ,QString ,bool );

private:
    bool createConnection();
};

#endif // DBMAN_H
