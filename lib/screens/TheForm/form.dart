import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zbooma/core/widgets/snak_bar.dart';
import 'package:zbooma/custom_widget/Bottoms/custom_Bottoms.dart';
import 'package:zbooma/custom_widget/filepicker/file1.dart';
import 'package:zbooma/style/size.dart';
import 'package:zbooma/style/text.dart';

class TheFFFFFF extends StatefulWidget {
  final int userId;

  const TheFFFFFF({super.key, required this.userId});

  @override
  State<TheFFFFFF> createState() => _TheFFFFFFState();
}

class _TheFFFFFFState extends State<TheFFFFFF> {
  String? ibanFile;
  String? identityFile;
  String? commercialFile;
  bool isUploading = false;
  bool isUploadedSuccessfully = false;
  final Dio _dio = Dio();

  bool get allFilesUploaded =>
      ibanFile != null && identityFile != null && commercialFile != null;

  Future<void> uploadFiles() async {
    if (!allFilesUploaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("يرجى تحميل جميع الملفات قبل الإرسال.")),
      );
      return;
    }

    setState(() {
      isUploading = true;
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      String url = 'https://app.crmzbooma.com/Client/${widget.userId}/files';

      FormData formData = FormData.fromMap({
        'ibanFile':
            await MultipartFile.fromFile(ibanFile!, filename: 'iban.png'),
        'identityFile': await MultipartFile.fromFile(identityFile!,
            filename: 'identity.png'),
        'commercialFile': await MultipartFile.fromFile(commercialFile!,
            filename: 'commercial.png'),
      });

      Response response = await _dio.post(
        url,
        data: formData,
        options: Options(headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        showSnackBar(
          "✅ تم إرسال الملفات بنجاح!",
        );

        setState(() {
          isUploadedSuccessfully = true;
        });
      } else {
        showSnackBar(
          "❌ فشل في إرسال الملفات. حاول مرة أخرى.",
          isError: true,
        );
      }
    } catch (e) {
      print(" خطأ أثناء رفع الملفات: $e");
      showSnackBar("⚠️ حدث خطأ أثناء رفع الملفات.", succColor: Colors.orange);
    }

    setState(() {
      isUploading = false;
    });
  }

  Future<void> refreshData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refreshData,
        color: Colors.green,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/data.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Image.asset(
                      "assets/Frame.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height: height(context, .01)),
                  Text(
                    "يرجى ملء الفورم بمعلومات دقيقة",
                    style: AppTextStyles.headline2,
                  ),
                  SizedBox(height: height(context, .02)),
                  _buildFilePicker(
                    label: "الرقم القومي",
                    filePath: identityFile,
                    onFilePicked: (file) => setState(() => identityFile = file),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildFilePicker(
                          label: "IBAN",
                          filePath: ibanFile,
                          onFilePicked: (file) =>
                              setState(() => ibanFile = file),
                        ),
                        SizedBox(width: width(context, .05)),
                        _buildFilePicker(
                          label: "الوثيقة / السجل التجاري",
                          filePath: commercialFile,
                          onFilePicked: (file) =>
                              setState(() => commercialFile = file),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height(context, .02)),
                  if (!isUploadedSuccessfully)
                    Container(
                      height: height(context, .05),
                      width: width(context, .9),
                      child: CustomButton(
                        text: "ارسال",
                        onPressed: allFilesUploaded ? uploadFiles : null,
                        isLoading: isUploading,
                      ),
                    ),
                  SizedBox(height: height(context, .09)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilePicker({
    required String label,
    required String? filePath,
    required void Function(String?) onFilePicked,
  }) {
    return Column(
      children: [
        Text(label, style: AppTextStyles.bodyText1),
        SizedBox(height: height(context, .02)),
        Container(
          height: height(context, .1),
          width: width(context, .4),
          child: isUploadedSuccessfully
              ? Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // color: Colors.green[100],
                      // borderRadius: BorderRadius.circular(20),
                      // border: Border.all(
                      //   color: Colors.green,
                      //   width: 0,
                      // ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.green.withOpacity(0.4),
                      //     blurRadius: 10,
                      //     offset: const Offset(0, 4),
                      //   ),
                      // ],
                      ),
                  child: const Text(
                    "✅ تم الرفع بنجاح",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : FilePicker1(
                  uploadText: label,
                  onFilePicked: onFilePicked,
                ),
        ),
      ],
    );
  }
}
