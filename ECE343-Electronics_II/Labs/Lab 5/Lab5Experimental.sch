<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.2.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ngspice-simulation" urn="urn:adsk.eagle:library:527439">
<description>SPICE compatible library parts</description>
<packages>
</packages>
<symbols>
<symbol name="FET-P" urn="urn:adsk.eagle:symbol:5272039/1" library_version="16">
<description>P-Type MOS Field Effect Transistor (MOSFET)</description>
<pin name="G1" x="-10.16" y="0" length="middle"/>
<pin name="D1" x="5.08" y="-12.7" length="middle" rot="R90"/>
<pin name="S1" x="5.08" y="12.7" length="middle" rot="R270"/>
<wire x1="-1.016" y1="-5.08" x2="-1.016" y2="0" width="0.254" layer="94"/>
<wire x1="-1.016" y1="0" x2="-1.016" y2="5.08" width="0.254" layer="94"/>
<wire x1="1.27" y1="-5.842" x2="1.27" y2="-4.064" width="0.254" layer="94"/>
<wire x1="1.27" y1="-4.064" x2="1.27" y2="4.064" width="0.254" layer="94"/>
<wire x1="1.27" y1="4.064" x2="1.27" y2="6.096" width="0.254" layer="94"/>
<wire x1="5.08" y1="-4.064" x2="1.27" y2="-4.064" width="0.254" layer="94"/>
<wire x1="5.08" y1="-4.064" x2="5.08" y2="-7.62" width="0.1524" layer="94"/>
<wire x1="5.08" y1="4.064" x2="5.08" y2="7.62" width="0.1524" layer="94"/>
<wire x1="-5.08" y1="0" x2="-1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="1.778" y1="4.064" x2="5.08" y2="4.064" width="0.254" layer="94"/>
<wire x1="1.778" y1="4.064" x2="2.54" y2="4.826" width="0.254" layer="94"/>
<wire x1="1.778" y1="4.064" x2="2.54" y2="3.302" width="0.254" layer="94"/>
<wire x1="1.778" y1="4.064" x2="1.27" y2="4.064" width="0.254" layer="94"/>
<circle x="2.032" y="0" radius="7.228965625" width="0.254" layer="94"/>
<text x="10.16" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="10.16" y="-2.54" size="1.778" layer="97">&gt;SPICEMODEL</text>
<text x="10.16" y="0" size="1.778" layer="96">&gt;VALUE</text>
<text x="10.16" y="-5.08" size="1.778" layer="97">&gt;SPICEEXTRA</text>
</symbol>
<symbol name="FET-N" urn="urn:adsk.eagle:symbol:5272031/1" library_version="16">
<description>N-Type MOS Field Effect Transistor (MOSFET)</description>
<pin name="G" x="-10.16" y="0" length="middle"/>
<pin name="D" x="5.08" y="12.7" length="middle" rot="R270"/>
<pin name="S" x="5.08" y="-12.7" length="middle" rot="R90"/>
<wire x1="-1.016" y1="5.08" x2="-1.016" y2="0" width="0.254" layer="94"/>
<wire x1="-1.016" y1="0" x2="-1.016" y2="-5.08" width="0.254" layer="94"/>
<wire x1="1.27" y1="5.842" x2="1.27" y2="4.064" width="0.254" layer="94"/>
<wire x1="1.27" y1="4.064" x2="1.27" y2="-4.064" width="0.254" layer="94"/>
<wire x1="1.27" y1="-4.064" x2="1.27" y2="-6.096" width="0.254" layer="94"/>
<wire x1="5.08" y1="4.064" x2="1.27" y2="4.064" width="0.254" layer="94"/>
<wire x1="5.08" y1="4.064" x2="5.08" y2="7.62" width="0.1524" layer="94"/>
<wire x1="5.08" y1="-4.064" x2="5.08" y2="-7.62" width="0.1524" layer="94"/>
<wire x1="4.572" y1="-4.064" x2="1.27" y2="-4.064" width="0.254" layer="94"/>
<wire x1="4.572" y1="-4.064" x2="3.81" y2="-3.302" width="0.254" layer="94"/>
<wire x1="4.572" y1="-4.064" x2="3.81" y2="-4.826" width="0.254" layer="94"/>
<wire x1="4.572" y1="-4.064" x2="5.08" y2="-4.064" width="0.254" layer="94"/>
<wire x1="-5.08" y1="0" x2="-1.016" y2="0" width="0.254" layer="94"/>
<circle x="2.032" y="0" radius="7.228965625" width="0.254" layer="94"/>
<text x="10.16" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="10.16" y="-2.54" size="1.778" layer="97">&gt;SPICEMODEL</text>
<text x="10.16" y="0" size="1.778" layer="96">&gt;VALUE</text>
<text x="10.16" y="-5.08" size="1.778" layer="97">&gt;SPICEEXTRA</text>
</symbol>
<symbol name="BJT-PNP" urn="urn:adsk.eagle:symbol:5272041/1" library_version="16">
<description>Bipolar PNP Transistor</description>
<wire x1="-2.54" y1="0" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="-3.302" x2="0" y2="-2.032" width="0.254" layer="94"/>
<wire x1="0" y1="-2.032" x2="0" y2="2.286" width="0.254" layer="94"/>
<wire x1="0" y1="2.286" x2="0" y2="3.302" width="0.254" layer="94"/>
<wire x1="0" y1="-2.032" x2="2.54" y2="-4.064" width="0.254" layer="94"/>
<wire x1="2.54" y1="-4.064" x2="2.54" y2="-5.334" width="0.254" layer="94"/>
<wire x1="0" y1="2.286" x2="2.54" y2="4.064" width="0.254" layer="94"/>
<wire x1="2.54" y1="4.064" x2="2.54" y2="5.334" width="0.254" layer="94"/>
<wire x1="0.762" y1="2.794" x2="0.762" y2="3.556" width="0.254" layer="94"/>
<wire x1="0.762" y1="2.794" x2="1.524" y2="2.794" width="0.254" layer="94"/>
<pin name="B" x="-7.62" y="0" length="middle"/>
<pin name="C" x="2.54" y="-10.16" length="middle" rot="R90"/>
<pin name="E" x="2.54" y="10.16" length="middle" rot="R270"/>
<circle x="1.016" y="0" radius="5.588" width="0.254" layer="94"/>
<text x="7.62" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="7.62" y="-2.54" size="1.778" layer="97">&gt;SPICEMODEL</text>
<text x="7.62" y="0" size="1.778" layer="96">&gt;VALUE</text>
<text x="7.62" y="-5.08" size="1.778" layer="97">&gt;SPICEEXTRA</text>
</symbol>
<symbol name="BJT-NPN" urn="urn:adsk.eagle:symbol:5272032/1" library_version="16">
<description>Bipolar NPN Transistor</description>
<wire x1="-2.54" y1="0" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="3.302" x2="0" y2="2.032" width="0.254" layer="94"/>
<wire x1="0" y1="2.032" x2="0" y2="-2.286" width="0.254" layer="94"/>
<wire x1="0" y1="-2.286" x2="0" y2="-3.302" width="0.254" layer="94"/>
<wire x1="0" y1="2.032" x2="2.54" y2="4.064" width="0.254" layer="94"/>
<wire x1="2.54" y1="4.064" x2="2.54" y2="5.334" width="0.254" layer="94"/>
<wire x1="0" y1="-2.286" x2="2.54" y2="-4.064" width="0.254" layer="94"/>
<wire x1="2.54" y1="-4.064" x2="2.54" y2="-5.334" width="0.254" layer="94"/>
<wire x1="2.032" y1="-3.81" x2="2.032" y2="-3.048" width="0.254" layer="94"/>
<wire x1="2.032" y1="-3.81" x2="1.27" y2="-3.81" width="0.254" layer="94"/>
<pin name="B" x="-7.62" y="0" length="middle"/>
<pin name="C" x="2.54" y="10.16" length="middle" rot="R270"/>
<pin name="E" x="2.54" y="-10.16" length="middle" rot="R90"/>
<circle x="1.016" y="0" radius="5.588" width="0.254" layer="94"/>
<text x="7.62" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="7.62" y="-2.54" size="1.778" layer="97">&gt;SPICEMODEL</text>
<text x="7.62" y="0" size="1.778" layer="96">&gt;VALUE</text>
<text x="7.62" y="-5.08" size="1.778" layer="97">&gt;SPICEEXTRA</text>
</symbol>
<symbol name="R" urn="urn:adsk.eagle:symbol:5272030/1" library_version="16">
<description>RESISTOR</description>
<wire x1="-2.54" y1="-0.889" x2="2.54" y2="-0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="0.889" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="-0.889" x2="2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-0.889" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<text x="-2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-6.35" size="1.778" layer="97">&gt;SPICEMODEL</text>
<text x="-2.54" y="-3.81" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.54" y="-8.89" size="1.778" layer="97">&gt;SPICEEXTRA</text>
</symbol>
<symbol name="C" urn="urn:adsk.eagle:symbol:5272033/1" library_version="16">
<description>Capacitor</description>
<rectangle x1="-2.032" y1="-2.032" x2="2.032" y2="-1.524" layer="94"/>
<rectangle x1="-2.032" y1="-1.016" x2="2.032" y2="-0.508" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<pin name="1" x="0" y="2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
<text x="2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-2.54" size="1.778" layer="97">&gt;SPICEMODEL</text>
<text x="2.54" y="0" size="1.778" layer="96">&gt;VALUE</text>
<text x="2.54" y="-5.08" size="1.778" layer="97">&gt;SPICEEXTRA</text>
</symbol>
<symbol name="0" urn="urn:adsk.eagle:symbol:527455/1" library_version="16">
<description>Simulation ground symbol (spice node 0)</description>
<wire x1="-2.54" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<pin name="0" x="0" y="0" visible="off" length="point" direction="sup"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="FET_P" urn="urn:adsk.eagle:component:5272064/1" prefix="M" uservalue="yes" library_version="16">
<description>P-Type MOS Field Effect Transistor (MOSFET)</description>
<gates>
<gate name="G$1" symbol="FET-P" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="_EXTERNAL_" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
<spice>
<pinmapping spiceprefix="M">
<pinmap gate="G$1" pin="D1" pinorder="1"/>
<pinmap gate="G$1" pin="G1" pinorder="2"/>
<pinmap gate="G$1" pin="S1" pinorder="3"/>
</pinmapping>
<model name="PFET">
**********************
* Autodesk EAGLE - Spice Model File
* Date: 9/17/17
* basic pfet intrinsic model
**********************
.MODEL PFET PMOS (LEVEL=3)</model>
</spice>
</deviceset>
<deviceset name="FET_N" urn="urn:adsk.eagle:component:5272055/1" prefix="M" uservalue="yes" library_version="16">
<description>N-Type MOS Field Effect Transistor (MOSFET)</description>
<gates>
<gate name="G$1" symbol="FET-N" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="_EXTERNAL_" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
<spice>
<pinmapping spiceprefix="M">
<pinmap gate="G$1" pin="D" pinorder="1"/>
<pinmap gate="G$1" pin="G" pinorder="2"/>
<pinmap gate="G$1" pin="S" pinorder="3"/>
</pinmapping>
<model name="NFET">
**********************
* Autodesk EAGLE - Spice Model File
* Date: 9/17/17
* basic nfet intrinsic model
**********************
.MODEL NFET NMOS (LEVEL=3)</model>
</spice>
</deviceset>
<deviceset name="BJT_PNP" urn="urn:adsk.eagle:component:5272059/1" prefix="Q" uservalue="yes" library_version="16">
<description>Bipolar PNP Transistor</description>
<gates>
<gate name="G$1" symbol="BJT-PNP" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="_EXTERNAL_" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
<spice>
<pinmapping spiceprefix="Q">
<pinmap gate="G$1" pin="B" pinorder="2"/>
<pinmap gate="G$1" pin="C" pinorder="1"/>
<pinmap gate="G$1" pin="E" pinorder="3"/>
</pinmapping>
<model name="QPNP">
**********************
* Autodesk EAGLE - Spice Model File
* Date: 9/17/17
* basic pnp intrinsic model
**********************
.MODEL QPNP PNP</model>
</spice>
</deviceset>
<deviceset name="BJT_NPN" urn="urn:adsk.eagle:component:5272057/1" prefix="Q" uservalue="yes" library_version="16">
<description>Bipolar NPN Transistor</description>
<gates>
<gate name="G$1" symbol="BJT-NPN" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="_EXTERNAL_" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
<spice>
<pinmapping spiceprefix="Q">
<pinmap gate="G$1" pin="B" pinorder="2"/>
<pinmap gate="G$1" pin="C" pinorder="1"/>
<pinmap gate="G$1" pin="E" pinorder="3"/>
</pinmapping>
<model name="QNPN">
**********************
* Autodesk EAGLE - Spice Model File
* Date: 9/17/17
* basic npn intrinsic model
**********************
.MODEL QNPN NPN</model>
</spice>
</deviceset>
<deviceset name="R" urn="urn:adsk.eagle:component:5272053/1" prefix="R" uservalue="yes" library_version="16">
<description>RESISTOR</description>
<gates>
<gate name="G$1" symbol="R" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="_EXTERNAL_" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
<spice>
<pinmapping spiceprefix="R">
<pinmap gate="G$1" pin="1" pinorder="1"/>
<pinmap gate="G$1" pin="2" pinorder="2"/>
</pinmapping>
</spice>
</deviceset>
<deviceset name="C" urn="urn:adsk.eagle:component:5272047/1" prefix="C" uservalue="yes" library_version="16">
<description>CAPACITOR</description>
<gates>
<gate name="G$1" symbol="C" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="_EXTERNAL_" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
<spice>
<pinmapping spiceprefix="C">
<pinmap gate="G$1" pin="1" pinorder="1"/>
<pinmap gate="G$1" pin="2" pinorder="2"/>
</pinmapping>
</spice>
</deviceset>
<deviceset name="GND" urn="urn:adsk.eagle:component:527478/1" prefix="X_" library_version="16">
<description>Simulation ground symbol (spice node 0)</description>
<gates>
<gate name="G$1" symbol="0" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="SPICEGROUND" value=""/>
<attribute name="_EXTERNAL_" value=""/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="M1" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="FET_P" device=""/>
<part name="M2" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="FET_P" device=""/>
<part name="M3" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="FET_P" device=""/>
<part name="M4" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="FET_P" device=""/>
<part name="M5" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="FET_N" device=""/>
<part name="M6" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="FET_N" device=""/>
<part name="Q1" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="BJT_PNP" device=""/>
<part name="Q2" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="BJT_NPN" device=""/>
<part name="Q3" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="BJT_NPN" device=""/>
<part name="Q4" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="BJT_NPN" device=""/>
<part name="R1" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="R" device="" value="2.22k"/>
<part name="R2" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="R" device="" value="20"/>
<part name="R3" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="R" device="" value="5.1k"/>
<part name="RL" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="R" device="" value="500"/>
<part name="C1" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="C" device="" value="5.6n"/>
<part name="X_1" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="GND" device=""/>
<part name="RREF" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="R" device="" value="19k"/>
<part name="RF" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="R" device="" value="20k"/>
<part name="R5" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="R" device="" value="1k"/>
<part name="X_3" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="M1" gate="G$1" x="96.52" y="60.96" rot="MR0">
<attribute name="NAME" x="86.36" y="63.5" size="1.778" layer="95" rot="MR0"/>
<attribute name="VALUE" x="86.36" y="60.96" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="M2" gate="G$1" x="43.18" y="60.96">
<attribute name="NAME" x="53.34" y="63.5" size="1.778" layer="95"/>
<attribute name="VALUE" x="53.34" y="60.96" size="1.778" layer="96"/>
</instance>
<instance part="M3" gate="G$1" x="63.5" y="86.36">
<attribute name="NAME" x="73.66" y="88.9" size="1.778" layer="95"/>
<attribute name="VALUE" x="73.66" y="86.36" size="1.778" layer="96"/>
</instance>
<instance part="M4" gate="G$1" x="22.86" y="86.36" rot="MR0">
<attribute name="NAME" x="12.7" y="88.9" size="1.778" layer="95" rot="MR0"/>
<attribute name="VALUE" x="12.7" y="86.36" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="M5" gate="G$1" x="53.34" y="22.86" rot="MR0">
<attribute name="NAME" x="43.18" y="25.4" size="1.778" layer="95" rot="MR0"/>
<attribute name="VALUE" x="43.18" y="22.86" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="M6" gate="G$1" x="86.36" y="22.86">
<attribute name="NAME" x="96.52" y="25.4" size="1.778" layer="95"/>
<attribute name="VALUE" x="96.52" y="22.86" size="1.778" layer="96"/>
</instance>
<instance part="Q1" gate="G$1" x="187.96" y="22.86">
<attribute name="NAME" x="195.58" y="25.4" size="1.778" layer="95"/>
<attribute name="VALUE" x="195.58" y="22.86" size="1.778" layer="96"/>
</instance>
<instance part="Q2" gate="G$1" x="121.92" y="48.26">
<attribute name="NAME" x="129.54" y="50.8" size="1.778" layer="95"/>
<attribute name="VALUE" x="129.54" y="48.26" size="1.778" layer="96"/>
</instance>
<instance part="Q3" gate="G$1" x="147.32" y="38.1">
<attribute name="NAME" x="154.94" y="40.64" size="1.778" layer="95"/>
<attribute name="VALUE" x="154.94" y="38.1" size="1.778" layer="96"/>
</instance>
<instance part="Q4" gate="G$1" x="187.96" y="68.58">
<attribute name="NAME" x="195.58" y="71.12" size="1.778" layer="95"/>
<attribute name="VALUE" x="195.58" y="68.58" size="1.778" layer="96"/>
</instance>
<instance part="R1" gate="G$1" x="124.46" y="20.32" rot="R90">
<attribute name="NAME" x="121.92" y="17.78" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="128.27" y="17.78" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R2" gate="G$1" x="149.86" y="15.24" rot="R90">
<attribute name="NAME" x="147.32" y="12.7" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="153.67" y="12.7" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R3" gate="G$1" x="149.86" y="76.2" rot="R90">
<attribute name="NAME" x="147.32" y="73.66" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="153.67" y="73.66" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="RL" gate="G$1" x="213.36" y="27.94" rot="R90">
<attribute name="NAME" x="210.82" y="25.4" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="217.17" y="25.4" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="C1" gate="G$1" x="165.1" y="22.86">
<attribute name="NAME" x="167.64" y="25.4" size="1.778" layer="95"/>
<attribute name="VALUE" x="167.64" y="22.86" size="1.778" layer="96"/>
</instance>
<instance part="X_1" gate="G$1" x="213.36" y="10.16"/>
<instance part="RREF" gate="G$1" x="17.78" y="38.1" rot="R90">
<attribute name="NAME" x="15.24" y="35.56" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="21.59" y="35.56" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="RF" gate="G$1" x="167.64" y="88.9">
<attribute name="NAME" x="165.1" y="91.44" size="1.778" layer="95"/>
<attribute name="VALUE" x="165.1" y="85.09" size="1.778" layer="96"/>
</instance>
<instance part="R5" gate="G$1" x="101.6" y="88.9">
<attribute name="NAME" x="99.06" y="91.44" size="1.778" layer="95"/>
<attribute name="VALUE" x="99.06" y="85.09" size="1.778" layer="96"/>
</instance>
<instance part="X_3" gate="G$1" x="33.02" y="58.42"/>
</instances>
<busses>
</busses>
<nets>
<net name="VDD" class="0">
<segment>
<pinref part="M4" gate="G$1" pin="S1"/>
<wire x1="17.78" y1="99.06" x2="68.58" y2="99.06" width="0.1524" layer="91"/>
<pinref part="Q4" gate="G$1" pin="C"/>
<wire x1="68.58" y1="99.06" x2="101.6" y2="99.06" width="0.1524" layer="91"/>
<wire x1="101.6" y1="99.06" x2="124.46" y2="99.06" width="0.1524" layer="91"/>
<wire x1="124.46" y1="99.06" x2="149.86" y2="99.06" width="0.1524" layer="91"/>
<wire x1="149.86" y1="99.06" x2="190.5" y2="99.06" width="0.1524" layer="91"/>
<wire x1="190.5" y1="99.06" x2="190.5" y2="78.74" width="0.1524" layer="91"/>
<pinref part="M3" gate="G$1" pin="S1"/>
<junction x="68.58" y="99.06"/>
<pinref part="Q2" gate="G$1" pin="C"/>
<wire x1="124.46" y1="58.42" x2="124.46" y2="99.06" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="149.86" y1="81.28" x2="149.86" y2="99.06" width="0.1524" layer="91"/>
<junction x="149.86" y="99.06"/>
<wire x1="101.6" y1="99.06" x2="101.6" y2="104.14" width="0.1524" layer="91"/>
<junction x="101.6" y="99.06"/>
<label x="101.6" y="106.68" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="Q1" gate="G$1" pin="E"/>
<pinref part="Q4" gate="G$1" pin="E"/>
<wire x1="190.5" y1="33.02" x2="190.5" y2="48.26" width="0.1524" layer="91"/>
<pinref part="RL" gate="G$1" pin="2"/>
<wire x1="190.5" y1="48.26" x2="190.5" y2="58.42" width="0.1524" layer="91"/>
<wire x1="213.36" y1="33.02" x2="213.36" y2="48.26" width="0.1524" layer="91"/>
<wire x1="213.36" y1="48.26" x2="190.5" y2="48.26" width="0.1524" layer="91"/>
<junction x="190.5" y="48.26"/>
<pinref part="RF" gate="G$1" pin="2"/>
<wire x1="213.36" y1="48.26" x2="213.36" y2="88.9" width="0.1524" layer="91"/>
<wire x1="213.36" y1="88.9" x2="172.72" y2="88.9" width="0.1524" layer="91"/>
<junction x="213.36" y="48.26"/>
</segment>
</net>
<net name="0" class="0">
<segment>
<pinref part="RL" gate="G$1" pin="1"/>
<pinref part="X_1" gate="G$1" pin="0"/>
<wire x1="213.36" y1="22.86" x2="213.36" y2="10.16" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="X_3" gate="G$1" pin="0"/>
<wire x1="33.02" y1="58.42" x2="33.02" y2="60.96" width="0.1524" layer="91"/>
<pinref part="M2" gate="G$1" pin="G1"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="M5" gate="G$1" pin="D"/>
<pinref part="M2" gate="G$1" pin="D1"/>
<wire x1="48.26" y1="35.56" x2="48.26" y2="48.26" width="0.1524" layer="91"/>
<pinref part="M5" gate="G$1" pin="G"/>
<pinref part="M6" gate="G$1" pin="G"/>
<wire x1="63.5" y1="22.86" x2="68.58" y2="22.86" width="0.1524" layer="91"/>
<wire x1="68.58" y1="22.86" x2="76.2" y2="22.86" width="0.1524" layer="91"/>
<wire x1="48.26" y1="35.56" x2="68.58" y2="35.56" width="0.1524" layer="91"/>
<wire x1="68.58" y1="35.56" x2="68.58" y2="22.86" width="0.1524" layer="91"/>
<junction x="48.26" y="35.56"/>
<junction x="68.58" y="22.86"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="S1"/>
<pinref part="M1" gate="G$1" pin="S1"/>
<wire x1="48.26" y1="73.66" x2="68.58" y2="73.66" width="0.1524" layer="91"/>
<pinref part="M3" gate="G$1" pin="D1"/>
<wire x1="68.58" y1="73.66" x2="91.44" y2="73.66" width="0.1524" layer="91"/>
<junction x="68.58" y="73.66"/>
</segment>
</net>
<net name="VSS" class="0">
<segment>
<pinref part="Q1" gate="G$1" pin="C"/>
<wire x1="17.78" y1="10.16" x2="48.26" y2="10.16" width="0.1524" layer="91"/>
<wire x1="48.26" y1="10.16" x2="91.44" y2="10.16" width="0.1524" layer="91"/>
<wire x1="91.44" y1="10.16" x2="104.14" y2="10.16" width="0.1524" layer="91"/>
<wire x1="104.14" y1="10.16" x2="124.46" y2="10.16" width="0.1524" layer="91"/>
<wire x1="124.46" y1="10.16" x2="149.86" y2="10.16" width="0.1524" layer="91"/>
<wire x1="149.86" y1="10.16" x2="165.1" y2="10.16" width="0.1524" layer="91"/>
<wire x1="165.1" y1="10.16" x2="190.5" y2="10.16" width="0.1524" layer="91"/>
<wire x1="190.5" y1="10.16" x2="190.5" y2="12.7" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="124.46" y1="15.24" x2="124.46" y2="10.16" width="0.1524" layer="91"/>
<junction x="124.46" y="10.16"/>
<pinref part="M5" gate="G$1" pin="S"/>
<junction x="48.26" y="10.16"/>
<pinref part="M6" gate="G$1" pin="S"/>
<junction x="91.44" y="10.16"/>
<pinref part="R2" gate="G$1" pin="1"/>
<junction x="149.86" y="10.16"/>
<pinref part="RREF" gate="G$1" pin="1"/>
<wire x1="17.78" y1="33.02" x2="17.78" y2="10.16" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="165.1" y1="17.78" x2="165.1" y2="10.16" width="0.1524" layer="91"/>
<junction x="165.1" y="10.16"/>
<wire x1="104.14" y1="10.16" x2="104.14" y2="2.54" width="0.1524" layer="91"/>
<junction x="104.14" y="10.16"/>
<label x="104.14" y="0" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="M6" gate="G$1" pin="D"/>
<pinref part="M1" gate="G$1" pin="D1"/>
<wire x1="91.44" y1="35.56" x2="91.44" y2="48.26" width="0.1524" layer="91"/>
<pinref part="Q2" gate="G$1" pin="B"/>
<wire x1="114.3" y1="48.26" x2="91.44" y2="48.26" width="0.1524" layer="91"/>
<junction x="91.44" y="48.26"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<wire x1="17.78" y1="73.66" x2="43.18" y2="73.66" width="0.1524" layer="91"/>
<wire x1="43.18" y1="73.66" x2="43.18" y2="86.36" width="0.1524" layer="91"/>
<pinref part="M4" gate="G$1" pin="G1"/>
<wire x1="43.18" y1="86.36" x2="33.02" y2="86.36" width="0.1524" layer="91"/>
<pinref part="M3" gate="G$1" pin="G1"/>
<wire x1="53.34" y1="86.36" x2="43.18" y2="86.36" width="0.1524" layer="91"/>
<junction x="43.18" y="86.36"/>
<pinref part="M4" gate="G$1" pin="D1"/>
<pinref part="RREF" gate="G$1" pin="2"/>
<wire x1="17.78" y1="73.66" x2="17.78" y2="43.18" width="0.1524" layer="91"/>
<junction x="17.78" y="73.66"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="Q4" gate="G$1" pin="B"/>
<pinref part="Q1" gate="G$1" pin="B"/>
<wire x1="180.34" y1="68.58" x2="180.34" y2="48.26" width="0.1524" layer="91"/>
<wire x1="180.34" y1="48.26" x2="180.34" y2="22.86" width="0.1524" layer="91"/>
<junction x="180.34" y="48.26"/>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="165.1" y1="48.26" x2="180.34" y2="48.26" width="0.1524" layer="91"/>
<wire x1="165.1" y1="25.4" x2="165.1" y2="48.26" width="0.1524" layer="91"/>
<pinref part="Q3" gate="G$1" pin="C"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="149.86" y1="71.12" x2="149.86" y2="48.26" width="0.1524" layer="91"/>
<wire x1="165.1" y1="48.26" x2="149.86" y2="48.26" width="0.1524" layer="91"/>
<junction x="165.1" y="48.26"/>
<junction x="149.86" y="48.26"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="Q3" gate="G$1" pin="E"/>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="149.86" y1="27.94" x2="149.86" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="Q2" gate="G$1" pin="E"/>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="Q3" gate="G$1" pin="B"/>
<wire x1="124.46" y1="38.1" x2="124.46" y2="25.4" width="0.1524" layer="91"/>
<wire x1="124.46" y1="38.1" x2="139.7" y2="38.1" width="0.1524" layer="91"/>
<junction x="124.46" y="38.1"/>
</segment>
</net>
<net name="VIN" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="96.52" y1="88.9" x2="91.44" y2="88.9" width="0.1524" layer="91"/>
<label x="91.44" y="91.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="G1"/>
<wire x1="106.68" y1="60.96" x2="114.3" y2="60.96" width="0.1524" layer="91"/>
<wire x1="114.3" y1="60.96" x2="114.3" y2="88.9" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="114.3" y1="88.9" x2="106.68" y2="88.9" width="0.1524" layer="91"/>
<pinref part="RF" gate="G$1" pin="1"/>
<wire x1="162.56" y1="88.9" x2="114.3" y2="88.9" width="0.1524" layer="91"/>
<junction x="114.3" y="88.9"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.4" severity="warning">
Since Version 8.4, EAGLE supports properties for SPICE simulation. 
Probes in schematics and SPICE mapping objects found in parts and library devices
will not be understood with this version. Update EAGLE to the latest version
for full support of SPICE simulation. 
</note>
</compatibility>
</eagle>
