import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_provider.dart';
import 'package:taqueria_vargas/features/auth/presentation/widgets/widgets.dart';

class LoginForm extends ConsumerWidget {

  final GlobalKey<FormState> formKey;


  const LoginForm({
    super.key,
    required this.formKey,
  });


  @override
  Widget build(BuildContext context, ref) {
    
    final authState = ref.watch(authProvider);

    final focusNode = FocusNode();

    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            spacing: 25,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UsernameFieldWidget(
                controller: authState.emailController!,
                key: const Key('username-field'),
                focus: focusNode,
              ),
              PassFieldWidget(
                controller: authState.passwordController!,
                key: const Key('password-field'),
                labelText: 'Contraseña',
                focus: focusNode,
                formKey: formKey,
              ),
              Gap(10),
              RememberMe()
            ],
          )
        ),
        /*Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RememberMe(),
          AdaptativeTooltip(
            label: "Proximamente",
            child: AdaptativeGesture(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Olvidaste tu contraseña?",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),*/
    ]);

  }

}