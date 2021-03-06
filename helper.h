#ifndef HELPER_H
#define HELPER_H

#include <QObject>

class Helper : public QObject
{
    Q_OBJECT
public:
    explicit Helper(QObject *parent = 0);

public slots:
    QString gregorianToJalali(QString dateTime);
    QString currentJalaliYear();

signals:

public slots:
};

#endif // HELPER_H
