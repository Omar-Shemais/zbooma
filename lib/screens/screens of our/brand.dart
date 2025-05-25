import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma/core/utiles/route_utils/route_utils.dart';
import 'package:zbooma/custom_widget/containers/custom_deatailes_card.dart';
import 'package:zbooma/custom_widget/containers/step_card.dart';
import 'package:zbooma/style/color.dart';
import 'package:zbooma/style/size.dart';

class Brand extends StatelessWidget {
  const Brand({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/AppBackGround.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            SizedBox(
                height: height(context, .37).h,
                width: double.infinity,
                child: Image.asset(
                  'assets/marketing.png',
                  // scale: .4,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: height(context, .01),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "تطوير العلامة التجارية",
                style: TextStyle(
                    color: Color(0xff09f9a3),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  "علامتك التجارية ليست مجرد اسم أو شعار، بل هي هويتك التي تعبر عن رؤيتك وقيمك. نحن نساعدك في بناء علامة قوية ومتميزة تعزز ظهورك الرقمي وتضعك في مقدمة المنافسة من خلال استراتيجيات مبتكرة وفعالة",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  "تفاصيل خدمة تطوير العلامة التجارية",
                  style: TextStyle(
                      color: Color(0xff09f9a3),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Container(
              // height: height(context, .74),
              // width: width(context, 1),
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: width(context, .03),
                mainAxisSpacing: height(context, .015),
                childAspectRatio: 1.1, // Adjust based on your card content
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable inner scrolling
                children: const [
                  CustomDeatailesCard(
                    title: "تطوير استراتيجية العلامة التجارية",
                    description:
                        ".نساعدك في تحديد قيم علامتك التجارية وصياغة رسائلها الرئيسية، مع تطوير استراتيجية تواصل فعالة تقدم قيمة مضافة لجمهورك.",
                  ),
                  CustomDeatailesCard(
                    title: "تصميم الشعار والهوية البصرية",
                    description:
                        ".نصمم شعارًا فريدًا وهوية بصرية متكاملة تعكس علامتك التجارية، بما في ذلك الألوان والخطوط والأنماط، لترك انطباع مميز لدى عملائك",
                  ),
                  CustomDeatailesCard(
                    title: "إدارة تجربة العلامة التجارية",
                    description:
                        ".نساعدك في إدارة تجربة العملاء مع علامتك التجارية لضمان تقديم تجربة متسقة ومميزة تعزز من ولاء العملاء وتزيد من تفاعلهم مع علامتك",
                  ),
                  CustomDeatailesCard(
                    title: "بناء حضور رقمي قوي",
                    description:
                        ".نساعدك في بناء حضور رقمي قوي عبر المواقع والتواصل الاجتماعي، لضمان رؤية علامتك التجارية ووصولها الفعّال لجمهورك المستهدف",
                  ),
                  SizedBox.shrink(),
                  CustomDeatailesCard(
                    title: "تحليل وتطوير الأداء",
                    description:
                        ".نقدم تحليلات دورية لأداء علامتك التجارية، ونقوم بتعديل الاستراتيجيات وفقًا للبيانات لتحسين الأداء وتحقيق أفضل النتائج",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height(context, .02),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                ": خطوات تقديم الخدمة",
                style: TextStyle(
                    color: Color(0xff09f9a3),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              // color: Color.fromARGB(255, 0, 0, 255),
              height: height(context, 1.2),
              width: width(context, 1),
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      StepCard(
                        imagePath: 'assets/one.png',
                        title: 'الاستشارة الأولية :',
                        description:
                            '.نبدأ بفهم رؤيتك وأهدافك من خلال جلسة استشارية. نقوم بتحديد النقاط التي تحتاج إلى تطوير ونضع خطة مبدئية في تطوير العلامة التجارية',
                      ),
                      StepCard(
                        imagePath: 'assets/two.png',
                        title: 'تحليل السوق والمنافسين',
                        description:
                            '.نقوم بإجراء تحليل شامل للسوق والمنافسين لفهم الاتجاهات الحالية وتحديد الفرص المتاحة لعلامتك التجارية. هذا يساعدنا في وضع استراتيجيات تنافسية فعالة',
                      ),
                      StepCard(
                        imagePath: 'assets/three.png',
                        title: 'تصميم الهوية البصرية وتطوير الاستراتيجية',
                        description:
                            '.بعد التحليل، نبدأ في تصميم الشعار والهوية البصرية، مع تطوير استراتيجية متكاملة تعبر عن قيم علامتك وتساعد في الوصول إلى الجمهور المستهدف',
                      ),
                      StepCard(
                        imagePath: 'assets/four.png',
                        title: 'تنفيذ الاستراتيجية وبناء الحضور الرقمي',
                        description:
                            '.نعمل على تنفيذ الاستراتيجية الموضوعة، بما في ذلك تطوير موقع الويب، إدارة وسائل التواصل الاجتماعي، وتقديم المحتوى الذي يعزز من تواجد علامتك الرقمية',
                      ),
                      StepCard(
                        imagePath: 'assets/five.png',
                        title: 'مراقبة وتقييم الأداء',
                        description:
                            '.بعد تنفيذ الاستراتيجية، نقوم بمتابعة الأداء وتقديم تقارير دورية توضح التقدم المحرز. نعمل على تعديل الاستراتيجيات حسب الحاجة لضمان تحقيق الأهداف',
                      ),
                    ],
                  )),
            )
          ])),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: AppColors.green),
              onPressed: () => RouteUtils.pop(),
            ),
          )
        ],
      ),
    ));
  }
}
