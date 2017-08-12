#include "databuilder.h"
#include "datamanager.h"
#include "sectiongroupmodel.h"
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

    View vwHome("Home");
    viewDao->addView(vwHome);

    View vwADSB("ADSB");
    viewDao->addView(vwADSB);

    View vwSetup("Setup");
    viewDao->addView(vwSetup);

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

    View vwSetupUser("Setup-User");
    viewDao->addView(vwSetupUser);

    View vwSetupUserDetail("Setup-User-Detail");
    viewDao->addView(vwSetupUserDetail);

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

    View vwADSBout1090Radar("ADSB-OUT-1090-Radar");
    viewDao->addView(vwADSBout1090Radar);

    View vwADSBoutUatRadar("ADSB-OUT-UAT-Radar");
    viewDao->addView(vwADSBoutUatRadar);

    View vwADSBout1090Graph("ADSB-OUT-1090-Graph");
    viewDao->addView(vwADSBout1090Graph);

    View vwADSBoutUatGraph("ADSB-OUT-UAT-Graph");
    viewDao->addView(vwADSBoutUatGraph);

    View vwSetupAddUser("Setup-Add-User");
    viewDao->addView(vwSetupAddUser);

    View vwAntenna("Antenna");
    viewDao->addView(vwAntenna);

    View vwAntAviationVswr("Antenna-Aviation-VSWR");
    viewDao->addView(vwAntAviationVswr);

    View vwAntAviationCl("Antenna-Aviation-Cl");
    viewDao->addView(vwAntAviationCl);

    View vwAntAviationDtf("Antenna-Aviation-DTF");
    viewDao->addView(vwAntAviationDtf);

    View vwAppLogs("Global-App-Logs");
    viewDao->addView(vwAppLogs);

    View vwTestDetailLanding("Test-Detail-Landing");
    viewDao->addView(vwTestDetailLanding);

    View vwAviationLanding("Aviation-Landing");
    viewDao->addView(vwAviationLanding);

    View vwTransponder("Transponder");
    viewDao->addView(vwTransponder);

    View vwTransponderLanding("Transponder-Landing");
    viewDao->addView(vwTransponderLanding);

    View vwXpndrAutoTestP1("XPNDR-Auto-Test-P1");
    viewDao->addView(vwXpndrAutoTestP1);

    View vwXpndrAutoTestP2("XPNDR-Auto-Test-P2");
    viewDao->addView(vwXpndrAutoTestP2);

    View vwXpndrAutoTestP3("XPNDR-Auto-Test-P3");
    viewDao->addView(vwXpndrAutoTestP3);

    View vwXpndrAutoTestP4("XPNDR-Auto-Test-P4");
    viewDao->addView(vwXpndrAutoTestP4);

    View vwXpndrAutoTestP5("XPNDR-Auto-Test-P5");
    viewDao->addView(vwXpndrAutoTestP5);

    View vwXpndrAutoTestP6("XPNDR-Auto-Test-P6");
    viewDao->addView(vwXpndrAutoTestP6);

    View vwXpndrAutoTestP7("XPNDR-Auto-Test-P7");
    viewDao->addView(vwXpndrAutoTestP7);

    View vwXpndrAutoTestP8("XPNDR-Auto-Test-P8");
    viewDao->addView(vwXpndrAutoTestP8);


    SectionGroupModel sgModel{};
    SectionModel secModel{};

    SectionGroup grpHome("");
    sgModel.addSectionGroup(grpHome);

    SectionGroup grpTests("Tests");
    sgModel.addSectionGroup(grpTests);

    SectionGroup grpSystem("System");
    sgModel.addSectionGroup(grpSystem);

    Section secHome("Home", grpHome.id());
    secModel.addSection(secHome);

    Section secTransponder("Transponder", grpTests.id());
    secModel.addSection(secTransponder);

    Section secModeS("Mode S", grpTests.id());
    secModel.addSection(secModeS);

    Section secADSB("ADS-B", grpTests.id());
    secModel.addSection(secADSB);

    Section secNAV("NAV", grpTests.id());
    secModel.addSection(secNAV);

    Section secComm("Comm", grpTests.id());
    secModel.addSection(secComm);

    Section secAntenna("Antenna", grpTests.id());
    secModel.addSection(secAntenna);

    Section secReports("Reports", grpTests.id());
    secModel.addSection(secReports);

    Section secSetup("Setup", grpSystem.id());
    secModel.addSection(secSetup);

    Section secSearch("Search", grpSystem.id());
    secModel.addSection(secSearch);

    TestModel testModel { };
    SummaryModel sumModel { };
    TestParamModel tpModel { };

    Test adsbOut1090("1090 ADS-B OUT", secADSB.id());
    testModel.addTest(adsbOut1090);

    //------------------------------P1-------------------------------

    Summary sumAirVeh("Aircraft/Vehicle", adsbOut1090.id(), 0, 0, 2);
    sumModel.addSummary(sumAirVeh);

    TestParam tpAirVehAdd("address", sumAirVeh.id(), "ADDRESS", "______ (_) / ________ (_)", "", 0, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVehAdd);

    TestParam tpAirVehFId("flight-Id", sumAirVeh.id(), "Flight ID", "______", "", 1, 0, 1 , 1, "l50.v30.u10");
    tpModel.addTestParam(tpAirVehFId);

    TestParam tpAirVehRfLvl("rfLvl", sumAirVeh.id(), "RF Level",  "______", "", 1, 1, 1 , 1, "l10.v30.u10");
    tpModel.addTestParam(tpAirVehRfLvl);

    TestParam tpAirVehBds("bds-Rcvd", sumAirVeh.id(), "BDS Rcvd (DF17)", "_,_ _,_ _,_ _,_ _,_", "", 2, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVehBds);

    Summary sumFarElems("FAR 91.227 REQUIRED ELEMENTS", adsbOut1090.id(), 0, 1, 1);
    sumModel.addSummary(sumFarElems);

    Summary sumAvInfo1("Aircraft/Vehicle info", adsbOut1090.id(), 0, 2, 2);
    sumModel.addSummary(sumAvInfo1);

    TestParam tpAvInfoFId("flight-Id", sumAvInfo1.id(), "Flight ID", "______", "", 0, 0, 1 , 1, "l50.v70.u10");
    tpModel.addTestParam(tpAvInfoFId);

    TestParam tpAvInfoMsAdd("mode-S-Addr", sumAvInfo1.id(), "Mode S Addr", "______", "", 0, 1, 1 , 1, "l30.v70.u10");
    tpModel.addTestParam(tpAvInfoMsAdd);

    TestParam tpAvInfoEc("emitter-Cat", sumAvInfo1.id(), "Emitter Cat", "__ (______)", "", 1, 0, 1 , 1, "l50.v70.u10");
    tpModel.addTestParam(tpAvInfoEc);

    TestParam tpAvInfoAcode("3/A-Code", sumAvInfo1.id(), "3/A Code", "_____", "", 1, 1, 1 , 1, "l30.v70.u10");
    tpModel.addTestParam(tpAvInfoAcode);

    TestParam tpAvInfoEp("emg/Prty", sumAvInfo1.id(), "Emg/Prty", "_ (________)", "", 2, 0, 1 , 1, "l50.v70.u10");
    tpModel.addTestParam(tpAvInfoEp);

    TestParam tpAvInfoLw("l/w", sumAvInfo1.id(), "L/W", "__ ( __ m / __._m)", "", 2, 1, 1 , 1, "l30.v70.u10");
    tpModel.addTestParam(tpAvInfoLw);

    TestParam tpAvInfoLat("latitude", sumAvInfo1.id(), "Latitude", "__._____°", "N", 3, 0, 1 , 1, "l50.v70.u10");
    tpModel.addTestParam(tpAvInfoLat);

    TestParam tpAvInfoAltbaro("altitude(baro)", sumAvInfo1.id(), "Altitude(baro)"," ____,_____", "ft", 3, 1, 1 , 1, "l30.v70.u10");
    tpModel.addTestParam(tpAvInfoAltbaro);

    TestParam tpAvInfoLong("longitude", sumAvInfo1.id(), "Longitude", "____._____°", "W", 4, 0, 1 , 1, "l50.v70.u10");
    tpModel.addTestParam(tpAvInfoLong);

    TestParam tpAvInfoAltgeom("altitude(geom)", sumAvInfo1.id(), "Altitude(geom)", "__,___", "ft", 4, 1, 1 , 1, "l30.v70.u10");
    tpModel.addTestParam(tpAvInfoAltgeom);

    TestParam tpAvInfoVct("velocity", sumAvInfo1.id(), "Velocity", "___", "kts", 5, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpAvInfoVct);

    Summary sumYnDisc("YES/NO Discretes", adsbOut1090.id(), 0, 3, 2);
    sumModel.addSummary(sumYnDisc);

    TestParam tpYnDiscUin("uat-In", sumYnDisc.id(),  "UAT IN", "_ (_)", "", 0, 0, 1 , 1, "l50.v70.u10");
    tpModel.addTestParam(tpYnDiscUin);

    TestParam tpYnDiscTop("tcas-Op", sumYnDisc.id(), "TCAS Op", "_ (_)", "", 0, 1, 1 , 1, "l30.v70.u10");
    tpModel.addTestParam(tpYnDiscTop);

    TestParam tpYnDiscEsin("1090-ES-In", sumYnDisc.id(), "1090ES IN", "_ (_)", "", 1, 0, 1 , 1, "l50.v70.u10");
    tpModel.addTestParam(tpYnDiscEsin);

    TestParam tpYnDiscIdt("ident", sumYnDisc.id(), "IDENT", "_ (_)", "", 1, 1, 1 , 1, "l30.v70.u10");
    tpModel.addTestParam(tpYnDiscIdt);

    TestParam tpYnDiscTra("tcas-Ra", sumYnDisc.id(), "TCAS RA",  "_ (_)", "", 2, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpYnDiscTra);

    Summary sumIntgFld("Integrity Fields", adsbOut1090.id(), 0, 4, 2);
    sumModel.addSummary(sumIntgFld);

    TestParam tpIntgFldNacp("nacp", sumIntgFld.id(), "NACp", "__ (< __nm)", "", 0, 0, 1 , 1, "l50.v70.u10");
    tpModel.addTestParam(tpIntgFldNacp);

    TestParam tpIntgFldNacv("nacv", sumIntgFld.id(), "NACv", "__ (< __m/s)", "", 0, 1, 1 , 1, "l50.v70.u10");
    tpModel.addTestParam(tpIntgFldNacv);

    TestParam tpIntgFldSil("sil", sumIntgFld.id(), "SIL", "__ (< __ -__ )", "", 1, 0, 1 , 1, "l50.v70.u10");
    tpModel.addTestParam(tpIntgFldSil);

    TestParam tpIntgFldSda("sda", sumIntgFld.id(), "SDA", "__", "", 1, 1, 1 , 1, "l50.v70.u10");
    tpModel.addTestParam(tpIntgFldSda);

    TestParam tpIntgFldGva("gva", sumIntgFld.id(), "GVA", "__ (< ___m)", "", 2, 0, 1 , 1, "l50.v70.u10");
    tpModel.addTestParam(tpIntgFldGva);

    TestParam tpIntgFldNic("nic", sumIntgFld.id(), "NIC", "__ (RC< __nmi)", "", 2, 1, 1 , 1, "l50.v70.u10");
    tpModel.addTestParam(tpIntgFldNic);

    //------------------------------P2-------------------------------

    Summary sumAirVeh1("Aircraft/Vehicle", adsbOut1090.id(), 1, 0, 2);
    sumModel.addSummary(sumAirVeh1);

    TestParam tpAirVeh1Add("address", sumAirVeh1.id(), "ADDRESS", "______ (_) / ________ (_)", "", 0, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh1Add);

    TestParam tpAirVeh1FId("flight-Id", sumAirVeh1.id(), "Flight ID", "______", "", 1, 0, 1, 1, "l50.v30.u10");
    tpModel.addTestParam(tpAirVeh1FId);

    TestParam tpAirVeh1RfLvl("rfLvl", sumAirVeh1.id(), "RF Level",  "______", "", 1, 1, 1, 1, "l10.v30.u10");
    tpModel.addTestParam(tpAirVeh1RfLvl);

    TestParam tpAirVeh1Bds("bds-Rcvd", sumAirVeh1.id(), "BDS Rcvd (DF17)", "_,_ _,_ _,_ _,_ _,_", "", 2, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh1Bds);

    Summary sumAirPos("BDS 0,5: Airborne Postion", adsbOut1090.id(), 1, 1, 1);
    sumModel.addSummary(sumAirPos);

    TestParam tpAirPosMsgEle("message-Element", sumAirPos.id(), "Message Element", "__ __ __ __ __ __ __", "", 0, 0, 1, 2, "l40.l40.u10");
    tpModel.addTestParam(tpAirPosMsgEle);


    Summary sumPos("Position", adsbOut1090.id(), 1, 2, 2);
    sumModel.addSummary(sumPos);

    TestParam tpPosLat("latitude", sumPos.id(), "Latitude", "__⁰ __ __.___", "N", 0, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpPosLat);

    TestParam tpPosLong("longitude", sumPos.id(), "Longitude", "____⁰ __ __.___", "W", 1, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpPosLong);

    TestParam tpPosAltBaro("altitude(baro)", sumPos.id(), "Altitude(baro)"," ____,_____", "ft", 2, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpPosAltBaro);

    Summary sumOFlds("Other Fields", adsbOut1090.id(), 1, 3, 2);
    sumModel.addSummary(sumOFlds);

    TestParam tpOFldsSurSts("surveillance-Status", sumOFlds.id(), "Surveillance Status", "__ (____)", "", 0, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpOFldsSurSts);

    TestParam tpOFldsNicSb("nic-SB", sumOFlds.id(), "NIC-SB", "__", "", 1, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpOFldsNicSb);

    TestParam tpOFldsCprFrmt("cpr-Format", sumOFlds.id(), "CPR Format", "__ (____)", "", 2, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpOFldsCprFrmt);

    TestParam tpOFldsUtcSync("utc-Sync", sumOFlds.id(), "UTC Sync", "__ (_______)", "", 3, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpOFldsUtcSync);

    //------------------------------P3-------------------------------

    Summary sumAirVeh2("Aircraft/Vehicle", adsbOut1090.id(), 2, 0, 2);
    sumModel.addSummary(sumAirVeh2);

    TestParam tpAirVeh2Add("address", sumAirVeh2.id(), "ADDRESS", "______ (_) / ________ (_)", "", 0, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh2Add);

    TestParam tpAirVeh2FId("flight-Id", sumAirVeh2.id(), "Flight ID", "______", "", 1, 0, 1, 1, "l50.v30.u10");
    tpModel.addTestParam(tpAirVeh2FId);

    TestParam tpAirVeh2RfLvl("rfLvl", sumAirVeh2.id(), "RF Level",  "______", "", 1, 1, 1, 1, "l10.v30.u10");
    tpModel.addTestParam(tpAirVeh2RfLvl);

    TestParam tpAirVeh2Bds("bds-Rcvd", sumAirVeh2.id(), "BDS Rcvd (DF17)", "_,_ _,_ _,_ _,_ _,_", "", 2, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh2Bds);

    Summary sumAcIdCat("BDS 0,8: A/C ID & Category", adsbOut1090.id(), 2, 1, 1);
    sumModel.addSummary(sumAcIdCat);

    TestParam tpAcIdCatMsgEle("message-Element", sumAcIdCat.id(), "Message Element", "__ __ __ __ __ __ __", "", 0, 0, 1, 2, "l40.l40.u10");
    tpModel.addTestParam(tpAcIdCatMsgEle);

    Summary sumAVInfo2("Aircraft/Vechile Info", adsbOut1090.id(), 2, 2, 2);
    sumModel.addSummary(sumAVInfo2);

    TestParam tpAVInfoAID("aircraft-ID", sumAVInfo2.id(), "Aircraft ID", "______", "", 0, 0, 1, 2, "l50.v40.u10");
    tpModel.addTestParam(tpAVInfoAID);

    TestParam tpAVInfoEC("emitter-Cat", sumAVInfo2.id(), "Emitter Cat", "_ (_____)", "", 1, 0, 1, 2, "l50.v40.u10");
    tpModel.addTestParam(tpAVInfoEC);

    //------------------------------P4-------------------------------

    Summary sumAirVeh3("Aircraft/Vehicle", adsbOut1090.id(), 3, 0, 2);
    sumModel.addSummary(sumAirVeh3);

    TestParam tpAirVeh3Add("address", sumAirVeh3.id(), "ADDRESS", "______ (_) / ________ (_)", "", 0, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh3Add);

    TestParam tpAirVeh3FId("flight-Id", sumAirVeh3.id(), "Flight ID", "______", "", 1, 0, 1, 1, "l50.v30.u10");
    tpModel.addTestParam(tpAirVeh3FId);

    TestParam tpAVeh3RfLvl("rfLvl", sumAirVeh3.id(), "RF Level",  "______", "", 1, 1, 1, 1, "l10.v30.u10");
    tpModel.addTestParam(tpAVeh3RfLvl);

    TestParam tpAirVeh3Bds("bds-Rcvd", sumAirVeh3.id(), "BDS Rcvd (DF17)", "_,_ _,_ _,_ _,_ _,_", "", 2, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh3Bds);

    Summary sumAirVelocity("BDS 0,9: Airborne Velocity", adsbOut1090.id(), 3, 1, 1);
    sumModel.addSummary(sumAirVelocity);

    TestParam tpAirVelocityMsgEle("message-Element", sumAirVelocity.id(), "Message Element", "__ __ __ __ __ __ __", "", 0, 0, 1, 2, "l40.l40.u10");
    tpModel.addTestParam(tpAirVelocityMsgEle);


    Summary sumFltData("Flight Data", adsbOut1090.id(), 3, 2, 2);
    sumModel.addSummary(sumFltData);

    TestParam tpFltDataHdg("heading", sumFltData.id(), "Heading", "______", "", 0, 0, 1, 2, "l50.v50.u10");
    tpModel.addTestParam(tpFltDataHdg);

    TestParam tpFltDataAirspd("airspeed", sumFltData.id(), "Airspeed", "__ (______)", "", 1, 0, 1, 2, "l50.v50.u10");
    tpModel.addTestParam(tpFltDataAirspd);

    TestParam tpFltDataVerRt("vertical-Rate", sumFltData.id(), "Vertical Rate", "______", "fpm", 2, 0, 1, 2, "l50.v50.u10");
    tpModel.addTestParam(tpFltDataVerRt);

    TestParam tpFltDataGBAlt("Geom/Baro Alt", sumFltData.id(), "Geom/Baro Alt", "_____", "ft", 3, 0, 1, 2, "l50.v50.u10");
    tpModel.addTestParam(tpFltDataGBAlt);

    Summary sumOFlds1("Other Fields", adsbOut1090.id(), 3, 3, 2);
    sumModel.addSummary(sumOFlds1);

    TestParam tpOFlds1Icf("icf", sumOFlds1.id(), "ICF", "_ (______)", "", 0, 0, 1, 1, "l50.v50.u10");
    tpModel.addTestParam(tpOFlds1Icf);

    TestParam tpOFlds1AirSpdTyp("airSpd-Type", sumOFlds1.id(), "AirSpd Type", "__ (___)", "", 0, 1, 1, 1, "l50.v50.u10");
    tpModel.addTestParam(tpOFlds1AirSpdTyp);

    TestParam tpOFlds1Nacv("nacv", sumOFlds1.id(), "NACv", "__ (< __ m/s)", "", 1, 0, 1, 1, "l50.v50.u10");
    tpModel.addTestParam(tpOFlds1Nacv);

    TestParam tpOFlds1VRSrc("vert-Rate-Src", sumOFlds1.id(), "Vert Rate Src", "_ (_____)", "", 1, 1, 1, 1, "l50.v50.u10");
    tpModel.addTestParam(tpOFlds1VRSrc);

    TestParam tpOFlds1hdgSts("hdg-Sts", sumOFlds1.id(), "Hdg Sts", "_ (_____)", "", 2, 0, 1, 2, "l50.v50.u10");
    tpModel.addTestParam(tpOFlds1hdgSts);

    //------------------------------P5-------------------------------

    Summary sumAirVeh4("Aircraft/Vehicle", adsbOut1090.id(), 4, 0, 2);
    sumModel.addSummary(sumAirVeh4);

    TestParam tpAirVeh4Add("address", sumAirVeh4.id(), "ADDRESS", "______ (_) / ________ (_)", "", 0, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh4Add);

    TestParam tpAirVeh4FId("flight-Id", sumAirVeh4.id(), "Flight ID", "______", "", 1, 0, 1, 1, "l50.v30.u10");
    tpModel.addTestParam(tpAirVeh4FId);

    TestParam tpAVeh4RfLvl("rfLvl", sumAirVeh4.id(), "RF Level",  "______", "", 1, 1, 1, 1, "l50.v30.u10");
    tpModel.addTestParam(tpAVeh4RfLvl);

    TestParam tpAirVeh4Bds("bds-Rcvd", sumAirVeh4.id(), "BDS Rcvd (DF17)", "_,_ _,_ _,_ _,_ _,_", "", 2, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh4Bds);

    Summary sumOprSts("BDS 6,5: Operational Status", adsbOut1090.id(), 4, 1, 1);
    sumModel.addSummary(sumOprSts);

    TestParam tpOprStsMsgEle("message-Element", sumOprSts.id(), "Message Element", "__ __ __ __ __ __ __", "", 0, 0, 1, 2, "l40.l40.u10");
    tpModel.addTestParam(tpOprStsMsgEle);


    Summary sumIntData("Intergrity Data", adsbOut1090.id(), 4, 2, 2);
    sumModel.addSummary(sumIntData);

    TestParam tpIntDataNacp("nacp", sumIntData.id(), "NACp", "__ (<.__ nm)", "", 0, 0, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpIntDataNacp);

    TestParam tpIntDataNsupa("nic-supa", sumIntData.id(), "NIC-supA", "__", "", 0, 1, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpIntDataNsupa);

    TestParam tpIntDataSda("sda", sumIntData.id(), "SDA", "__", "", 1, 0, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpIntDataSda);

    TestParam tpIntDataGva("gva", sumIntData.id(), "GVA", "_ (<__ m)", "", 1, 1, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpIntDataGva);

    TestParam tpIntDataSil("sil", sumIntData.id(), "SIL", "_ (___)", "", 2, 0, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpIntDataSil);

    TestParam tpIntDatassup("silsup", sumIntData.id(), "SILSup", "__", "", 2, 1, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpIntDatassup);

    Summary sumCapSts("Capability/Status", adsbOut1090.id(), 4, 3, 2);
    sumModel.addSummary(sumCapSts);

    TestParam tpCapStsAcc("airb-Cap.-Class", sumCapSts.id(), "Airb Cap. Class", "___", "", 0, 0, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpCapStsAcc);

    TestParam tpCapStsOm("op.-Mode-(OM)", sumCapSts.id(), "Op. Mode (OM)", "__", "", 0, 1, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpCapStsOm);

    TestParam tpCapStsAnt("antenna", sumCapSts.id(), "Antenna", "__ (___)", "", 1, 0, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpCapStsAnt);

    TestParam tpCapStsTSR("target-State-Rpt", sumCapSts.id(), "Target State Rpt", "__ (____)", "", 1, 1, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpCapStsTSR);

    TestParam tpCapStsTo("tcas-Oper", sumCapSts.id(), "TCAS Oper", "__ (____)", "", 2, 0, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpCapStsTo);

    TestParam tpCapStsTra("tcas-Ra", sumCapSts.id(), "TCAS RA",  "__ (____)", "", 2, 1, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpCapStsTra);

    TestParam tpCapStsesin("1090es-In", sumCapSts.id(), "1090ES-IN", "__ (____)", "", 3, 0, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpCapStsesin);

    TestParam tpCapStsuin("uat-In", sumCapSts.id(), "UAT-IN", "__ (____)", "", 3, 1, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpCapStsuin);

    TestParam tpCapStsatc("atc", sumCapSts.id(), "ATC", "__ (____)", "", 4, 0, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpCapStsatc);

    TestParam tpCapStsidt("ident", sumCapSts.id(), "IDENT", "__ (____)", "", 4, 1, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpCapStsidt);

    Summary sumOFlds2("Other Fields", adsbOut1090.id(), 4, 4, 2);
    sumModel.addSummary(sumOFlds2);

    TestParam tpOFlds2Vrs("version", sumOFlds2.id(), "Version", "__ (_____)", "", 0, 0, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpOFlds2Vrs);

    TestParam tpOFlds2Tc("traj-Chg-(TC)", sumOFlds2.id(), "Traj Chg (TC)", "__ (____)", "", 0, 1, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpOFlds2Tc);

    TestParam tpOFlds2Ac("arv-Capable", sumOFlds2.id(), "ARV capable", "__ (____)", "", 1, 0, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpOFlds2Ac);

    TestParam tpOFlds2Arf("ads-R-Flag", sumOFlds2.id(), "ADS-R Flag", "__", "", 1, 1, 1, 1, "l50.v40.u10");
    tpModel.addTestParam(tpOFlds2Arf);

    TestParam tpOFlds2Hrd("hrz-Ref-Dir", sumOFlds2.id(), "Hrz Ref Dir", "__ (___ _)", "", 2, 0, 1, 2, "l50.v40.u10");
    tpModel.addTestParam(tpOFlds2Hrd);

    //------------------------------P6-------------------------------

    Summary sumAirVeh5("Aircraft/Vehicle", adsbOut1090.id(), 5, 0, 2);
    sumModel.addSummary(sumAirVeh5);

    TestParam tpAirVeh5Add("address", sumAirVeh5.id(), "ADDRESS", "______ (_) / ________ (_)", "", 0, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh5Add);

    TestParam tpAirVeh5FId("flight-Id", sumAirVeh5.id(), "Flight ID", "______", "", 1, 0, 1, 1, "l50.v30.u10");
    tpModel.addTestParam(tpAirVeh5FId);

    TestParam tpAirVeh5RfLvl("rfLvl", sumAirVeh5.id(), "RF Level",  "______", "", 1, 1, 1, 1, "l10.v30.u10");
    tpModel.addTestParam(tpAirVeh5RfLvl);

    TestParam tpAirVeh5Bds("bds-Rcvd", sumAirVeh5.id(), "BDS Rcvd (DF17)", "_,_ _,_ _,_ _,_ _,_", "", 2, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh5Bds);

    Summary sumTse("Target State Element (TS)", adsbOut1090.id(), 5, 1, 1);
    sumModel.addSummary(sumTse);

    TestParam tpTsSAlt("sel.-Altitude", sumTse.id(), "Sel. Altitude", "__ (<.__ nm)", "", 0, 0, 1, 1, "l50.v50.u10");
    tpModel.addTestParam(tpTsSAlt);

    TestParam tpTseNs("nic-supA", sumTse.id(), "NIC-supA", "__", "", 0, 1, 1, 1, "l10.v50.u10");
    tpModel.addTestParam(tpTseNs);

    TestParam tpTseBs("baro-Setting", sumTse.id(), "Baro Setting", "____", "mb", 1, 0, 1, 2, "l50.v50.u10");
    tpModel.addTestParam(tpTseBs);

    TestParam tpTseSh("sel.-Heading", sumTse.id(), "Sel. Heading", "____", "deg", 2, 0, 1, 1, "l50.v50.u10");
    tpModel.addTestParam(tpTseSh);

    TestParam tpTse("status", sumTse.id(), "Status", "__ (_____)", "", 2, 1, 1, 1, "l10.v50.u10");
    tpModel.addTestParam(tpTse);

    Summary sumApM1("Autopilot Modes", adsbOut1090.id(), 5, 2, 2);
    sumModel.addSummary(sumApM1);

    TestParam tpApMMbs("mode-Bits-Status", sumApM1.id(), "Mode bits status", "__(_____)", "", 0, 0, 1, 2, "l50.v80.u10");
    tpModel.addTestParam(tpApMMbs);

    TestParam tpApMAp("autopilot-(AP)", sumApM1.id(), "Autopilot (AP)", "_ (_______)", "", 1, 0, 1, 2, "l50.v80.u10");
    tpModel.addTestParam(tpApMAp);

    TestParam tpApMVnav("vnav", sumApM1.id(), "VNAV", "_ (__________)", "", 2, 0, 1, 2, "l50.v80.u10");
    tpModel.addTestParam(tpApMVnav);

    TestParam tpApMAltH("alt.-Hold-(ALT)", sumApM1.id(), "Alt. Hold (ALT)", "_ (_______)", "", 3, 0, 1, 2, "l50.v80.u10");
    tpModel.addTestParam(tpApMAltH);

    TestParam tpApMApp("approach-(APP)", sumApM1.id(), "Approach (APP)", "__ (___________)", "", 4, 0, 1, 2, "l50.v80.u10");
    tpModel.addTestParam(tpApMApp);

    TestParam tpApMlnav("lnav", sumApM1.id(), "LNAV", "__ (___________)", "", 5, 0, 1, 2, "l50.v80.u10");
    tpModel.addTestParam(tpApMlnav);

    //------------------------------P7-------------------------------

    Summary sumAirVeh6("Aircraft/Vehicle", adsbOut1090.id(), 6, 0, 2);
    sumModel.addSummary(sumAirVeh6);

    TestParam tpAirVeh6Add("address", sumAirVeh6.id(), "ADDRESS", "______ (_) / ________ (_)", "", 0, 0, 1, 2, "l60.v60.u10");
    tpModel.addTestParam(tpAirVeh6Add);

    TestParam tpAirVeh6FId("flight-Id", sumAirVeh6.id(), "Flight ID", "______", "", 1, 0, 1, 1, "l60.v30.u10");
    tpModel.addTestParam(tpAirVeh6FId);

    TestParam tpAirVeh6RfLvl("rfLvl", sumAirVeh6.id(), "RF Level",  "______", "", 1, 1, 1, 1, "l10.v30.u10");
    tpModel.addTestParam(tpAirVeh6RfLvl);

    TestParam tpAirVeh6Bds("bds-Rcvd", sumAirVeh6.id(), "BDS Rcvd (DF17)", "_,_ _,_ _,_ _,_ _,_", "", 2, 0, 1, 2, "l60.v60.u10");
    tpModel.addTestParam(tpAirVeh6Bds);

    Summary sumRfST("RF/ Squitter Timming", adsbOut1090.id(), 6, 1, 1);
    sumModel.addSummary(sumRfST);

    TestParam tpRfSTEsr("extended-Squitter-Rate", sumRfST.id(), "Extended Squitter Rate", "__.__", "sec", 0, 0, 1, 2, "l40.v20.u20");
    tpModel.addTestParam(tpRfSTEsr);

    Summary sumRfData("1090 MHz RF Data", adsbOut1090.id(), 6, 2, 2);
    sumModel.addSummary(sumRfData);

    TestParam tpRfDataMf("measured-frequency", sumRfData.id(), "Measured frequency", "____.___", "MHz", 0, 0, 1, 2, "l60.v70.u10");
    tpModel.addTestParam(tpRfDataMf);

    TestParam tpRfDataMp("measure-power", sumRfData.id(), "Measure power", "___._", "dBm", 1, 0, 1, 2, "l60.v70.u10");
    tpModel.addTestParam(tpRfDataMp);

    TestParam tpRfDataEc("error-conditions", sumRfData.id(), "Error conditions", "__________", "", 2, 0, 1, 2, "l60.v70.u10");
    tpModel.addTestParam(tpRfDataEc);

    Test in1090("1090 ADS-B IN", secADSB.id());
    testModel.addTest(in1090);

    //------------------------------uatOut-------------------------------

    Test adsbOutUat("UAT ADS-B OUT", secADSB.id());
    testModel.addTest(adsbOutUat);

    //------------------------------P1-------------------------------

    Summary sumAirVeh7("Aircraft/Vehicle", adsbOutUat.id(), 0, 0, 2);
    sumModel.addSummary(sumAirVeh7);

    TestParam tpAirVeh7Add("address", sumAirVeh7.id(), "ADDRESS", "______ (_) / ________ (_)", "", 0, 0, 1, 2, "l30.6v0.u10");
    tpModel.addTestParam(tpAirVeh7Add);

    TestParam tpAirVeh7FId("qualifier", sumAirVeh7.id(), "Qualifier", "______", "", 1, 0, 1, 1, "l30.v30.u10");
    tpModel.addTestParam(tpAirVeh7FId);

    TestParam tpAirVeh7RfLvl("rfLvl", sumAirVeh7.id(), "RF Level",  "______", "", 1, 1, 1, 1, "l30.v30.u10");
    tpModel.addTestParam(tpAirVeh7RfLvl);

    TestParam tpAirVeh7Bds("payloads-Rcvd", sumAirVeh7.id(), "Payloads Rcvd", "_,_,_,_", "", 2, 0, 1, 2, "l30.v60.u10");
    tpModel.addTestParam(tpAirVeh7Bds);

    Summary sumMS("Mode Status Element (MS)", adsbOutUat.id(), 0, 1, 1);
    sumModel.addSummary(sumMS);

    Summary sumAvInfo3("Aircraft/Vehicle info", adsbOutUat.id(), 0, 2, 2);
    sumModel.addSummary(sumAvInfo3);

    TestParam tpAvInfo3fid("flight-ID", sumAvInfo3.id(), "Flight ID", "______", "", 0, 0, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpAvInfo3fid);

    TestParam tpAvInfo3csid("csid", sumAvInfo3.id(), "CSID", "__ (__________)", "", 0, 1, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpAvInfo3csid);

    TestParam tpAvInfo3ect("emitter-Cat", sumAvInfo3.id(), "Emitter Cat", "__ (______)", "", 1, 0, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpAvInfo3ect);

    TestParam tpAvInfo3acode("3/A-Code", sumAvInfo3.id(), "3/A Code", "_____", "", 1, 1, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpAvInfo3acode);

    TestParam tpAvInfo3ep("emg/Prty", sumAvInfo3.id(), "Emg/Prty", "_ (________)", "", 2, 0, 1, 2, "l30.v80.u10");
    tpModel.addTestParam(tpAvInfo3ep);

    Summary sumCCodes("Capability Codes", adsbOutUat.id(), 0, 3, 2);
    sumModel.addSummary(sumCCodes);

    TestParam tpCCodesuin("uat-IN", sumCCodes.id(),  "UAT IN", "_ (_)", "", 0, 0, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpCCodesuin);

    TestParam tpCCodestOp("tcas-Op", sumCCodes.id(), "TCAS Op", "_ (_)", "", 0, 1, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpCCodestOp);

    TestParam tpCCodesesin("1090ES-IN", sumCCodes.id(), "1090ES IN", "_ (_)", "", 1, 0, 1, 2, "l30.v80.u10");
    tpModel.addTestParam(tpCCodesesin);

    Summary sumOModes("Operational Modes", adsbOutUat.id(), 0, 4, 2);
    sumModel.addSummary(sumOModes);

    TestParam tpOModesAtcS("atc-Svcs", sumOModes.id(), "ATC Svcs", "_ (_)", "", 0, 0, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpOModesAtcS);

    TestParam tpOModesidt("ident", sumOModes.id(), "IDENT", "_ (_)", "", 0, 1, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpOModesidt);

    TestParam tpOModestra("tcas-RA", sumOModes.id(), "TCAS RA",  "_ (_)", "", 1, 0, 1, 2, "l30.v80.u10");
    tpModel.addTestParam(tpOModestra);

    Summary sumOtherFld("Other Fields", adsbOutUat.id(), 0, 5, 2);
    sumModel.addSummary(sumOtherFld);

    TestParam tpOtherFldnacp("nacp", sumOtherFld.id(), "NACp", "__ (< ___nm)", "", 0, 0, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpOtherFldnacp);

    TestParam tpOtherFldtmso("transmit-MSO", sumOtherFld.id(), "Transmit MSO", "___", "", 0, 1, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpOtherFldtmso);

    TestParam tpOtherFldnacv("nacv", sumOtherFld.id(), "NACv", "__ (< __m/s)", "", 1, 0, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpOtherFldnacv);

    TestParam tpOtherFldsil("sil", sumOtherFld.id(), "SIL", "_ (< ___)", "", 1, 1, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpOtherFldsil);

    TestParam tpOtherFldsda("sda", sumOtherFld.id(), "SDA", "__", "", 2, 0, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpOtherFldsda);

    TestParam tpOtherFldgva("gva", sumOtherFld.id(), "GVA", "__ (< __m)", "", 2, 1, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpOtherFldgva);

    TestParam tpOtherFldmops("mops", sumOtherFld.id(), "MOPS", "__ (__-____)", "", 3, 0, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpOtherFldmops);

    TestParam tpOtherFldssup("sil-Sup", sumOtherFld.id(), "SIL Sup", "__ (_________)", "", 3, 1, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpOtherFldssup);

    TestParam tpOtherFldsant("sgl-Ant", sumOtherFld.id(), "Sgl Ant", "__ (________)", "", 4, 0, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpOtherFldsant);

    TestParam tpOtherFldnbaro("nicbaro", sumOtherFld.id(), "NICbaro", "__ (_________)", "", 4, 1, 1, 1, "l30.v80.u10");
    tpModel.addTestParam(tpOtherFldnbaro);

    TestParam tpOtherFldnsup("nicsup", sumOtherFld.id(), "NICsup", "__", "", 5, 0, 1, 2, "l30.v80.u10");
    tpModel.addTestParam(tpOtherFldnsup);



    //------------------------------P2-------------------------------

    Summary sumAirVeh8("Aircraft/Vehicle", adsbOutUat.id(), 1, 0, 2);
    sumModel.addSummary(sumAirVeh8);

    TestParam tpAirVeh8Add("address", sumAirVeh8.id(), "ADDRESS", "______ (_) / ________ (_)", "", 0, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh8Add);

    TestParam tpAirVeh8FId("qualifier", sumAirVeh8.id(), "Qualifier", "______", "", 1, 0, 1, 1, "l50.v30.u10");
    tpModel.addTestParam(tpAirVeh8FId);

    TestParam tpAirVeh8RfLvl("rfLvl", sumAirVeh8.id(), "RF Level",  "______", "", 1, 1, 1, 1, "l10.v30.u10");
    tpModel.addTestParam(tpAirVeh8RfLvl);

    TestParam tpAirVeh8Bds("payloads-Rcvd", sumAirVeh8.id(), "Payloads Rcvd", "_,_,_,_", "", 2, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh8Bds);

    Summary sumSV1("State Vector Element (SV)", adsbOutUat.id(), 1, 1, 1);
    sumModel.addSummary(sumSV1);

    Summary sumPosVel1("Position & Velocity", adsbOutUat.id(), 1, 2, 2);
    sumModel.addSummary(sumPosVel1);

    TestParam tpPosVel1agst("air/Gnd State", sumPosVel1.id(), "Air/Gnd State", "Air-Subsonic", "", 0, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel1agst);

    TestParam tpPosVel1lat("latitude", sumPosVel1.id(), "Latitude", "__⁰ __ __.___", "N", 1, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel1lat);

    TestParam tpPosVel1long("longitude", sumPosVel1.id(), "Longitude", "__⁰ __ __.___", "W", 2, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel1long);

    TestParam tpPosVel1alt("altitude", sumPosVel1.id(), "Altitude", "___,_____", "ft", 3, 0, 1, 1, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel1alt);

    TestParam tpPosVel1typ("type", sumPosVel1.id(), "Type", "__ (______)", "", 3, 1, 1, 1, "l10.v70.u10");
    tpModel.addTestParam(tpPosVel1typ);

    TestParam tpPosVel1hv("horizontal-Velocity", sumPosVel1.id(), "Horizontal Velocity", "___ kts N ___", "kts W", 4, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel1hv);

    TestParam tpPosVel1trh("vert.-Velocity", sumPosVel1.id(), "Vert. Velocity", "__,____", "", 5, 0, 1, 1, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel1trh);

    TestParam tpPosVel1src("source", sumPosVel1.id(), "Source", "__ (_____)", "", 5, 1, 1, 1, "l10.v70.u10");
    tpModel.addTestParam(tpPosVel1src);

    Summary sumOtherFld1("Other Fields", adsbOutUat.id(), 1, 3, 2);
    sumModel.addSummary(sumOtherFld1);

    TestParam tpOtherFld1Nic("nic", sumOtherFld1.id(), "NIC", "__(< ___m)", "", 0, 0, 1, 1, "l50.v70.u10");
    tpModel.addTestParam(tpOtherFld1Nic);

    TestParam tpOtherFld1Utc("utc", sumOtherFld1.id(), "UTC", "__ (________)", "", 0, 1, 1, 1, "l10.v70.u10");
    tpModel.addTestParam(tpOtherFld1Utc);

    TestParam tpOtherFld1Uf("uplink-Feedback", sumOtherFld1.id(), "Uplink Feedback", "__ (____=__)", "", 1, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpOtherFld1Uf);


    Summary sumAuxSv1("Aux.State Vector Element (AUX SV)", adsbOutUat.id(), 1, 4, 2);
    sumModel.addSummary(sumAuxSv1);

    TestParam tpAuxSv1SecAlt("secondary-Altitude", sumAuxSv1.id(), "Secondary Altitude", "____,_____", "ft", 0, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpAuxSv1SecAlt);


    //------------------------------P3-------------------------------

    Summary sumAirVeh9("Aircraft/Vehicle", adsbOutUat.id(), 2, 0, 2);
    sumModel.addSummary(sumAirVeh9);

    TestParam tpAirVeh9Add("address", sumAirVeh9.id(), "ADDRESS", "______ (_) / ________ (_)", "", 0, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh9Add);

    TestParam tpAirVeh9FId("qualifier", sumAirVeh9.id(), "Qualifier", "______", "", 1, 0, 1, 1, "l50.v30.u10");
    tpModel.addTestParam(tpAirVeh9FId);

    TestParam tpAirVeh9RfLvl("rfLvl", sumAirVeh9.id(), "RF Level",  "______", "", 1, 1, 1, 1, "l10.v30.u10");
    tpModel.addTestParam(tpAirVeh9RfLvl);

    TestParam tpAirVeh9Bds("payloads-Rcvd", sumAirVeh9.id(), "Payloads Rcvd", "_,_,_,_", "", 2, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh9Bds);

    Summary sumSV2("State Vector Element (SV)", adsbOutUat.id(), 2, 1, 1);
    sumModel.addSummary(sumSV2);

    Summary sumPosVel2("Position & Velocity", adsbOutUat.id(), 2, 2, 2);
    sumModel.addSummary(sumPosVel2);

    TestParam tpPosVel2agst("air/Gnd State", sumPosVel2.id(), "Air/Gnd State", "Ground", "", 0, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel2agst);

    TestParam tpPosVel2lat("latitude", sumPosVel2.id(), "Latitude", "__⁰ __ __.___", "N", 1, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel2lat);

    TestParam tpPosVel2long("longitude", sumPosVel2.id(), "Longitude", "____⁰ __ __.___", "W", 2, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel2long);

    TestParam tpPosVel2alt("altitude", sumPosVel2.id(), "Altitude", "_,____", "ft", 3, 0, 1, 1, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel2alt);

    TestParam tpPosVel2typ("type", sumPosVel2.id(), "Type", "_ (__________)", "", 3, 1, 1, 1, "l10.v50.u10");
    tpModel.addTestParam(tpPosVel2typ);

    TestParam tpPosVel2gsp("groundspeed", sumPosVel2.id(), "Groundspeed", "___", "kts", 4, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel2gsp);

    TestParam tpPosVel2trh("track/Heading", sumPosVel2.id(), "Track/Heading", "___.__", "deg", 5, 0, 1, 1, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel2trh);

    TestParam tpPosVel2th("t/h", sumPosVel2.id(), "T/H", "__(______)", "", 5, 1, 1, 1, "l10.v50.u10");
    tpModel.addTestParam(tpPosVel2th);

    TestParam tpPosVel2avlw("a/v-L/W", sumPosVel2.id(), "A/V L/W", "__ (__m/__._m)", "", 6, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel2avlw);

    TestParam tpPosVel2gao("gps-Ant-Offset", sumPosVel2.id(), "GPS Ant Offset", "_ m Right; _ m Aft", "", 7, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpPosVel2gao);

    Summary sumOtherFld2("Other Fields", adsbOutUat.id(), 2, 3, 2);
    sumModel.addSummary(sumOtherFld2);

    TestParam tpOtherFld2Nic("nic", sumOtherFld2.id(), "NIC", "__(< ___m)", "", 0, 0, 1, 1, "l50.v70.u10");
    tpModel.addTestParam(tpOtherFld2Nic);

    TestParam tpOtherFld2Utc("utc", sumOtherFld2.id(), "UTC", "__ (________)", "", 0, 1, 1, 1, "l10.v50.u10");
    tpModel.addTestParam(tpOtherFld2Utc);

    TestParam tpOtherFld2Uf("uplink-Feedback", sumOtherFld2.id(), "Uplink Feedback", "__ (_____=___)", "", 1, 0, 1, 2, "l50.v70.u10");
    tpModel.addTestParam(tpOtherFld2Uf);

    Summary sumAuxSv2("Aux.State Vector Element (AUX SV)", adsbOutUat.id(), 2, 4, 2);
    sumModel.addSummary(sumAuxSv2);

    TestParam tpAuxSv2secAlt("secondary-Altitude", sumAuxSv2.id(), "Secondary Altitude", "__,_____", "ft", 0, 0, 1, 1, "l50.v70.u10");
    tpModel.addTestParam(tpAuxSv2secAlt);

    TestParam tpAuxSv2typ("type", sumAuxSv2.id(), "Type", "__ (_____)", "", 0, 1, 1, 1, "l10.v50.u10");
    tpModel.addTestParam(tpAuxSv2typ);

    //------------------------------P4-------------------------------

    Summary sumAirVe10("Aircraft/Vehicle", adsbOutUat.id(), 3, 0, 2);
    sumModel.addSummary(sumAirVe10);

    TestParam tpAirVeh10Add("address", sumAirVe10.id(), "ADDRESS", "______ (_) / ________ (_)", "", 0, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh10Add);

    TestParam tpAirVeh10FId("qualifier", sumAirVe10.id(), "Qualifier", "______", "", 1, 0, 1, 1, "l50.v30.u10");
    tpModel.addTestParam(tpAirVeh10FId);

    TestParam tpAirVeh10RfLvl("rfLvl", sumAirVe10.id(), "RF Level",  "______", "", 1, 1, 1, 1, "l10.v30.u10");
    tpModel.addTestParam(tpAirVeh10RfLvl);

    TestParam tpAirVeh10Bds("payloads-Rcvd", sumAirVe10.id(), "Payloads Rcvd", "_,_,_,_", "", 2, 0, 1, 2, "l50.v60.u10");
    tpModel.addTestParam(tpAirVeh10Bds);

    Summary sumTS("Target state Element (TS)", adsbOutUat.id(), 3, 1, 1);
    sumModel.addSummary(sumTS);

    TestParam tpTSSAlt("sel.-Altitude", sumTS.id(), "Sel. Altitude", "____,_____", "ft", 0, 0, 1, 1, "l50.v50.u10");
    tpModel.addTestParam(tpTSSAlt);

    TestParam tpTSTyp("type", sumTS.id(), "Type", "_ (________)", "", 0, 1, 1, 1, "l10.v50.u10");
    tpModel.addTestParam(tpTSTyp);

    TestParam tpTSBStt("baro-Setting", sumTS.id(), "Baro Setting", "____", "mb", 1, 0, 1, 2, "l50.v50.u10");
    tpModel.addTestParam(tpTSBStt);

    TestParam tpTSSelH("sel.-Heading", sumTS.id(), "Sel. Heading", "____", "deg", 2, 0, 1, 1, "l50.v50.u10");
    tpModel.addTestParam(tpTSSelH);

    TestParam tpTSSts("status", sumTS.id(), "Status", "__(_____)", "", 2, 1, 1, 1, "l10.v50.u10");
    tpModel.addTestParam(tpTSSts);

    Summary sumApM2("AutoPilot Modes", adsbOutUat.id(), 3, 2, 2);
    sumModel.addSummary(sumApM2);

    TestParam tpApM2Mbs("mode-bits-status", sumApM2.id(), "Mode bits status", "__(_____)", "", 0, 0, 1, 2, "l50.v80.u10");
    tpModel.addTestParam(tpApM2Mbs);

    TestParam tpApM2Ap("autoPilot-(AP)", sumApM2.id(), "AutoPilot (AP)", "_ (_______)", "", 1, 0, 1, 2, "l50.v80.u10");
    tpModel.addTestParam(tpApM2Ap);

    TestParam tpApM2Vnav("vnav", sumApM2.id(), "VNAV", "__ (___________)", "", 2, 0, 1, 2, "l50.v80.u10");
    tpModel.addTestParam(tpApM2Vnav);

    TestParam tpApM2Alt("alt.-Hold-(ALT)", sumApM2.id(), "Alt. Hold (ALT)", "_ (_______)", "", 3, 0, 1, 2, "l50.v80.u10");
    tpModel.addTestParam(tpApM2Alt);

    TestParam tpApM2App("approach-(APP)", sumApM2.id(), "Approach (APP)", "__ (___________)", "", 4, 0, 1, 2, "l50.v80.u10");
    tpModel.addTestParam(tpApM2App);

    TestParam tpApM2lnav("lnav", sumApM2.id(), "LNAV", "__ (___________)", "", 5, 0, 1, 2, "l50.v80.u10");
    tpModel.addTestParam(tpApM2lnav);

    //------------------------------P5-------------------------------

    Summary sumAirVe11("Aircraft/Vehicle", adsbOutUat.id(), 4, 0, 2);
    sumModel.addSummary(sumAirVe11);

    TestParam tpAirVeh11Add("address", sumAirVe11.id(), "ADDRESS", "______ (_) / ________ (_)", "", 0, 0, 1, 2, "l30.v60.u10");
    tpModel.addTestParam(tpAirVeh11Add);

    TestParam tpAirVeh11FId("qualifier", sumAirVe11.id(), "Qualifier", "______", "", 1, 0, 1, 1, "l30.v30.u10");
    tpModel.addTestParam(tpAirVeh11FId);

    TestParam tpAirVeh11RfLvl("rfLvl", sumAirVe11.id(), "RF Level",  "______", "", 1, 1, 1, 1, "l10.v30.u10");
    tpModel.addTestParam(tpAirVeh11RfLvl);

    TestParam tpAirVeh11Bds("payloads-Rcvd", sumAirVe11.id(), "Payloads Rcvd", "_,_,_,_", "", 2, 0, 1, 2, "l30.v60.u10");
    tpModel.addTestParam(tpAirVeh11Bds);

    Summary sumTce("Trajectory Change Element", adsbOutUat.id(), 4, 1, 1);
    sumModel.addSummary(sumTce);

    TestParam tpTceTcFld("tc-Field", sumTce.id(), "TC Field", "_________________", "", 0, 0, 1, 2, "l30.v60.u10");
    tpModel.addTestParam(tpTceTcFld);

    //------------------------------P6-------------------------------

    Summary sumAirVe12("Aircraft/Vehicle", adsbOutUat.id(), 5, 0, 2);
    sumModel.addSummary(sumAirVe12);

    TestParam tpAirVeh12Add("address", sumAirVe12.id(), "ADDRESS", "______ (_) / ________ (_)", "", 0, 0, 1, 2, "l30.v60.u10");
    tpModel.addTestParam(tpAirVeh12Add);

    TestParam tpAirVeh12FId("qualifier", sumAirVe12.id(), "Qualifier", "______", "", 1, 0, 1, 1, "l30.v30.u10");
    tpModel.addTestParam(tpAirVeh12FId);

    TestParam tpAirVeh12RfLvl("rfLvl", sumAirVe12.id(), "RF Level",  "______", "", 1, 1, 1, 1, "l10.v30.u10");
    tpModel.addTestParam(tpAirVeh12RfLvl);

    TestParam tpAirVeh12Bds("payloads-Rcvd", sumAirVe12.id(), "Payloads Rcvd", "_,_,_,_", "", 2, 0, 1, 2, "l30.v60.u10");
    tpModel.addTestParam(tpAirVeh12Bds);

    Summary sumRflM("978 MHz RF Link Measurements", adsbOutUat.id(), 5, 1, 1);
    sumModel.addSummary(sumRflM);

    TestParam tpRflMFq("frequency", sumRflM.id(), "Frequency", "___.___", "MHz", 0, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpRflMFq);

    TestParam tpRflMPwr("power", sumRflM.id(), "Power", "__._", "dBm (Medium)", 1, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpRflMPwr);

    TestParam tpRflMErrC("error-conditions", sumRflM.id(), "Error conditions", "_____________", "", 2, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpRflMErrC);

    TestParam tpRflMPwrD("power-Drop", sumRflM.id(), "Power Drop", "_._", "dB", 3, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpRflMPwrD);

    TestParam tpRflMD("deviation", sumRflM.id(), "Deviation", "__", "%", 4, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpRflMD);

    TestParam tpRflMPD("peak-Deviation", sumRflM.id(), "Peak Deviation", "___", "%", 5, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpRflMPD);

    TestParam tpRflMVEO("vert-Eye-Opening", sumRflM.id(), "Vert Eye Opening", "__", "%", 6, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpRflMVEO);

    TestParam tpRflMHEO("horz-Eye-Opening", sumRflM.id(), "Horz Eye Opening", "___", "%", 7, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpRflMHEO);

    TestParam tpRflMMTErr("message-Time-Error", sumRflM.id(), "Message Time Error", "__.__", "uS", 8, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpRflMMTErr);

    Summary sumUatMsgSum("UAT Message Summary", adsbOutUat.id(), 5, 2, 2);
    sumModel.addSummary(sumUatMsgSum);

    TestParam tpUatMsgSumMsgRcvd("message-Received", sumUatMsgSum.id(), "Message Received", "___", "", 0, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpUatMsgSumMsgRcvd);

    TestParam tpUatMsgSumMIMsg("missing/Incorrect-Messages", sumUatMsgSum.id(), "Missing/Incorrect Messages", "_", "", 1, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpUatMsgSumMIMsg);

    TestParam tpUatMsgSumMsgSR("message-Success-Rate", sumUatMsgSum.id(), "Message Success Rate", "__", "%", 2, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpUatMsgSumMsgSR);

    TestParam tpUatMsgSumCMsgBE("current-Message-Bit-Errors", sumUatMsgSum.id(), "Current Message Bit Errors", "__", "", 3, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpUatMsgSumCMsgBE);

    TestParam tpUatMsgSumMSgSeq("message-Sequence", sumUatMsgSum.id(), "Message Sequence", "__", "", 4, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpUatMsgSumMSgSeq);

    TestParam tpUatMsgSumMsgPld("message-Payloads", sumUatMsgSum.id(), "Message Payloads", "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _", "", 5, 0, 1, 2, "l70.v90.u10");
    tpModel.addTestParam(tpUatMsgSumMsgPld);

    Test uatIn("UAT ADS-B IN", secADSB.id());
    testModel.addTest(uatIn);

    Test antennaAviation("Aviation", secAntenna.id());
    testModel.addTest(antennaAviation);

    Test xpndrAutoTest("Transponder Auto Test", secTransponder.id());
    testModel.addTest(xpndrAutoTest);

    //------------------------------P1-------------------------------

