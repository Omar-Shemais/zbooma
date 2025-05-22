import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma/core/utiles/route_utils/route_utils.dart';
import 'package:zbooma/custom_widget/containers/custom_deatailes_card.dart';
import 'package:zbooma/style/color.dart';
import 'package:zbooma/style/size.dart';

class socialmedia extends StatelessWidget {
  const socialmedia({super.key});

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
                  'assets/soical.png',
                  scale: .1,
                )),
            SizedBox(
              height: height(context, .01),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                ": إدارة حسابات السوشيال ميديا",
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
                  "إدارة السوشيال ميديا ليست مجرد نشر محتوى، بل استراتيجية مدروسة لتعزيز وجودك الرقمي وزيادة أرباحك. نقدم لك خدمات متكاملة لبناء جمهور مستهدف، وتعزيز التفاعل، وتحقيق أعلى عائد استثماري.",
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
                  "تفاصيل خدمة إدارة حسابات السوشيال ميديا",
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
                    title: ": تطوير استراتيجية محتوى",
                    description:
                        "بناءً على البيانات المحللة، نطور استراتيجية إعلانية فعالة، تشمل اختيار القنوات المناسبة مثل فيسبوك وجوجل، وتصميم رسائل متوافقة مع أهداف الحملة.",
                  ),
                  CustomDeatailesCard(
                    title: ": تحليل الحسابات الحالية",
                    description:
                        "نبدأ بتحليل حساباتك على السوشيال ميديا لفهم التفاعل، المحتوى، والجمهور المستهدف. يساعدنا ذلك في تحديد نقاط التحسين وتطوير استراتيجيات فعالة",
                  ),
                  CustomDeatailesCard(
                    title: ": تحليل الأداء والتقارير ",
                    description:
                        "نقدم لك تقارير دورية شاملة توضح أداء حساباتك على السوشيال ميديا. نقوم بتحليل البيانات لتقديم توصيات مدروسة تساهم في تحسين الأداء وزيادة التفاعل",
                  ),
                  CustomDeatailesCard(
                    title: ": إدارة الحملات الإعلانية ",
                    description:
                        "نصمم ونُدير حملات إعلانية مدفوعة على فيسبوك، إنستجرام، تويتر، ولينكد إن، لضمان وصول إعلاناتك للجمهور المناسب بأفضل الأسعار.",
                  ),
                  SizedBox.shrink(),
                  CustomDeatailesCard(
                    title: ": التفاعل مع الجمهور",
                    description:
                        "ندير التفاعل اليومي مع متابعيك، من الردود إلى إدارة المسابقات، لتعزيز ولاء العملاء وزيادة التفاعل مع علامتك التجارية.",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/one.png',
                          scale: 4.r,
                        ),
                        SizedBox(
                          width: width(context, .03),
                        ),
                        Container(
                          // color: Color(0xFF03110F),
                          child: Row(
                            children: [
                              SizedBox(
                                width: width(context, .6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("الاستشارة الأولية :",
                                        style: TextStyle(
                                            color: Color(0xff09f9a3),
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: height(context, .01),
                                    ),
                                    Text(
                                        "نبدأ بفهم أهدافك التسويقية من خلال جلسة استشارية، حيث نقوم بتحديد النقاط الأساسية التي يجب تحسينها لتحقيق أفضل نتائج من إدارة حسابات السوشيال ميديا .",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold))
                                    // endcontaner
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    // aaaa
                    Container(
                      height: height(context, .2),
                      // color: Color.fromARGB(225, 255, 4, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/two.png',
                            scale: 4.r,
                          ),
                          SizedBox(
                            width: width(context, .03),
                          ),
                          Container(
                            // color: Color(0xFF03110F)
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width(context, .6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("تحليل الحسابات والمنافسين:",
                                          style: TextStyle(
                                              color: Color(0xff09f9a3),
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: height(context, .01),
                                      ),
                                      Text(
                                          "نقوم بإجراء تحليل شامل خدمات ادرارة صفحات السوشيال  لحساباتك الحالية بالإضافة إلى دراسة المنافسين، لنتمكن من وضع استراتيجية تسويق تنافسية تلبي احتياجات السوق.",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold))
                                      // endcontaner
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      // aaaa
                    ),
                    Container(
                      height: height(context, .2),
                      // color: Color.fromARGB(225, 255, 4, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/three.png',
                            scale: 4.r,
                          ),
                          SizedBox(
                            width: width(context, .03),
                          ),
                          Container(
                            // color: Color(0xFF03110F),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width(context, .6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("تطوير وتنفيذ الاستراتيجية:",
                                          style: TextStyle(
                                              color: Color(0xff09f9a3),
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: height(context, .01),
                                      ),
                                      Text(
                                          "بناءً على التحليل، نطور استراتيجية محتوى وحملات إعلانية متكاملة، ثم ننفذها من خلال إنشاء محتوى مبتكر يعكس هويتك ويعزز تواجدك على السوشيال ميديا.",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold))
                                      // endcontaner
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      // aaaa
                    ),
                    Container(
                      height: height(context, .2),
                      // color: Color.fromARGB(225, 255, 4, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/four.png',
                            scale: 4.r,
                          ),
                          SizedBox(
                            width: width(context, .03),
                          ),
                          Container(
                            // color: Color(0xFF03110F),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width(context, .6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("المتابعة والتحليل المستمر:",
                                          style: TextStyle(
                                              color: Color(0xff09f9a3),
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: height(context, .01),
                                      ),
                                      Text(
                                          "بعد تنفيذ الخطة، نتابع الأداء بشكل دوري من خلال أدوات التحليل المتقدمة. نقدم تقارير مفصلة توضح نقاط القوة والضعف، مع اقتراحات لتحسين الأداء وزيادة التفاعل",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold))
                                      // endcontaner
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      // aaaa
                    ),
                    Container(
                      height: height(context, .2),
                      // color: Color.fromARGB(225, 255, 4, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/five.png',
                            scale: 4.r,
                          ),
                          SizedBox(
                            width: width(context, .03),
                          ),
                          Container(
                            // color: Color(0xFF03110F),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width(context, .6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("التعديل والتحسين:",
                                          style: TextStyle(
                                              color: Color(0xff09f9a3),
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: height(context, .01),
                                      ),
                                      Text(
                                          "بناءً على النتائج التي نحصل عليها من التحليل، نقوم بتعديل الاستراتيجية وتطوير الحملات بشكل مستمر لضمان تحقيق أفضل النتائج وزيادة الأرباح.",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.bold))
                                      // endcontaner
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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
