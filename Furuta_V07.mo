package Furuta_V03
  model Ges_Integration_fin_03
    Modelica.Blocks.Sources.Constant Soll_Pend(k = 0/180*3.14159) annotation(
      Placement(transformation(origin = {-150, 30}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Pend(controllerType = Modelica.Blocks.Types.SimpleController.PD, k = 1000, Td = 0.05, Nd = 100) annotation(
      Placement(transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Add add(k1 = +1, k2 = -1) annotation(
      Placement(transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Rot(Nd = 100, Td = 5, controllerType = Modelica.Blocks.Types.SimpleController.PI, k = 0.05, Ti = 1) annotation(
      Placement(transformation(origin = {-150, -10}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant Soll_Pend1(k = 0) annotation(
      Placement(transformation(origin = {-190, -10}, extent = {{-10, -10}, {10, 10}})));
    Akt_gestuft_fin_03 akt_gestuft_fin_03 annotation(
      Placement(transformation(origin = {-10, 50}, extent = {{-30, -30}, {30, 30}})));
    Pendel_Mechanik_fin_04 pendel_Mechanik_fin_04 annotation(
      Placement(transformation(origin = {70, 50}, extent = {{-30, -30}, {30, 30}})));
  equation
    connect(PID_lim_Pend.u_s, add.y) annotation(
      Line(points = {{-82, 30}, {-99, 30}}, color = {0, 0, 127}));
    connect(PID_lim_Rot.u_s, Soll_Pend1.y) annotation(
      Line(points = {{-162, -10}, {-179, -10}}, color = {0, 0, 127}));
    connect(add.u2, PID_lim_Rot.y) annotation(
      Line(points = {{-122, 24}, {-128, 24}, {-128, -10}, {-138, -10}}, color = {0, 0, 127}));
    connect(add.u1, Soll_Pend.y) annotation(
      Line(points = {{-122, 36}, {-132, 36}, {-132, 30}, {-138, 30}}, color = {0, 0, 127}));
    connect(akt_gestuft_fin_03.Trq_Soll, PID_lim_Pend.y) annotation(
      Line(points = {{-40, 38}, {-50, 38}, {-50, 30}, {-58, 30}}, color = {0, 0, 127}));
    connect(akt_gestuft_fin_03.Trq_Ist, pendel_Mechanik_fin_04.In_Torque_Rot) annotation(
      Line(points = {{23, 50}, {39, 50}}, color = {0, 0, 127}));
    connect(akt_gestuft_fin_03.w_Mot, pendel_Mechanik_fin_04.Out_w_Rot) annotation(
      Line(points = {{-40, 62}, {-56, 62}, {-56, 90}, {140, 90}, {140, 68}, {104, 68}}, color = {0, 0, 127}));
  connect(pendel_Mechanik_fin_04.Out_w_Rot, PID_lim_Rot.u_m) annotation(
      Line(points = {{104, 68}, {140, 68}, {140, -40}, {-150, -40}, {-150, -22}}, color = {0, 0, 127}));
  connect(pendel_Mechanik_fin_04.Out_Angle_Pend, PID_lim_Pend.u_m) annotation(
      Line(points = {{104, 32}, {120, 32}, {120, -20}, {-70, -20}, {-70, 18}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 12, Tolerance = 1e-05, Interval = 0.0001),
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      Diagram);
  end Ges_Integration_fin_03;

  block Pendel_Mechanik_fin_04
    //
    //ANFANG Parametrierung des Furuta-Pendels
    //
    // Geometrie
    parameter Real D_GrPlatte = 0.200 "Durchmesser Grundplatte (m)";
    // Durchmesser der Grundplatte in m ; (0.200)
    parameter Real H_GrPlatte = 0.014 "Hoehe Grundplatte (m)";
    // Hoehe der Grundplatte in m ; (0.014)
    parameter Real D_Stator = 0.065 "Durchmesser Stator (m)";
    // Durchmesser Stator in m ; (0.065)
    parameter Real Di_Stator = 0.060 "Innen-Durchmesser Stator (m)";
    // I-Durchmesser Stator in m ; (0.060)
    parameter Real H_Stator = 0.045 "Hoehe Stator (m)";
    // Hoehe Stator in m ; (0.045)
    parameter Real D_Rotor = 0.065 "Durchmesser Rotor (m)";
    // Durchmesser Rotors in m ; (0.065)
    parameter Real Di_Rotor = 0.061 "Innen-Durchmesser Rotor (m)";
    // I-Durchmesser Rotors in m ; (0.061)
    parameter Real H_Rotor = 0.059 "Hoehe Rotor (m)";
    // Hoehe Rotor in m ; (0.059)
    parameter Real D_Deckel = 0.065 "Durchmesser Deckel (m)";
    // Durchmesser des Deckels in m ; (0.065)
    parameter Real H_Deckel = 0.002 "Dicke Deckel (m)";
    // Dicke des Deckels in m ; (0.002) >> für Abgleich Rotor-Traegheitsmoments
    parameter Real D_Pendel = 0.006 "Durchmesser Pendel (m)";
    // Durchmesser des Pendels in m ; (0.006)
    parameter Real L_Pendel = 0.075 "Laenge Pendel (m)";
    // Laenge des Pendels in m ; (0.075)
    // Reibung und Daempfung
    parameter Real F_Damp_Pend = 3e-7 "Faktor Daempfung Pendel (Nms/rad)";
    // Faktor Daempfung Pendel 0 > ohne Daempfung (def 3e-7)
    parameter Real F_Reib_Pend = 5e-6 "Faktor Reibung Pendel ()";
    // Reibung Pendel Fak_Reib = 0       > Reibungsfrei
    // Reibung Pendel Fak_Reib = 5e-6 > Reibung 0.5 myNm
    parameter Real F_Damp_Rot = 3e-6 "Faktor Daempfung Rotor (Nms/rad)";
    // Faktor Daempfung Rot 0 > ohne Daempfung (def 3e-6)
    parameter Real F_Reib_Rot = 5e-5 "Faktor Reibung Rotor ()";
    // Reibung Pendel F_Reib_Rot = 5e-5    > Reibung 5 myNm
    // Reibung Pendel F_Reib_Rot = 0       > Reibungsfrei
    // Reibung Pendel F_Reib_Rot = 1000    > Rotor blockiert !! NICHT zur Modellierung mit Antrieb, nur für freies Ausschwingen !!
    //
    // weitere Parameter
    parameter Real Rho_Furuta = 7700 "Dichte Pendelbauteile (kg/m^3)";
    // Dichte der Bauteile des Furuta-Pendels in kg/m^3 ; (7700)
    parameter Real phi_0_Pend = 40/180*3.14 "Anfangsauslegung Pendel (rad)";
    // Auslenkung des Pendels zum Zeitpunkt t= 0 in rad
    parameter Real phi_0_Rot = -90/180*3.14 "Anfangsauslegung Rotor (rad)";
    // Auslenkung des Rotors zum Zeitpunkt t= 0 in rad
    //
    //ENDE Parametrierung des Furuta-Pendels
    //
    inner Modelica.Mechanics.MultiBody.World world(nominalLength = 0.35) annotation(
      Placement(transformation(origin = {-122, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Grundplatte(final color = {128, 0, 0}, density = Rho_Furuta, diameter(displayUnit = "mm") = D_GrPlatte, length(displayUnit = "mm") = H_GrPlatte, r(each displayUnit = "mm") = {0, 0.014, 0}) annotation(
      Placement(transformation(origin = {-96, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Stator(color = {128, 0, 0}, density = Rho_Furuta, diameter(displayUnit = "mm") = D_Stator, innerDiameter(displayUnit = "mm") = Di_Stator, length(displayUnit = "mm") = H_Stator, r(each displayUnit = "mm") = {0, H_Stator, 0}) annotation(
      Placement(transformation(origin = {-72, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Rotor(color = {0, 128, 0}, density = Rho_Furuta, diameter(displayUnit = "mm") = D_Rotor, innerDiameter(displayUnit = "mm") = Di_Rotor, length(displayUnit = "mm") = D_Rotor, r(each displayUnit = "mm") = {0, D_Rotor, 0}) annotation(
      Placement(transformation(origin = {-24, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Joints.Revolute rev_Stat_Rot(n = {0, 1, 0}, phi(start = phi_0_Rot), useAxisFlange = true) annotation(
      Placement(transformation(origin = {-48, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pin_Rot(color = {0, 128, 0}, density = 0, diameter(displayUnit = "mm") = 0.004, length(displayUnit = "mm") = 0.005, r(each displayUnit = "mm") = {(D_Rotor/2 + 0.0015), -0.005, 0}, r_shape(each displayUnit = "mm") = {(D_Rotor/2 - 0.0001), -0.005, 0}) annotation(
      Placement(transformation(origin = {2, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pin_Pen(color = {0, 0, 128}, density = 0, diameter(displayUnit = "mm") = 0.004, length(displayUnit = "mm") = 0.005, r(each displayUnit = "mm") = {0.005, 0, 0}) annotation(
      Placement(transformation(origin = {52, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pendel(color = {0, 0, 128}, density = Rho_Furuta, diameter(displayUnit = "mm") = D_Pendel, length(displayUnit = "mm") = L_Pendel, lengthDirection = {0, 1, 0}, r(each displayUnit = "mm") = {0, 0, 0}, r_shape(each displayUnit = "mm") = {0, -0.005, 0}) annotation(
      Placement(transformation(origin = {76, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Deckel(color = {128, 128, 0}, density = Rho_Furuta, diameter(displayUnit = "mm") = D_Deckel, length(displayUnit = "mm") = H_Deckel, r(each displayUnit = "mm") = {0, H_Deckel, 0}) annotation(
      Placement(transformation(origin = {2, -64}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Joints.Revolute rev_Rot_Pend(cylinderDiameter(displayUnit = "mm") = 0.007, cylinderLength(displayUnit = "mm") = 0.002, n = {1, 0, 0}, phi(fixed = true, start = phi_0_Pend), useAxisFlange = true) annotation(
      Placement(transformation(origin = {28, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.Rotational.Sensors.RelAngleSensor Angle_Pend annotation(
      Placement(transformation(origin = {32, 26}, extent = {{-10, 10}, {10, -10}})));
    Modelica.Mechanics.Rotational.Sources.Torque2 Torque_Rot annotation(
      Placement(transformation(origin = {-58, 66}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.Rotational.Sensors.RelAngleSensor Angle_Rot annotation(
      Placement(transformation(origin = {-58, 26}, extent = {{-10, 10}, {10, -10}})));
    Modelica.Blocks.Interfaces.RealInput In_Torque_Rot annotation(
      Placement(transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Interfaces.RealOutput Out_Angle_Rot annotation(
      Placement(transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealOutput Out_Angle_Pend annotation(
      Placement(transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.Derivative derivative annotation(
      Placement(transformation(origin = {22, 80}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealOutput Out_w_Rot annotation(
      Placement(transformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.Rotational.Components.Damper Damp_Pend(d = F_Damp_Pend) annotation(
      Placement(transformation(origin = {32, -50}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.Rotational.Components.Clutch Reib_Rot(mu_pos = [0, 0.1]) annotation(
      Placement(transformation(origin = {-58, -20}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant Stat_Kuppl(k = F_Reib_Rot) annotation(
      Placement(transformation(origin = {-30, 4}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
    Modelica.Mechanics.Rotational.Components.Clutch Reib_Pend(mu_pos = [0, 0.1]) annotation(
      Placement(transformation(origin = {32, -20}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant Fakt_Reib(k = F_Reib_Pend) annotation(
      Placement(transformation(origin = {60, 4}, extent = {{10, -10}, {-10, 10}})));
    Modelica.Mechanics.Rotational.Components.Damper Damp_Rot(d = F_Damp_Rot) annotation(
      Placement(transformation(origin = {-58, -50}, extent = {{-10, -10}, {10, 10}})));
  equation
    connect(world.frame_b, Grundplatte.frame_a) annotation(
      Line(points = {{-112, -82}, {-106, -82}}, color = {95, 95, 95}));
    connect(Grundplatte.frame_b, Stator.frame_a) annotation(
      Line(points = {{-86, -82}, {-82, -82}}, color = {95, 95, 95}));
    connect(Stator.frame_b, rev_Stat_Rot.frame_a) annotation(
      Line(points = {{-62, -82}, {-58, -82}}, color = {95, 95, 95}));
    connect(rev_Stat_Rot.frame_b, Rotor.frame_a) annotation(
      Line(points = {{-38, -82}, {-34, -82}}, color = {95, 95, 95}));
    connect(Rotor.frame_b, Pin_Rot.frame_a) annotation(
      Line(points = {{-14, -82}, {-8, -82}}, color = {95, 95, 95}));
    connect(Pin_Pen.frame_b, Pendel.frame_a) annotation(
      Line(points = {{62, -82}, {66, -82}}, color = {95, 95, 95}));
    connect(Deckel.frame_a, Rotor.frame_b) annotation(
      Line(points = {{-8, -64}, {-14, -64}, {-14, -82}}, color = {95, 95, 95}));
    connect(Pin_Rot.frame_b, rev_Rot_Pend.frame_a) annotation(
      Line(points = {{12, -82}, {18, -82}}, color = {95, 95, 95}));
    connect(rev_Rot_Pend.frame_b, Pin_Pen.frame_a) annotation(
      Line(points = {{38, -82}, {42, -82}}, color = {95, 95, 95}));
    connect(Angle_Pend.flange_a, rev_Rot_Pend.support) annotation(
      Line(points = {{22, 26}, {22, -72}}));
    connect(Angle_Pend.flange_b, rev_Rot_Pend.axis) annotation(
      Line(points = {{42, 26}, {42, -66}, {28, -66}, {28, -72}}));
    connect(Torque_Rot.flange_b, rev_Stat_Rot.axis) annotation(
      Line(points = {{-48, 66}, {-48, -72}}));
    connect(Angle_Rot.flange_a, Torque_Rot.flange_a) annotation(
      Line(points = {{-68, 26}, {-68, 66}}));
    connect(Angle_Rot.flange_b, Torque_Rot.flange_b) annotation(
      Line(points = {{-48, 26}, {-48, 66}}));
    connect(rev_Stat_Rot.support, Angle_Rot.flange_a) annotation(
      Line(points = {{-54, -72}, {-54, -66}, {-68, -66}, {-68, 26}}));
    connect(Out_w_Rot, derivative.y) annotation(
      Line(points = {{110, 80}, {33, 80}}, color = {0, 0, 127}));
    connect(In_Torque_Rot, Torque_Rot.tau) annotation(
      Line(points = {{-120, 80}, {-58, 80}, {-58, 70}}, color = {0, 0, 127}));
    connect(Reib_Rot.flange_a, rev_Stat_Rot.support) annotation(
      Line(points = {{-68, -20}, {-68, -66}, {-54, -66}, {-54, -72}}));
    connect(Reib_Rot.flange_b, rev_Stat_Rot.axis) annotation(
      Line(points = {{-48, -20}, {-48, -72}}));
    connect(Reib_Pend.flange_a, rev_Rot_Pend.support) annotation(
      Line(points = {{22, -20}, {22, -72}}));
    connect(Reib_Pend.flange_b, rev_Rot_Pend.axis) annotation(
      Line(points = {{42, -20}, {42, -66}, {28, -66}, {28, -72}}));
    connect(Damp_Pend.flange_a, rev_Rot_Pend.support) annotation(
      Line(points = {{22, -50}, {22, -72}}));
    connect(Damp_Pend.flange_b, rev_Rot_Pend.axis) annotation(
      Line(points = {{42, -50}, {42, -66}, {28, -66}, {28, -72}}));
    connect(Fakt_Reib.y, Reib_Pend.f_normalized) annotation(
      Line(points = {{49, 4}, {32, 4}, {32, -9}}, color = {0, 0, 127}));
    connect(Angle_Pend.phi_rel, Out_Angle_Pend) annotation(
      Line(points = {{32, 38}, {32, 40}, {110, 40}}, color = {0, 0, 127}));
    connect(Stat_Kuppl.y, Reib_Rot.f_normalized) annotation(
      Line(points = {{-41, 4}, {-58, 4}, {-58, -8}}, color = {0, 0, 127}));
    connect(Out_Angle_Rot, Angle_Rot.phi_rel) annotation(
      Line(points = {{110, 60}, {-20, 60}, {-20, 45}, {-58, 45}, {-58, 37}}, color = {0, 0, 127}));
    connect(derivative.u, Angle_Rot.phi_rel) annotation(
      Line(points = {{10, 80}, {-20, 80}, {-20, 45}, {-58, 45}, {-58, 37}}, color = {0, 0, 127}));
    connect(Damp_Rot.flange_a, rev_Stat_Rot.support) annotation(
      Line(points = {{-68, -50}, {-68, -66}, {-54, -66}, {-54, -72}}));
    connect(Damp_Rot.flange_b, rev_Stat_Rot.axis) annotation(
      Line(points = {{-48, -50}, {-48, -72}}));
    annotation(
      Icon(graphics = {Rectangle(fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-56, 82}, extent = {{-36, 18}, {36, -18}}, textString = "%name"), Text(origin = {48, 3}, extent = {{-40, 15}, {40, -15}}, textString = "Angle_Rot >
  [rad]", horizontalAlignment = TextAlignment.Right), Text(origin = {55, -59}, extent = {{-35, 15}, {35, -15}}, textString = "Angle_Pend >
  [rad]", horizontalAlignment = TextAlignment.Right), Text(origin = {-51, 1}, extent = {{-25, 15}, {25, -15}}, textString = "> Torque
  [Nm]", horizontalAlignment = TextAlignment.Left), Text(origin = {55, 63}, extent = {{-29, 15}, {29, -15}}, textString = "w_Rot >
  [rad/s]", horizontalAlignment = TextAlignment.Right)}),
      uses(Modelica(version = "4.1.0")),
      Diagram(graphics = {Text(origin = {129, -48}, extent = {{-47, 26}, {47, -26}}, textString = "- Die Parameter können in der Code_Ansicht 
   verändert werden
  - mit drehzahlunabhängiger Reibung und 
  drehzahlabhängiger Dämpfung für Rotor und Pendel", horizontalAlignment = TextAlignment.Left), Text(origin = {-129, -37}, extent = {{-41, 19}, {41, -19}}, textString = "Furuta-Pendel als parametrierbarer Block
   
  Eingang: 
  - Moment [Nm]
    
  Ausgänge: 
  - Winkel Rotor und Pendel [rad]
  - Winkelgeschwindigkeit Rotor [rad/s]", horizontalAlignment = TextAlignment.Left)}),
      experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-05, Interval = 0.0001),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Pendel_Mechanik_fin_04;
  
  block Akt_gestuft_fin_03
    //
    // ANFANG Parametrierung des gestuften Aktuatormodells
    //
    // Stufe 1 - ideale Momentquelle
    parameter Real Trq_max_St1 = 0.450 "max. Drehmoment St. 1 (Nm)";
    // max. Drehmoment in Stufe 1 in Nm
    //
    // Stufe 2 - dynamische Abstraktion
    parameter Real Trq_max_St2 = 0.450 "max. Drehmoment St. 2 (Nm)";
    // max. Drehmoment in Stufe 2 in Nm
    parameter Real T1_St_2 = 0.0012 "Zeitkonstante St. 2 (s)";
    // T1 des Zeit-Glieds in Stufe 2 in s
    //
    // Stufe 3 - erweiterte Aktuatorsimulation
    parameter Real Trq_max_St3 = 0.450 "max. Drehmoment St. 3 (Nm)";
    // max. Drehmoment in Stufe 3 in Nm
    parameter Real T1_St_3 = 0.0012 "Zeitkonstante St. 3 (s)";
    // T1 des Zeit-Glieds in Stufe 3 in s
    parameter Real N_LL_3 = 577 "LL-Drehzahl St. 3 (rpm)";
    // Maximal-Drehzahl Stufe 3 in rpm
    //
    //  Aktuatorauswahl
    parameter Integer Akt_Stufe = 3 "Aktuator-Stufe 1,2,3";
    //
    // ENDE  Parametrierung des gestuften Aktuatormodells
    //
    //
    Modelica.Blocks.Interfaces.RealOutput Trq_Ist annotation(
      Placement(transformation(origin = {220, -30}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealInput w_Mot annotation(
      Placement(transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Interfaces.RealInput Trq_Soll annotation(
      Placement(transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Sources.Constant w_To_n(k = 60/2/3.1415926) annotation(
      Placement(transformation(origin = {-76, 80}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Product product annotation(
      Placement(transformation(origin = {-38, 74}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Abs abs1 annotation(
      Placement(transformation(origin = {-8, 74}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant n_LL(k = N_LL_3) annotation(
      Placement(transformation(origin = {-8, 42}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Add add(k1 = -1, k2 = +1) annotation(
      Placement(transformation(origin = {26, 68}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Division division annotation(
      Placement(transformation(origin = {58, 62}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Max max annotation(
      Placement(transformation(origin = {90, 56}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant zero(k = 0) annotation(
      Placement(transformation(origin = {58, 36}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter annotation(
      Placement(transformation(origin = {54, -8}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant Trq_Nenn(k = Trq_max_St3) annotation(
      Placement(transformation(origin = {-70, -12}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Product product1 annotation(
      Placement(transformation(origin = {-36, -6}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant const(k = -1) annotation(
      Placement(transformation(origin = {-18, -56}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Product product2 annotation(
      Placement(transformation(origin = {18, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(T(displayUnit = "ms") = T1_St_3, k = 1) annotation(
      Placement(transformation(origin = {90, -8}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Logical.Switch switch1 annotation(
      Placement(transformation(origin = {190, -30}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Nonlinear.Limiter Lim_Torque(uMax = Trq_max_St2, uMin = -Trq_max_St2) annotation(
      Placement(transformation(origin = {50, -70}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.FirstOrder firstOrder1(T(displayUnit = "ms") = T1_St_2, k = 1) annotation(
      Placement(transformation(origin = {82, -70}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Logical.Switch switch11 annotation(
      Placement(transformation(origin = {150, -50}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Nonlinear.Limiter Lim_Torque1(uMax = Trq_max_St1, uMin = -Trq_max_St1) annotation(
      Placement(transformation(origin = {50, -130}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y = Akt_Stufe <> 1)  annotation(
      Placement(transformation(origin = {20, -100}, extent = {{-20, -10}, {20, 10}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = Akt_Stufe == 3) annotation(
      Placement(transformation(origin = {63, -36}, extent = {{-17, -10}, {17, 10}})));
  equation
//
//
    connect(w_To_n.y, product.u1) annotation(
      Line(points = {{-65, 80}, {-51, 80}}, color = {0, 0, 127}));
    connect(abs1.u, product.y) annotation(
      Line(points = {{-20, 74}, {-26, 74}}, color = {0, 0, 127}));
    connect(add.u1, abs1.y) annotation(
      Line(points = {{14, 74}, {4, 74}}, color = {0, 0, 127}));
    connect(add.u2, n_LL.y) annotation(
      Line(points = {{14, 62}, {8, 62}, {8, 42}, {4, 42}}, color = {0, 0, 127}));
    connect(division.u1, add.y) annotation(
      Line(points = {{46, 68}, {38, 68}}, color = {0, 0, 127}));
    connect(division.u2, n_LL.y) annotation(
      Line(points = {{46, 56}, {40, 56}, {40, 42}, {4, 42}}, color = {0, 0, 127}));
    connect(max.u1, division.y) annotation(
      Line(points = {{78, 62}, {70, 62}}, color = {0, 0, 127}));
    connect(max.u2, zero.y) annotation(
      Line(points = {{78, 50}, {74, 50}, {74, 36}, {70, 36}}, color = {0, 0, 127}));
    connect(max.y, product1.u1) annotation(
      Line(points = {{101, 56}, {107, 56}, {107, 14}, {-55, 14}, {-55, 0}, {-49, 0}}, color = {0, 0, 127}));
    connect(product1.u2, Trq_Nenn.y) annotation(
      Line(points = {{-48, -12}, {-59, -12}}, color = {0, 0, 127}));
    connect(product1.y, variableLimiter.limit1) annotation(
      Line(points = {{-25, -6}, {-21, -6}, {-21, 0}, {41, 0}}, color = {0, 0, 127}));
    connect(product2.u2, const.y) annotation(
      Line(points = {{6, -46}, {-1, -46}, {-1, -56}, {-6, -56}}, color = {0, 0, 127}));
    connect(product2.u1, product1.y) annotation(
      Line(points = {{6, -34}, {-2, -34}, {-2, -26}, {-20, -26}, {-20, -6}, {-24, -6}}, color = {0, 0, 127}));
    connect(product2.y, variableLimiter.limit2) annotation(
      Line(points = {{29, -40}, {33, -40}, {33, -16}, {41, -16}}, color = {0, 0, 127}));
    connect(variableLimiter.y, firstOrder.u) annotation(
      Line(points = {{65, -8}, {78, -8}}, color = {0, 0, 127}));
    connect(Trq_Soll, variableLimiter.u) annotation(
      Line(points = {{-120, -40}, {-12, -40}, {-12, -8}, {42, -8}}, color = {0, 0, 127}));
    connect(w_Mot, product.u2) annotation(
      Line(points = {{-120, 40}, {-60, 40}, {-60, 68}, {-50, 68}}, color = {0, 0, 127}));
    connect(switch1.y, Trq_Ist) annotation(
      Line(points = {{201, -30}, {220, -30}}, color = {0, 0, 127}));
    connect(Lim_Torque.y, firstOrder1.u) annotation(
      Line(points = {{61, -70}, {70, -70}}, color = {0, 0, 127}));
    connect(Trq_Soll, Lim_Torque.u) annotation(
      Line(points = {{-120, -40}, {-40, -40}, {-40, -80}, {0, -80}, {0, -70}, {38, -70}}, color = {0, 0, 127}));
    connect(firstOrder.y, switch1.u1) annotation(
      Line(points = {{102, -8}, {112, -8}, {112, -22}, {178, -22}}, color = {0, 0, 127}));
    connect(firstOrder1.y, switch11.u1) annotation(
      Line(points = {{93, -70}, {110, -70}, {110, -42}, {138, -42}}, color = {0, 0, 127}));
    connect(switch11.y, switch1.u3) annotation(
      Line(points = {{162, -50}, {168, -50}, {168, -38}, {178, -38}}, color = {0, 0, 127}));
    connect(switch11.u3, Lim_Torque1.y) annotation(
      Line(points = {{138, -58}, {130, -58}, {130, -130}, {61, -130}}, color = {0, 0, 127}));
    connect(Lim_Torque1.u, Trq_Soll) annotation(
      Line(points = {{38, -130}, {-40, -130}, {-40, -40}, {-120, -40}}, color = {0, 0, 127}));
    connect(switch11.u2, booleanExpression.y) annotation(
      Line(points = {{138, -50}, {120, -50}, {120, -100}, {42, -100}}, color = {255, 0, 255}));
  connect(switch1.u2, booleanExpression1.y) annotation(
      Line(points = {{178, -30}, {100, -30}, {100, -36}, {82, -36}}, color = {255, 0, 255}));
    annotation(
      Icon(graphics = {Rectangle(fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-49, 90}, extent = {{-33, 12}, {33, -12}}, textString = "%name"), Text(origin = {-52, 41}, extent = {{-22, 15}, {22, -15}}, textString = "w_Mot
  [rad/s]", horizontalAlignment = TextAlignment.Left), Text(origin = {-53, -39}, extent = {{-21, 19}, {21, -19}}, textString = "Trq_Soll
  [Nm]", horizontalAlignment = TextAlignment.Left), Text(origin = {75, 1}, extent = {{-17, 15}, {17, -15}}, textString = "Trq_Ist
  [Nm]")}),
      Diagram(graphics = {Text(origin = {24, -125}, extent = {{-12, 3}, {12, -3}}, textString = "Sollmoment"), Text(origin = {73, -121}, extent = {{-13, 7}, {13, -7}}, textString = "Ist-
  Moment
  Stufe 1"), Text(origin = {27, -77}, extent = {{-13, 5}, {13, -5}}, textString = "Soll-
  moment"), Text(origin = {104, -79}, extent = {{-14, 7}, {14, -7}}, textString = "Ist-
  moment
  Stufe 2"), Text(origin = {142, 99}, extent = {{-60, 39}, {60, -39}}, textString = "Die Parameter können in der Code_Ansicht 
verändert werden
  -  max. Drehmoment pro Stufe
  -   Auswahl Abstraktionsstufe 1..3
  -   Zeitkonstante Stufe 2 und 3
  -   LL-Drehzahl Stufe 3", horizontalAlignment = TextAlignment.Left), Text(origin = {128, -11}, extent = {{-14, 7}, {14, -7}}, textString = "Ist-
  moment
  Stufe 3"), Text(origin = {-150, 87}, extent = {{-52, 37}, {52, -37}}, textString = "gestuftes Aktuator-Modell als parametrierbarer Block
  Eingang: 
  - Soll-Moment [Nm]
  - Winkelgeschwindigkeit Aktuator [rad/s]
    
  Ausgänge: 
  - Ist-Moment [Nm]", horizontalAlignment = TextAlignment.Left)}),
      experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-05, Interval = 0.0001),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Akt_gestuft_fin_03;
  annotation(
    uses(Modelica(version = "4.1.0")));
end Furuta_V03;
