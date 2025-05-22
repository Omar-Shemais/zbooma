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
