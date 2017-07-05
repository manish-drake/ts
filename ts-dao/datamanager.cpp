#include "datamanager.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QDir>
#include <QStandardPaths>



DataManager &DataManager::instance()
{
#if defined (Q_OS_ANDROID) || defined (Q_OS_IOS)
    QFile assetDbFile(":/database/" + DATABASE_FILENAME);/*   :/database/ts.db   */
    #if defined (Q_OS_ANDROID)
        QString destinationDbFile = QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation).append("/" + DATABASE_FILENAME);
    #elif defined (Q_OS_IOS)
        QString destinationDbFile = QStandardPaths::writableLocation(QStandardPaths::DocumentsLocation).append("/" + DATABASE_FILENAME);
    #endif
    if(!QFile::exists(destinationDbFile)){
        assetDbFile.copy(destinationDbFile);
        QFile::setPermissions(destinationDbFile, QFile::WriteOwner | QFile::ReadOwner);
    }
    static DataManager singelton(destinationDbFile);
#else
    static DataManager singelton;
#endif
    return singelton;
}

DataManager::DataManager(const QString &path):
    m_database(new QSqlDatabase(QSqlDatabase::addDatabase("QSQLITE")))
{
//    QDir dir("/home/manish/git/ts");
//    QString s;

//    s = dir.relativeFilePath("images/file.jpg");     // s is "images/file.jpg"
//    s = dir.relativeFilePath("/home/mary/file.txt"); // s is "../mary/file.txt"


    m_database->setDatabaseName(path);

    bool openStatus = m_database->open();
    qDebug() << "Database connection: " << (openStatus ? "OK" : "Error");

    this->createRegistry();

    for(auto key: daoRegistry.keys()){
        auto dao = daoRegistry[key];
        dao->init();
    }
}
DataManager::~DataManager()
{
    m_database->close();
}

std::shared_ptr<const SectionDao> DataManager::sectionDao() const
{
    auto daoPtr = this->daoRegistry["section"];
    auto sectionDaoPtr = std::dynamic_pointer_cast<SectionDao>(daoPtr);
    return  sectionDaoPtr;
}

std::shared_ptr<const TestDao> DataManager::testDao() const
{
    auto daoPtr = this->daoRegistry["test"];
    auto testDaoPtr = std::dynamic_pointer_cast<TestDao>(daoPtr);
    return  testDaoPtr;
}

std::shared_ptr<const SummaryDao> DataManager::summaryDao() const
{
    auto daoPtr = this->daoRegistry["summary"];
    auto summaryDaoPtr = std::dynamic_pointer_cast<SummaryDao>(daoPtr);
    return  summaryDaoPtr;
}

std::shared_ptr<const TestParamDao> DataManager::testParamDao() const
{
    auto daoPtr = this->daoRegistry["testparam"];
    auto testParamDaoPtr = std::dynamic_pointer_cast<TestParamDao>(daoPtr);
    return  testParamDaoPtr;
}

std::shared_ptr<const ViewDao> DataManager::viewDao() const
{
    auto daoPtr = this->daoRegistry["view"];
    auto viewDaoPtr = std::dynamic_pointer_cast<ViewDao>(daoPtr);
    return  viewDaoPtr;
}

std::shared_ptr<const NavigationDao> DataManager::navigationDao() const
{
    auto daoPtr = this->daoRegistry["navigation"];
    auto navigationDaoPtr = std::dynamic_pointer_cast<NavigationDao>(daoPtr);
    return  navigationDaoPtr;
}

std::shared_ptr<const SnapshotDao> DataManager::snapshotDao() const
{
    auto daoPtr = this->daoRegistry["snapshot"];
    auto snapshotDaoPtr = std::dynamic_pointer_cast<SnapshotDao>(daoPtr);
    return  snapshotDaoPtr;
}

std::shared_ptr<const AviationMarkersDao> DataManager::aviationMarkersDao() const
{
    auto daoPtr = this->daoRegistry["aviation_Markers"];
    auto aviationMarkersDaoPtr = std::dynamic_pointer_cast<AviationMarkersDao>(daoPtr);
    return  aviationMarkersDaoPtr;
}

std::shared_ptr<const AviationVswrDao> DataManager::aviationVswrDao() const
{
    auto daoPtr = this->daoRegistry["aviation_Vswr"];
    auto aviationVswrDaoPtr = std::dynamic_pointer_cast<AviationVswrDao>(daoPtr);
    return  aviationVswrDaoPtr;
}


std::shared_ptr<const AviationClDao> DataManager::aviationClDao() const
{
    auto daoPtr = this->daoRegistry["aviation_Cable_loss"];
    auto aviationClDaoPtr = std::dynamic_pointer_cast<AviationClDao>(daoPtr);
    return  aviationClDaoPtr;
}

std::shared_ptr<const AviationDtfDao> DataManager::aviationDtfDao() const
{
    auto daoPtr = this->daoRegistry["aviation_Dtf"];
    auto aviationDtfDaoPtr = std::dynamic_pointer_cast<AviationDtfDao>(daoPtr);
    return  aviationDtfDaoPtr;
}

std::shared_ptr<const LoggingDao> DataManager::loggingDao() const
{
    auto daoPtr = this->daoRegistry["logs"];
    auto loggingDaoPtr = std::dynamic_pointer_cast<LoggingDao>(daoPtr);
    return  loggingDaoPtr;
}


void DataManager::createRegistry()
{
    daoRegistry.insert("section",
                       std::shared_ptr<Dao>(new SectionDao(*m_database)));
    daoRegistry.insert("test",
                       std::shared_ptr<Dao>(new TestDao(*m_database)));
    daoRegistry.insert("summary",
                       std::shared_ptr<Dao>(new SummaryDao(*m_database)));
    daoRegistry.insert("testparam",
                       std::shared_ptr<Dao>(new TestParamDao(*m_database)));
    daoRegistry.insert("view",
                       std::shared_ptr<Dao>(new ViewDao(*m_database)));
    daoRegistry.insert("navigation",
                       std::shared_ptr<Dao>(new NavigationDao(*m_database)));
    daoRegistry.insert("snapshot",
                       std::shared_ptr<Dao>(new SnapshotDao(*m_database)));
    daoRegistry.insert("aviation_Markers",
                       std::shared_ptr<Dao>(new AviationMarkersDao(*m_database)));
    daoRegistry.insert("aviation_Vswr",
                       std::shared_ptr<Dao>(new AviationVswrDao(*m_database)));
    daoRegistry.insert("aviation_Cable_loss",
                       std::shared_ptr<Dao>(new AviationClDao(*m_database)));
    daoRegistry.insert("aviation_Dtf",
                       std::shared_ptr<Dao>(new AviationDtfDao(*m_database)));
    daoRegistry.insert("logs",std::shared_ptr<Dao>(new LoggingDao(*m_database)));
}

void DataManager::debugQuery(const QSqlQuery& query)
{
    if (query.lastError().type() == QSqlError::ErrorType::NoError) {
        qDebug() << "Query OK:"  << query.lastQuery();
    } else {
        qWarning() << "Query KO:" << query.lastError().text();
        qWarning() << "Query text:" << query.lastQuery();
    }
}

void DataManager::deleteExitingDBFile()
{
    QDir dir;
    dir.remove(DB_FILE);
}




