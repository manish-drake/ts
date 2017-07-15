#include "setupmodel.h"

void SetupModel::createNewUser()
{
    m_newUser = new User(parent());
}

void SetupModel::addNewUser()
{

}

SetupModel::SetupModel()
{

}

User *SetupModel::newUser()
{
    return m_newUser;
}

