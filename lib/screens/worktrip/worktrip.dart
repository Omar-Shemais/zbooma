import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:zbooma/custom_widget/containers/custom_dialog.dart';
import 'package:zbooma/screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:math' as math;

import 'package:zbooma/style/color.dart';

class WorkTrip extends StatefulWidget {
  final int clientId;

  const WorkTrip({super.key, required this.clientId});

  @override
  // ignore: library_private_types_in_public_api
  _WorkTripState createState() => _WorkTripState();
}

class _WorkTripState extends State<WorkTrip> {
  List<dynamic> stages = [];
  bool isLoading = true;

  // Responsive positions based on screen percentages instead of fixed values
  final List<Map<String, double>> responsivePositions = [
    {"bottomPercent": 0.90, "rightPercent": 0.20},
    {"bottomPercent": 0.77, "rightPercent": 0.45},
    {"bottomPercent": 0.62, "rightPercent": 0.45},
    {"bottomPercent": 0.45, "rightPercent": 0.10},
    {"bottomPercent": 0.47, "rightPercent": 0.45},
    {"bottomPercent": 0.31, "rightPercent": 0.45},
    {"bottomPercent": 0.20, "rightPercent": 0.10},
    {"bottomPercent": 0.18, "rightPercent": 0.45},
    {"bottomPercent": 0.00, "rightPercent": 0.55},
    {"bottomPercent": 0.03, "rightPercent": 0.20},
  ];

  @override
  void initState() {
    super.initState();
    loadStagesData();
  }

  Future<void> loadStagesData() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedStages = prefs.getString('stagesData');

