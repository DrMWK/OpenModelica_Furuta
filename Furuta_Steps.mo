package Furuta_V03

  model Step_01_freies_Pendel_01
    inner Modelica.Mechanics.MultiBody.World world(nominalLength = 0.3) annotation(
      Placement(transformation(origin = {-100, -46}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Grundplatte(length(displayUnit = "mm") = 0.014, diameter(displayUnit = "mm") = 0.2, r(each displayUnit = "mm") = {0, 0.014, 0}, final color = {128, 0, 0}, density = 7700) annotation(
      Placement(transformation(origin = {-74, -46}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Stator(length(displayUnit = "mm") = 0.045, diameter(displayUnit = "mm") = 0.065, r(each displayUnit = "mm") = {0, 0.045, 0}, innerDiameter(displayUnit = "mm") = 0.06, density = 7700, color = {128, 0, 0}) annotation(
      Placement(transformation(origin = {-50, -46}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Rotor(r(each displayUnit = "mm") = {0, 0.059, 0}, length(displayUnit = "mm") = 0.059, diameter(displayUnit = "mm") = 0.065, innerDiameter(displayUnit = "mm") = 0.06, density = 7700, color = {0, 128, 0}) annotation(
      Placement(transformation(origin = {-2, -46}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Joints.Revolute rev_Stat_Rot(n = {0, 1, 0}, useAxisFlange = true, phi(start = -1.5707963267948966)) annotation(
      Placement(transformation(origin = {-26, -46}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pin_Rot(length(displayUnit = "mm") = 0.005, diameter(displayUnit = "mm") = 0.004, r(each displayUnit = "mm") = {0.034, -0.005, 0}, r_shape(each displayUnit = "mm") = {0.0315, -0.005, 0}, density = 7700, color = {0, 128, 0}) annotation(
      Placement(transformation(origin = {24, -46}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pin_Pen(r(each displayUnit = "mm") = {0.005, 0, 0}, length(displayUnit = "mm") = 0.005, diameter(displayUnit = "mm") = 0.004, density = 7700, color = {0, 0, 128}) annotation(
      Placement(transformation(origin = {74, -46}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pendel(length(displayUnit = "mm") = 0.075, diameter(displayUnit = "mm") = 0.006, r(each displayUnit = "mm") = {0, 0, 0}, r_shape(each displayUnit = "mm") = {0, -0.005, 0}, density = 7700, color = {0, 0, 128}, lengthDirection = {0, 1, 0}) annotation(
      Placement(transformation(origin = {98, -46}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Deckel(r(each displayUnit = "mm") = {0, 0.005, 0}, length(displayUnit = "mm") = 0.005, diameter(displayUnit = "mm") = 0.065, density = 7700, color = {128, 128, 0}) annotation(
      Placement(transformation(origin = {24, -28}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Joints.Revolute rev_Rot_Pend(phi(start = 2.792526803190927, fixed = true), n = {1, 0, 0}, cylinderLength(displayUnit = "mm") = 0.002, cylinderDiameter(displayUnit = "mm") = 0.007, useAxisFlange = true) annotation(
      Placement(transformation(origin = {50, -46}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.Rotational.Sensors.RelAngleSensor Angle_Pend annotation(
      Placement(transformation(origin = {50, -10}, extent = {{-10, 10}, {10, -10}})));
    Modelica.Mechanics.Rotational.Sensors.RelAngleSensor Angle_Rot annotation(
      Placement(transformation(origin = {-36, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  equation
    connect(world.frame_b, Grundplatte.frame_a) annotation(
      Line(points = {{-90, -46}, {-84, -46}}, color = {95, 95, 95}));
    connect(Grundplatte.frame_b, Stator.frame_a) annotation(
      Line(points = {{-64, -46}, {-60, -46}}, color = {95, 95, 95}));
    connect(Stator.frame_b, rev_Stat_Rot.frame_a) annotation(
      Line(points = {{-40, -46}, {-36, -46}}, color = {95, 95, 95}));
    connect(rev_Stat_Rot.frame_b, Rotor.frame_a) annotation(
      Line(points = {{-16, -46}, {-12, -46}}, color = {95, 95, 95}));
    connect(Rotor.frame_b, Pin_Rot.frame_a) annotation(
      Line(points = {{8, -46}, {14, -46}}, color = {95, 95, 95}));
    connect(Pin_Pen.frame_b, Pendel.frame_a) annotation(
      Line(points = {{84, -46}, {88, -46}}, color = {95, 95, 95}));
    connect(Deckel.frame_a, Rotor.frame_b) annotation(
      Line(points = {{14, -28}, {8, -28}, {8, -46}}, color = {95, 95, 95}));
    connect(Pin_Rot.frame_b, rev_Rot_Pend.frame_a) annotation(
      Line(points = {{34, -46}, {40, -46}}, color = {95, 95, 95}));
    connect(rev_Rot_Pend.frame_b, Pin_Pen.frame_a) annotation(
      Line(points = {{60, -46}, {64, -46}}, color = {95, 95, 95}));
    connect(Angle_Pend.flange_a, rev_Rot_Pend.support) annotation(
      Line(points = {{40, -10}, {40, -24}, {44, -24}, {44, -36}}));
    connect(Angle_Pend.flange_b, rev_Rot_Pend.axis) annotation(
      Line(points = {{60, -10}, {60, -30}, {50, -30}, {50, -36}}));
    connect(rev_Stat_Rot.support, Angle_Rot.flange_a) annotation(
      Line(points = {{-32, -36}, {-32, -30}, {-46, -30}, {-46, -10}}));
    connect(Angle_Rot.flange_b, rev_Stat_Rot.axis) annotation(
      Line(points = {{-26, -10}, {-26, -36}}));
    annotation(
      experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.002),
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
  end Step_01_freies_Pendel_01;

  model Step_02_ideale_Momentquelle_01
    inner Modelica.Mechanics.MultiBody.World world(nominalLength = 0.3) annotation(
      Placement(transformation(origin = {-78, -44}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Grundplatte(length(displayUnit = "mm") = 0.014, diameter(displayUnit = "mm") = 0.2, r(each displayUnit = "mm") = {0, 0.014, 0}, final color = {128, 0, 0}, density = 7700) annotation(
      Placement(transformation(origin = {-52, -44}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Stator(length(displayUnit = "mm") = 0.045, diameter(displayUnit = "mm") = 0.065, r(each displayUnit = "mm") = {0, 0.045, 0}, innerDiameter(displayUnit = "mm") = 0.06, density = 7700, color = {128, 0, 0}) annotation(
      Placement(transformation(origin = {-28, -44}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Rotor(r(each displayUnit = "mm") = {0, 0.059, 0}, length(displayUnit = "mm") = 0.059, diameter(displayUnit = "mm") = 0.065, innerDiameter(displayUnit = "mm") = 0.06, density = 7700, color = {0, 128, 0}) annotation(
      Placement(transformation(origin = {20, -44}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Joints.Revolute rev_Stat_Rot(n = {0, 1, 0}, useAxisFlange = true, phi(start = -3.14/2)) annotation(
      Placement(transformation(origin = {-4, -44}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pin_Rot(length(displayUnit = "mm") = 0.005, diameter(displayUnit = "mm") = 0.004, r(each displayUnit = "mm") = {0.034, -0.005, 0}, r_shape(each displayUnit = "mm") = {0.0315, -0.005, 0}, density = 7700, color = {0, 128, 0}) annotation(
      Placement(transformation(origin = {46, -44}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pin_Pen(r(each displayUnit = "mm") = {0.005, 0, 0}, length(displayUnit = "mm") = 0.005, diameter(displayUnit = "mm") = 0.004, density = 7700, color = {0, 0, 128}) annotation(
      Placement(transformation(origin = {96, -44}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pendel(length(displayUnit = "mm") = 0.075, diameter(displayUnit = "mm") = 0.006, r(each displayUnit = "mm") = {0, 0, 0}, r_shape(each displayUnit = "mm") = {0, -0.005, 0}, density = 7700, color = {0, 0, 128}, lengthDirection = {0, 1, 0}) annotation(
      Placement(transformation(origin = {120, -44}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Deckel(r(each displayUnit = "mm") = {0, 0.005, 0}, length(displayUnit = "mm") = 0.005, diameter(displayUnit = "mm") = 0.065, density = 7700, color = {128, 128, 0}) annotation(
      Placement(transformation(origin = {46, -26}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Joints.Revolute rev_Rot_Pend(phi(start = 0.9599310885968813, fixed = true), n = {1, 0, 0}, cylinderLength(displayUnit = "mm") = 0.002, cylinderDiameter(displayUnit = "mm") = 0.007, useAxisFlange = true) annotation(
      Placement(transformation(origin = {72, -44}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.Rotational.Sensors.RelAngleSensor Angle_Pend annotation(
      Placement(transformation(origin = {72, -8}, extent = {{-10, 10}, {10, -10}})));
    Modelica.Blocks.Sources.Constant Soll_Pend(k = 0) annotation(
      Placement(transformation(origin = {-136, 52}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.Rotational.Sources.Torque2 Torque_Rot annotation(
      Placement(transformation(origin = {-14, 14}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant Soll_Rot(k = -3.14/2) annotation(
      Placement(transformation(origin = {-196, 18}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.Rotational.Sensors.RelAngleSensor Angle_Rot annotation(
      Placement(transformation(origin = {-14, -8}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Nonlinear.Limiter Lim_Rot(uMax = 3.14/2, uMin = -3.14/2) annotation(
      Placement(transformation(origin = {-136, 18}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Rot(controllerType = Modelica.Blocks.Types.SimpleController.PD, k = 0.01, Td = 5, Nd = 100) annotation(
      Placement(transformation(origin = {-166, 18}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Pend(controllerType = Modelica.Blocks.Types.SimpleController.PD, k = 10000, Td = 0.1) annotation(
      Placement(transformation(origin = {-66, 24}, extent = {{-10, 10}, {10, -10}})));
    Modelica.Blocks.Math.Add add(k1 = +1, k2 = -1) annotation(
      Placement(transformation(origin = {-98, 24}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Nonlinear.Limiter Lim_Torque(uMax = 0.45, uMin = -0.45) annotation(
      Placement(transformation(origin = {-38, 24}, extent = {{-10, -10}, {10, 10}})));
  equation
    connect(world.frame_b, Grundplatte.frame_a) annotation(
      Line(points = {{-68, -44}, {-62, -44}}, color = {95, 95, 95}));
    connect(Grundplatte.frame_b, Stator.frame_a) annotation(
      Line(points = {{-42, -44}, {-38, -44}}, color = {95, 95, 95}));
    connect(Stator.frame_b, rev_Stat_Rot.frame_a) annotation(
      Line(points = {{-18, -44}, {-14, -44}}, color = {95, 95, 95}));
    connect(rev_Stat_Rot.frame_b, Rotor.frame_a) annotation(
      Line(points = {{6, -44}, {10, -44}}, color = {95, 95, 95}));
    connect(Rotor.frame_b, Pin_Rot.frame_a) annotation(
      Line(points = {{30, -44}, {36, -44}}, color = {95, 95, 95}));
    connect(Pin_Pen.frame_b, Pendel.frame_a) annotation(
      Line(points = {{106, -44}, {110, -44}}, color = {95, 95, 95}));
    connect(Deckel.frame_a, Rotor.frame_b) annotation(
      Line(points = {{36, -26}, {30, -26}, {30, -44}}, color = {95, 95, 95}));
    connect(Pin_Rot.frame_b, rev_Rot_Pend.frame_a) annotation(
      Line(points = {{56, -44}, {62, -44}}, color = {95, 95, 95}));
    connect(rev_Rot_Pend.frame_b, Pin_Pen.frame_a) annotation(
      Line(points = {{82, -44}, {86, -44}}, color = {95, 95, 95}));
    connect(Angle_Pend.flange_a, rev_Rot_Pend.support) annotation(
      Line(points = {{62, -8}, {62, -22}, {66, -22}, {66, -34}}));
    connect(Angle_Pend.flange_b, rev_Rot_Pend.axis) annotation(
      Line(points = {{82, -8}, {82, -28}, {72, -28}, {72, -34}}));
    connect(Torque_Rot.flange_b, rev_Stat_Rot.axis) annotation(
      Line(points = {{-4, 14}, {-4, -34}}));
    connect(Angle_Rot.flange_a, Torque_Rot.flange_a) annotation(
      Line(points = {{-24, -8}, {-24, 14}}));
    connect(Angle_Rot.flange_b, Torque_Rot.flange_b) annotation(
      Line(points = {{-4, -8}, {-4, 14}}));
    connect(rev_Stat_Rot.support, Angle_Rot.flange_a) annotation(
      Line(points = {{-10, -34}, {-10, -28}, {-24, -28}, {-24, -8}}));
    connect(Soll_Rot.y, PID_lim_Rot.u_s) annotation(
      Line(points = {{-185, 18}, {-179, 18}}, color = {0, 0, 127}));
    connect(PID_lim_Rot.y, Lim_Rot.u) annotation(
      Line(points = {{-155, 18}, {-149, 18}}, color = {0, 0, 127}));
    connect(PID_lim_Pend.u_m, Angle_Pend.phi_rel) annotation(
      Line(points = {{-66, 36}, {-66, 44}, {72, 44}, {72, 4}}, color = {0, 0, 127}));
    connect(PID_lim_Pend.u_s, add.y) annotation(
      Line(points = {{-78, 24}, {-86, 24}}, color = {0, 0, 127}));
    connect(Soll_Pend.y, add.u1) annotation(
      Line(points = {{-125, 52}, {-119, 52}, {-119, 30}, {-111, 30}}, color = {0, 0, 127}));
    connect(Lim_Rot.y, add.u2) annotation(
      Line(points = {{-125, 18}, {-111, 18}}, color = {0, 0, 127}));
    connect(Lim_Torque.u, PID_lim_Pend.y) annotation(
      Line(points = {{-50, 24}, {-54, 24}}, color = {0, 0, 127}));
    connect(Lim_Torque.y, Torque_Rot.tau) annotation(
      Line(points = {{-26, 24}, {-14, 24}, {-14, 18}}, color = {0, 0, 127}));
    connect(Angle_Rot.phi_rel, PID_lim_Rot.u_m) annotation(
      Line(points = {{-14, -18}, {-14, -26}, {-166, -26}, {-166, 6}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.002),
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
  end Step_02_ideale_Momentquelle_01;

  block Block_Pendel_01
    inner Modelica.Mechanics.MultiBody.World world(nominalLength = 0.3) annotation(
      Placement(transformation(origin = {-102, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Grundplatte(final color = {128, 0, 0}, density = 7700, diameter(displayUnit = "mm") = 0.2, length(displayUnit = "mm") = 0.014, r(each displayUnit = "mm") = {0, 0.014, 0}) annotation(
      Placement(transformation(origin = {-76, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Stator(color = {128, 0, 0}, density = 7700, diameter(displayUnit = "mm") = 0.065, innerDiameter(displayUnit = "mm") = 0.06, length(displayUnit = "mm") = 0.045, r(each displayUnit = "mm") = {0, 0.045, 0}) annotation(
      Placement(transformation(origin = {-52, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Rotor(color = {0, 128, 0}, density = 7700, diameter(displayUnit = "mm") = 0.065, innerDiameter(displayUnit = "mm") = 0.061, length(displayUnit = "mm") = 0.059, r(each displayUnit = "mm") = {0, 0.059, 0}) annotation(
      Placement(transformation(origin = {-4, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Joints.Revolute rev_Stat_Rot(n = {0, 1, 0}, phi(start = -3.14/2), useAxisFlange = true) annotation(
      Placement(transformation(origin = {-28, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pin_Rot(color = {0, 128, 0}, density = 7700, diameter(displayUnit = "mm") = 0.004, length(displayUnit = "mm") = 0.005, r(each displayUnit = "mm") = {0.034, -0.005, 0}, r_shape(each displayUnit = "mm") = {0.0315, -0.005, 0}) annotation(
      Placement(transformation(origin = {22, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pin_Pen(color = {0, 0, 128}, density = 7700, diameter(displayUnit = "mm") = 0.004, length(displayUnit = "mm") = 0.005, r(each displayUnit = "mm") = {0.005, 0, 0}) annotation(
      Placement(transformation(origin = {72, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pendel(color = {0, 0, 128}, density = 7700, diameter(displayUnit = "mm") = 0.006, length(displayUnit = "mm") = 0.075, lengthDirection = {0, 1, 0}, r(each displayUnit = "mm") = {0, 0, 0}, r_shape(each displayUnit = "mm") = {0, -0.005, 0}) annotation(
      Placement(transformation(origin = {96, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Deckel(color = {128, 128, 0}, density = 7700, diameter(displayUnit = "mm") = 0.065, length(displayUnit = "mm") = 0.002, r(each displayUnit = "mm") = {0, 0.005, 0}) annotation(
      Placement(transformation(origin = {22, -22}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Joints.Revolute rev_Rot_Pend(cylinderDiameter(displayUnit = "mm") = 0.007, cylinderLength(displayUnit = "mm") = 0.002, n = {1, 0, 0}, phi(fixed = true, start = -0.6981317007977318), useAxisFlange = true) annotation(
      Placement(transformation(origin = {48, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.Rotational.Sensors.RelAngleSensor Angle_Pend annotation(
      Placement(transformation(origin = {48, -4}, extent = {{-10, 10}, {10, -10}})));
    Modelica.Mechanics.Rotational.Sources.Torque2 Torque_Rot annotation(
      Placement(transformation(origin = {-38, 66}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.Rotational.Sensors.RelAngleSensor Angle_Rot annotation(
      Placement(transformation(origin = {-38, 44}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealInput In_Torque_Rot annotation(
      Placement(transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-86, 0}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Interfaces.RealOutput Out_Angle_Rot annotation(
      Placement(transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {88, 0}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealOutput Out_Angle_Pend annotation(
      Placement(transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {88, -30}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.Derivative derivative annotation(
      Placement(transformation(origin = {42, 70}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealOutput Out_w_Rot annotation(
      Placement(transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {88, 30}, extent = {{-10, -10}, {10, 10}})));
  equation
    connect(world.frame_b, Grundplatte.frame_a) annotation(
      Line(points = {{-92, -40}, {-86, -40}}, color = {95, 95, 95}));
    connect(Grundplatte.frame_b, Stator.frame_a) annotation(
      Line(points = {{-66, -40}, {-62, -40}}, color = {95, 95, 95}));
    connect(Stator.frame_b, rev_Stat_Rot.frame_a) annotation(
      Line(points = {{-42, -40}, {-38, -40}}, color = {95, 95, 95}));
    connect(rev_Stat_Rot.frame_b, Rotor.frame_a) annotation(
      Line(points = {{-18, -40}, {-14, -40}}, color = {95, 95, 95}));
    connect(Rotor.frame_b, Pin_Rot.frame_a) annotation(
      Line(points = {{6, -40}, {12, -40}}, color = {95, 95, 95}));
    connect(Pin_Pen.frame_b, Pendel.frame_a) annotation(
      Line(points = {{82, -40}, {86, -40}}, color = {95, 95, 95}));
    connect(Deckel.frame_a, Rotor.frame_b) annotation(
      Line(points = {{12, -22}, {6, -22}, {6, -40}}, color = {95, 95, 95}));
    connect(Pin_Rot.frame_b, rev_Rot_Pend.frame_a) annotation(
      Line(points = {{32, -40}, {38, -40}}, color = {95, 95, 95}));
    connect(rev_Rot_Pend.frame_b, Pin_Pen.frame_a) annotation(
      Line(points = {{58, -40}, {62, -40}}, color = {95, 95, 95}));
    connect(Angle_Pend.flange_a, rev_Rot_Pend.support) annotation(
      Line(points = {{38, -4}, {38, -18}, {42, -18}, {42, -30}}));
    connect(Angle_Pend.flange_b, rev_Rot_Pend.axis) annotation(
      Line(points = {{58, -4}, {58, -24}, {48, -24}, {48, -30}}));
    connect(Torque_Rot.flange_b, rev_Stat_Rot.axis) annotation(
      Line(points = {{-28, 66}, {-28, -30}}));
    connect(Angle_Rot.flange_a, Torque_Rot.flange_a) annotation(
      Line(points = {{-48, 44}, {-48, 66}}));
    connect(Angle_Rot.flange_b, Torque_Rot.flange_b) annotation(
      Line(points = {{-28, 44}, {-28, 66}}));
    connect(rev_Stat_Rot.support, Angle_Rot.flange_a) annotation(
      Line(points = {{-34, -30}, {-34, -24}, {-48, -24}, {-48, 44}}));
    connect(Angle_Rot.phi_rel, Out_Angle_Rot) annotation(
      Line(points = {{-38, 33}, {-38, 24}, {4, 24}, {4, 40}, {110, 40}}, color = {0, 0, 127}));
    connect(Angle_Pend.phi_rel, Out_Angle_Pend) annotation(
      Line(points = {{48, 8}, {48, 10}, {110, 10}}, color = {0, 0, 127}));
    connect(In_Torque_Rot, Torque_Rot.tau) annotation(
      Line(points = {{-120, 80}, {-38, 80}, {-38, 70}}, color = {0, 0, 127}));
    connect(derivative.u, Angle_Rot.phi_rel) annotation(
      Line(points = {{30, 70}, {4, 70}, {4, 24}, {-38, 24}, {-38, 34}}, color = {0, 0, 127}));
    connect(Out_w_Rot, derivative.y) annotation(
      Line(points = {{110, 70}, {54, 70}}, color = {0, 0, 127}));
    annotation(
      Icon(graphics = {Rectangle(origin = {6, 3}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-72, 49}, {72, -49}}), Text(origin = {-41, 64}, extent = {{-27, 14}, {27, -14}}, textString = "%name"), Text(origin = {45, 2}, extent = {{-33, 10}, {33, -10}}, textString = "Angle_Rot >"), Text(origin = {41, -29}, extent = {{-37, 17}, {37, -17}}, textString = "Angle_Pend >"), Text(origin = {-38, 2}, extent = {{-26, 16}, {26, -16}}, textString = "> Torque"), Text(origin = {55, 32}, extent = {{-23, 8}, {23, -8}}, textString = "w_Rot >")}),
      uses(Modelica(version = "4.1.0")),
      Diagram(graphics = {Text(origin = {167, -44}, extent = {{-47, 26}, {47, -26}}, textString = "Furuta-Pendel als Block
Wandstärke Rotor auf 2mm reduziert

Eingang: 
- Moment

Ausgänge: 
- Winkel Rotor und Pendel 
- Winkelgeschwindigkeit Rotor

Ausgangslagen:
- Pendel -40°
- Rotor 90°", horizontalAlignment = TextAlignment.Left)}));
  end Block_Pendel_01;

  model Step_02_id_Torque_m_Block_01
    Modelica.Blocks.Sources.Constant Soll_Pend(k = 0) annotation(
      Placement(transformation(origin = {-136, 52}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant Soll_Rot(k = -3.14/2) annotation(
      Placement(transformation(origin = {-196, 18}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Nonlinear.Limiter Lim_Rot(uMax = 3.14/2, uMin = -3.14/2) annotation(
      Placement(transformation(origin = {-136, 18}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Rot(controllerType = Modelica.Blocks.Types.SimpleController.PD, k = 0.01, Td = 5, Nd = 100) annotation(
      Placement(transformation(origin = {-166, 18}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
    Modelica.Blocks.Continuous.LimPID PID_lim_Pend(controllerType = Modelica.Blocks.Types.SimpleController.PD, k = 10000, Td = 0.1) annotation(
      Placement(transformation(origin = {-66, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -0)));
    Modelica.Blocks.Math.Add add(k1 = +1, k2 = -1) annotation(
      Placement(transformation(origin = {-98, 24}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Nonlinear.Limiter Lim_Torque(uMax = 0.45, uMin = -0.45) annotation(
      Placement(transformation(origin = {-38, 24}, extent = {{-10, -10}, {10, 10}})));
    Block_Pendel_01 block_Pendel_01 annotation(
      Placement(transformation(origin = {27, 23}, extent = {{-35, -35}, {35, 35}})));
  equation
    connect(Soll_Rot.y, PID_lim_Rot.u_s) annotation(
      Line(points = {{-185, 18}, {-178, 18}}, color = {0, 0, 127}));
    connect(PID_lim_Rot.y, Lim_Rot.u) annotation(
      Line(points = {{-155, 18}, {-149, 18}}, color = {0, 0, 127}));
    connect(PID_lim_Pend.u_s, add.y) annotation(
      Line(points = {{-78, 24}, {-86, 24}}, color = {0, 0, 127}));
    connect(Soll_Pend.y, add.u1) annotation(
      Line(points = {{-125, 52}, {-119, 52}, {-119, 30}, {-111, 30}}, color = {0, 0, 127}));
    connect(Lim_Rot.y, add.u2) annotation(
      Line(points = {{-125, 18}, {-111, 18}}, color = {0, 0, 127}));
    connect(Lim_Torque.u, PID_lim_Pend.y) annotation(
      Line(points = {{-50, 24}, {-55, 24}}, color = {0, 0, 127}));
    connect(block_Pendel_01.In_Torque_Rot, Lim_Torque.y) annotation(
      Line(points = {{-4, 24}, {-26, 24}}, color = {0, 0, 127}));
    connect(block_Pendel_01.Out_Angle_Pend, PID_lim_Pend.u_m) annotation(
      Line(points = {{58, 12}, {80, 12}, {80, -12}, {-66, -12}, {-66, 12}}, color = {0, 0, 127}));
    connect(block_Pendel_01.Out_Angle_Rot, PID_lim_Rot.u_m) annotation(
      Line(points = {{58, 24}, {80, 24}, {80, 80}, {-166, 80}, {-166, 30}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.002),
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      Diagram(graphics = {Text(origin = {60, -36}, extent = {{-36, 20}, {36, -20}}, textString = "äußerer Regler: 
Lageregelung Rotor", horizontalAlignment = TextAlignment.Left)}));
  end Step_02_id_Torque_m_Block_01;

  model Step_02_id_Torque_m_Block_02
    Modelica.Blocks.Sources.Constant Soll_Pend(k = 0) annotation(
      Placement(transformation(origin = {-136, 52}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Pend(controllerType = Modelica.Blocks.Types.SimpleController.PD, k = 10000, Td = 0.1) annotation(
      Placement(transformation(origin = {-66, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -0)));
    Modelica.Blocks.Math.Add add(k1 = +1, k2 = -1) annotation(
      Placement(transformation(origin = {-98, 24}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Nonlinear.Limiter Lim_Torque(uMax = 0.45, uMin = -0.45) annotation(
      Placement(transformation(origin = {-38, 24}, extent = {{-10, -10}, {10, 10}})));
    Block_Pendel_01 block_Pendel_01 annotation(
      Placement(transformation(origin = {27, 23}, extent = {{-35, -35}, {35, 35}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Rot(Nd = 100, Td = 5, controllerType = Modelica.Blocks.Types.SimpleController.P, k = 0.05, Ti = 10000) annotation(
      Placement(transformation(origin = {-144, 18}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant Soll_Pend1(k = 0) annotation(
      Placement(transformation(origin = {-182, 18}, extent = {{-10, -10}, {10, 10}})));
  equation
    connect(PID_lim_Pend.u_s, add.y) annotation(
      Line(points = {{-78, 24}, {-86, 24}}, color = {0, 0, 127}));
    connect(Soll_Pend.y, add.u1) annotation(
      Line(points = {{-125, 52}, {-119, 52}, {-119, 30}, {-111, 30}}, color = {0, 0, 127}));
    connect(Lim_Torque.u, PID_lim_Pend.y) annotation(
      Line(points = {{-50, 24}, {-55, 24}}, color = {0, 0, 127}));
    connect(block_Pendel_01.In_Torque_Rot, Lim_Torque.y) annotation(
      Line(points = {{-4, 24}, {-26, 24}}, color = {0, 0, 127}));
    connect(block_Pendel_01.Out_Angle_Pend, PID_lim_Pend.u_m) annotation(
      Line(points = {{58, 12}, {80, 12}, {80, -12}, {-66, -12}, {-66, 12}}, color = {0, 0, 127}));
    connect(PID_lim_Rot.u_s, Soll_Pend1.y) annotation(
      Line(points = {{-156, 18}, {-170, 18}}, color = {0, 0, 127}));
    connect(block_Pendel_01.Out_w_Rot, PID_lim_Rot.u_m) annotation(
      Line(points = {{58, 34}, {92, 34}, {92, -30}, {-143.5, -30}, {-143.5, 6}, {-144, 6}}, color = {0, 0, 127}));
    connect(add.u2, PID_lim_Rot.y) annotation(
      Line(points = {{-110, 18}, {-133, 18}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.002),
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      Diagram(graphics = {Text(origin = {70, -61}, extent = {{-28, 17}, {28, -17}}, textString = "äußerer Regler: 
w_Rotor > 0", horizontalAlignment = TextAlignment.Left)}));
  end Step_02_id_Torque_m_Block_02;

  block Block_Pendel_param_01
    //
    //Parametrierung des Furuta-Pendels ANFANG
    parameter Real D_GrPlatte = 0.200;
    // Durchmesser der Grundplatte in m ; (0.200)
    parameter Real H_GrPlatte = 0.014;
    // Hoehe der Grundplatte in m ; (0.014)
    parameter Real D_Stator = 0.065;
    // Durchmesser Stator in m ; (0.065)
    parameter Real Di_Stator = 0.060;
    // I-Durchmesser Stator in m ; (0.060)
    parameter Real H_Stator = 0.045;
    // Hoehe Stator in m ; (0.045)
    parameter Real D_Rotor = 0.065;
    // Durchmesser Rotors in m ; (0.065)
    parameter Real Di_Rotor = 0.061;
    // I-Durchmesser Rotors in m ; (0.061)
    parameter Real H_Rotor = 0.059;
    // Hoehe Rotor in m ; (0.059)
    parameter Real D_Deckel = 0.065;
    // Durchmesser des Deckels in m ; (0.065)
    parameter Real H_Deckel = 0.002;
    // Dicke des Deckels in m ; (0.002) >> für Abgleich Rotor-Traegheitsmoments
    parameter Real D_Pendel = 0.006;
    // Durchmesser des Pendels in m ; (0.006)
    parameter Real L_Pendel = 0.075;
    // Laenge des Pendels in m ; (0.075)
    parameter Real Rho_Furuta = 7700;
    // Dichte der Bauteile des Furuta-Pendels in kg/m^3 ; (7700)
    parameter Real phi_0_Pend = 40/180*3.14;
    // Auslenkung des Pendels zum Zeitpunkt t= 0 in rad
    parameter Real phi_0_Rot = -90/180*3.14;
    // Auslenkung des Pendels zum Zeitpunkt t= 0 in rad
    //Parametrierung des Furuta-Pendels ENDE
    //
    inner Modelica.Mechanics.MultiBody.World world(nominalLength = 0.3) annotation(
      Placement(transformation(origin = {-102, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Grundplatte(final color = {128, 0, 0}, density = Rho_Furuta, diameter(displayUnit = "mm") = D_GrPlatte, length(displayUnit = "mm") = H_GrPlatte, r(each displayUnit = "mm") = {0, 0.014, 0}) annotation(
      Placement(transformation(origin = {-76, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Stator(color = {128, 0, 0}, density = Rho_Furuta, diameter(displayUnit = "mm") = D_Stator, innerDiameter(displayUnit = "mm") = Di_Stator, length(displayUnit = "mm") = H_Stator, r(each displayUnit = "mm") = {0, H_Stator, 0}) annotation(
      Placement(transformation(origin = {-52, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Rotor(color = {0, 128, 0}, density = Rho_Furuta, diameter(displayUnit = "mm") = D_Rotor, innerDiameter(displayUnit = "mm") = Di_Rotor, length(displayUnit = "mm") = D_Rotor, r(each displayUnit = "mm") = {0, D_Rotor, 0}) annotation(
      Placement(transformation(origin = {-4, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Joints.Revolute rev_Stat_Rot(n = {0, 1, 0}, phi(start = phi_0_Rot), useAxisFlange = true) annotation(
      Placement(transformation(origin = {-28, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pin_Rot(color = {0, 128, 0}, density = Rho_Furuta, diameter(displayUnit = "mm") = 0.004, length(displayUnit = "mm") = 0.005, r(each displayUnit = "mm") = {(D_Rotor/2 + 0.0015), -0.005, 0}, r_shape(each displayUnit = "mm") = {(D_Rotor/2 - 0.0001), -0.005, 0}) annotation(
      Placement(transformation(origin = {22, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pin_Pen(color = {0, 0, 128}, density = Rho_Furuta, diameter(displayUnit = "mm") = 0.004, length(displayUnit = "mm") = 0.005, r(each displayUnit = "mm") = {0.005, 0, 0}) annotation(
      Placement(transformation(origin = {72, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pendel(color = {0, 0, 128}, density = Rho_Furuta, diameter(displayUnit = "mm") = D_Pendel, length(displayUnit = "mm") = L_Pendel, lengthDirection = {0, 1, 0}, r(each displayUnit = "mm") = {0, 0, 0}, r_shape(each displayUnit = "mm") = {0, -0.005, 0}) annotation(
      Placement(transformation(origin = {96, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Deckel(color = {128, 128, 0}, density = Rho_Furuta, diameter(displayUnit = "mm") = D_Deckel, length(displayUnit = "mm") = H_Deckel, r(each displayUnit = "mm") = {0, H_Deckel, 0}) annotation(
      Placement(transformation(origin = {22, -22}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Joints.Revolute rev_Rot_Pend(cylinderDiameter(displayUnit = "mm") = 0.007, cylinderLength(displayUnit = "mm") = 0.002, n = {1, 0, 0}, phi(fixed = true, start = phi_0_Pend), useAxisFlange = true) annotation(
      Placement(transformation(origin = {48, -40}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.Rotational.Sensors.RelAngleSensor Angle_Pend annotation(
      Placement(transformation(origin = {48, -4}, extent = {{-10, 10}, {10, -10}})));
    Modelica.Mechanics.Rotational.Sources.Torque2 Torque_Rot annotation(
      Placement(transformation(origin = {-38, 66}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.Rotational.Sensors.RelAngleSensor Angle_Rot annotation(
      Placement(transformation(origin = {-38, 44}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealInput In_Torque_Rot annotation(
      Placement(transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-86, 0}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Interfaces.RealOutput Out_Angle_Rot annotation(
      Placement(transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {88, 0}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealOutput Out_Angle_Pend annotation(
      Placement(transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {88, -30}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.Derivative derivative annotation(
      Placement(transformation(origin = {42, 70}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealOutput Out_w_Rot annotation(
      Placement(transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {88, 30}, extent = {{-10, -10}, {10, 10}})));
  equation
    connect(world.frame_b, Grundplatte.frame_a) annotation(
      Line(points = {{-92, -40}, {-86, -40}}, color = {95, 95, 95}));
    connect(Grundplatte.frame_b, Stator.frame_a) annotation(
      Line(points = {{-66, -40}, {-62, -40}}, color = {95, 95, 95}));
    connect(Stator.frame_b, rev_Stat_Rot.frame_a) annotation(
      Line(points = {{-42, -40}, {-38, -40}}, color = {95, 95, 95}));
    connect(rev_Stat_Rot.frame_b, Rotor.frame_a) annotation(
      Line(points = {{-18, -40}, {-14, -40}}, color = {95, 95, 95}));
    connect(Rotor.frame_b, Pin_Rot.frame_a) annotation(
      Line(points = {{6, -40}, {12, -40}}, color = {95, 95, 95}));
    connect(Pin_Pen.frame_b, Pendel.frame_a) annotation(
      Line(points = {{82, -40}, {86, -40}}, color = {95, 95, 95}));
    connect(Deckel.frame_a, Rotor.frame_b) annotation(
      Line(points = {{12, -22}, {6, -22}, {6, -40}}, color = {95, 95, 95}));
    connect(Pin_Rot.frame_b, rev_Rot_Pend.frame_a) annotation(
      Line(points = {{32, -40}, {38, -40}}, color = {95, 95, 95}));
    connect(rev_Rot_Pend.frame_b, Pin_Pen.frame_a) annotation(
      Line(points = {{58, -40}, {62, -40}}, color = {95, 95, 95}));
    connect(Angle_Pend.flange_a, rev_Rot_Pend.support) annotation(
      Line(points = {{38, -4}, {38, -18}, {42, -18}, {42, -30}}));
    connect(Angle_Pend.flange_b, rev_Rot_Pend.axis) annotation(
      Line(points = {{58, -4}, {58, -24}, {48, -24}, {48, -30}}));
    connect(Torque_Rot.flange_b, rev_Stat_Rot.axis) annotation(
      Line(points = {{-28, 66}, {-28, -30}}));
    connect(Angle_Rot.flange_a, Torque_Rot.flange_a) annotation(
      Line(points = {{-48, 44}, {-48, 66}}));
    connect(Angle_Rot.flange_b, Torque_Rot.flange_b) annotation(
      Line(points = {{-28, 44}, {-28, 66}}));
    connect(rev_Stat_Rot.support, Angle_Rot.flange_a) annotation(
      Line(points = {{-34, -30}, {-34, -24}, {-48, -24}, {-48, 44}}));
    connect(Angle_Rot.phi_rel, Out_Angle_Rot) annotation(
      Line(points = {{-38, 33}, {-38, 24}, {4, 24}, {4, 40}, {110, 40}}, color = {0, 0, 127}));
    connect(Angle_Pend.phi_rel, Out_Angle_Pend) annotation(
      Line(points = {{48, 8}, {48, 10}, {110, 10}}, color = {0, 0, 127}));
    connect(In_Torque_Rot, Torque_Rot.tau) annotation(
      Line(points = {{-120, 80}, {-38, 80}, {-38, 70}}, color = {0, 0, 127}));
    connect(derivative.u, Angle_Rot.phi_rel) annotation(
      Line(points = {{30, 70}, {4, 70}, {4, 24}, {-38, 24}, {-38, 34}}, color = {0, 0, 127}));
    connect(Out_w_Rot, derivative.y) annotation(
      Line(points = {{110, 70}, {54, 70}}, color = {0, 0, 127}));
    annotation(
      Icon(graphics = {Rectangle(origin = {6, 3}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-72, 49}, {72, -49}}), Text(origin = {-41, 64}, extent = {{-27, 14}, {27, -14}}, textString = "%name"), Text(origin = {45, 2}, extent = {{-33, 10}, {33, -10}}, textString = "Angle_Rot >"), Text(origin = {41, -29}, extent = {{-37, 17}, {37, -17}}, textString = "Angle_Pend >"), Text(origin = {-38, 2}, extent = {{-26, 16}, {26, -16}}, textString = "> Torque"), Text(origin = {55, 32}, extent = {{-23, 8}, {23, -8}}, textString = "w_Rot >")}),
      uses(Modelica(version = "4.1.0")),
      Diagram(graphics = {Text(origin = {167, -44}, extent = {{-47, 26}, {47, -26}}, textString = "Furuta-Pendel als parametrierbarer Block
Parameter können in der Code_Ansicht verändert werden

Eingang: 
- Moment

Ausgänge: 
- Winkel Rotor und Pendel 
- Winkelgeschwindigkeit Rotor

Ausgangslagen:
- Pendel 40°
- Rotor -90°", horizontalAlignment = TextAlignment.Left)}));
  end Block_Pendel_param_01;

  model Step_03_id_Trq_Param_01
    Modelica.Blocks.Sources.Constant Soll_Pend(k = 0) annotation(
      Placement(transformation(origin = {-136, 52}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Pend(controllerType = Modelica.Blocks.Types.SimpleController.PD, k = 10000, Td = 0.1) annotation(
      Placement(transformation(origin = {-66, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -0)));
    Modelica.Blocks.Math.Add add(k1 = +1, k2 = -1) annotation(
      Placement(transformation(origin = {-98, 24}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Nonlinear.Limiter Lim_Torque(uMax = 0.45, uMin = -0.45) annotation(
      Placement(transformation(origin = {-38, 24}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Rot(Nd = 100, Td = 5, controllerType = Modelica.Blocks.Types.SimpleController.P, k = 0.05, Ti = 10000) annotation(
      Placement(transformation(origin = {-144, 18}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant Soll_Pend1(k = 0) annotation(
      Placement(transformation(origin = {-182, 18}, extent = {{-10, -10}, {10, 10}})));
    Block_Pendel_param_01 block_Pendel_param_01 annotation(
      Placement(transformation(origin = {26, 24}, extent = {{-34, -34}, {34, 34}})));
  equation
    connect(PID_lim_Pend.u_s, add.y) annotation(
      Line(points = {{-78, 24}, {-86, 24}}, color = {0, 0, 127}));
    connect(Soll_Pend.y, add.u1) annotation(
      Line(points = {{-125, 52}, {-119, 52}, {-119, 30}, {-111, 30}}, color = {0, 0, 127}));
    connect(Lim_Torque.u, PID_lim_Pend.y) annotation(
      Line(points = {{-50, 24}, {-55, 24}}, color = {0, 0, 127}));
    connect(PID_lim_Rot.u_s, Soll_Pend1.y) annotation(
      Line(points = {{-156, 18}, {-170, 18}}, color = {0, 0, 127}));
    connect(add.u2, PID_lim_Rot.y) annotation(
      Line(points = {{-110, 18}, {-133, 18}}, color = {0, 0, 127}));
    connect(block_Pendel_param_01.In_Torque_Rot, Lim_Torque.y) annotation(
      Line(points = {{-4, 24}, {-26, 24}}, color = {0, 0, 127}));
    connect(block_Pendel_param_01.Out_Angle_Pend, PID_lim_Pend.u_m) annotation(
      Line(points = {{56, 14}, {66, 14}, {66, -6}, {-66, -6}, {-66, 12}}, color = {0, 0, 127}));
    connect(block_Pendel_param_01.Out_w_Rot, PID_lim_Rot.u_m) annotation(
      Line(points = {{56, 34}, {74, 34}, {74, -20}, {-144, -20}, {-144, 6}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.002),
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      Diagram(graphics = {Text(origin = {58, -42}, extent = {{-38, 20}, {38, -20}}, textString = "Ideale Momentquelle + - 0,45 Nm

Abfangen des Pendels bis 55° Anfangsauslenkung", horizontalAlignment = TextAlignment.Left)}));
  end Step_03_id_Trq_Param_01;

  model Step_04_dyn_Trq_Param_01
    Modelica.Blocks.Sources.Constant Soll_Pend(k = 0) annotation(
      Placement(transformation(origin = {-136, 52}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Pend(controllerType = Modelica.Blocks.Types.SimpleController.PD, k = 10000, Td = 0.1) annotation(
      Placement(transformation(origin = {-66, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -0)));
    Modelica.Blocks.Math.Add add(k1 = +1, k2 = -1) annotation(
      Placement(transformation(origin = {-98, 24}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Nonlinear.Limiter Lim_Torque(uMax = 0.45, uMin = -0.45) annotation(
      Placement(transformation(origin = {-38, 24}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Rot(Nd = 100, Td = 5, controllerType = Modelica.Blocks.Types.SimpleController.P, k = 0.05, Ti = 10000) annotation(
      Placement(transformation(origin = {-144, 18}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant Soll_Pend1(k = 0) annotation(
      Placement(transformation(origin = {-182, 18}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(k = 1, T(displayUnit = "ms") = 0.0012) annotation(
      Placement(transformation(origin = {-8, 24}, extent = {{-10, -10}, {10, 10}})));
    Block_Pendel_param_01 block_Pendel_param_01 annotation(
      Placement(transformation(origin = {40, 24}, extent = {{-22, -22}, {22, 22}})));
  equation
    connect(PID_lim_Pend.u_s, add.y) annotation(
      Line(points = {{-78, 24}, {-86, 24}}, color = {0, 0, 127}));
    connect(Soll_Pend.y, add.u1) annotation(
      Line(points = {{-125, 52}, {-119, 52}, {-119, 30}, {-111, 30}}, color = {0, 0, 127}));
    connect(Lim_Torque.u, PID_lim_Pend.y) annotation(
      Line(points = {{-50, 24}, {-55, 24}}, color = {0, 0, 127}));
    connect(PID_lim_Rot.u_s, Soll_Pend1.y) annotation(
      Line(points = {{-156, 18}, {-170, 18}}, color = {0, 0, 127}));
    connect(add.u2, PID_lim_Rot.y) annotation(
      Line(points = {{-110, 18}, {-133, 18}}, color = {0, 0, 127}));
    connect(Lim_Torque.y, firstOrder.u) annotation(
      Line(points = {{-26, 24}, {-20, 24}}, color = {0, 0, 127}));
    connect(firstOrder.y, block_Pendel_param_01.In_Torque_Rot) annotation(
      Line(points = {{4, 24}, {22, 24}}, color = {0, 0, 127}));
    connect(block_Pendel_param_01.Out_Angle_Pend, PID_lim_Pend.u_m) annotation(
      Line(points = {{60, 18}, {66, 18}, {66, -10}, {-66, -10}, {-66, 12}}, color = {0, 0, 127}));
    connect(block_Pendel_param_01.Out_w_Rot, PID_lim_Rot.u_m) annotation(
      Line(points = {{60, 30}, {78, 30}, {78, -22}, {-144, -22}, {-144, 6}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.002),
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      Diagram(graphics = {Text(origin = {76, -42}, extent = {{-38, 20}, {38, -20}}, textString = "dyn. Momentquelle + - 0,45 Nm 
PT1 ; T1 = 1.2 ms

Abfangen des Pendels bis 40° Anfangsauslenkung
Bleibende Schwingung auf dem Rotor", horizontalAlignment = TextAlignment.Left)}));
  end Step_04_dyn_Trq_Param_01;

  block Block_Trq_erw
    //  extends Modelica.Math.Icons.AxisLeft;
    extends Modelica.Constants;
    Modelica.Blocks.Interfaces.RealOutput Trq_Ist annotation(
      Placement(transformation(origin = {110, -8}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {102, 0}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealInput w_Mot annotation(
      Placement(transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Sources.Constant w_To_n(k = 60/2/pi) annotation(
      Placement(transformation(origin = {-82, 80}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Product product annotation(
      Placement(transformation(origin = {-44, 74}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Abs abs1 annotation(
      Placement(transformation(origin = {-14, 74}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant n_LL(k = 577) annotation(
      Placement(transformation(origin = {-14, 42}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Add add(k1 = -1, k2 = +1) annotation(
      Placement(transformation(origin = {20, 68}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Division division annotation(
      Placement(transformation(origin = {52, 62}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Max max annotation(
      Placement(transformation(origin = {84, 56}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant zero(k = 0) annotation(
      Placement(transformation(origin = {52, 36}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter annotation(
      Placement(transformation(origin = {48, -8}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealInput Trq_Soll annotation(
      Placement(transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-100, -26}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Sources.Constant Trq_Nenn(k = 0.45) annotation(
      Placement(transformation(origin = {-74, -12}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Product product1 annotation(
      Placement(transformation(origin = {-42, -6}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant const(k = -1) annotation(
      Placement(transformation(origin = {-24, -56}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Math.Product product2 annotation(
      Placement(transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(k = 1, T(displayUnit = "ms") = 0.0012) annotation(
      Placement(transformation(origin = {80, -8}, extent = {{-10, -10}, {10, 10}})));
  equation
    connect(w_Mot, product.u2) annotation(
      Line(points = {{-120, 40}, {-64, 40}, {-64, 68}, {-56, 68}}, color = {0, 0, 127}));
    connect(w_To_n.y, product.u1) annotation(
      Line(points = {{-71, 80}, {-57, 80}}, color = {0, 0, 127}));
    connect(abs1.u, product.y) annotation(
      Line(points = {{-26, 74}, {-32, 74}}, color = {0, 0, 127}));
    connect(add.u1, abs1.y) annotation(
      Line(points = {{8, 74}, {-2, 74}}, color = {0, 0, 127}));
    connect(add.u2, n_LL.y) annotation(
      Line(points = {{8, 62}, {2, 62}, {2, 42}, {-2, 42}}, color = {0, 0, 127}));
    connect(division.u1, add.y) annotation(
      Line(points = {{40, 68}, {32, 68}}, color = {0, 0, 127}));
    connect(division.u2, n_LL.y) annotation(
      Line(points = {{40, 56}, {34, 56}, {34, 42}, {-2, 42}}, color = {0, 0, 127}));
    connect(max.u1, division.y) annotation(
      Line(points = {{72, 62}, {64, 62}}, color = {0, 0, 127}));
    connect(max.u2, zero.y) annotation(
      Line(points = {{72, 50}, {68, 50}, {68, 36}, {64, 36}}, color = {0, 0, 127}));
    connect(max.y, product1.u1) annotation(
      Line(points = {{95, 56}, {101, 56}, {101, 14}, {-61, 14}, {-61, 0}, {-55, 0}}, color = {0, 0, 127}));
    connect(product1.u2, Trq_Nenn.y) annotation(
      Line(points = {{-54, -12}, {-63, -12}}, color = {0, 0, 127}));
    connect(product1.y, variableLimiter.limit1) annotation(
      Line(points = {{-31, -6}, {-27, -6}, {-27, 0}, {35, 0}}, color = {0, 0, 127}));
    connect(variableLimiter.u, Trq_Soll) annotation(
      Line(points = {{36, -8}, {-14, -8}, {-14, -40}, {-120, -40}}, color = {0, 0, 127}));
    connect(product2.u2, const.y) annotation(
      Line(points = {{-2, -56}, {-12, -56}}, color = {0, 0, 127}));
    connect(product2.u1, product1.y) annotation(
      Line(points = {{-2, -44}, {-8, -44}, {-8, -26}, {-26, -26}, {-26, -6}, {-30, -6}}, color = {0, 0, 127}));
    connect(product2.y, variableLimiter.limit2) annotation(
      Line(points = {{21, -50}, {27, -50}, {27, -16}, {35, -16}}, color = {0, 0, 127}));
    connect(variableLimiter.y, firstOrder.u) annotation(
      Line(points = {{60, -8}, {68, -8}}, color = {0, 0, 127}));
    connect(firstOrder.y, Trq_Ist) annotation(
      Line(points = {{92, -8}, {110, -8}}, color = {0, 0, 127}));
    annotation(
      Icon(graphics = {Rectangle(origin = {-1, 3}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-93, 63}, {93, -63}}), Text(origin = {-55, 78}, extent = {{-33, 12}, {33, -12}}, textString = "%name"), Text(origin = {-49, 42}, extent = {{-21, 12}, {21, -12}}, textString = "w_Mot"), Text(origin = {-45, -27}, extent = {{-29, 23}, {29, -23}}, textString = "Trq_Soll"), Text(origin = {64, 1}, extent = {{-24, 21}, {24, -21}}, textString = "Trq_Ist")}),
      Diagram(graphics));
  end Block_Trq_erw;

  model Test_Trq_erw_01
    Modelica.Blocks.Sources.Ramp ramp(height = 1, duration = 5, offset = -0.5, startTime = 0.2) annotation(
      Placement(transformation(origin = {-90, -8}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant const(k = 500*2*3.14/60) annotation(
      Placement(transformation(origin = {-90, 22}, extent = {{-10, -10}, {10, 10}})));
    Block_Trq_erw block_Trq_erw annotation(
      Placement(transformation(origin = {6, 5}, extent = {{-42, -39}, {42, 39}})));
  equation
    connect(const.y, block_Trq_erw.w_Mot) annotation(
      Line(points = {{-78, 22}, {-66, 22}, {-66, 21}, {-36, 21}}, color = {0, 0, 127}));
    connect(ramp.y, block_Trq_erw.Trq_Soll) annotation(
      Line(points = {{-78, -8}, {-36, -8}, {-36, -5}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Test_Trq_erw_01;

  model Step_05_Trq_erw_01
    Modelica.Blocks.Sources.Constant Soll_Pend(k = 0) annotation(
      Placement(transformation(origin = {-136, 52}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Pend(controllerType = Modelica.Blocks.Types.SimpleController.PD, k = 10000, Td = 0.1) annotation(
      Placement(transformation(origin = {-66, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -0)));
    Modelica.Blocks.Math.Add add(k1 = +1, k2 = -1) annotation(
      Placement(transformation(origin = {-98, 24}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Rot(Nd = 100, Td = 5, controllerType = Modelica.Blocks.Types.SimpleController.P, k = 0.05, Ti = 10000) annotation(
      Placement(transformation(origin = {-144, 18}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant Soll_Pend1(k = 0) annotation(
      Placement(transformation(origin = {-182, 18}, extent = {{-10, -10}, {10, 10}})));
    Block_Pendel_param_01 block_Pendel_param_01 annotation(
      Placement(transformation(origin = {44, 24}, extent = {{-34, -34}, {34, 34}})));
    Block_Trq_erw block_Trq_erw annotation(
      Placement(transformation(origin = {-21, 29}, extent = {{-21, -17}, {21, 17}})));
  equation
    connect(PID_lim_Pend.u_s, add.y) annotation(
      Line(points = {{-78, 24}, {-86, 24}}, color = {0, 0, 127}));
    connect(Soll_Pend.y, add.u1) annotation(
      Line(points = {{-125, 52}, {-119, 52}, {-119, 30}, {-111, 30}}, color = {0, 0, 127}));
    connect(PID_lim_Rot.u_s, Soll_Pend1.y) annotation(
      Line(points = {{-156, 18}, {-170, 18}}, color = {0, 0, 127}));
    connect(add.u2, PID_lim_Rot.y) annotation(
      Line(points = {{-110, 18}, {-133, 18}}, color = {0, 0, 127}));
    connect(block_Pendel_param_01.Out_w_Rot, PID_lim_Rot.u_m) annotation(
      Line(points = {{74, 34}, {92, 34}, {92, -20}, {-144, -20}, {-144, 6}}, color = {0, 0, 127}));
    connect(block_Pendel_param_01.Out_Angle_Pend, PID_lim_Pend.u_m) annotation(
      Line(points = {{74, 14}, {82, 14}, {82, -10}, {-66, -10}, {-66, 12}}, color = {0, 0, 127}));
    connect(PID_lim_Pend.y, block_Trq_erw.Trq_Soll) annotation(
      Line(points = {{-54, 24}, {-42, 24}, {-42, 25}}, color = {0, 0, 127}));
    connect(block_Trq_erw.Trq_Ist, block_Pendel_param_01.In_Torque_Rot) annotation(
      Line(points = {{0, 29}, {14, 29}, {14, 24}}, color = {0, 0, 127}));
    connect(block_Trq_erw.w_Mot, block_Pendel_param_01.Out_w_Rot) annotation(
      Line(points = {{-42, 36}, {-52, 36}, {-52, 56}, {92, 56}, {92, 34}, {74, 34}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.002),
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      Diagram(graphics = {Text(origin = {76, -42}, extent = {{-38, 20}, {38, -20}}, textString = "erweiterte Aktuatorstufe  
    
Abfangen des Pendels bis 40° Anfangsauslenkung
Bleibende Schwingung auf dem Rotor", horizontalAlignment = TextAlignment.Left)}));
  end Step_05_Trq_erw_01;

  block Block_Pendel_Reib_01
    //
    //ANFANG Parametrierung des Furuta-Pendels
    //
    // Geometrie
    parameter Real D_GrPlatte = 0.200;
    // Durchmesser der Grundplatte in m ; (0.200)
    parameter Real H_GrPlatte = 0.014;
    // Hoehe der Grundplatte in m ; (0.014)
    parameter Real D_Stator = 0.065;
    // Durchmesser Stator in m ; (0.065)
    parameter Real Di_Stator = 0.060;
    // I-Durchmesser Stator in m ; (0.060)
    parameter Real H_Stator = 0.045;
    // Hoehe Stator in m ; (0.045)
    parameter Real D_Rotor = 0.065;
    // Durchmesser Rotors in m ; (0.065)
    parameter Real Di_Rotor = 0.061;
    // I-Durchmesser Rotors in m ; (0.061)
    parameter Real H_Rotor = 0.059;
    // Hoehe Rotor in m ; (0.059)
    parameter Real D_Deckel = 0.065;
    // Durchmesser des Deckels in m ; (0.065)
    parameter Real H_Deckel = 0.002;
    // Dicke des Deckels in m ; (0.002) >> für Abgleich Rotor-Traegheitsmoments
    parameter Real D_Pendel = 0.006;
    // Durchmesser des Pendels in m ; (0.006)
    parameter Real L_Pendel = 0.075;
    // Laenge des Pendels in m ; (0.075)
    // Reibung und Daempfung
    parameter Real F_Damp_Pend = 0.0000003;
    // Faktor Daempfung Pendel 0 > ohne Daempfung (def 0.0000003)
    parameter Real F_Reib_Pend = 0.00006;
    // Reibung Pendel Fak_Reib = 0       > Reibungsfrei
    // Reibung Pendel Fak_Reib = 0.00006 > Reibung 6 myNm
    parameter Real F_Damp_Rot = 0.000003;
    // Faktor Daempfung Rot 0 > ohne Daempfung (def 0.000003)
    parameter Real F_Reib_Rot = 0.0006;
    // Reibung Pendel F_Reib_Rot = 0.0006  > Reibung 60 myNm
    // Reibung Pendel F_Reib_Rot = 0       > Reibungsfrei
    // Reibung Pendel F_Reib_Rot = 1000    > Rotor blockiert !! NICHT zur Modellierung mit Antrieb, nur für freies Ausschwingen !!
    //
    // weitere Parameter
    parameter Real Rho_Furuta = 7700;
    // Dichte der Bauteile des Furuta-Pendels in kg/m^3 ; (7700)
    parameter Real phi_0_Pend = 40/180*3.14;
    // Auslenkung des Pendels zum Zeitpunkt t= 0 in rad
    parameter Real phi_0_Rot = -90/180*3.14;
    // Auslenkung des Pendels zum Zeitpunkt t= 0 in rad
    //
    //ENDE Parametrierung des Furuta-Pendels
    //
    inner Modelica.Mechanics.MultiBody.World world(nominalLength = 0.3) annotation(
      Placement(transformation(origin = {-122, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Grundplatte(final color = {128, 0, 0}, density = Rho_Furuta, diameter(displayUnit = "mm") = D_GrPlatte, length(displayUnit = "mm") = H_GrPlatte, r(each displayUnit = "mm") = {0, 0.014, 0}) annotation(
      Placement(transformation(origin = {-96, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Stator(color = {128, 0, 0}, density = Rho_Furuta, diameter(displayUnit = "mm") = D_Stator, innerDiameter(displayUnit = "mm") = Di_Stator, length(displayUnit = "mm") = H_Stator, r(each displayUnit = "mm") = {0, H_Stator, 0}) annotation(
      Placement(transformation(origin = {-72, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Rotor(color = {0, 128, 0}, density = Rho_Furuta, diameter(displayUnit = "mm") = D_Rotor, innerDiameter(displayUnit = "mm") = Di_Rotor, length(displayUnit = "mm") = D_Rotor, r(each displayUnit = "mm") = {0, D_Rotor, 0}) annotation(
      Placement(transformation(origin = {-24, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Joints.Revolute rev_Stat_Rot(n = {0, 1, 0}, phi(start = phi_0_Rot), useAxisFlange = true) annotation(
      Placement(transformation(origin = {-48, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pin_Rot(color = {0, 128, 0}, density = Rho_Furuta, diameter(displayUnit = "mm") = 0.004, length(displayUnit = "mm") = 0.005, r(each displayUnit = "mm") = {(D_Rotor/2 + 0.0015), -0.005, 0}, r_shape(each displayUnit = "mm") = {(D_Rotor/2 - 0.0001), -0.005, 0}) annotation(
      Placement(transformation(origin = {2, -82}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder Pin_Pen(color = {0, 0, 128}, density = Rho_Furuta, diameter(displayUnit = "mm") = 0.004, length(displayUnit = "mm") = 0.005, r(each displayUnit = "mm") = {0.005, 0, 0}) annotation(
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
      Placement(transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-86, 0}, extent = {{-20, -20}, {20, 20}})));
    Modelica.Blocks.Interfaces.RealOutput Out_Angle_Rot annotation(
      Placement(transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {88, 0}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealOutput Out_Angle_Pend annotation(
      Placement(transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {88, -30}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.Derivative derivative annotation(
      Placement(transformation(origin = {22, 80}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealOutput Out_w_Rot annotation(
      Placement(transformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {88, 30}, extent = {{-10, -10}, {10, 10}})));
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
      Icon(graphics = {Rectangle(origin = {6, 3}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-72, 49}, {72, -49}}), Text(origin = {-41, 64}, extent = {{-27, 14}, {27, -14}}, textString = "%name"), Text(origin = {45, 2}, extent = {{-33, 10}, {33, -10}}, textString = "Angle_Rot >"), Text(origin = {41, -29}, extent = {{-37, 17}, {37, -17}}, textString = "Angle_Pend >"), Text(origin = {-38, 2}, extent = {{-26, 16}, {26, -16}}, textString = "> Torque"), Text(origin = {55, 32}, extent = {{-23, 8}, {23, -8}}, textString = "w_Rot >")}),
      uses(Modelica(version = "4.1.0")),
      Diagram(graphics = {Text(origin = {165, -72}, extent = {{-47, 26}, {47, -26}}, textString = "Furuta-Pendel als parametrierbarer Block
    Parameter können in der Code_Ansicht verändert werden
    mit drehzahlunabhängiger Reibung und drehzahlabhängiger Dämpfung
   
    Eingang: 
    - Moment
    
    Ausgänge: 
    - Winkel Rotor und Pendel 
    - Winkelgeschwindigkeit Rotor", horizontalAlignment = TextAlignment.Left)}),
      experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Block_Pendel_Reib_01;

  model Step_06_Trq_erw_Reib_01
    Modelica.Blocks.Sources.Constant Soll_Pend(k = 0) annotation(
      Placement(transformation(origin = {-136, 52}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Pend(controllerType = Modelica.Blocks.Types.SimpleController.PD, k = 10000, Td = 0.1) annotation(
      Placement(transformation(origin = {-66, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -0)));
    Modelica.Blocks.Math.Add add(k1 = +1, k2 = -1) annotation(
      Placement(transformation(origin = {-98, 24}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Continuous.LimPID PID_lim_Rot(Nd = 100, Td = 5, controllerType = Modelica.Blocks.Types.SimpleController.P, k = 0.05, Ti = 10000) annotation(
      Placement(transformation(origin = {-144, 18}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.Constant Soll_Pend1(k = 0) annotation(
      Placement(transformation(origin = {-182, 18}, extent = {{-10, -10}, {10, 10}})));
    Block_Trq_erw block_Trq_erw annotation(
      Placement(transformation(origin = {-21, 29}, extent = {{-21, -17}, {21, 17}})));
    Block_Pendel_Reib_01 block_Pendel_Reib_01 annotation(
      Placement(transformation(origin = {49, 29}, extent = {{-35, -35}, {35, 35}})));
  equation
    connect(PID_lim_Pend.u_s, add.y) annotation(
      Line(points = {{-78, 24}, {-86, 24}}, color = {0, 0, 127}));
    connect(Soll_Pend.y, add.u1) annotation(
      Line(points = {{-125, 52}, {-119, 52}, {-119, 30}, {-111, 30}}, color = {0, 0, 127}));
    connect(PID_lim_Rot.u_s, Soll_Pend1.y) annotation(
      Line(points = {{-156, 18}, {-170, 18}}, color = {0, 0, 127}));
    connect(add.u2, PID_lim_Rot.y) annotation(
      Line(points = {{-110, 18}, {-133, 18}}, color = {0, 0, 127}));
    connect(PID_lim_Pend.y, block_Trq_erw.Trq_Soll) annotation(
      Line(points = {{-54, 24}, {-42, 24}, {-42, 25}}, color = {0, 0, 127}));
    connect(block_Pendel_Reib_01.In_Torque_Rot, block_Trq_erw.Trq_Ist) annotation(
      Line(points = {{18, 30}, {0, 30}}, color = {0, 0, 127}));
    connect(block_Pendel_Reib_01.Out_w_Rot, PID_lim_Rot.u_m) annotation(
      Line(points = {{80, 40}, {100, 40}, {100, -20}, {-144, -20}, {-144, 6}}, color = {0, 0, 127}));
    connect(block_Pendel_Reib_01.Out_Angle_Pend, PID_lim_Pend.u_m) annotation(
      Line(points = {{80, 18}, {90, 18}, {90, -10}, {-66, -10}, {-66, 12}}, color = {0, 0, 127}));
    connect(block_Pendel_Reib_01.Out_w_Rot, block_Trq_erw.w_Mot) annotation(
      Line(points = {{80, 40}, {100, 40}, {100, 60}, {-54, 60}, {-54, 36}, {-42, 36}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.002),
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      Diagram(graphics = {Text(origin = {76, -42}, extent = {{-38, 20}, {38, -20}}, textString = "erweiterte Aktuatorstufe 
Pendel mit Reibung 
    
  Abfangen des Pendels bis 40° Anfangsauslenkung
  Bleibende Schwingung auf dem Rotor", horizontalAlignment = TextAlignment.Left)}));
  end Step_06_Trq_erw_Reib_01;
  annotation(
    uses(Modelica(version = "4.1.0")));
end Furuta_V03;
