import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/core/constants/constants.dart';
import 'package:taqueria_vargas/core/services/messages/message_service_impl.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_provider.dart';
import 'package:taqueria_vargas/features/auth/presentation/widgets/widgets.dart';
import 'package:taqueria_vargas/features/features_screens.dart';
import 'package:taqueria_vargas/helpers/extensions.dart';
import 'package:responsive_builder/responsive_builder.dart';


class LoginScreen extends ConsumerWidget {

  static String path = "/auth/login";
  
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context,ref) {

    final authData = ref.watch(authProvider);

    return Title(
      key: ValueKey("authLogin"),
      color: Colors.red,
      title: "Iniciar sesión",
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ResponsiveBuilder(builder: (BuildContext context, SizingInformation sizingInformation) {
                      return Container(
                        width: sizingInformation.isDesktop || sizingInformation.isTablet ? context.width * .4 >= 500 ? 500 : context.width * .4 : context.width,
                        padding: EdgeInsets.symmetric(
                        horizontal: sizingInformation.isMobile ? 30 : 0),
                        height: context.height - 27,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 140,
                              child: Image(
                                image: AssetImage(
                                  "assets/images/logo_taqueria copia.png",
                                ),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Gap(20),
                            LoginForm(
                              formKey: _formKey
                            ),
                            Column(
                              children: [
                                AdaptativeButton(
                                  key:  ValueKey("${UiConstants.loginButtonText}1"),
                                  labelText: UiConstants.loginButtonText, 
                                  isLoading: authData.isLoading,
                                  onTap: () async {
                                
                                    FocusScope.of(context).unfocus();
                                
                                    if (!_formKey.currentState!.validate()) return;
                                
                                    ref.read(authProvider.notifier).login();
                                
                                  }, 
                                ),
                                ErrorAuthWidget(),
                              ],
                            ),
                            
                            //NewAccount()
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      color: Colors.black.withValues(alpha: .5),
                    ),
                  children: [
                    TextSpan(
                      text: "Versión ",
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.black.withValues(alpha: .5),
                      ),
                    ),
                    TextSpan(
                      text: "1",
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.black.withValues(alpha: .5),
                      ),
                    ),
                    TextSpan(
                      text: ".",
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.black.withValues(alpha: .5),
                      ),
                    ),
                    TextSpan(
                      text: "2",
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.black.withValues(alpha: .5),
                      ),
                    ),
                    TextSpan(
                      text: ".",
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.black.withValues(alpha: .5),
                      ),
                    ),
                    TextSpan(
                      text: "1",
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.black.withValues(alpha: .5),
                      ),
                    ),
                  ],
                  ),
                ),
                GestureDetector(
                  onLongPress: () async {

                    await Clipboard.setData(ClipboardData(text: authData.deviceId));

                    if (context.mounted) {
                      MessageServiceImpl().showBottom(
                      context: context, 
                      message: "ID copiado al portapapeles",
                      title: "ID copiado", 
                      backgroundColor:  AppTheme.primary, 
                    );

                    }

                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      authData.deviceId,
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: Colors.black.withValues(alpha: .5),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