//    Summary sumXTypeLevel("xpndr type & level:", xpndrAutoTest.id(), 0, 0, 2);
//    sumModel.addSummary(sumXTypeLevel);



    auto navigationDaoPtr = DataManager::instance().navigationDao();

    Navigation secToHome(vwGlobal.id(), "_section", secHome.id(), vwHome.id());
    navigationDaoPtr->addNavigation(secToHome);

    Navigation secToTransponder(vwGlobal.id(), "_section", secTransponder.id(), vwTransponder.id());
    navigationDaoPtr->addNavigation(secToTransponder);

    Navigation secToTestGroup(vwGlobal.id(), "_section", secADSB.id(), vwADSB.id());
    navigationDaoPtr->addNavigation(secToTestGroup);

    Navigation secToAntenna(vwGlobal.id(), "_section", secAntenna.id(), vwAntenna.id());
    navigationDaoPtr->addNavigation(secToAntenna);

    Navigation secToSetup(vwGlobal.id(), "_section", secSetup.id(), vwSetup.id());
    navigationDaoPtr->addNavigation(secToSetup);


//        //For Home Tests---------------------------------

//        Test homeAdsbOut1090("1090 ADS-B OUT", secHome.id());
//        testModel.addTest(homeAdsbOut1090);

//        Navigation homeToadsbOut1090(vwHome.id(), "_test", homeAdsbOut1090.id(), vwTestDetailLanding.id());
//        navigationDaoPtr->addNavigation(homeToadsbOut1090);

