import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma/core/utiles/route_utils/route_utils.dart';
import 'package:zbooma/custom_widget/containers/custom_deatailes_card.dart';
import 'package:zbooma/custom_widget/containers/step_card.dart';
import 'package:zbooma/style/color.dart';
import 'package:zbooma/style/size.dart';

class Programming extends StatelessWidget {
  const Programming({super.key});

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
            Stack(
              children: [
                Positioned(
                    right: 5,
                    top: 5,
                    child: IconButton(
                        onPressed: () => RouteUtils.pop(),
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.black,
                          size: 50,
                        ))),
                SizedBox(
                    height: height(context, .3),
                    width: double.infinity,
                    child: Image.asset(
                      'assets/prog.png',
                      // scale: .1,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
            SizedBox(
              height: height(context, .01),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                ": خدمات برمجيه ",
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
                  "نحن في شركة زا بوما نقدم خدمات برمجية متكاملة تغطي جميع جوانب تطوير المتاجر الإلكترونية. سواء كنت بحاجة إلى تصميم متجر من الصفر، أو تحسين موقعك الحالي، فإن فريقنا من المطورين ذوي الخبرة مستعد لتقديم الدعم اللازم.",
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
                  "كيف تتم عملية الخدمات البرمجية لدينا ؟",
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
                    title: "  :Back-End Development",
                    description:
                        "نضمن تطوير موقع إلكتروني قوي ببرمجة متينة وقاعدة بيانات منظمة لمعالجة البيانات بكفاءة. نوفر أنظمة إدارة محتوى (CMS) تمنحك تحكمًا كاملًا وسهل الاستخدام.",
                  ),
                  CustomDeatailesCard(
                    title: ": تصميم وتطوير الواجهات ",
                    description:
                        "نحرص على تقديم واجهات سهلة الاستخدام و متجاوبة مع جميع الأجهزة. نعمل على تصميم تجربة مستخدم سلسة تجذب الزوار وتزيد من معدل التحويل.",
                  ),
                  CustomDeatailesCard(
                    title: ": الأمان والحماية ",
                    description:
                        "نضع أمان موقعك على رأس أولوياتنا. نستخدم أحدث تقنيات الحماية لضمان أن بيانات عملائك و معلوماتك الحساسة محفوظة بشكل آمن.",
                  ),
                  CustomDeatailesCard(
                    title: ": دمج الحلول التقنية ",
                    description:
                        "نساعدك في دمج متجرك مع أنظمة الدفع الإلكتروني، وإدارة المخزون، وأدوات التسويق الإلكتروني، مما يضمن تكامل جميع جوانب عملك في منصة واحدة.",
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
                  children: const [
                    StepCard(
                      imagePath: 'assets/one.png',
                      title: "الاستشارة الأولية :",
                      description:
                          "نبدأ بفهم احتياجات متجرك بشكل دقيق من خلال جلسة استشارية شاملة. نتعرف على أهدافك، والجمهور المستهدف، والتحديات التي تواجهها.",
                    ),
                    StepCard(
                      imagePath: 'assets/two.png',
                      title: "التخطيط والتصميم:",
                      description:
                          "بعد جمع المعلومات اللازمة، نقوم بتخطيط وتنفيذ تصميم مبدئي يراعي تجربة المستخدم والجانب الجمالي. نعمل معك خطوة بخطوة لضمان أن التصميم يلبي توقعاتك.",
                    ),
                    StepCard(
                      imagePath: 'assets/three.png',
                      title: "التطوير والبرمجة:",
                      description:
                          "يبدأ فريقنا من المطورين في بناء متجرك باستخدام أحدث تقنيات برمجه مواقع . نحرص على أن يكون الموقع متجاوبًا، سريعًا، وآمنًا، مع دمج جميع الميزات التي تم الاتفاق عليها.",
                    ),
                    StepCard(
                      imagePath: 'assets/four.png',
                      title: "الاختبار والتقييم:",
                      description:
                          "بعد إكمال عملية التطوير، نقوم بإجراء اختبارات شاملة للتأكد من أن الموقع يعمل بكفاءة عالية دون أي مشاكل. يتم اختبار المتجر على مختلف الأجهزة والمتصفحات لضمان تجربة مستخدم ممتازة.",
                    ),
                    StepCard(
                      imagePath: 'assets/five.png',
                      title: "الإطلاق والمتابعة:",
                      description:
                          "بعد التأكد من جاهزية المتجر، نقوم بإطلاقه رسميًا. لكن عملنا لا يتوقف هنا؛ نحن نقدم دعمًا مستمرًا لضمان نجاح متجرك في السوق الإلكتروني. نتابع أداء الموقع ونوفر التحديثات والتحسينات اللازمة.",
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
