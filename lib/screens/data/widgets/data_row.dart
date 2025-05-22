import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zbooma/style/color.dart';

class CustomDataRow extends StatelessWidget {
  final String? value;
  final String label;
  final bool isLink;

  const CustomDataRow({
    super.key,
    required this.value,
    required this.label,
    this.isLink = false,
  });

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: isLink
                ? GestureDetector(
                    onTap: () async {
                      final uri = Uri.parse(value!.startsWith('http')
                          ? value!
                          : 'https://$value');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      }
                    },
                    child: Text(
                      value!,
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  )
                : Text(
                    value!,
                    style: const TextStyle(color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
          ),
          Text(":  $label",
              style: const TextStyle(
                  color: AppColors.green, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
