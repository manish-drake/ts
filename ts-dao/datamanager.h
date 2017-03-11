#ifndef DATAMANAGER_H
#define DATAMANAGER_H

#include "ts-dao_global.h"
#include "section.h"

class TSDAOSHARED_EXPORT DataManager
{
    Section section{};
public:
    DataManager();
};

#endif // DATAMANAGER_H
