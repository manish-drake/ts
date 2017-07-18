#ifndef USER_H
#define USER_H

#include <QObject>
#include <ts-model_global.h>

class TSMODELSHARED_EXPORT User : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(int userID READ userID WRITE setUserID NOTIFY userIDChanged)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(int language READ language WRITE setLanguage NOTIFY languageChanged)
    Q_PROPERTY(QString email READ email WRITE setEmail NOTIFY emailChanged)
    Q_PROPERTY(bool emailSavedTests READ emailSavedTests WRITE setEmailSavedTests NOTIFY emailSavedTestsChanged)

    explicit User(QObject *parent = 0);
    User(const User &user);
    User &operator =(const User &user);

    inline bool operator!=(const User &other){ return (this != &other); }

    int userID() const;
    void setUserID(int userID);

    QString name() const;
    void setName(const QString &name);

    int language() const;
    void setLanguage(int language);

    QString email() const;
    void setEmail(const QString &email);

    bool emailSavedTests() const;
    void setEmailSavedTests(bool flag);
signals:
    void userIDChanged();
    void nameChanged();
    void languageChanged();
    void emailChanged();
    void emailSavedTestsChanged();
public slots:
private:
    int m_userID = 0;
    QString m_name = "Chris";
    int m_language = 0;
    QString m_email;
    bool m_emailSavedTests;
};

#endif // USER_H
