#include "user.h"

User::User(QObject *parent) : QObject(parent)
{

}

User::User(const User &user):
    QObject(user.parent()),
    m_userID{user.m_userID},
    m_name{user.m_name},
    m_language{user.m_language},
    m_email{user.m_email},
    m_emailSavedTests{user.m_emailSavedTests}
{
}

User &User::operator =(const User &user)
{
    if(this != &user){
        setParent(user.parent());
        setUserID(user.userID());
        setName(user.name());
        setLanguage(user.language());
        setEmail(user.email());
        setEmailSavedTests(user.emailSavedTests());
    }

    return *this;
}


int User::userID() const
{
    return m_userID;
}

void User::setUserID(int userID)
{
    if(m_userID != userID){
        m_userID = userID;
        emit userIDChanged();
    }
}

QString User::name() const
{
    return m_name;
}

void User::setName(const QString &name)
{
    if(m_name != name){
        m_name = name;
        emit nameChanged();
    }
}

int User::language() const
{
    return m_language;
}

void User::setLanguage(int language)
{
    if(m_language != language){
        m_language = language;
        emit languageChanged();
    }
}

QString User::email() const
{
    return m_email;
}

void User::setEmail(const QString &email)
{
    if(m_email != email){
        m_email = email;
        emit emailChanged();
    }
}

bool User::emailSavedTests() const
{
    return m_emailSavedTests;
}

void User::setEmailSavedTests(bool flag)
{
    if(m_emailSavedTests != flag){
        m_emailSavedTests = flag;
        emit emailSavedTestsChanged();
    }
}
