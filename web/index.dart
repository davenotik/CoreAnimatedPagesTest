import 'dart:html';
import 'package:polymer/polymer.dart';

main() => initPolymer();

@initMethod
init() => Polymer.onReady.then((_) {
  final pages = querySelector('core-animated-pages');
  final select = querySelector('select');

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
});