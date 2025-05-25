import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma/core/utiles/route_utils/route_utils.dart';
import 'package:zbooma/custom_widget/containers/custom_deatailes_card.dart';
import 'package:zbooma/custom_widget/containers/step_card.dart';
import 'package:zbooma/style/color.dart';
import 'package:zbooma/style/size.dart';

class marketing extends StatelessWidget {
  const marketing({super.key});

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
                  'assets/canbanin.png',
                  // scale: .3,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: height(context, .01),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "ادارة حملات اعلانية",
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
                  "ادارة حملات اعلانية تمثل الأساس الذي تبنى عليه استراتيجيات التسويق الإلكتروني الناجحة. سواء كنت تدير متجرًا إلكترونيًا صغيرًا أو علامة تجارية عالمية، فإن الحملات الإعلانية المدروسة تلعب دورًا حاسمًا في تعزيز مكانتك في السوق.",
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
                  "كيف تتم عملية الحملات الإعلانية لدينا في سباق؟",
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
                childAspectRatio: 1.1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  CustomDeatailesCard(
                    title: "تصميم استراتيجيات الإعلانات",
                    description:
                        "بناءً على البيانات المحللة، نطور استراتيجية إعلانية فعالة، تشمل اختيار القنوات المناسبة مثل فيسبوك وجوجل، وتصميم رسائل متوافقة مع أهداف الحملة.",
                  ),
                  CustomDeatailesCard(
                    title: "التخطيط الاستراتيجي والتحليل",
                    description:
                        "نبدأ إدارة الحملات الإعلانية بفهم متطلبات العميل وتحليل سوقه وجمهوره المستهدف، مع دراسة أداء الحملات السابقة وسلوك المستهلك عبر المنصات الرقمية.",
                  ),
                  CustomDeatailesCard(
                    title: "التنفيذ التقني وإعداد الإعلانات",
                    description:
                        "ننفذ الحملة عبر أدوات مثل Google Ads، مع تحديد الميزانية والأهداف والجمهور، وتفعيل Google Analytics لمتابعة الأداء بدقة.",
                  ),
                  CustomDeatailesCard(
                    title: " إنشاء المحتوى الإعلاني الجذاب",
                    description:
                        "فريقنا من المحترفين يقوم بإنشاء محتوى إعلاني مبتكر يتوافق مع هوية العميل ويجذب الجمهور المستهدف. ",
                  ),
                  CustomDeatailesCard(
                    title: " تقديم التقارير النهائية وتحليل النجاح",
                    description:
                        "بعد انتهاء الحملة، نوفر تقارير مفصلة توضح أداء كل عنصر، مما يساعد العميل على تقييم النتائج وفهمها بدقة.",
                  ),
                  CustomDeatailesCard(
                    title: "مراقبة الأداء والتحسين المستمر",
                    description:
                        "منذ إطلاق الحملة، نراقبها على مدار الساعة باستخدام تقارير تحليلية لقياس الأداء، مثل CTR وROI، مع تحسين مستمر لضمان أفضل النتائج.",
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
                "خطوات تقديم خدمة الحملات الاعلانية ",
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
                            'نبدأ العملية بالاستماع إلى متطلباتك وتحليل مشروعك بشكل دقيق.',
                      ),
                      StepCard(
                        imagePath: 'assets/two.png',
                        title: 'تحليل السوق والمنافسين:',
                        description:
                            'نقوم بدراسة السوق الذي تعمل فيه، ونعمل على تحليل أداء منافسيك للإطلاع على كيفية تقديم الأفضل.',
                      ),
                      StepCard(
                        imagePath: 'assets/three.png',
                        title: 'تحديد الأهداف:',
                        description:
                            'نعمل على تحديد الأهداف الواضحة والقابلة للقياس والتي تساهم في نجاح الحملة الإعلانية.',
                      ),
                      StepCard(
                        imagePath: 'assets/four.png',
                        title: 'تصميم الإعلانات:',
                        description:
                            'فريقنا الإبداعي يقوم بتصميم الإعلانات التي تتماشى مع هوية علامتك التجارية وتلفت أنظار الجمهور.',
                      ),
                      StepCard(
                        imagePath: 'assets/five.png',
                        title: 'إطلاق الحملة: ',
                        description:
                            'نقوم بإطلاق حملتك الإعلانية على القنوات المختارة مع متابعة دقيقة لكل خطوة.',
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
