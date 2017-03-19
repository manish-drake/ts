#include "databuilder.h"
#include "datamanager.h"
#include "sectionmodel.h"
#include "testmodel.h"
#include "summarymodel.h"
#include "testparammodel.h"

DataBuilder::DataBuilder()
{

}

int DataBuilder::build()
{

    DataManager::deleteExitingDBFile();

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

    return 1;
}