    if (savedStages != null) {
      setState(() {
        stages = jsonDecode(savedStages);
        isLoading = false;
      });
    } else {
      fetchClientStages();
    }
  }

  Future<void> saveStagesData(List<dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('stagesData', jsonEncode(data));
  }

  Future<void> fetchClientStages() async {
    setState(() {
      isLoading = true;
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      print(
          " إرسال الطلب  `clientId: ${widget.clientId}`, `token: Bearer $token`");

      var response = await Dio().get(
        "https://app.crmzbooma.com/ClientStage/get-client-stages",
        queryParameters: {"clientId": widget.clientId},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          stages = response.data['\$values'] ?? [];
          isLoading = false;
        });

        await saveStagesData(stages);

        print(" تم جلب بيانات المراحل بنجاح.");
      } else {
        print(" خطأ في جلب البيانات: ${response.statusCode}");
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print(" استثناء أثناء جلب البيانات: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void logout() {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => LOGIN()),
    // );

    showDialog(
        context: context,
        builder: (context) => AppDialog(
            message: 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
            confirmTitle: 'confirmTitle',
            onConfirm: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LOGIN()),
              );
            }));
  }

  // Calculate responsive positions based on screen size
  Map<String, double> getResponsivePosition(
      int index, double screenHeight, double screenWidth) {
    if (index >= responsivePositions.length) {
      // If we have more stages than positions, use the last position
      index = responsivePositions.length - 1;
    }

    Map<String, double> position = responsivePositions[index];

    // Convert percentages to actual screen coordinates
    double bottom = screenHeight * 1.5 * position['bottomPercent']!;
    double right = screenWidth * position['rightPercent']!;

    // Add slight responsive adjustments for different screen sizes
    double screenRatio = screenWidth / screenHeight;

    // Adjust positions slightly based on screen ratio for better alignment
    if (screenRatio > 0.6) {
      // Wider screens
      right = right * 0.95; // Slightly move items inward
    } else if (screenRatio < 0.5) {
      // Narrower screens
      right = right * 1.05; // Slightly move items outward
    }

    // Ensure positions stay within reasonable bounds
    bottom = bottom.clamp(0, screenHeight * 1.45);
    right = right.clamp(screenWidth * 0.05, screenWidth * 0.8);

    return {
      'bottom': bottom,
      'right': right,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFe1d991),
        centerTitle: true,
        title: const Text("رحلة العمل",
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(icon: const Icon(Icons.logout), onPressed: logout),
      ),
      body: RefreshIndicator(
        onRefresh: () => fetchClientStages(),
        backgroundColor: Colors.transparent,
        color: AppColors.green,
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                double screenHeight = constraints.maxHeight;
                double screenWidth = constraints.maxWidth;

                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset('assets/trip.png', fit: BoxFit.cover),
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                Container(
                                  height: screenHeight * 1.5,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: screenHeight * 0.1),
                                            child: Image.asset(
                                              'assets/linetrip.png',
                                              width: screenWidth,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      for (int i = 0; i < stages.length; i++)
                                        Builder(
                                          builder: (context) {
                                            Map<String, double> position =
                                                getResponsivePosition(i,
                                                    screenHeight, screenWidth);
                                            return _buildContainer(
                                              context,
                                              stages[i]['isActive'] == true
                                                  ? "assets/${(i + 11).toString().padLeft(2, '0')}.png"
                                                  : "assets/${(i + 1).toString().padLeft(2, '0')}.png",
                                              stages[i]['stage']['name'] ??
                                                  "بدون اسم",
                                              stages[i]['isActive'] == true
                                                  ? const Color(0xff09f9a3)
                                                  : const Color(0xffcfcfcf),
                                              stages[i]['isActive'] == true
                                                  ? Colors.black
                                                  : const Color.fromARGB(
                                                      156, 41, 40, 40),
                                              position['bottom']!,
                                              position['right']!,
                                              screenWidth,
                                              screenHeight,
                                            );
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            if (isLoading)
              Container(
                color: const Color.fromARGB(0, 197, 197, 197)
                    .withValues(alpha: 0.3),
                width: double.infinity,
                height: double.infinity,
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(
    BuildContext context,
    String imageAsset,
    String text,
    Color containerColor,
    Color textColor,
    double bottom,
    double right,
    double screenWidth,
    double screenHeight,
  ) {
    // Responsive sizing based on screen dimensions
    double containerWidth =
        math.min(screenWidth * 0.25, 120); // Max width of 120
    double imageSize = math.min(screenWidth * 0.12, 60); // Max size of 60
    double fontSize = math.min(screenWidth * 0.035, 16); // Max font size of 16
    double padding = math.min(screenWidth * 0.02, 10); // Max padding of 10

    return Positioned(
      bottom: bottom,
      right: right,
      child: Column(
        children: [
          Container(
            width: containerWidth,
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 119, 118, 118)
                        .withValues(alpha: 0.1),
                    blurRadius: 5,
                    spreadRadius: 2),
              ],
            ),
            child: Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Image.asset(imageAsset, width: imageSize, fit: BoxFit.contain),
        ],
      ),
    );
  }
}




/*
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:zbooma/custom_widget/Bottoms/teipbottom.dart';
import 'package:zbooma/screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:zbooma/style/color.dart';

class WorkTrip extends StatefulWidget {
  final int clientId;

  const WorkTrip({super.key, required this.clientId});

  @override
  _WorkTripState createState() => _WorkTripState();
}

class _WorkTripState extends State<WorkTrip> {
  List<dynamic> stages = [];
  bool isLoading = true;

  final List<Map<String, double>> fixedPositions = [
    {"bottom": 1.35, "right": 0.2},
    {"bottom": 1.15, "right": 0.45},
    {"bottom": .93, "right": 0.45},
    {"bottom": 0.67, "right": 0.1},
    {"bottom": 0.70, "right": 0.45},
    {"bottom": 0.46, "right": 0.45},
    {"bottom": 0.30, "right": 0.1},
    {"bottom": 0.27, "right": 0.45},
    {"bottom": 0.00, "right": 0.55},
    {"bottom": 0.05, "right": 0.2},
  ];

  @override
  void initState() {
    super.initState();
    loadStagesData();
  }

  Future<void> loadStagesData() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedStages = prefs.getString('stagesData');

    if (savedStages != null) {
      setState(() {
        stages = jsonDecode(savedStages);
        isLoading = false;
      });
    } else {
      fetchClientStages();
    }
  }

  Future<void> saveStagesData(List<dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('stagesData', jsonEncode(data));
  }

  Future<void> fetchClientStages() async {
    setState(() {
      isLoading = true;
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      print(
          " إرسال الطلب  `clientId: ${widget.clientId}`, `token: Bearer $token`");

      var response = await Dio().get(
        "https://app.crmzbooma.com/ClientStage/get-client-stages",
        queryParameters: {"clientId": widget.clientId},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          stages = response.data['\$values'] ?? [];
          isLoading = false;
        });

        await saveStagesData(stages);

        print(" تم جلب بيانات المراحل بنجاح.");
      } else {
        print(" خطأ في جلب البيانات: ${response.statusCode}");
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print(" استثناء أثناء جلب البيانات: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LOGIN()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFe1d991),
        centerTitle: true,
        title: const Text("رحلة العمل",
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(icon: const Icon(Icons.logout), onPressed: logout),
      ),
      body: RefreshIndicator(
        onRefresh: () => fetchClientStages(),
        backgroundColor: Colors.transparent,
        color: AppColors.green,
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                double screenHeight = constraints.maxHeight;
                double screenWidth = constraints.maxWidth;

                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset('assets/trip.png', fit: BoxFit.cover),
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                Container(
                                  height: screenHeight * 1.5,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: screenHeight * 0.1),
                                            child: Image.asset(
                                              'assets/linetrip.png',
                                              width: screenWidth,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ),
                                      for (int i = 0; i < stages.length; i++)
                                        _buildContainer(
                                          context,
                                          stages[i]['isActive'] == true
                                              ? "assets/${(i + 11).toString().padLeft(2, '0')}.png"
                                              : "assets/${(i + 1).toString().padLeft(2, '0')}.png",
                                          stages[i]['stage']['name'] ??
                                              "بدون اسم",
                                          stages[i]['isActive'] == true
                                              ? const Color(0xff09f9a3)
                                              : const Color(0xffcfcfcf),
                                          stages[i]['isActive'] == true
                                              ? Colors.black
                                              : const Color.fromARGB(
                                                  156, 41, 40, 40),
                                          screenHeight *
                                              fixedPositions[
                                                      i % fixedPositions.length]
                                                  ['bottom']!,
                                          screenWidth *
                                              fixedPositions[
                                                      i % fixedPositions.length]
                                                  ['right']!,
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            if (isLoading)
              Container(
                color: const Color.fromARGB(0, 197, 197, 197).withOpacity(0.3),
                width: double.infinity,
                height: double.infinity,
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context, String imageAsset, String text,
      Color containerColor, Color textColor, double bottom, double right) {
    return Positioned(
      bottom: bottom,
      right: right,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 119, 118, 118)
                        .withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 2),
              ],
            ),
            child: Text(
              text,
              style: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Image.asset(imageAsset,
              width: MediaQuery.of(context).size.width * 0.12,
              fit: BoxFit.contain),
        ],
      ),
    );
  }
}
*/