//        Test homeadsbOutUat("UAT ADS-B OUT", secHome.id());
//        testModel.addTest(homeadsbOutUat);

//        Navigation homeToadsbOutUat(vwHome.id(), "_test", homeadsbOutUat.id(), vwTestDetailLanding.id());
//        navigationDaoPtr->addNavigation(homeToadsbOutUat);
//        //-----------------------------------------------

    Navigation adsbIn1090ToDetail(vwADSB.id(), "_test", in1090.id(), vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(adsbIn1090ToDetail);

    Navigation adsbInUatToDetail(vwADSB.id(), "_test", uatIn.id(), vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(adsbInUatToDetail);


    Navigation adsbOut1090ToDetail(vwADSB.id(), "_test", adsbOut1090.id(), vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(adsbOut1090ToDetail);

    Navigation adsbOut1090LandingToAircraft(vwTestDetailLanding.id(), "_detailSummary",adsbOut1090.id(), vwADSBout1090P1.id());
    navigationDaoPtr->addNavigation(adsbOut1090LandingToAircraft);

    Navigation adsbOut1090LandingToGroup(vwTestDetailLanding.id(), "back", 0, vwADSB.id());
    navigationDaoPtr->addNavigation(adsbOut1090LandingToGroup);

//    Navigation scan1090ToRadar(vwADSBout1090Scan.id(), "Radar", 0, vwADSBout1090Radar.id());
//    navigationDaoPtr->addNavigation(scan1090ToRadar);

//    Navigation scanUatToRadar(vwADSBoutUATScan.id(), "Radar", 0, vwADSBoutUatRadar.id());
//    navigationDaoPtr->addNavigation(scanUatToRadar);

//    Navigation radar1090ToGraph (vwADSBout1090Radar.id(), "Graph", 0, vwADSBout1090Graph.id());
//    navigationDaoPtr->addNavigation(radar1090ToGraph);

//    Navigation radarUatToGraph (vwADSBoutUatRadar.id(), "Graph", 0, vwADSBoutUatGraph.id());
//    navigationDaoPtr->addNavigation(radarUatToGraph);

//    Navigation graph1090ToScan (vwADSBout1090Graph.id(), "Scan", 0, vwADSBout1090Scan.id());
//    navigationDaoPtr->addNavigation(graph1090ToScan);

//    Navigation graphUatToScan (vwADSBoutUatGraph.id(), "Scan", 0, vwADSBoutUATScan.id());
//    navigationDaoPtr->addNavigation(graphUatToScan);

    Navigation adsbOutUatToDetail(vwADSB.id(), "_test", adsbOutUat.id(), vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(adsbOutUatToDetail);


//    Navigation scanTo1090P1(vwADSBout1090Scan.id(), "Next", 0, vwADSBout1090P1.id());
//    navigationDaoPtr->addNavigation(scanTo1090P1);

    Navigation radarTo1090P1(vwADSBout1090Radar.id(), "Next", 0, vwADSBout1090P1.id());
    navigationDaoPtr->addNavigation(radarTo1090P1);

    Navigation graphTo1090P1(vwADSBout1090Graph.id(), "Next", 0, vwADSBout1090P1.id());
    navigationDaoPtr->addNavigation(graphTo1090P1);

    Navigation out1090P1To1090P2(vwADSBout1090P1.id(), "Next", 0, vwADSBout1090P2.id());
    navigationDaoPtr->addNavigation(out1090P1To1090P2);

    Navigation out1090P2To1090P3(vwADSBout1090P2.id(), "Next", 0, vwADSBout1090P3.id());
    navigationDaoPtr->addNavigation(out1090P2To1090P3);

    Navigation out1090P3To1090P4(vwADSBout1090P3.id(), "Next", 0, vwADSBout1090P4.id());
    navigationDaoPtr->addNavigation(out1090P3To1090P4);

    Navigation out1090P4To1090P5(vwADSBout1090P4.id(), "Next", 0, vwADSBout1090P5.id());
    navigationDaoPtr->addNavigation(out1090P4To1090P5);

    Navigation out1090P5To1090P6(vwADSBout1090P5.id(), "Next", 0, vwADSBout1090P6.id());
    navigationDaoPtr->addNavigation(out1090P5To1090P6);

    Navigation out1090P6To1090P7(vwADSBout1090P6.id(), "Next", 0, vwADSBout1090P7.id());
    navigationDaoPtr->addNavigation(out1090P6To1090P7);

    Navigation out1090P7To1090P1(vwADSBout1090P7.id(), "Next", 0, vwADSBout1090P1.id());
    navigationDaoPtr->addNavigation(out1090P7To1090P1);

//    Navigation scanTo1090P7(vwADSBout1090Scan.id(), "Previous", 0, vwADSBout1090P7.id());
//    navigationDaoPtr->addNavigation(scanTo1090P7);

    Navigation radarTo1090P7(vwADSBout1090Radar.id(), "Previous", 0, vwADSBout1090P7.id());
    navigationDaoPtr->addNavigation(radarTo1090P7);

    Navigation graphTo1090P7(vwADSBout1090Graph.id(), "Previous", 0, vwADSBout1090P7.id());
    navigationDaoPtr->addNavigation(graphTo1090P7);

    Navigation out1090P7To1090P6(vwADSBout1090P7.id(), "Previous", 0, vwADSBout1090P6.id());
    navigationDaoPtr->addNavigation(out1090P7To1090P6);

    Navigation out1090P6To1090P5(vwADSBout1090P6.id(), "Previous", 0, vwADSBout1090P5.id());
    navigationDaoPtr->addNavigation(out1090P6To1090P5);

    Navigation out1090P5To1090P4(vwADSBout1090P5.id(), "Previous", 0, vwADSBout1090P4.id());
    navigationDaoPtr->addNavigation(out1090P5To1090P4);

    Navigation out1090P4To1090P3(vwADSBout1090P4.id(), "Previous", 0, vwADSBout1090P3.id());
    navigationDaoPtr->addNavigation(out1090P4To1090P3);

    Navigation out1090P3To1090P2(vwADSBout1090P3.id(), "Previous", 0, vwADSBout1090P2.id());
    navigationDaoPtr->addNavigation(out1090P3To1090P2);

    Navigation out1090P2To1090P1(vwADSBout1090P2.id(), "Previous", 0, vwADSBout1090P1.id());
    navigationDaoPtr->addNavigation(out1090P2To1090P1);

    Navigation out1090P1To1090P7(vwADSBout1090P1.id(), "Previous", 0, vwADSBout1090P7.id());
    navigationDaoPtr->addNavigation(out1090P1To1090P7);

    Navigation adsbOutUatLandingToAircraft(vwTestDetailLanding.id(), "_detailSummary",adsbOutUat.id(), vwADSBoutUATP1.id());
    navigationDaoPtr->addNavigation(adsbOutUatLandingToAircraft);

    Navigation adsbOutUatLandingToGroup(vwTestDetailLanding.id(), "back", 0, vwADSB.id());
    navigationDaoPtr->addNavigation(adsbOutUatLandingToGroup);

//    Navigation outUATscanToUATP1(vwADSBoutUATScan.id(), "Next", 0, vwADSBoutUATP1.id());
//    navigationDaoPtr->addNavigation(outUATscanToUATP1);

    Navigation radarToUATP1(vwADSBoutUatRadar.id(), "Next", 0, vwADSBoutUATP1.id());
    navigationDaoPtr->addNavigation(radarToUATP1);

    Navigation graphToUATP1(vwADSBoutUatGraph.id(), "Next", 0, vwADSBoutUATP1.id());
    navigationDaoPtr->addNavigation(graphToUATP1);

    Navigation outUATP1ToUATP2(vwADSBoutUATP1.id(), "Next", 0, vwADSBoutUATP2.id());
    navigationDaoPtr->addNavigation(outUATP1ToUATP2);

    Navigation outUATP2ToUATP3(vwADSBoutUATP2.id(), "Next", 0, vwADSBoutUATP3.id());
    navigationDaoPtr->addNavigation(outUATP2ToUATP3);

    Navigation outUATP3ToUATP4(vwADSBoutUATP3.id(), "Next", 0, vwADSBoutUATP4.id());
    navigationDaoPtr->addNavigation(outUATP3ToUATP4);

    Navigation outUATP4ToUATP5(vwADSBoutUATP4.id(), "Next", 0, vwADSBoutUATP5.id());
    navigationDaoPtr->addNavigation(outUATP4ToUATP5);

    Navigation outUATP5ToUATP6(vwADSBoutUATP5.id(), "Next", 0, vwADSBoutUATP6.id());
    navigationDaoPtr->addNavigation(outUATP5ToUATP6);

    Navigation outUATP6ToUATP1(vwADSBoutUATP6.id(), "Next", 0, vwADSBoutUATP1.id());
    navigationDaoPtr->addNavigation(outUATP6ToUATP1);

//    Navigation outUATScanToUATP6(vwADSBoutUATScan.id(), "Previous", 0, vwADSBoutUATP6.id());
//    navigationDaoPtr->addNavigation(outUATScanToUATP6);

    Navigation radarToUATP6(vwADSBoutUatRadar.id(), "Previous", 0, vwADSBoutUATP6.id());
    navigationDaoPtr->addNavigation(radarToUATP6);

    Navigation graphToUATP6(vwADSBoutUatGraph.id(), "Previous", 0, vwADSBoutUATP6.id());
    navigationDaoPtr->addNavigation(graphToUATP6);

    Navigation outUATP6ToUATP5(vwADSBoutUATP6.id(), "Previous", 0, vwADSBoutUATP5.id());
    navigationDaoPtr->addNavigation(outUATP6ToUATP5);

    Navigation outUATP5ToUATP4(vwADSBoutUATP5.id(), "Previous", 0, vwADSBoutUATP4.id());
    navigationDaoPtr->addNavigation(outUATP5ToUATP4);

    Navigation outUATP4ToUATP3(vwADSBoutUATP4.id(), "Previous", 0, vwADSBoutUATP3.id());
    navigationDaoPtr->addNavigation(outUATP4ToUATP3);

    Navigation outUATP3ToUATP2(vwADSBoutUATP3.id(), "Previous", 0, vwADSBoutUATP2.id());
    navigationDaoPtr->addNavigation(outUATP3ToUATP2);

    Navigation outUATP2ToUATP1(vwADSBoutUATP2.id(), "Previous", 0, vwADSBoutUATP1.id());
    navigationDaoPtr->addNavigation(outUATP2ToUATP1);

    Navigation outUATP1ToUATP6(vwADSBoutUATP1.id(), "Previous", 0, vwADSBoutUATP6.id());
    navigationDaoPtr->addNavigation(outUATP1ToUATP6);

    Navigation out1090RadarTomainADSB(vwADSBout1090Radar.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(out1090RadarTomainADSB);

    Navigation out1090GraphTomainADSB(vwADSBout1090Graph.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(out1090GraphTomainADSB);

//    Navigation out1090scanTomainADSB(vwADSBout1090Scan.id(), "back", 0, vwTestDetailLanding.id());
//    navigationDaoPtr->addNavigation(out1090scanTomainADSB);

    Navigation out1090P1TomainADSB(vwADSBout1090P1.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(out1090P1TomainADSB);

    Navigation out1090P2TomainADSB(vwADSBout1090P2.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(out1090P2TomainADSB);

    Navigation out1090P3TomainADSB(vwADSBout1090P3.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(out1090P3TomainADSB);

    Navigation out1090P4TomainADSB(vwADSBout1090P4.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(out1090P4TomainADSB);

    Navigation out1090P5TomainADSB(vwADSBout1090P5.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(out1090P5TomainADSB);

    Navigation out1090P6TomainADSB(vwADSBout1090P6.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(out1090P6TomainADSB);

    Navigation out1090P7TomainADSB(vwADSBout1090P7.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(out1090P7TomainADSB);

    Navigation outUATRadarTomainADSB(vwADSBoutUatRadar.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(outUATRadarTomainADSB);

    Navigation outUATGraphTomainADSB(vwADSBoutUatGraph.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(outUATGraphTomainADSB);

//    Navigation outUATscanTomainADSB(vwADSBoutUATScan.id(), "back", 0, vwTestDetailLanding.id());
//    navigationDaoPtr->addNavigation(outUATscanTomainADSB);

    Navigation outUATP1TomainADSB(vwADSBoutUATP1.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(outUATP1TomainADSB);

    Navigation outUATP2TomainADSB(vwADSBoutUATP2.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(outUATP2TomainADSB);

    Navigation outUATP3TomainADSB(vwADSBoutUATP3.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(outUATP3TomainADSB);

    Navigation outUATP4TomainADSB(vwADSBoutUATP4.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(outUATP4TomainADSB);

    Navigation outUATP5TomainADSB(vwADSBoutUATP5.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(outUATP5TomainADSB);

    Navigation outUATP6TomainADSB(vwADSBoutUATP6.id(), "back", 0, vwTestDetailLanding.id());
    navigationDaoPtr->addNavigation(outUATP6TomainADSB);

    Navigation sUserToSetup (vwSetupUser.id(), "back", 0, vwSetup.id());
    navigationDaoPtr->addNavigation(sUserToSetup);

    Navigation sUserDetailToUser (vwSetupUserDetail.id(), "back", 0, vwSetupUser.id());
    navigationDaoPtr->addNavigation(sUserDetailToUser);

    Navigation sAddUserToUser (vwSetupAddUser.id(), "back", 0, vwSetupUser.id());
    navigationDaoPtr->addNavigation(sAddUserToUser);

    Navigation sDisplayToSetup (vwSetupDisplay.id(), "back", 0, vwSetup.id());
    navigationDaoPtr->addNavigation(sDisplayToSetup);

    Navigation sGPSToSetup (vwSetupGPS.id(), "back", 0, vwSetup.id());
    navigationDaoPtr->addNavigation(sGPSToSetup);

    Navigation sNetworkToSetup (vwSetupNetwork.id(), "back", 0, vwSetup.id());
    navigationDaoPtr->addNavigation(sNetworkToSetup);

    Navigation sSysInfoToSetup (vwSetupSysInfo.id(), "back", 0, vwSetup.id());
    navigationDaoPtr->addNavigation(sSysInfoToSetup);

    Navigation sRMBitToSetup (vwSetupRMBit.id(), "back", 0, vwSetup.id());
    navigationDaoPtr->addNavigation(sRMBitToSetup);

    Navigation sConnToSetup (vwSetupConn.id(), "back", 0, vwSetup.id());
    navigationDaoPtr->addNavigation(sConnToSetup);

    Navigation setupToUser(vwSetup.id(), "User", 0, vwSetupUser.id());
    navigationDaoPtr->addNavigation(setupToUser);

    Navigation userToUserDetail(vwSetupUser.id(), "UserDetail", 0, vwSetupUserDetail.id());
    navigationDaoPtr->addNavigation(userToUserDetail);

    Navigation userToAddUser(vwSetupUser.id(), "AddUser", 0, vwSetupAddUser.id());
    navigationDaoPtr->addNavigation(userToAddUser);

    Navigation setupToDisplay(vwSetup.id(), "Display", 0, vwSetupDisplay.id());
    navigationDaoPtr->addNavigation(setupToDisplay);

    Navigation setupToGps(vwSetup.id(), "GPS", 0, vwSetupGPS.id());
    navigationDaoPtr->addNavigation(setupToGps);

    Navigation setupToNetwork(vwSetup.id(), "Network", 0, vwSetupNetwork.id());
    navigationDaoPtr->addNavigation(setupToNetwork);

    Navigation setupToSysInfo(vwSetup.id(), "System-Info", 0, vwSetupSysInfo.id());
    navigationDaoPtr->addNavigation(setupToSysInfo);

    Navigation setupToRMBit(vwSetup.id(), "Run-Manual-Bit", 0, vwSetupRMBit.id());
    navigationDaoPtr->addNavigation(setupToRMBit);

    Navigation setupToConn(vwSetup.id(), "Connection", 0, vwSetupConn.id());
    navigationDaoPtr->addNavigation(setupToConn);

    Navigation antennaToAviationLanding(vwAntenna.id(), "_test",antennaAviation.id(), vwAviationLanding.id());
    navigationDaoPtr->addNavigation(antennaToAviationLanding);

    Navigation aviationLandingToVSWR(vwAviationLanding.id(), "Aviation-Vswr",0, vwAntAviationVswr.id());
    navigationDaoPtr->addNavigation(aviationLandingToVSWR);

    Navigation aviationLandingToCL(vwAviationLanding.id(), "Aviation-Cl",0, vwAntAviationCl.id());
    navigationDaoPtr->addNavigation(aviationLandingToCL);

    Navigation aviationLandingToDTF(vwAviationLanding.id(), "Aviation-Dtf",0, vwAntAviationDtf.id());
    navigationDaoPtr->addNavigation(aviationLandingToDTF);

    Navigation AviationVswrToCl(vwAntAviationVswr.id(), "Aviation-Cl",0, vwAntAviationCl.id());
    navigationDaoPtr->addNavigation(AviationVswrToCl);

    Navigation AviationVswrToDtf(vwAntAviationVswr.id(), "Aviation-Dtf",0, vwAntAviationDtf.id());
    navigationDaoPtr->addNavigation(AviationVswrToDtf);

    Navigation AviationClToVswr(vwAntAviationCl.id(), "Aviation-Vswr",0, vwAntAviationVswr.id());
    navigationDaoPtr->addNavigation(AviationClToVswr);

    Navigation AviationClToDtf(vwAntAviationCl.id(), "Aviation-Dtf",0, vwAntAviationDtf.id());
    navigationDaoPtr->addNavigation(AviationClToDtf);

    Navigation AviationDtfToVswr(vwAntAviationDtf.id(), "Aviation-Vswr",0, vwAntAviationVswr.id());
    navigationDaoPtr->addNavigation(AviationDtfToVswr);

    Navigation AviationDtfToCl(vwAntAviationDtf.id(), "Aviation-Cl",0, vwAntAviationCl.id());
    navigationDaoPtr->addNavigation(AviationDtfToCl);

    Navigation aviationLandingToAntenna(vwAviationLanding.id(), "back", 0, vwAntenna.id());
    navigationDaoPtr->addNavigation(aviationLandingToAntenna);

    Navigation vswrToAviationLanding(vwAntAviationVswr.id(), "back", 0, vwAviationLanding.id());
    navigationDaoPtr->addNavigation(vswrToAviationLanding);

    Navigation clToAviationLanding(vwAntAviationCl.id(), "back", 0, vwAviationLanding.id());
    navigationDaoPtr->addNavigation(clToAviationLanding);

    Navigation dtfToAviationLanding(vwAntAviationDtf.id(), "back", 0, vwAviationLanding.id());
    navigationDaoPtr->addNavigation(dtfToAviationLanding);

    Navigation globalToAppLogs(vwGlobal.id(), "App-Logs",0, vwAppLogs.id());
    navigationDaoPtr->addNavigation(globalToAppLogs);

    Navigation appLogsToHome(vwAppLogs.id(), "back", 0, vwHome.id());
    navigationDaoPtr->addNavigation(appLogsToHome);

    Navigation xpndrLandingToTransponder(vwTransponderLanding.id(), "back", 0, vwTransponder.id());
    navigationDaoPtr->addNavigation(xpndrLandingToTransponder);

    Navigation xpndrToLanding(vwTransponder.id(), "_test", xpndrAutoTest.id(), vwTransponderLanding.id());
    navigationDaoPtr->addNavigation(xpndrToLanding);

    Navigation xpndrLandingToxpndrAutoTstP1(vwTransponderLanding.id(), "_detailSummary",xpndrAutoTest.id(), vwXpndrAutoTestP1.id());
    navigationDaoPtr->addNavigation(xpndrLandingToxpndrAutoTstP1);

    Navigation xpndrAutoTstP1ToP2(vwXpndrAutoTestP1.id(), "Next", 0, vwXpndrAutoTestP2.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP1ToP2);

    Navigation xpndrAutoTstP2ToP3(vwXpndrAutoTestP2.id(), "Next", 0, vwXpndrAutoTestP3.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP2ToP3);

    Navigation xpndrAutoTstP3ToP4(vwXpndrAutoTestP3.id(), "Next", 0, vwXpndrAutoTestP4.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP3ToP4);

    Navigation xpndrAutoTstP4ToP5(vwXpndrAutoTestP4.id(), "Next", 0, vwXpndrAutoTestP5.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP4ToP5);

    Navigation xpndrAutoTstP5ToP6(vwXpndrAutoTestP5.id(), "Next", 0, vwXpndrAutoTestP6.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP5ToP6);

    Navigation xpndrAutoTstP6ToP7(vwXpndrAutoTestP6.id(), "Next", 0, vwXpndrAutoTestP7.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP6ToP7);

    Navigation xpndrAutoTstP7ToP8(vwXpndrAutoTestP7.id(), "Next", 0, vwXpndrAutoTestP8.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP7ToP8);

    Navigation xpndrAutoTstP8ToP1(vwXpndrAutoTestP8.id(), "Next", 0, vwXpndrAutoTestP1.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP8ToP1);

    Navigation xpndrAutoTstP1ToP8(vwXpndrAutoTestP1.id(), "Previous", 0, vwXpndrAutoTestP8.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP1ToP8);

    Navigation xpndrAutoTstP2ToP1(vwXpndrAutoTestP2.id(), "Previous", 0, vwXpndrAutoTestP1.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP2ToP1);

    Navigation xpndrAutoTstP3ToP2(vwXpndrAutoTestP3.id(), "Previous", 0, vwXpndrAutoTestP2.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP3ToP2);

    Navigation xpndrAutoTstP4ToP3(vwXpndrAutoTestP4.id(), "Previous", 0, vwXpndrAutoTestP3.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP4ToP3);

    Navigation xpndrAutoTstP5ToP4(vwXpndrAutoTestP5.id(), "Previous", 0, vwXpndrAutoTestP4.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP5ToP4);

    Navigation xpndrAutoTstP6ToP5(vwXpndrAutoTestP6.id(), "Previous", 0, vwXpndrAutoTestP5.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP6ToP5);

    Navigation xpndrAutoTstP7ToP6(vwXpndrAutoTestP7.id(), "Previous", 0, vwXpndrAutoTestP6.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP7ToP6);

    Navigation xpndrAutoTstP8ToP7(vwXpndrAutoTestP8.id(), "Previous", 0, vwXpndrAutoTestP7.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP8ToP7);

    Navigation xpndrAutoTstP1ToLanding(vwXpndrAutoTestP1.id(), "back", 0, vwTransponderLanding.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP1ToLanding);

    Navigation xpndrAutoTstP2ToLanding(vwXpndrAutoTestP2.id(), "back", 0, vwTransponderLanding.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP2ToLanding);

    Navigation xpndrAutoTstP3ToLanding(vwXpndrAutoTestP3.id(), "back", 0, vwTransponderLanding.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP3ToLanding);

    Navigation xpndrAutoTstP4ToLanding(vwXpndrAutoTestP4.id(), "back", 0, vwTransponderLanding.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP4ToLanding);

    Navigation xpndrAutoTstP5ToLanding(vwXpndrAutoTestP5.id(), "back", 0, vwTransponderLanding.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP5ToLanding);

    Navigation xpndrAutoTstP6ToLanding(vwXpndrAutoTestP6.id(), "back", 0, vwTransponderLanding.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP6ToLanding);

    Navigation xpndrAutoTstP7ToLanding(vwXpndrAutoTestP7.id(), "back", 0, vwTransponderLanding.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP7ToLanding);

    Navigation xpndrAutoTstP8ToLanding(vwXpndrAutoTestP8.id(), "back", 0, vwTransponderLanding.id());
    navigationDaoPtr->addNavigation(xpndrAutoTstP8ToLanding);


    return 1;
}
