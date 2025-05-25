import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:zbooma/style/color.dart';
import 'package:zbooma/style/size.dart';

class FilePicker1 extends StatefulWidget {
  final Function(String?) onFilePicked;
  final String uploadText;

  const FilePicker1({
    Key? key,
    required this.onFilePicked,
    required this.uploadText,
  }) : super(key: key);

  @override
  _FilePicker1State createState() => _FilePicker1State();
}

class _FilePicker1State extends State<FilePicker1> {
  PlatformFile? _pickedFile;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx'],
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          _pickedFile = result.files.first;
        });
        widget.onFilePicked(_pickedFile?.path);
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0e2424),
      height: height(context, .3),
      width: width(context, .8),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_pickedFile == null)
            InkWell(
              onTap: _pickFile,
              child: Container(
                height: height(context, .1),
                width: width(context, .4),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: AppColors.green,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload_rounded,
                        color: Color(0xff09f9a3),
                        size: 30,
                      ),
                      SizedBox(height: height(context, .01)),
                      Text(
                        widget.uploadText,
                        style: TextStyle(
                          color: Color(0xffc9c9c9),
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            Container(
              height: height(context, .1),
              width: width(context, .4),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Color(0xffc9c9c9),
                  width: 2,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _pickedFile!.extension == 'pdf'
                      ? Icon(Icons.picture_as_pdf, color: Colors.red, size: 50)
                      : Icon(Icons.image, color: Colors.blue, size: 50),
                  Positioned(
                    top: 2,
                    right: 30,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _pickedFile = null;
                        });
                        widget.onFilePicked(null);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        padding: EdgeInsets.all(2),
                        child: Icon(Icons.close, color: Colors.white, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
