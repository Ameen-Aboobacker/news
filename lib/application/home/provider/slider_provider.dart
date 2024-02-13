import 'package:flutter/cupertino.dart';

class SliderProvider extends ChangeNotifier{
  int index=0;
  int activeIndex=0;

  setIndex(int index){
    activeIndex=index;
    notifyListeners();
  }
}