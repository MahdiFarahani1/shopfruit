import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CoustomLoading {
  static Widget loading() {
    return LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.grey, size: 50);
  }

  static Widget loadingImages() {
    return LoadingAnimationWidget.threeArchedCircle(
        color: Colors.white, size: 40);
  }
}
