import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageTransitions {

  CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    int? duration,
  }) {

    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      reverseTransitionDuration: Duration(milliseconds: duration ?? 200),
      transitionDuration: Duration(milliseconds: duration ?? 1200),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );

  }

  static CustomTransitionPage buildPageWithSlideTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    int? duration,
  }) {

    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      name: state.uri.toString(),
      reverseTransitionDuration: Duration(milliseconds: duration ?? 200),
      transitionDuration: Duration(milliseconds: duration ?? 1200),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        const begin = Offset(1.0, 0.0); 
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );

  }

  static CustomTransitionPage buildPageWithFadeAndSlideTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    int? duration,
  }) {

    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      name: state.uri.toString(),
      reverseTransitionDuration: Duration(milliseconds: duration ?? 50),
      transitionDuration: Duration(milliseconds: duration ?? 50),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        const beginOffset = Offset(1.0, 0.0); 
        const endOffset = Offset.zero;
        var slideTween = Tween(begin: beginOffset, end: endOffset);
        
        var slideAnimation = animation.drive(slideTween);

        return SlideTransition(
          position: slideAnimation,
          child: child,
        );
      },
    );

  }

  static CustomTransitionPage buildPageWithTestTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    int? duration,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      name: state.uri.toString(),
      reverseTransitionDuration: Duration(milliseconds: duration ?? 150),
      transitionDuration: Duration(milliseconds: duration ?? 350),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        final fade = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );
        final slide = Tween<Offset>(
          begin: const Offset(0.0, 0.05),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        ));

        return FadeTransition(
          opacity: fade,
          child: SlideTransition(
            position: slide,
            child: child,
          ),
        );
      },
    );
  }

  static CustomTransitionPage buildPageWithFadeInFromCenter<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    
    int? duration,
  }) {

    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      name: state.uri.toString(),
      reverseTransitionDuration: Duration(milliseconds: duration ?? 100),
      transitionDuration: Duration(milliseconds: duration ?? 100),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {

        final scaleTween = Tween<double>(begin: 0.8, end: 1.0);
        final reverseScaleTween = Tween<double>(begin: 1.0, end: 0.8);

        final scaleAnimation = animation.drive(CurveTween(curve: Curves.easeInOut)).drive(scaleTween);
        final reverseScaleAnimation = secondaryAnimation
            .drive(CurveTween(curve: Curves.easeInOut))
            .drive(reverseScaleTween);

        final fadeAnimation = animation.drive(CurveTween(curve: Curves.easeInOut));
        final reverseFadeAnimation =
            secondaryAnimation.drive(CurveTween(curve: Curves.easeInOut));

        return FadeTransition(
          opacity: animation.status == AnimationStatus.reverse
              ? reverseFadeAnimation
              : fadeAnimation,
          child: ScaleTransition(
            scale: animation.status == AnimationStatus.reverse
                ? reverseScaleAnimation
                : scaleAnimation,
            child: child,
          ),
        );
      }

    );
  }

}
