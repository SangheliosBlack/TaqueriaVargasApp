import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';

class Button extends StatelessWidget {

  final double borderRadius;
  final Widget child;
  final Function() onTap;
  final Color buttonColor;
  final bool locked;
  final bool? isLoading;
  final EdgeInsets margin;

  const Button({
    super.key,
    this.borderRadius = 20,
    this.buttonColor = AppTheme.primary,
    this.locked = false,
    required this.child,
    required this.onTap,
    this.isLoading = false,
    this.margin = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      
      margin: margin,
      child: AnimatedOpacity(
        opacity: locked && locked ? .5 : 1,
        duration: Duration(milliseconds: 300),
        child: GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.translucent,
          child: AnimatedContainer(
            height: 45,
            constraints: BoxConstraints(
              maxWidth: double.infinity,
              minWidth: double.infinity
            ),
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15
            ),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(borderRadius)
            ),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              reverseDuration: Duration(milliseconds: 300),
              child: isLoading == true
              ? SizedBox(
                key: ValueKey('loading'),
                height: 20,
                width:  20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1,
                  )
                )
              : Center(
                key: ValueKey('content'),
                child: child
              ),
            ),
          ),
        ),
      ),
    );

  }

}