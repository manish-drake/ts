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

    View vwStart("Start");
    viewDao->addView(vwStart);

    View vwADSB("ADSB");
    viewDao->addView(vwADSB);

    View vwSetup(" Setup");
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

    SectionModel secModel{};

    Section secStart("Start");
    secModel.addSection(secStart);

    Section secTransponder("Transponder");
    secModel.addSection(secTransponder);

    Section secModeS("Mode S");
    secModel.addSection(secModeS);

    Section secADSB("ADS-B");
    secModel.addSection(secADSB);

    Section secNav("NAV");
    secModel.addSection(secNav);

    Section secComm("Comm");
    secModel.addSection(secComm);

    Section secAntenna("Antenna");
    secModel.addSection(secAntenna);

    Section secReports("Reports");
    secModel.addSection(secReports);

    Section secSetup("Setup");
    secModel.addSection(secSetup);

    Section secSearch("Search");
    secModel.addSection(secSearch);

    TestModel testModel { };
    SummaryModel sumModel { };
    TestParamModel tpModel { };

    Test adsbOut1090("1090 ADS-B OUT", secADSB.id());
    testModel.addTest(adsbOut1090);

    //------------------------------P1-------------------------------

    Summary sumAirVeh("Aircraft/Vehicle:", adsbOut1090.id(), 0, 0, 2);
    sumModel.addSummary(sumAirVeh);

    TestParam tpAirVehAdd("address", sumAirVeh.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(tpAirVehAdd);

    TestParam tpAirVehFId("flight-Id", sumAirVeh.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(tpAirVehFId);

    TestParam tpAirVehRfLvl("rfLvl", sumAirVeh.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(tpAirVehRfLvl);

    TestParam tpAirVehBds("bds-Rcvd", sumAirVeh.id(), "BDS Rcvd (DF17)", "0,5,0,8,0,9,6,0,6,1,6,5", "", 2, 0, 0);
    tpModel.addTestParam(tpAirVehBds);

    Summary sumFarElems("FAR 91.227 REQUIRED ELEMENTS", adsbOut1090.id(), 0, 1, 1);
    sumModel.addSummary(sumFarElems);

    Summary sumAvInfo1("Aircraft/Vehicle info:", adsbOut1090.id(), 0, 2, 2);
    sumModel.addSummary(sumAvInfo1);

    TestParam tpAvInfoFId("flight-Id", sumAvInfo1.id(), "Flight ID", "N1246W", "", 0, 0, 0);
    tpModel.addTestParam(tpAvInfoFId);

    TestParam tpAvInfoMsAdd("mode-S-Addr", sumAvInfo1.id(), "Mode S Addr", "", "", 0, 1, 0);
    tpModel.addTestParam(tpAvInfoMsAdd);

    TestParam tpAvInfoEc("emitter-Cat", sumAvInfo1.id(), "Emitter Cat", "", "", 1, 0, 0);
    tpModel.addTestParam(tpAvInfoEc);

    TestParam tpAvInfoAcode("3/A-Code", sumAvInfo1.id(), "3/A Code", "", "", 1, 1, 0);
    tpModel.addTestParam(tpAvInfoAcode);

    TestParam tpAvInfoEp("emg/Prty", sumAvInfo1.id(), "Emg/Prty", "", "", 2, 0, 0);
    tpModel.addTestParam(tpAvInfoEp);

    TestParam tpAvInfoLw("l/w", sumAvInfo1.id(), "L/W", "", "", 2, 1, 0);
    tpModel.addTestParam(tpAvInfoLw);

    TestParam tpAvInfoLat("latitude", sumAvInfo1.id(), "Latitude", "", "N", 3, 0, 0);
    tpModel.addTestParam(tpAvInfoLat);

    TestParam tpAvInfoAltbaro("altitude(baro)", sumAvInfo1.id(), "Altitude(baro)", "", "ft", 3, 1, 0);
    tpModel.addTestParam(tpAvInfoAltbaro);

    TestParam tpAvInfoLong("longitude", sumAvInfo1.id(), "Longitude", "", "W", 4, 0, 0);
    tpModel.addTestParam(tpAvInfoLong);

    TestParam tpAvInfoAltgeom("altitude(geom)", sumAvInfo1.id(), "Altitude(geom)", "", "ft", 4, 1, 0);
    tpModel.addTestParam(tpAvInfoAltgeom);

    TestParam tpAvInfoVct("velocity", sumAvInfo1.id(), "Velocity", "", "kts", 5, 0, 0);
    tpModel.addTestParam(tpAvInfoVct);

    Summary sumYnDisc("YES/NO Discretes:", adsbOut1090.id(), 0, 3, 2);
    sumModel.addSummary(sumYnDisc);

    TestParam tpYnDiscUin("uat-In", sumYnDisc.id(), "UAT IN", "", "", 0, 0, 0);
    tpModel.addTestParam(tpYnDiscUin);

    TestParam tpYnDiscTop("tcas-Op", sumYnDisc.id(), "TCAS Op", "", "", 0, 1, 0);
    tpModel.addTestParam(tpYnDiscTop);

    TestParam tpYnDiscEsin("1090-ES-In", sumYnDisc.id(), "1090ES IN", "", "", 1, 0, 0);
    tpModel.addTestParam(tpYnDiscEsin);

    TestParam tpYnDiscIdt("ident", sumYnDisc.id(), "IDENT", "", "", 1, 1, 0);
    tpModel.addTestParam(tpYnDiscIdt);

    TestParam tpYnDiscTra("tcas-Ra", sumYnDisc.id(), "TCAS RA", "", "", 2, 0, 0);
    tpModel.addTestParam(tpYnDiscTra);

    Summary sumIntgFld("Integrity Fields:", adsbOut1090.id(), 0, 4, 2);
    sumModel.addSummary(sumIntgFld);

    TestParam tpIntgFldNacp("nacp", sumIntgFld.id(), "NACp", "", "", 0, 0, 0);
    tpModel.addTestParam(tpIntgFldNacp);

    TestParam tpIntgFldNacv("nacv", sumIntgFld.id(), "NACv", "", "", 0, 1, 0);
    tpModel.addTestParam(tpIntgFldNacv);

    TestParam tpIntgFldSil("sil", sumIntgFld.id(), "SIL", "", "", 1, 0, 0);
    tpModel.addTestParam(tpIntgFldSil);

    TestParam tpIntgFldSda("sda", sumIntgFld.id(), "SDA", "", "", 1, 1, 0);
    tpModel.addTestParam(tpIntgFldSda);

    TestParam tpIntgFldGva("gva", sumIntgFld.id(), "GVA", "", "", 2, 0, 0);
    tpModel.addTestParam(tpIntgFldGva);

    TestParam tpIntgFldNic("nic", sumIntgFld.id(), "NIC", "", "", 2, 1, 0);
    tpModel.addTestParam(tpIntgFldNic);

     //------------------------------P2-------------------------------

    Summary sumAirVeh1("Aircraft/Vehicle:", adsbOut1090.id(), 1, 0, 2);
    sumModel.addSummary(sumAirVeh1);

    TestParam tpAirVeh1Add("address", sumAirVeh1.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(tpAirVeh1Add);

    TestParam tpAirVeh1FId("flight-Id", sumAirVeh1.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(tpAirVeh1FId);

    TestParam tpAirVeh1RfLvl("rfLvl", sumAirVeh1.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(tpAirVeh1RfLvl);

    TestParam tpAirVeh1Bds("bds-Rcvd", sumAirVeh1.id(), "BDS Rcvd (DF17)", "0,5,0,8,0,9,6,0,6,1,6,5", "", 2, 0, 0);
    tpModel.addTestParam(tpAirVeh1Bds);



    Summary sumAirPos("BDS 0,5: Airborne Postion", adsbOut1090.id(), 1, 1, 1);
    sumModel.addSummary(sumAirPos);

    TestParam tpAirPosMsgEle("message-Element", sumAirPos.id(), "Message Element", "", "", 0, 0, 1);
    tpModel.addTestParam(tpAirPosMsgEle);


    Summary sumPos("Position:", adsbOut1090.id(), 1, 2, 2);
    sumModel.addSummary(sumPos);

    TestParam tpPosLat("latitude", sumPos.id(), "Latitude", "", "N", 0, 0, 0);
    tpModel.addTestParam(tpPosLat);

    TestParam tpPosLong("longitude", sumPos.id(), "Longitude", "", "W", 1, 0, 0);
    tpModel.addTestParam(tpPosLong);

    TestParam tpPosAltBaro("altitude(baro)", sumPos.id(), "Altitude(baro)", "", "ft", 2, 0, 0);
    tpModel.addTestParam(tpPosAltBaro);

    Summary sumOFlds("Other Fields:", adsbOut1090.id(), 1, 3, 2);
    sumModel.addSummary(sumOFlds);

    TestParam tpOFldsSurSts("surveillance-Status", sumOFlds.id(), "Surveillance Status", "", "", 0, 0, 0);
    tpModel.addTestParam(tpOFldsSurSts);

    TestParam tpOFldsNicSb("nic-SB", sumOFlds.id(), "NIC-SB", "", "", 1, 0, 0);
    tpModel.addTestParam(tpOFldsNicSb);

    TestParam tpOFldsCprFrmt("cpr-Format", sumOFlds.id(), "CPR Format", "", "", 2, 0, 0);
    tpModel.addTestParam(tpOFldsCprFrmt);

    TestParam tpOFldsUtcSync("utc-Sync", sumOFlds.id(), "UTC Sync", "", "", 3, 0, 0);
    tpModel.addTestParam(tpOFldsUtcSync);

    //------------------------------P3-------------------------------

    Summary sumAirVeh2("Aircraft/Vehicle:", adsbOut1090.id(), 2, 0, 2);
    sumModel.addSummary(sumAirVeh2);

    TestParam tpAirVeh2Add("address", sumAirVeh2.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(tpAirVeh2Add);

    TestParam tpAirVeh2FId("flight-Id", sumAirVeh2.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(tpAirVeh2FId);

    TestParam tpAirVeh2RfLvl("rfLvl", sumAirVeh2.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(tpAirVeh2RfLvl);

    TestParam tpAirVeh2Bds("bds-Rcvd", sumAirVeh2.id(), "BDS Rcvd (DF17)", "0,5,0,8,0,9,6,0,6,1,6,5", "", 2, 0, 0);
    tpModel.addTestParam(tpAirVeh2Bds);



    Summary sumAcIdCat("BDS 0,8: A/C ID & Category", adsbOut1090.id(), 2, 1, 1);
    sumModel.addSummary(sumAcIdCat);

    TestParam tpAcIdCatMsgEle("message-Element", sumAcIdCat.id(), "Message Element", "", "", 0, 0, 1);
    tpModel.addTestParam(tpAcIdCatMsgEle);

    Summary sumAVInfo2("Aircraft/Vechile Info:", adsbOut1090.id(), 2, 2, 2);
    sumModel.addSummary(sumAVInfo2);

    TestParam tpAVInfoAID("aircraft-ID", sumAVInfo2.id(), "Aircraft ID", "", "", 0, 0, 0);
    tpModel.addTestParam(tpAVInfoAID);

    TestParam tpAVInfoEC("emitter-Cat", sumAVInfo2.id(), "Emitter Cat", "", "", 1, 0, 0);
    tpModel.addTestParam(tpAVInfoEC);

    //------------------------------P4-------------------------------

    Summary sumAirVeh3("Aircraft/Vehicle:", adsbOut1090.id(), 3, 0, 2);
    sumModel.addSummary(sumAirVeh3);

    TestParam tpAirVeh3Add("address", sumAirVeh3.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(tpAirVeh3Add);

    TestParam tpAirVeh3FId("flight-Id", sumAirVeh3.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(tpAirVeh3FId);

    TestParam tpAVeh3RfLvl("rfLvl", sumAirVeh3.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(tpAVeh3RfLvl);

    TestParam tpAirVeh3Bds("bds-Rcvd", sumAirVeh3.id(), "BDS Rcvd (DF17)", "0,5,0,8,0,9,6,0,6,1,6,5", "", 2, 0, 0);
    tpModel.addTestParam(tpAirVeh3Bds);

    Summary sumAirVelocity("BDS 0,5: Airborne Velocity", adsbOut1090.id(), 3, 1, 1);
    sumModel.addSummary(sumAirVelocity);

    TestParam tpAirVelocityMsgEle("message-Element", sumAirVelocity.id(), "Message Element", "", "", 0, 0, 1);
    tpModel.addTestParam(tpAirVelocityMsgEle);


    Summary sumFltData("Flight Data:", adsbOut1090.id(), 3, 2, 2);
    sumModel.addSummary(sumFltData);

    TestParam tpFltDataHdg("heading", sumFltData.id(), "Heading", "", "", 0, 0, 0);
    tpModel.addTestParam(tpFltDataHdg);

    TestParam tpFltDataAirspd("airspeed", sumFltData.id(), "Airspeed", "", "", 1, 0, 0);
    tpModel.addTestParam(tpFltDataAirspd);

    TestParam tpFltDataVerRt("vertical-Rate", sumFltData.id(), "Vertical Rate", "", "fpm", 2, 0, 0);
    tpModel.addTestParam(tpFltDataVerRt);

    TestParam tpFltDataGBAlt("Geom/Baro Alt", sumFltData.id(), "Geom/Baro Alt", "", "ft", 3, 0, 0);
    tpModel.addTestParam(tpFltDataGBAlt);

    Summary sumOFlds1("Other Fields:", adsbOut1090.id(), 3, 3, 2);
    sumModel.addSummary(sumOFlds1);

    TestParam tpOFlds1Icf("icf", sumOFlds1.id(), "ICF", "", "", 0, 0, 0);
    tpModel.addTestParam(tpOFlds1Icf);

    TestParam tpOFlds1AirSpdTyp("airSpd-Type", sumOFlds1.id(), "AirSpd Type", "", "", 0, 1, 0);
    tpModel.addTestParam(tpOFlds1AirSpdTyp);

    TestParam tpOFlds1Nacv("nacv", sumOFlds1.id(), "NACv", "", "", 1, 0, 0);
    tpModel.addTestParam(tpOFlds1Nacv);

    TestParam tpOFlds1VRSrc("vert-Rate-Src", sumOFlds1.id(), "Vert Rate Src", "", "", 1, 1, 0);
    tpModel.addTestParam(tpOFlds1VRSrc);

    TestParam tpOFlds1hdgSts("hdg-Sts", sumOFlds1.id(), "Hdg Sts", "", "", 2, 0, 0);
    tpModel.addTestParam(tpOFlds1hdgSts);

    //------------------------------P5-------------------------------

    Summary sumAirVeh4("Aircraft/Vehicle:", adsbOut1090.id(), 4, 0, 2);
    sumModel.addSummary(sumAirVeh4);

    TestParam tpAirVeh4Add("address", sumAirVeh4.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(tpAirVeh4Add);

    TestParam tpAirVeh4FId("flight-Id", sumAirVeh4.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(tpAirVeh4FId);

    TestParam tpAVeh4RfLvl("rfLvl", sumAirVeh4.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(tpAVeh4RfLvl);

    TestParam tpAirVeh4Bds("bds-Rcvd", sumAirVeh4.id(), "BDS Rcvd (DF17)", "0,5,0,8,0,9,6,0,6,1,6,5", "", 2, 0, 0);
    tpModel.addTestParam(tpAirVeh4Bds);

    Summary sumOprSts("BDS 6,5: Operational Status", adsbOut1090.id(), 4, 1, 1);
    sumModel.addSummary(sumOprSts);

    TestParam tpOprStsMsgEle("message-Element", sumOprSts.id(), "Message Element", "", "", 0, 0, 1);
    tpModel.addTestParam(tpOprStsMsgEle);


    Summary sumIntData("Intergrity Data:", adsbOut1090.id(), 4, 2, 2);
    sumModel.addSummary(sumIntData);

    TestParam tpIntDataNacp("nacp", sumIntData.id(), "NACp", "", "", 0, 0, 0);
    tpModel.addTestParam(tpIntDataNacp);

    TestParam tpIntDataNsupa("nic-supa", sumIntData.id(), "NIC-supA", "", "", 0, 1, 0);
    tpModel.addTestParam(tpIntDataNsupa);

    TestParam tpIntDataSda("sda", sumIntData.id(), "SDA", "", "", 1, 0, 0);
    tpModel.addTestParam(tpIntDataSda);

    TestParam tpIntDataGva("gva", sumIntData.id(), "GVA", "", "", 1, 1, 0);
    tpModel.addTestParam(tpIntDataGva);

    TestParam tpIntDataSil("sil", sumIntData.id(), "SIL", "", "", 2, 0, 0);
    tpModel.addTestParam(tpIntDataSil);

    TestParam tpIntDatassup("silsup", sumIntData.id(), "SILSup", "", "", 2, 1, 0);
    tpModel.addTestParam(tpIntDatassup);

    Summary sumCapSts("Capability/Status:", adsbOut1090.id(), 4, 2, 2);
    sumModel.addSummary(sumCapSts);

    TestParam tpCapStsAcc("airb-Cap.-Class", sumCapSts.id(), "Airb Cap. Class", "", "", 0, 0, 0);
    tpModel.addTestParam(tpCapStsAcc);

    TestParam tpCapStsOm("op.-Mode-(OM)", sumCapSts.id(), "Op. Mode (OM)", "", "", 0, 1, 0);
    tpModel.addTestParam(tpCapStsOm);

    TestParam tpCapStsAnt("antenna", sumCapSts.id(), "Antenna", "", "", 1, 0, 0);
    tpModel.addTestParam(tpCapStsAnt);

    TestParam tpCapStsTSR("target-State-Rpt", sumCapSts.id(), "Target State Rpt", "", "", 1, 1, 0);
    tpModel.addTestParam(tpCapStsTSR);

    TestParam tpCapStsTo("tcas-Oper", sumCapSts.id(), "TCAS Oper", "", "", 2, 0, 0);
    tpModel.addTestParam(tpCapStsTo);

    TestParam tpCapStsTra("tcas-Ra", sumCapSts.id(), "TCAS RA", "", "", 2, 1, 0);
    tpModel.addTestParam(tpCapStsTra);

    TestParam tpCapStsesin("1090es-In", sumCapSts.id(), "1090ES-IN", "", "", 3, 0, 0);
    tpModel.addTestParam(tpCapStsesin);

    TestParam tpCapStsuin("uat-In", sumCapSts.id(), "UAT-IN", "", "", 3, 1, 0);
    tpModel.addTestParam(tpCapStsuin);

    TestParam tpCapStsatc("atc", sumCapSts.id(), "ATC", "", "", 4, 0, 0);
    tpModel.addTestParam(tpCapStsatc);

    TestParam tpCapStsidt("ident", sumCapSts.id(), "IDENT", "", "", 4, 1, 0);
    tpModel.addTestParam(tpCapStsidt);

    Summary sumOFlds2("Other Fields:", adsbOut1090.id(), 4, 3, 2);
    sumModel.addSummary(sumOFlds2);

    TestParam tpOFlds2Vrs("version", sumOFlds2.id(), "Version", "", "", 0, 0, 0);
    tpModel.addTestParam(tpOFlds2Vrs);

    TestParam tpOFlds2Tc("traj-Chg-(TC)", sumOFlds2.id(), "Traj Chg (TC)", "", "", 0, 1, 0);
    tpModel.addTestParam(tpOFlds2Tc);

    TestParam tpOFlds2Ac("arv-Capable", sumOFlds2.id(), "ARV capable", "", "", 1, 0, 0);
    tpModel.addTestParam(tpOFlds2Ac);

    TestParam tpOFlds2Arf("ads-R-Flag", sumOFlds2.id(), "ADS-R Flag", "", "", 1, 1, 0);
    tpModel.addTestParam(tpOFlds2Arf);

    TestParam tpOFlds2Hrd("hrz-Ref-Dir", sumOFlds2.id(), "Hrz Ref Dir", "", "", 2, 0, 0);
    tpModel.addTestParam(tpOFlds2Hrd);

    //------------------------------P6-------------------------------

    Summary sumAirVeh5("Aircraft/Vehicle:", adsbOut1090.id(), 5, 0, 2);
    sumModel.addSummary(sumAirVeh5);

    TestParam tpAirVeh5Add("address", sumAirVeh5.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(tpAirVeh5Add);

    TestParam tpAirVeh5FId("flight-Id", sumAirVeh5.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(tpAirVeh5FId);

    TestParam tpAirVeh5RfLvl("rfLvl", sumAirVeh5.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(tpAirVeh5RfLvl);

    TestParam tpAirVeh5Bds("bds-Rcvd", sumAirVeh5.id(), "BDS Rcvd (DF17)", "0,5,0,8,0,9,6,0,6,1,6,5", "", 2, 0, 0);
    tpModel.addTestParam(tpAirVeh5Bds);

    Summary sumTse("Target State Element (TS):", adsbOut1090.id(), 5, 1, 1);
    sumModel.addSummary(sumTse);

    TestParam tpTsSAlt("sel.-Altitude", sumTse.id(), "Sel. Altitude", "", "", 0, 0, 1);
    tpModel.addTestParam(tpTsSAlt);

    TestParam tpTseNs("nic-supA", sumTse.id(), "NIC-supA", "", "", 0, 1, 0);
    tpModel.addTestParam(tpTseNs);

    TestParam tpTseBs("baro-Setting", sumTse.id(), "Baro Setting", "", "", 1, 0, 0);
    tpModel.addTestParam(tpTseBs);

    TestParam tpTseSh("sel.-Heading", sumTse.id(), "Sel. Heading", "", "", 2, 0, 0);
    tpModel.addTestParam(tpTseSh);

    TestParam tpTse("status", sumTse.id(), "Status", "", "", 2, 1, 0);
    tpModel.addTestParam(tpTse);

    Summary sumApM1("Autopilot Modes:", adsbOut1090.id(), 5, 2, 1);
    sumModel.addSummary(sumApM1);

    TestParam tpApMMbs("mode-Bits-Status", sumApM1.id(), "Mode bits status", "", "", 0, 0, 1);
    tpModel.addTestParam(tpApMMbs);

    TestParam tpApMAp("autopilot-(AP)", sumApM1.id(), "Autopilot (AP)", "", "", 1, 0, 0);
    tpModel.addTestParam(tpApMAp);

    TestParam tpApMVnav("vnav", sumApM1.id(), "VNAV", "", "", 2, 0, 0);
    tpModel.addTestParam(tpApMVnav);

    TestParam tpApMAltH("alt.-Hold-(ALT)", sumApM1.id(), "Alt. Hold (ALT)", "", "", 3, 0, 0);
    tpModel.addTestParam(tpApMAltH);

    TestParam tpApMApp("approach-(APP)", sumApM1.id(), "Approach (APP)", "", "", 4, 0, 0);
    tpModel.addTestParam(tpApMApp);

    TestParam tpApMlnav("lnav", sumApM1.id(), "LNAV", "", "", 5, 0, 0);
    tpModel.addTestParam(tpApMlnav);

    //------------------------------P7-------------------------------

    Summary sumAirVeh6("Aircraft/Vehicle:", adsbOut1090.id(), 6, 0, 2);
    sumModel.addSummary(sumAirVeh6);

    TestParam tpAirVeh6Add("address", sumAirVeh6.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(tpAirVeh6Add);

    TestParam tpAirVeh6FId("flight-Id", sumAirVeh6.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(tpAirVeh6FId);

    TestParam tpAirVeh6RfLvl("rfLvl", sumAirVeh6.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(tpAirVeh6RfLvl);

    TestParam tpAirVeh6Bds("bds-Rcvd", sumAirVeh6.id(), "BDS Rcvd (DF17)", "0,5,0,8,0,9,6,0,6,1,6,5", "", 2, 0, 0);
    tpModel.addTestParam(tpAirVeh6Bds);

    Summary sumRfST("RF/ Squitter Timming", adsbOut1090.id(), 6, 1, 1);
    sumModel.addSummary(sumRfST);

    TestParam tpRfSTEsr("extended-Squitter-Rate", sumRfST.id(), "Extended Squitter Rate", "", "sec", 0, 0, 1);
    tpModel.addTestParam(tpRfSTEsr);

    Summary sumRfData("1090 MHz RF Data:", adsbOut1090.id(), 6, 2, 2);
    sumModel.addSummary(sumRfData);

    TestParam tpRfDataMf("measured-frequency", sumRfData.id(), "Measured frequency", "", "MHz", 0, 0, 0);
    tpModel.addTestParam(tpRfDataMf);

    TestParam tpRfDataMp("measure-power", sumRfData.id(), "Measure power", "", "dBm", 1, 0, 0);
    tpModel.addTestParam(tpRfDataMp);

    TestParam tpRfDataEc("error-conditions", sumRfData.id(), "Error conditions", "", "", 2, 0, 0);
    tpModel.addTestParam(tpRfDataEc);

    Test in1090("1090 ADS-B IN", secADSB.id());
    testModel.addTest(in1090);

    //------------------------------uatOut-------------------------------

    Test uatOut("UAT ADS-B OUT", secADSB.id());
    testModel.addTest(uatOut);

    //------------------------------P1-------------------------------

    Summary sumAirVeh7("Aircraft/Vehicle:", uatOut.id(), 0, 0, 2);
    sumModel.addSummary(sumAirVeh7);

    TestParam tpAirVeh7Add("address", sumAirVeh7.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(tpAirVeh7Add);

    TestParam tpAirVeh7FId("flight-Id", sumAirVeh7.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(tpAirVeh7FId);

    TestParam tpAirVeh7RfLvl("rfLvl", sumAirVeh7.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(tpAirVeh7RfLvl);

    TestParam tpAirVeh7Bds("payloads-Rcvd", sumAirVeh7.id(), "Payloads Rcvd", "", "", 2, 0, 0);
    tpModel.addTestParam(tpAirVeh7Bds);

    Summary sumMS("Mode Status Element (MS)", uatOut.id(), 0, 1, 1);
    sumModel.addSummary(sumMS);

    Summary sumAvInfo3("Aircraft/Vehicle info:", uatOut.id(), 0, 2, 2);
    sumModel.addSummary(sumAvInfo3);

    TestParam tpAvInfo3fid("flight-ID", sumAvInfo3.id(), "Flight ID", "", "", 0, 0, 0);
    tpModel.addTestParam(tpAvInfo3fid);

    TestParam tpAvInfo3csid("csid", sumAvInfo3.id(), "CSID", "", "", 0, 1, 0);
    tpModel.addTestParam(tpAvInfo3csid);

    TestParam tpAvInfo3ect("emitter-Cat", sumAvInfo3.id(), "Emitter Cat", "", "", 1, 0, 0);
    tpModel.addTestParam(tpAvInfo3ect);

    TestParam tpAvInfo3acode("3/A-Code", sumAvInfo3.id(), "3/A Code", "", "", 1, 1, 0);
    tpModel.addTestParam(tpAvInfo3acode);

    TestParam tpAvInfo3ep("emg/Prty", sumAvInfo3.id(), "Emg/Prty", "", "", 2, 0, 0);
    tpModel.addTestParam(tpAvInfo3ep);

    Summary sumCCodes("Capability Codes:", uatOut.id(), 0, 3, 2);
    sumModel.addSummary(sumCCodes);

    TestParam tpCCodesuin("uat-IN", sumCCodes.id(), "UAT IN", "", "", 0, 0, 0);
    tpModel.addTestParam(tpCCodesuin);

    TestParam tpCCodestOp("tcas-Op", sumCCodes.id(), "TCAS Op", "", "", 0, 1, 0);
    tpModel.addTestParam(tpCCodestOp);

    TestParam tpCCodesesin("1090ES-IN", sumCCodes.id(), "1090ES IN", "", "", 1, 0, 0);
    tpModel.addTestParam(tpCCodesesin);

    Summary sumOModes("Operational Modes:", uatOut.id(), 0, 4, 2);
    sumModel.addSummary(sumOModes);

    TestParam tpOModesAtcS("atc-Svcs", sumOModes.id(), "ATC Svcs", "", "", 0, 0, 0);
    tpModel.addTestParam(tpOModesAtcS);

    TestParam tpOModesidt("ident", sumOModes.id(), "IDENT", "", "", 0, 1, 0);
    tpModel.addTestParam(tpOModesidt);

    TestParam tpOModestra("tcas-RA", sumOModes.id(), "TCAS RA", "", "", 1, 0, 0);
    tpModel.addTestParam(tpOModestra);

    Summary sumOtherFld("Other Fields:", uatOut.id(), 0, 5, 2);
    sumModel.addSummary(sumOtherFld);

    TestParam tpOtherFldnacp("nacp", sumOtherFld.id(), "NACp", "", "", 0, 0, 0);
    tpModel.addTestParam(tpOtherFldnacp);

    TestParam tpOtherFldtmso("transmit-MSO", sumOtherFld.id(), "Transmit MSO", "", "", 0, 1, 0);
    tpModel.addTestParam(tpOtherFldtmso);

    TestParam tpOtherFldnacv("nacv", sumOtherFld.id(), "NACv", "", "", 1, 0, 0);
    tpModel.addTestParam(tpOtherFldnacv);

    TestParam tpOtherFldsil("sil", sumOtherFld.id(), "SIL", "", "", 1, 1, 0);
    tpModel.addTestParam(tpOtherFldsil);

    TestParam tpOtherFldsda("sda", sumOtherFld.id(), "SDA", "", "", 2, 0, 0);
    tpModel.addTestParam(tpOtherFldsda);

    TestParam tpOtherFldgva("gva", sumOtherFld.id(), "GVA", "", "", 2, 1, 0);
    tpModel.addTestParam(tpOtherFldgva);

    TestParam tpOtherFldmops("mops", sumOtherFld.id(), "MOPS", "", "", 3, 0, 0);
    tpModel.addTestParam(tpOtherFldmops);

    TestParam tpOtherFldssup("sil-Sup", sumOtherFld.id(), "SIL Sup", "", "", 3, 1, 0);
    tpModel.addTestParam(tpOtherFldssup);

    TestParam tpOtherFldsant("sgl-Ant", sumOtherFld.id(), "Sgl Ant", "", "", 4, 0, 0);
    tpModel.addTestParam(tpOtherFldsant);

    TestParam tpOtherFldnbaro("nicbaro", sumOtherFld.id(), "NICbaro", "", "", 4, 1, 0);
    tpModel.addTestParam(tpOtherFldnbaro);

    TestParam tpOtherFldnsup("nicsup", sumOtherFld.id(), "NICsup", "", "", 5, 0, 0);
    tpModel.addTestParam(tpOtherFldnsup);



    //------------------------------P2-------------------------------

    Summary sumAirVeh8("Aircraft/Vehicle:", uatOut.id(), 1, 0, 2);
    sumModel.addSummary(sumAirVeh8);

    TestParam tpAirVeh8Add("address", sumAirVeh8.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(tpAirVeh8Add);

    TestParam tpAirVeh8FId("flight-Id", sumAirVeh8.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(tpAirVeh8FId);

    TestParam tpAirVeh8RfLvl("rfLvl", sumAirVeh8.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(tpAirVeh8RfLvl);

    TestParam tpAirVeh8Bds("payloads-Rcvd", sumAirVeh8.id(), "Payloads Rcvd", "0,5,0,8,0,9,6,0,6,1,6,5", "", 2, 0, 0);
    tpModel.addTestParam(tpAirVeh8Bds);

    Summary sumSV1("State Vector Element (SV)", uatOut.id(), 1, 1, 1);
    sumModel.addSummary(sumSV1);

    Summary sumPosVel1("Position & Velocity:", uatOut.id(), 1, 2, 2);
    sumModel.addSummary(sumPosVel1);

    TestParam tpPosVel1agst("air/Gnd State", sumPosVel1.id(), "Air/Gnd State", "Air-Subsonic", "", 0, 0, 0);
    tpModel.addTestParam(tpPosVel1agst);

    TestParam tpPosVel1lat("latitude", sumPosVel1.id(), "Latitude", "", "N", 1, 0, 0);
    tpModel.addTestParam(tpPosVel1lat);

    TestParam tpPosVel1long("longitude", sumPosVel1.id(), "Longitude", "", "W", 2, 0, 0);
    tpModel.addTestParam(tpPosVel1long);

    TestParam tpPosVel1alt("altitude", sumPosVel1.id(), "Altitude", "", "ft", 3, 0, 0);
    tpModel.addTestParam(tpPosVel1alt);

    TestParam tpPosVel1typ("type", sumPosVel1.id(), "Type", "", "", 3, 1, 0);
    tpModel.addTestParam(tpPosVel1typ);

    TestParam tpPosVel1hv("horizontal-Velocity", sumPosVel1.id(), "Horizontal Velocity", "", "", 4, 0, 0);
    tpModel.addTestParam(tpPosVel1hv);

    TestParam tpPosVel1trh("vert.-Velocity", sumPosVel1.id(), "Vert. Velocity", "", "", 5, 0, 0);
    tpModel.addTestParam(tpPosVel1trh);

    TestParam tpPosVel1src("source", sumPosVel1.id(), "Source", "", "", 5, 1, 0);
    tpModel.addTestParam(tpPosVel1src);

    Summary sumOtherFld1("Other Fields:", uatOut.id(), 1, 3, 2);
    sumModel.addSummary(sumOtherFld1);

    TestParam tpOtherFld1Nic("nic", sumOtherFld1.id(), "NIC", "", "", 0, 0, 0);
    tpModel.addTestParam(tpOtherFld1Nic);

    TestParam tpOtherFld1Utc("utc", sumOtherFld1.id(), "UTC", "", "", 0, 1, 0);
    tpModel.addTestParam(tpOtherFld1Utc);

    TestParam tpOtherFld1Uf("uplink-Feedback", sumOtherFld1.id(), "Uplink Feedback", "", "", 1, 0, 0);
    tpModel.addTestParam(tpOtherFld1Uf);


    Summary sumAuxSv1("Aux.State Vector Element (AUX SV):", uatOut.id(), 1, 4, 2);
    sumModel.addSummary(sumAuxSv1);

    TestParam tpAuxSv1SecAlt("secondary-Altitude", sumAuxSv1.id(), "Secondary Altitude", "", "ft", 0, 0, 0);
    tpModel.addTestParam(tpAuxSv1SecAlt);


    //------------------------------P3-------------------------------

    Summary sumAirVeh9("Aircraft/Vehicle:", uatOut.id(), 2, 0, 2);
    sumModel.addSummary(sumAirVeh9);

    TestParam tpAirVeh9Add("address", sumAirVeh9.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(tpAirVeh9Add);

    TestParam tpAirVeh9FId("flight-Id", sumAirVeh9.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(tpAirVeh9FId);

    TestParam tpAirVeh9RfLvl("rfLvl", sumAirVeh9.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(tpAirVeh9RfLvl);

    TestParam tpAirVeh9Bds("payloads-Rcvd", sumAirVeh9.id(), "Payloads Rcvd", "", "", 2, 0, 0);
    tpModel.addTestParam(tpAirVeh9Bds);

    Summary sumSV2("State Vector Element (SV)", uatOut.id(), 2, 1, 1);
    sumModel.addSummary(sumSV2);    

    Summary sumPosVel2("Position & Velocity:", uatOut.id(), 2, 2, 2);
    sumModel.addSummary(sumPosVel2);

    TestParam tpPosVel2agst("air/Gnd State", sumPosVel2.id(), "Air/Gnd State", "Ground", "", 0, 0, 0);
    tpModel.addTestParam(tpPosVel2agst);

    TestParam tpPosVel2lat("latitude", sumPosVel2.id(), "Latitude", "", "N", 1, 0, 0);
    tpModel.addTestParam(tpPosVel2lat);

    TestParam tpPosVel2long("longitude", sumPosVel2.id(), "Longitude", "", "W", 2, 0, 0);
    tpModel.addTestParam(tpPosVel2long);

    TestParam tpPosVel2alt("altitude", sumPosVel2.id(), "Altitude", "", "ft", 3, 0, 0);
    tpModel.addTestParam(tpPosVel2alt);

    TestParam tpPosVel2typ("type", sumPosVel2.id(), "Type", "", "", 3, 1, 0);
    tpModel.addTestParam(tpPosVel2typ);

    TestParam tpPosVel2gsp("groundspeed", sumPosVel2.id(), "Groundspeed", "", "kts", 4, 0, 0);
    tpModel.addTestParam(tpPosVel2gsp);

    TestParam tpPosVel2trh("track/Heading", sumPosVel2.id(), "Track/Heading", "", "deg", 5, 0, 0);
    tpModel.addTestParam(tpPosVel2trh);

    TestParam tpPosVel2th("t/h", sumPosVel2.id(), "T/H", "", "", 5, 1, 0);
    tpModel.addTestParam(tpPosVel2th);

    TestParam tpPosVel2avlw("a/v-L/W", sumPosVel2.id(), "A/V L/W", "", "", 6, 0, 0);
    tpModel.addTestParam(tpPosVel2avlw);

    TestParam tpPosVel2gao("gps-Ant-Offset", sumPosVel2.id(), "GPS Ant Offset", "", "", 7, 0, 0);
    tpModel.addTestParam(tpPosVel2gao);

    Summary sumOtherFld2("Other Fields:", uatOut.id(), 2, 3, 2);
    sumModel.addSummary(sumOtherFld2);

    TestParam tpOtherFld2Nic("nic", sumOtherFld2.id(), "NIC", "", "", 0, 0, 0);
    tpModel.addTestParam(tpOtherFld2Nic);

    TestParam tpOtherFld2Utc("utc", sumOtherFld2.id(), "UTC", "", "", 0, 1, 0);
    tpModel.addTestParam(tpOtherFld2Utc);

    TestParam tpOtherFld2Uf("uplink-Feedback", sumOtherFld2.id(), "Uplink Feedback", "", "", 1, 0, 0);
    tpModel.addTestParam(tpOtherFld2Uf);

    Summary sumAuxSv2("Aux.State Vector Element (AUX SV):", uatOut.id(), 2, 4, 2);
    sumModel.addSummary(sumAuxSv2);

    TestParam tpAuxSv2secAlt("secondary-Altitude", sumAuxSv2.id(), "Secondary Altitude", "", "", 0, 0, 0);
    tpModel.addTestParam(tpAuxSv2secAlt);

    TestParam tpAuxSv2typ("type", sumAuxSv2.id(), "Type", "", "", 0, 1, 0);
    tpModel.addTestParam(tpAuxSv2typ);

    //------------------------------P4-------------------------------

    Summary sumAirVe10("Aircraft/Vehicle:", uatOut.id(), 3, 0, 2);
    sumModel.addSummary(sumAirVe10);

    TestParam tpAirVeh10Add("address", sumAirVe10.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(tpAirVeh10Add);

    TestParam tpAirVeh10FId("flight-Id", sumAirVe10.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(tpAirVeh10FId);

    TestParam tpAirVeh10RfLvl("rfLvl", sumAirVe10.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(tpAirVeh10RfLvl);

    TestParam tpAirVeh10Bds("payloads-Rcvd", sumAirVe10.id(), "Payloads Rcvd", "0,5,0,8,0,9,6,0,6,1,6,5", "", 2, 0, 0);
    tpModel.addTestParam(tpAirVeh10Bds);

    Summary sumTS("Target state Element (TS)", uatOut.id(), 3, 1, 1);
    sumModel.addSummary(sumTS);

    TestParam tpTSSAlt("sel.-Altitude", sumTS.id(), "Sel. Altitude", "", "", 0, 0, 0);
    tpModel.addTestParam(tpTSSAlt);

    TestParam tpTSTyp("type", sumTS.id(), "Type", "", "", 0, 1, 0);
    tpModel.addTestParam(tpTSTyp);

    TestParam tpTSBStt("baro-Setting", sumTS.id(), "Baro Setting", "", "", 1, 0, 0);
    tpModel.addTestParam(tpTSBStt);

    TestParam tpTSSelH("sel.-Heading", sumTS.id(), "Sel. Heading", "", "", 2, 0, 0);
    tpModel.addTestParam(tpTSSelH);

    TestParam tpTSSts("status", sumTS.id(), "Status", "", "", 2, 1, 0);
    tpModel.addTestParam(tpTSSts);

    Summary sumApM2("AutoPilot Modes:", uatOut.id(), 3, 2, 2);
    sumModel.addSummary(sumApM2);

    TestParam tpApM2Mbs("mode-bits-status", sumApM2.id(), "Mode bits status", "", "", 0, 0, 0);
    tpModel.addTestParam(tpApM2Mbs);

    TestParam tpApM2Ap("autoPilot-(AP)", sumApM2.id(), "AutoPilot (AP)", "", "", 1, 0, 0);
    tpModel.addTestParam(tpApM2Ap);

    TestParam tpApM2Vnav("vnav", sumApM2.id(), "VNAV", "", "", 2, 0, 0);
    tpModel.addTestParam(tpApM2Vnav);

    TestParam tpApM2Alt("alt.-Hold-(ALT)", sumApM2.id(), "Alt. Hold (ALT)", "", "", 3, 0, 0);
    tpModel.addTestParam(tpApM2Alt);

    TestParam tpApM2App("approach-(APP)", sumApM2.id(), "Approach (APP)", "", "", 4, 0, 0);
    tpModel.addTestParam(tpApM2App);

    TestParam tpApM2lnav("lnav", sumApM2.id(), "LNAV", "", "", 5, 0, 0);
    tpModel.addTestParam(tpApM2lnav);

    //------------------------------P5-------------------------------

    Summary sumAirVe11("Aircraft/Vehicle:", uatOut.id(), 4, 0, 2);
    sumModel.addSummary(sumAirVe11);

    TestParam tpAirVeh11Add("address", sumAirVe11.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(tpAirVeh11Add);

    TestParam tpAirVeh11FId("flight-Id", sumAirVe11.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(tpAirVeh11FId);

    TestParam tpAirVeh11RfLvl("rfLvl", sumAirVe11.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(tpAirVeh11RfLvl);

    TestParam tpAirVeh11Bds("payloads-Rcvd", sumAirVe11.id(), "Payloads Rcvd", "0,5,0,8,0,9,6,0,6,1,6,5", "", 2, 0, 0);
    tpModel.addTestParam(tpAirVeh11Bds);

    Summary sumTce("Trajectory Change Element", uatOut.id(), 4, 1, 1);
    sumModel.addSummary(sumTce);

    TestParam tpTceTcFld("tc-Field", sumTce.id(), "TC Field", "", "", 0, 0, 0);
    tpModel.addTestParam(tpTceTcFld);

    //------------------------------P6-------------------------------

    Summary sumAirVe12("Aircraft/Vehicle:", uatOut.id(), 5, 0, 2);
    sumModel.addSummary(sumAirVe12);

    TestParam tpAirVeh12Add("address", sumAirVe12.id(), "ADDRESS", "2345AA (H)/23734510 (O)", "", 0, 0, 0);
    tpModel.addTestParam(tpAirVeh12Add);

    TestParam tpAirVeh12FId("flight-Id", sumAirVe12.id(), "Flight ID", "N1246W", "", 1, 0, 0);
    tpModel.addTestParam(tpAirVeh12FId);

    TestParam tpAirVeh12RfLvl("rfLvl", sumAirVe12.id(), "RF Level", "Strong", "", 1, 1, 0);
    tpModel.addTestParam(tpAirVeh12RfLvl);

    TestParam tpAirVeh12Bds("payloads-Rcvd", sumAirVe12.id(), "BDS Rcvd (DF17)", "0,5,0,8,0,9,6,0,6,1,6,5", "", 2, 0, 0);
    tpModel.addTestParam(tpAirVeh12Bds);

    Summary sumRflM("978 MHz RF Link Measurements", uatOut.id(), 5, 1, 1);
    sumModel.addSummary(sumRflM);

    TestParam tpRflMFq("frequency", sumRflM.id(), "Frequency", "", "MHz", 0, 0, 0);
    tpModel.addTestParam(tpRflMFq);

    TestParam tpRflMPwr("power", sumRflM.id(), "Power", "", "dBm (Medium)", 1, 0, 0);
    tpModel.addTestParam(tpRflMPwr);

    TestParam tpRflMErrC("error-conditions", sumRflM.id(), "Error conditions", "", "", 2, 0, 0);
    tpModel.addTestParam(tpRflMErrC);

    TestParam tpRflMPwrD("power-Drop", sumRflM.id(), "Power Drop", "", "dB", 3, 0, 0);
    tpModel.addTestParam(tpRflMPwrD);

    TestParam tpRflMD("deviation", sumRflM.id(), "Deviation", "", "%", 4, 0, 0);
    tpModel.addTestParam(tpRflMD);

    TestParam tpRflMPD("peak-Deviation", sumRflM.id(), "Peak Deviation", "", "%", 5, 0, 0);
    tpModel.addTestParam(tpRflMPD);

    TestParam tpRflMVEO("vert-Eye-Opening", sumRflM.id(), "Vert Eye Opening", "", "%", 6, 0, 0);
    tpModel.addTestParam(tpRflMVEO);

    TestParam tpRflMHEO("horz-Eye-Opening", sumRflM.id(), "Horz Eye Opening", "", "%", 7, 0, 0);
    tpModel.addTestParam(tpRflMHEO);

    TestParam tpRflMMTErr("message-Time-Error", sumRflM.id(), "Message Time Error", "", "uS", 8, 0, 0);
    tpModel.addTestParam(tpRflMMTErr);

    Summary sumUatMsgSum("UAT Message Summary:", uatOut.id(), 5, 2, 2);
    sumModel.addSummary(sumUatMsgSum);

    TestParam tpUatMsgSumMsgRcvd("message-Received", sumUatMsgSum.id(), "Message Received", "", "", 0, 0, 0);
    tpModel.addTestParam(tpUatMsgSumMsgRcvd);

    TestParam tpUatMsgSumMIMsg("missing/Incorrect-Messages", sumUatMsgSum.id(), "Missing/Incorrect Messages", "", "", 1, 0, 0);
    tpModel.addTestParam(tpUatMsgSumMIMsg);

    TestParam tpUatMsgSumMsgSR("message-Success-Rate", sumUatMsgSum.id(), "Message Success Rate", "", "%", 2, 0, 0);
    tpModel.addTestParam(tpUatMsgSumMsgSR);

    TestParam tpUatMsgSumCMsgBE("current-Message-Bit-Errors", sumUatMsgSum.id(), "Current Message Bit Errors", "", "", 3, 0, 0);
    tpModel.addTestParam(tpUatMsgSumCMsgBE);

    TestParam tpUatMsgSumMSgSeq("message-Sequence", sumUatMsgSum.id(), "Message Sequence", "", "", 4, 0, 0);
    tpModel.addTestParam(tpUatMsgSumMSgSeq);

    TestParam tpUatMsgSumMsgPld("message-Payloads", sumUatMsgSum.id(), "Message Payloads", "", "", 5, 0, 0);
    tpModel.addTestParam(tpUatMsgSumMsgPld);

    Test uatIn("UAT ADS-B IN", secADSB.id());
    testModel.addTest(uatIn);


    auto navigationDaoPtr = DataManager::instance().navigationDao();

    Navigation adsbTo1090(vwGlobal.id(), "_section", secADSB.id(), vwADSB.id());
    navigationDaoPtr->addNavigation(adsbTo1090);

    Navigation main1090ToScanPage(vwADSB.id(), "_test", adsbOut1090.id(), vwADSBout1090Scan.id());
    navigationDaoPtr->addNavigation(main1090ToScanPage);

    Navigation scanToDetail(vwADSBout1090Scan.id(), "Next", 0, vwADSBout1090P1.id());
    navigationDaoPtr->addNavigation(scanToDetail);



    return 1;
}
