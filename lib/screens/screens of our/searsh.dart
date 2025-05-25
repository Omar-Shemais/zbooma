import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma/core/utiles/route_utils/route_utils.dart';
import 'package:zbooma/custom_widget/containers/custom_deatailes_card.dart';
import 'package:zbooma/custom_widget/containers/step_card.dart';
import 'package:zbooma/style/color.dart';
import 'package:zbooma/style/size.dart';

class search extends StatelessWidget {
  const search({super.key});

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
                  'assets/seo.png',
                  // scale: .4.r,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: height(context, .01),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                ": تحسين محركات البحث ",
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
                  "في شركة زابوما نساعدك على تحسين محركات البحث (SEO) لمتجرك الإلكتروني لضمان ظهوره في النتائج الأولى على جوجل. بفضل خبرتنا وفريقنا المتخصص، نقدم حلولًا متكاملة لتعزيز أداء متجرك الرقمي وجذب المزيد من العملاء المستهدفين.",
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
                  "كيف تتم عملية تحسين محركات البحث لدينا ؟",
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
                childAspectRatio: 1.1, // Adjust this for spacing/sizing
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  CustomDeatailesCard(
                    title: ": تحسين بنية الموقع",
                    description:
                        "نحسن بنية متجرك الإلكتروني من خلال تسريع التحميل، وتسهيل التنقل، وضمان التوافق مع الأجهزة المحمولة لتعزيز تجربة المستخدم وزيادة التفاعل",
                  ),
                  CustomDeatailesCard(
                    title: ": تحليل الكلمات المفتاحية ",
                    description:
                        "نبدأ بتحليل شامل للكلمات المفتاحية ذات الصلة بمنتجاتك وخدماتك، لضمان استهداف الجمهور الصحيح وزيادة فرص ظهورك في نتائج البحث.",
                  ),
                  CustomDeatailesCard(
                    title: ": بناء الروابط ",
                    description:
                        "نقوم بتطوير استراتيجية فعالة لبناء الروابط الداخلية والخارجية التي تدعم ترتيب موقعك في محركات البحث، مما يعزز من مصداقية متجرك ويزيد من ترتيبه",
                  ),
                  CustomDeatailesCard(
                    title: ": تحسين المحتوى ",
                    description:
                        "نقوم بتحسين محركات البحث عبر تطوير المحتوى الحالي، وإضافة محتوى جديد متوافق مع السيو، مع تحسين العناوين، والوصف الميتا، والصور لضمان أفضل أداء",
                  ),
                  SizedBox.shrink(),
                  CustomDeatailesCard(
                    title: ": تحليل الأداء",
                    description:
                        "نقدم تقارير دورية توضح تقدم موقعك في نتائج البحث، ونقوم بتحليل البيانات لضمان التحسين المستمر وتعديل الاستراتيجيات حسب الحاجة",
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
                    SingleChildScrollView(
                      child: Container(
                        width: width(context, 1),
                        padding: EdgeInsets.symmetric(
                            vertical: height(context, .03)),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            children: const [
                              StepCard(
                                imagePath: 'assets/one.png',
                                title: "الاستشارة الأولية :",
                                description:
                                    "نحدد استراتيجيتك المثلى لتحسين محركات البحث من خلال جلسة استشارية تفهم احتياجات متجرك وأهدافه",
                              ),
                              StepCard(
                                imagePath: 'assets/two.png',
                                title: "تحليل الموقع:",
                                description:
                                    "نقوم بإجراء تحليل شامل لموقعك لتحديد نقاط القوة والضعف، ومن ثم وضع خطة عمل مخصصة لتحسين أداء السيو",
                              ),
                              StepCard(
                                imagePath: 'assets/three.png',
                                title: "تنفيذ الاستراتيجية:",
                                description:
                                    "يبدأ فريقنا المتخصص في تنفيذ الخطة الموضوعة في تحسين محرك البحث الرقمي ، بما في ذلك تحسين بنية الموقع والمحتوى، وبناء الروابط اللازمة",
                              ),
                              StepCard(
                                imagePath: 'assets/four.png',
                                title: "المتابعة والتحليل:",
                                description:
                                    "بعد تنفيذ الاستراتيجية، نتابع أداء الموقع بانتظام، ونقدم تقارير تفصيلية عن التقدم المحرز، مع اقتراحات لتحسين مستمر",
                              ),
                              StepCard(
                                imagePath: 'assets/five.png',
                                title: "الدعم المستمر:  ",
                                description:
                                    "نحن لا نكتفي بتحسين موقعك مرة واحدة، بل نقدم دعمًا مستمرًا لضمان بقاء متجرك في الصدارة. نتعامل مع أي تغييرات في خوارزميات محركات البحث ونقوم بتحديثات دورية لضمان استمرار النجاح",
                              ),
                            ],
                          ),
                        ),
                      ),
                    )

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Image.asset(
                    //       'assets/one.png',
                    //       scale: 4.r,
                    //     ),
                    //     SizedBox(
                    //       width: width(context, .03),
                    //     ),
                    //     Container(
                    //       // color: Color(0xFF03110F),
                    //       child: Row(
                    //         children: [
                    //           SizedBox(
                    //             width: width(context, .6),
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Text("الاستشارة الأولية :",
                    //                     style: TextStyle(
                    //                         color: Color(0xff09f9a3),
                    //                         fontSize: 20.sp,
                    //                         fontWeight: FontWeight.bold)),
                    //                 SizedBox(
                    //                   height: height(context, .01),
                    //                 ),
                    //                 Text(
                    //                     "نحدد استراتيجيتك المثلى لتحسين محركات البحث من خلال جلسة استشارية تفهم احتياجات متجرك وأهدافه",
                    //                     style: TextStyle(
                    //                         color: Colors.white,
                    //                         fontSize: 13.sp,
                    //                         fontWeight: FontWeight.bold))
                    //                 // endcontaner
                    //               ],
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // // aaaa
                    // Container(
                    //   height: height(context, .2),
                    //   // color: Color.fromARGB(225, 255, 4, 0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Image.asset(
                    //         'assets/two.png',
                    //         scale: 4.r,
                    //       ),
                    //       SizedBox(
                    //         width: width(context, .03),
                    //       ),
                    //       Container(
                    //         // color: Color(0xFF03110F)
                    //         child: Row(
                    //           children: [
                    //             SizedBox(
                    //               width: width(context, .6),
                    //               child: Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: [
                    //                   Text("تحليل الموقع:",
                    //                       style: TextStyle(
                    //                           color: Color(0xff09f9a3),
                    //                           fontSize: 20.sp,
                    //                           fontWeight: FontWeight.bold)),
                    //                   SizedBox(
                    //                     height: height(context, .01),
                    //                   ),
                    //                   Text(
                    //                       "نقوم بإجراء تحليل شامل لموقعك لتحديد نقاط القوة والضعف، ومن ثم وضع خطة عمل مخصصة لتحسين أداء السيو",
                    //                       style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 13.sp,
                    //                           fontWeight: FontWeight.bold))
                    //                   // endcontaner
                    //                 ],
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    //   // aaaa
                    // ),
                    // Container(
                    //   height: height(context, .2),
                    //   // color: Color.fromARGB(225, 255, 4, 0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Image.asset(
                    //         'assets/three.png',
                    //         scale: 4.r,
                    //       ),
                    //       SizedBox(
                    //         width: width(context, .03),
                    //       ),
                    //       Container(
                    //         // color: Color(0xFF03110F),
                    //         child: Row(
                    //           children: [
                    //             SizedBox(
                    //               width: width(context, .6),
                    //               child: Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: [
                    //                   Text("تنفيذ الاستراتيجية:",
                    //                       style: TextStyle(
                    //                           color: Color(0xff09f9a3),
                    //                           fontSize: 20.sp,
                    //                           fontWeight: FontWeight.bold)),
                    //                   SizedBox(
                    //                     height: height(context, .01),
                    //                   ),
                    //                   Text(
                    //                       "يبدأ فريقنا المتخصص في تنفيذ الخطة الموضوعة في تحسين محرك البحث الرقمي ، بما في ذلك تحسين بنية الموقع والمحتوى، وبناء الروابط اللازمة",
                    //                       style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 13.sp,
                    //                           fontWeight: FontWeight.bold))
                    //                   // endcontaner
                    //                 ],
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    //   // aaaa
                    // ),
                    // Container(
                    //   height: height(context, .2),
                    //   // color: Color.fromARGB(225, 255, 4, 0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Image.asset(
                    //         'assets/four.png',
                    //         scale: 4.r,
                    //       ),
                    //       SizedBox(
                    //         width: width(context, .03),
                    //       ),
                    //       Container(
                    //         // color: Color(0xFF03110F),
                    //         child: Row(
                    //           children: [
                    //             SizedBox(
                    //               width: width(context, .6),
                    //               child: Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: [
                    //                   Text("المتابعة والتحليل:",
                    //                       style: TextStyle(
                    //                           color: Color(0xff09f9a3),
                    //                           fontSize: 20.sp,
                    //                           fontWeight: FontWeight.bold)),
                    //                   SizedBox(
                    //                     height: height(context, .01),
                    //                   ),
                    //                   Text(
                    //                       "بعد تنفيذ الاستراتيجية، نتابع أداء الموقع بانتظام، ونقدم تقارير تفصيلية عن التقدم المحرز، مع اقتراحات لتحسين مستمر",
                    //                       style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 13.sp,
                    //                           fontWeight: FontWeight.bold))
                    //                   // endcontaner
                    //                 ],
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    //   // aaaa
                    // ),
                    // Container(
                    //   height: height(context, .2),
                    //   // color: Color.fromARGB(225, 255, 4, 0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Image.asset(
                    //         'assets/five.png',
                    //         scale: 4.r,
                    //       ),
                    //       SizedBox(
                    //         width: width(context, .03),
                    //       ),
                    //       Container(
                    //         // color: Color(0xFF03110F),
                    //         child: Row(
                    //           children: [
                    //             SizedBox(
                    //               width: width(context, .6),
                    //               child: Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: [
                    //                   Text(" الدعم المستمر:  ",
                    //                       style: TextStyle(
                    //                           color: Color(0xff09f9a3),
                    //                           fontSize: 20.sp,
                    //                           fontWeight: FontWeight.bold)),
                    //                   SizedBox(
                    //                     height: height(context, .01),
                    //                   ),
                    //                   Text(
                    //                       "نحن لا نكتفي بتحسين موقعك مرة واحدة، بل نقدم دعمًا مستمرًا لضمان بقاء متجرك في الصدارة. نتعامل مع أي تغييرات في خوارزميات محركات البحث ونقوم بتحديثات دورية لضمان استمرار النجاح",
                    //                       style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontSize: 13.sp,
                    //                           fontWeight: FontWeight.bold))
                    //                   // endcontaner
                    //                 ],
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
          ])),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              highlightColor: Colors.black,
              icon: Icon(Icons.arrow_back_ios, color: AppColors.green),
              onPressed: () => RouteUtils.pop(),
            ),
          )
        ],
      ),
    ));
  }
}
