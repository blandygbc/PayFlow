import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      center: Alignment.bottomCenter,
                      radius: 1,
                      colors: [
                    Colors.orange.shade200,
                    AppColors.primary,
                  ])),
            ),
            Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Stack(alignment: AlignmentDirectional.center, children: [
                  Image.asset(
                    AppImages.person,
                    width: 208,
                    height: 373,
                  ),
                  Container(
                    height: 373,
                    width: 208,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.4),
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.0),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 58,
                    top: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: AnimatedCard(
                        direction: AnimatedCardDirection.right,
                        duration: Duration(milliseconds: 1900),
                        curve: Curves.easeOut,
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            FontAwesomeIcons.fileAlt,
                            color: AppColors.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 59,
                    top: 202,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: AnimatedCard(
                        direction: AnimatedCardDirection.left,
                        duration: Duration(milliseconds: 2200),
                        curve: Curves.easeOut,
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            FontAwesomeIcons.plusSquare,
                            color: AppColors.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
            Positioned(
              bottom: size.height * 0.07,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 70, right: 70, top: 10),
                    child: Text(
                      "Oraganize seus boletos em um só lugar!",
                      textAlign: TextAlign.center,
                      style: TextStyles.titleHome,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: SocialLoginButton(onTap: () {
                      controller.googleSingIn(context);
                    }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
