import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma/core/utiles/route_utils/route_utils.dart';
import 'package:zbooma/custom_widget/containers/custom_deatailes_card.dart';
import 'package:zbooma/custom_widget/containers/step_card.dart';
import 'package:zbooma/style/color.dart';
import 'package:zbooma/style/size.dart';

class graphic extends StatelessWidget {
  const graphic({super.key});

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
                height: height(context, .3),
                width: double.infinity,
                child: Image.asset(
                  'assets/design.png',
                  // scale: .4,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: height(context, .01),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                ": تصميمات الجرافيك",
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
                  "ندرك أن تصميمات الجرافيك تلعب دورًا أساسيًا في نجاح متجرك الإلكتروني، فهي تعكس هوية علامتك وتزيد التفاعل مع منتجاتك. نقدم لك تصاميم احترافية بجودة عالية لتعزيز تجربة عملائك وتحقيق أهدافك.",
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
                  "تفاصيل الخدمة : ",
                  style: TextStyle(
                      color: Color(0xff09f9a3),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Container(
              width: width(context, 1),
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: width(context, .03),
                mainAxisSpacing: height(context, .015),
                childAspectRatio: 1.1, // You can fine-tune this if needed
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  CustomDeatailesCard(
                    title: " : تصميم واجهات المستخدم  ",
                    description:
                        "نصمم واجهات جذابة وسهلة الاستخدام، توفر تجربة مميزة تعزز تفاعل المستخدم وتزيد معدلات التحويل في متجرك الإلكتروني.",
                  ),
                  CustomDeatailesCard(
                    title: " : تصميم الشعارات والهويةالبصرية ",
                    description:
                        "نحلل رؤيتك وهويتك التجارية لتصميم شعار فريد وهوية بصرية متكاملة تعكس قيم علامتك وتمنحك التميز في السوق.",
                  ),
                  CustomDeatailesCard(
                    title: ": تصميم المنتجات والمطبوعات  ",
                    description:
                        "نقدم تصميمات عالية الجودة للمنتجات والمواد المطبوعة، مثل الكتيبات والملصقات، لتلبية احتياجاتك وتعزيز الترويج لمنتجاتك بفعالية.",
                  ),
                  CustomDeatailesCard(
                    title: "تصميمات التسويق الرقمي:",
                    description:
                        "نصمم إعلانات وبانرات احترافية تجذب العملاء المحتملين، سواء لوسائل التواصل أو إعلانات (PPC)، لضمان تحقيق أهدافك التسويقية بفعالية.",
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
                      title: "الاستشارة الأولية :",
                      description:
                          "نبدأ بالتواصل معك لفهم احتياجاتك وتوقعاتك. نتعرف على رؤيتك وأهدافك التجارية لضمان أن التصميمات التي نقدمها تتماشى مع هوية علامتك التجارية.",
                    ),
                    StepCard(
                      imagePath: 'assets/two.png',
                      title: "البحث والتخطيط:",
                      description:
                          "نحلل متطلباتك ونجري بحثًا شاملاً عن السوق والمنافسين لاتجاهات التصميم الحديثة، ثم نضع خطة زمنية مفصلة لتنفيذ كل مرحلة بكفاءة.",
                    ),
                    StepCard(
                      imagePath: 'assets/three.png',
                      title: "التصميم والابتكار:",
                      description:
                          "يبدأ فريقنا من المصممين المبدعين في تحويل الأفكار إلى تصميمات واقعية. نعمل على إبداع تصميمات مبتكرة تجمع بين الجمال والوظيفية، مع الالتزام بالمعايير الفنية العالية.",
                    ),
                    StepCard(
                      imagePath: 'assets/four.png',
                      title: "المراجعة والتعديل:",
                      description:
                          "نشاركك التصميمات الأولية للحصول على ملاحظاتك. نحن ملتزمون بالتعديل والتحسين حتى نصل إلى التصميم النهائي الذي يلبي توقعاتك بالكامل.",
                    ),
                    StepCard(
                      imagePath: 'assets/five.png',
                      title: "التسليم والمتابعة:",
                      description:
                          "بعد إتمام التصميمات النهائية، نقوم بتسليمها في الصيغ المطلوبة للاستخدام الفوري. نقدم أيضًا خدمات دعم مستمرة لضمان تحديث التصميمات عند الحاجة وتقديم المساعدة في تنفيذها بشكل صحيح.",
                    ),
                  ],
                ),
              ),
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
