#include "databuilder.h"
#include "datamanager.h"
#include "sectionmodel.h"
#include "testmodel.h"
#include "summarymodel.h"
#include "testparammodel.h"

#include "view.h"
#include "viewdao.h"

#include "navigation.h"
#include "navigationdao.h"
#include <QAbstractListModel>
#include <QVector>
#include <QAbstractListModel>


inline QVector<int> toVector(QAbstractListModel &list)  {
    QVector<int> v;

    const int nbRow = list.rowCount();
    v.reserve(nbRow);

    for (int i = 0; i < nbRow; ++i)
    {
        auto elemT = list.index(i, 0).data(SectionModel::IDRole).toInt();
        v.append(elemT);
    }
    return v;
}

DataBuilder::DataBuilder()
{

}
inline std::vector<int> toIdVector(const QAbstractListModel &list){
    int sz = list.rowCount();
    std::vector<int> v;
    for(int i = 0; i < sz; ++i){
        int id = list.index(i, 0).data(SectionModel::IDRole/*Roles::ID*/).toInt();
        v.push_back(id);
    }
    return v;
}

int DataBuilder::build()
{

    DataManager::deleteExitingDBFile();

    auto viewDao = DataManager::instance().viewDao();

    View globalView("Global");
    viewDao->addView(globalView);

    View mainStartView("Main-Start");
    viewDao->addView(mainStartView);

    View mainADSBView("ADS-B");
    viewDao->addView(mainADSBView);

    View out1090DetailScan("Out1090-Detail-Scan");
    viewDao->addView(out1090DetailScan);

    SectionModel sectionModel{};

    Section start("Start");
    sectionModel.addSection(start);

    Section transponder("Transponder");
    sectionModel.addSection(transponder);

    Section modeS("Mode S");
    sectionModel.addSection(modeS);

    Section sectionADSB("ADS-B");
    sectionModel.addSection(sectionADSB);

    Section nav("NAV");
    sectionModel.addSection(nav);

    Section comm("Comm");
    sectionModel.addSection(comm);

    Section antenna("Antenna");
    sectionModel.addSection(antenna);

    Section reports("Reports");
    sectionModel.addSection(reports);

    Section setup("Setup");
    sectionModel.addSection(setup);

    Section search("Search");
    sectionModel.addSection(search);

    TestModel testModel { };
    SummaryModel summaryModel { };
    TestParamModel testParamModel { };

    Test out1090("1090 ADS-B OUT", sectionADSB.id());
    testModel.addTest(out1090);

    Summary airVeh("Aircraft/Vehicle:", out1090.id(), 0, 0, 0);
    summaryModel.addSummary(airVeh);

    TestParam airVehAdd("address", airVeh.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    testParamModel.addTestParam(airVehAdd);

    TestParam airVehFId("flightId", airVeh.id(), "Flight ID", "234N1246W", "", 1, 0, 0);
    testParamModel.addTestParam(airVehFId);

    TestParam airVehBds("bdsRcvd", airVeh.id(), "BDS Rcvd (DF17)", "0,5,0,8,0,9,6,0,6,1,6,5", "", 2, 0, 0);
    testParamModel.addTestParam(airVehBds);

    TestParam airVehRfLvl("rfLvl", airVeh.id(), "RF Level", "Strong", "", 1, 1, 0);
    testParamModel.addTestParam(airVehRfLvl);


    Summary farElems("FAR 91.227 REQUIRED ELEMENTS", out1090.id(), 0, 1, 1);
    summaryModel.addSummary(farElems);

    Summary avInfo("Aircraft/Vehicle info:", out1090.id(), 0, 2, 0);
    summaryModel.addSummary(avInfo);

    Summary ynDisc("YES/NO Discretes:", out1090.id(), 0, 3, 0);
    summaryModel.addSummary(ynDisc);

    Summary intgFld("Integrity Fields:", out1090.id(), 0, 4, 0);
    summaryModel.addSummary(intgFld);


    Test in1090("1090 ADS-B IN", sectionADSB.id());
    testModel.addTest(in1090);

    Test uatOut("UAT ADS-B OUT", sectionADSB.id());
    testModel.addTest(uatOut);

    Test uatIn("UAT ADS-B IN", sectionADSB.id());
    testModel.addTest(uatIn);


    auto navigationDaoPtr = DataManager::instance().navigationDao();

    for(auto id: toIdVector(sectionModel)){
        Navigation n(globalView.id(), "_section", id, globalView.id());
        navigationDaoPtr->addNavigation(n);
    }
    Navigation navAdsb(globalView.id(), "_section", sectionADSB.id(), mainADSBView.id());
    navigationDaoPtr->addNavigation(navAdsb);

    for(auto id: toIdVector(testModel)){
        Navigation t(globalView.id(), "_test", id, globalView.id());
        navigationDaoPtr->addNavigation(t);
    }
    Navigation navAdsbToScan(mainADSBView.id(), "_test", out1090.id(), out1090DetailScan.id());
    navigationDaoPtr->addNavigation(navAdsbToScan);

//    for(auto testId: toVector(testModel)){
//        Navigation testNav(testId, globalView.id(), mainStartView.id());
//        navigationDaoPtr->addNavigation(testNav);
//    }
    return 1;
}
