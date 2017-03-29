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

DataBuilder::DataBuilder()
{

}
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

int DataBuilder::build()
{

    DataManager::deleteExitingDBFile();

    auto viewDao = DataManager::instance().viewDao();

    View vwGlobal("Global");
    viewDao->addView(vwGlobal);

    View vwMainStart("Main-Start");
    viewDao->addView(vwMainStart);

    View vwMainADSB("Main-ADSB");
    viewDao->addView(vwMainADSB);    

    View vwADSBout1090Scan("ADSB-OUT-1090-Scan");
    viewDao->addView(vwADSBout1090Scan);

    View vwADSBout1090P1("ADSB-OUT-1090-P1");
    viewDao->addView(vwADSBout1090P1);

    View vwADSBout1090P2("ADSB-OUT-1090-P2");
    viewDao->addView(vwADSBout1090P2);

    View vwADSBout1090P3("ADSB-OUT-1090-P3");
    viewDao->addView(vwADSBout1090P3);

    View vwADSBout1090P4("ADSB-OUT-1090-P4");
    viewDao->addView(vwADSBout1090P4);

    View vwADSBout1090P5("ADSB-OUT-1090-P5");
    viewDao->addView(vwADSBout1090P5);

    View vwADSBout1090P6("ADSB-OUT-1090-P6");
    viewDao->addView(vwADSBout1090P6);

    View vwADSBout1090P7("ADSB-OUT-1090-P7");
    viewDao->addView(vwADSBout1090P7);

    View vwADSBoutUATScan("ADSB-OUT-UAT-Scan");
    viewDao->addView(vwADSBoutUATScan);

    View vwADSBoutUATP1("ADSB-OUT-UAT-P1");
    viewDao->addView(vwADSBoutUATP1);

    View vwADSBoutUATP2("ADSB-OUT-UAT-P2");
    viewDao->addView(vwADSBoutUATP2);

    View vwADSBoutUATP3("ADSB-OUT-UAT-P3");
    viewDao->addView(vwADSBoutUATP3);

    View vwADSBoutUATP4("ADSB-OUT-UAT-P4");
    viewDao->addView(vwADSBoutUATP4);

    View vwADSBoutUATP5("ADSB-OUT-UAT-P5");
    viewDao->addView(vwADSBoutUATP5);

    View vwADSBoutUATP6("ADSB-OUT-UAT-P6");
    viewDao->addView(vwADSBoutUATP6);

    View vwMainSetup("Main-Setup");
    viewDao->addView(vwMainSetup);

    View vwSetupUser("Setup-User");
    viewDao->addView(vwSetupUser);

    View vwSetupEditUser("Setup-User-EditUser");
    viewDao->addView(vwSetupEditUser);

    View vwSetupDisplay("Setup-Display");
    viewDao->addView(vwSetupDisplay);

    View vwSetupGPS("Setup-GPS");
    viewDao->addView(vwSetupGPS);

    View vwSetupNetwork("Setup-Network");
    viewDao->addView(vwSetupNetwork);

    View vwSetupSysInfo("Setup-System-Info");
    viewDao->addView(vwSetupSysInfo);

    View vwSetupConn("Setup-Connection");
    viewDao->addView(vwSetupConn);

    View vwSetupRMBit("Setup-Run-Manual-Bit");
    viewDao->addView(vwSetupRMBit);


    View vwDetail("Detail");
    viewDao->addView(vwDetail);

    SectionModel sectionModel{};

    Section secStart("Start");
    sectionModel.addSection(secStart);

    Section secTransponder("Transponder");
    sectionModel.addSection(secTransponder);

    Section secModeS("Mode S");
    sectionModel.addSection(secModeS);

    Section secADSB("ADS-B");
    sectionModel.addSection(secADSB);

    Section secNav("NAV");
    sectionModel.addSection(secNav);

    Section secComm("Comm");
    sectionModel.addSection(secComm);

    Section secAntenna("Antenna");
    sectionModel.addSection(secAntenna);

    Section secReports("Reports");
    sectionModel.addSection(secReports);

    Section secSetup("Setup");
    sectionModel.addSection(secSetup);

    Section secSearch("Search");
    sectionModel.addSection(secSearch);

    TestModel testModel { };
    SummaryModel sumModel { };
    TestParamModel tpModel { };

    Test adsbOut1090("1090 ADS-B OUT", secADSB.id());
    testModel.addTest(adsbOut1090);

    Summary airVeh("Aircraft/Vehicle:", adsbOut1090.id(), 0, 0, 0);
    sumModel.addSummary(airVeh);

    TestParam airVehAdd("address", airVeh.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(airVehAdd);

    TestParam airVehFId("flightId", airVeh.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(airVehFId);

    TestParam airVehBds("bdsRcvd", airVeh.id(), "BDS Rcvd (DF17)", "0,5,0,8,0,9,6,0,6,1,6,5", "", 2, 0, 0);
    tpModel.addTestParam(airVehBds);

    TestParam airVehRfLvl("rfLvl", airVeh.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(airVehRfLvl);


    Summary farElems("FAR 91.227 REQUIRED ELEMENTS", adsbOut1090.id(), 0, 1, 1);
    sumModel.addSummary(farElems);

    Summary avInfo("Aircraft/Vehicle info:", adsbOut1090.id(), 0, 2, 2);
    sumModel.addSummary(avInfo);

    TestParam avInfoFId("flightId", avInfo.id(), "Flight ID", "N1246W", "", 0, 0, 0);
    tpModel.addTestParam(avInfoFId);

    TestParam avInfoMsAdd("modeSAddr", avInfo.id(), "Mode S Addr", "", "", 0, 1, 0);
    tpModel.addTestParam(avInfoMsAdd);

    TestParam avInfoEc("emitterCat", avInfo.id(), "Emitter Cat", "", "", 1, 0, 0);
    tpModel.addTestParam(avInfoEc);

    TestParam avInfoAcode("3/ACode", avInfo.id(), "3/A Code", "", "", 1, 1, 0);
    tpModel.addTestParam(avInfoAcode);

    TestParam avInfoEp("emg/Prty", avInfo.id(), "Emg/Prty", "", "", 2, 0, 0);
    tpModel.addTestParam(avInfoEp);

    TestParam avInfoLw("l/w", avInfo.id(), "L/W", "", "", 2, 1, 0);
    tpModel.addTestParam(avInfoLw);

    TestParam avInfoLat("latitude", avInfo.id(), "Latitude", "", "N", 3, 0, 0);
    tpModel.addTestParam(avInfoLat);

    TestParam avInfoAltbaro("altitude(baro)", avInfo.id(), "Altitude(baro)", "", "ft", 3, 1, 0);
    tpModel.addTestParam(avInfoAltbaro);

    TestParam avInfoLong("longitude", avInfo.id(), "Longitude", "", "W", 4, 0, 0);
    tpModel.addTestParam(avInfoLong);

    TestParam avInfoAltgeom("altitude(geom)", avInfo.id(), "Altitude(geom)", "", "ft", 4, 1, 0);
    tpModel.addTestParam(avInfoAltgeom);

    TestParam avInfoVct("velocity", avInfo.id(), "Velocity", "", "kts", 5, 0, 0);
    tpModel.addTestParam(avInfoVct);

    Summary ynDisc("YES/NO Discretes:", adsbOut1090.id(), 0, 3, 2);
    sumModel.addSummary(ynDisc);

    TestParam ynDiscUin("uat-In", avInfo.id(), "UAT IN", "", "", 0, 0, 0);
    tpModel.addTestParam(ynDiscUin);

    TestParam ynDiscTop("tcas-Op", avInfo.id(), "TCAS Op", "", "", 0, 1, 0);
    tpModel.addTestParam(ynDiscTop);

    TestParam ynDiscEsin("1090ES-In", avInfo.id(), "1090ES IN", "", "", 1, 0, 0);
    tpModel.addTestParam(ynDiscEsin);

    TestParam ynDiscIdt("ident", avInfo.id(), "IDENT", "", "", 1, 1, 0);
    tpModel.addTestParam(ynDiscIdt);

    TestParam ynDiscTra("tcas-Ra", avInfo.id(), "TCAS RA", "", "", 2, 0, 0);
    tpModel.addTestParam(ynDiscTra);

    Summary intgFld("Integrity Fields:", adsbOut1090.id(), 0, 4, 2);
    sumModel.addSummary(intgFld);

    TestParam intgFldNacp("nacp", intgFld.id(), "NACp", "", "", 0, 0, 0);
    tpModel.addTestParam(intgFldNacp);

    TestParam intgFldNacv("nacv", intgFld.id(), "NACv", "", "", 0, 1, 0);
    tpModel.addTestParam(intgFldNacv);

    TestParam intgFldSil("sil", intgFld.id(), "SIL", "", "", 1, 0, 0);
    tpModel.addTestParam(intgFldSil);

    TestParam intgFldSda("sda", intgFld.id(), "SDA", "", "", 1, 1, 0);
    tpModel.addTestParam(intgFldSda);

    TestParam intgFldGva("gva", intgFld.id(), "GVA", "", "", 2, 0, 0);
    tpModel.addTestParam(intgFldGva);

    TestParam intgFldNic("nic", intgFld.id(), "NIC", "", "", 2, 1, 0);
    tpModel.addTestParam(intgFldNic);

    //-----------------------------------------------------------------




    Test in1090("1090 ADS-B IN", secADSB.id());
    testModel.addTest(in1090);

    Test uatOut("UAT ADS-B OUT", secADSB.id());
    testModel.addTest(uatOut);

    Test uatIn("UAT ADS-B IN", secADSB.id());
    testModel.addTest(uatIn);


    auto navigationDaoPtr = DataManager::instance().navigationDao();

    Navigation adsbTo1090(vwGlobal.id(), "_section", secADSB.id(), vwMainADSB.id());
    navigationDaoPtr->addNavigation(adsbTo1090);

    Navigation main1090ToScanPage(vwMainADSB.id(), "_test", adsbOut1090.id(), vwADSBout1090Scan.id());
    navigationDaoPtr->addNavigation(main1090ToScanPage);

    Navigation scanToDetail(vwADSBout1090Scan.id(), "Next", 0, vwADSBout1090P1.id());
    navigationDaoPtr->addNavigation(scanToDetail);


    return 1;
}
