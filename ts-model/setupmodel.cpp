#include "setupmodel.h"
#include "client.h"

void SetupModel::createNewUser()
{
    m_newUser = new User(parent());
}

void SetupModel::addNewUser()
{
    Client c;

    int userID = 10;
    c.addUser(userID, m_newUser->name());
}

SetupModel::SetupModel()
{

}

User *SetupModel::newUser()
{
    return m_newUser;
}

