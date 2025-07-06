import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


void navigateTo(context, widget) => Navigator.push(
  context,
      PageTransition(
        child: widget,
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 500),
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context,
    PageTransition(
      child: widget,
      type: PageTransitionType.fade,
      duration: const Duration(milliseconds: 500),
        ), (route) {
      return false;
    });
