import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/models/user_models.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [
    MeusBoletosPage(
      key: UniqueKey(),
    ),
    ExtractPage(
      key: UniqueKey(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment(0.0, 1.9),
                  radius: 1.2,
                  colors: [
                Colors.orange.shade100,
                AppColors.primary,
              ])),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                title: Text.rich(TextSpan(
                    text: "Olá, ",
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                        text: "${widget.user.name}",
                        style: TextStyles.titleBoldBackground,
                      )
                    ])),
                subtitle: Text(
                  "Mantenha suas contas em dia!",
                  style: TextStyles.captionShape,
                ),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(widget.user.photoURL!)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[controller.currentpage],
      bottomNavigationBar: Container(
        height: 149,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.0, 0.2),
            colors: [
              Colors.white.withOpacity(0.0),
              Colors.white60,
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 57),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: IconButton(
                    onPressed: () {
                      controller.setPage(0);
                      setState(() {});
                    },
                    icon: Icon(
                      controller.currentpage == 0
                          ? Icons.home
                          : Icons.home_outlined,
                      color: controller.currentpage == 0
                          ? AppColors.primary
                          : AppColors.body,
                      size: 34,
                    )),
              ),
              GestureDetector(
                onTap: () async {
                  await Navigator.pushNamed(context, "/barcode_scanner");
                  setState(() {});
                },
                child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      FontAwesomeIcons.plusSquare,
                      color: AppColors.background,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: IconButton(
                    onPressed: () {
                      controller.setPage(1);
                      setState(() {});
                    },
                    icon: Icon(
                      controller.currentpage == 1
                          ? FontAwesomeIcons.solidFileAlt
                          : FontAwesomeIcons.fileAlt,
                      color: controller.currentpage == 1
                          ? AppColors.primary
                          : AppColors.body,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
