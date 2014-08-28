import 'dart:html';
import 'dart:async';
import 'dart:js' show JsObject;

import 'package:polymer/polymer.dart';
import 'package:core_elements/core_drawer_panel.dart';
import 'package:core_elements/core_icon_button.dart';
import 'package:paper_elements/paper_toast.dart';

import 'package:core_elements/core_animated_pages.dart';


@CustomTag('my-app')
class MyApp extends PolymerElement with Observable {
  @observable var responsiveWidth = "600px";

  MyApp.created() : super.created();

  attached() {
    final pages = $['pages'];
    final select = $['select'];
    print(pages);

    var up = true;
    var max = 4;

    pages.onClick.listen((_) {
      var p = pages;
      if (up && p.selected == max || !up && p.selected == 0) {
        up = !up;
      }
      if (up) {
        p.selected += 1;
      } else {
        p.selected -= 1;
      }
    });

    select.onChange.listen((_) {
      pages.transitions = select.options[select.selectedIndex].value;
    });
  }
}