#ifndef READFILE_H
#define READFILE_H

#include <QObject>
#include <QString>

class readFile : public QObject
{
    Q_OBJECT
public:
    explicit readFile(QObject *parent = nullptr);

signals:
    void valueChanged(QString message);

public slots:
    void changeValue(QString value);
    void updateValue(QString value, QString filename);
};

#endif // READFILE_H
