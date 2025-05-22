import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma/core/utiles/route_utils/route_utils.dart';
import 'package:zbooma/custom_widget/containers/custom_deatailes_card.dart';
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
                height: height(context, .3),
                width: double.infinity,
                child: Image.asset(
                  'assets/marketing.png',
                  scale: .4,
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
                        "نساعدك في تحديد قيم علامتك التجارية وصياغة رسائلها الرئيسية، مع تطوير استراتيجية تواصل فعالة تقدم قيمة مضافة لجمهورك.",
                  ),
                  CustomDeatailesCard(
                    title: "تصميم الشعار والهوية البصرية",
                    description:
                        "نصمم شعارًا فريدًا وهوية بصرية متكاملة تعكس علامتك التجارية، بما في ذلك الألوان والخطوط والأنماط، لترك انطباع مميز لدى عملائك",
                  ),
                  CustomDeatailesCard(
                    title: "إدارة تجربة العلامة التجارية",
                    description:
                        "نساعدك في إدارة تجربة العملاء مع علامتك التجارية لضمان تقديم تجربة متسقة ومميزة تعزز من ولاء العملاء وتزيد من تفاعلهم مع علامتك",
                  ),
                  CustomDeatailesCard(
                    title: "بناء حضور رقمي قوي",
                    description:
                        "نساعدك في بناء حضور رقمي قوي عبر المواقع والتواصل الاجتماعي، لضمان رؤية علامتك التجارية ووصولها الفعّال لجمهورك المستهدف",
                  ),
                  SizedBox.shrink(),
                  CustomDeatailesCard(
                    title: "تحليل وتطوير الأداء",
                    description:
                        "نقدم تحليلات دورية لأداء علامتك التجارية، ونقوم بتعديل الاستراتيجيات وفقًا للبيانات لتحسين الأداء وتحقيق أفضل النتائج",
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
                                        "نبدأ بفهم رؤيتك وأهدافك من خلال جلسة استشارية. نقوم بتحديد النقاط التي تحتاج إلى تطوير ونضع خطة مبدئية في تطوير العلامة التجارية",
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
                                      Text("تحليل السوق والمنافسين",
                                          style: TextStyle(
                                              color: Color(0xff09f9a3),
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: height(context, .01),
                                      ),
                                      Text(
                                          "نقوم بإجراء تحليل شامل للسوق والمنافسين لفهم الاتجاهات الحالية وتحديد الفرص المتاحة لعلامتك التجارية. هذا يساعدنا في وضع استراتيجيات تنافسية فعالة",
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
                                      Text(
                                          "تصميم الهوية البصرية وتطوير الاستراتيجية",
                                          style: TextStyle(
                                              color: Color(0xff09f9a3),
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: height(context, .01),
                                      ),
                                      Text(
                                          "بعد التحليل، نبدأ في تصميم الشعار والهوية البصرية، مع تطوير استراتيجية متكاملة تعبر عن قيم علامتك وتساعد في الوصول إلى الجمهور المستهدف",
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
                                      Text(
                                          "تنفيذ الاستراتيجية وبناء الحضور الرقمي",
                                          style: TextStyle(
                                              color: Color(0xff09f9a3),
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: height(context, .01),
                                      ),
                                      Text(
                                          "نعمل على تنفيذ الاستراتيجية الموضوعة، بما في ذلك تطوير موقع الويب، إدارة وسائل التواصل الاجتماعي، وتقديم المحتوى الذي يعزز من تواجد علامتك الرقمية",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp,
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
                                      Text("مراقبة وتقييم الأداء",
                                          style: TextStyle(
                                              color: Color(0xff09f9a3),
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: height(context, .01),
                                      ),
                                      Text(
                                          "بعد تنفيذ الاستراتيجية، نقوم بمتابعة الأداء وتقديم تقارير دورية توضح التقدم المحرز. نعمل على تعديل الاستراتيجيات حسب الحاجة لضمان تحقيق الأهداف",
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
