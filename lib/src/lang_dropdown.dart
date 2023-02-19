import 'package:simple_dart_dropdown/simple_dart_dropdown.dart';
import 'package:simple_dart_multilang_controller/simple_dart_multilang_controller.dart';
import 'package:simple_dart_multilang_label/simple_dart_multilang_label.dart';
import 'package:simple_dart_multilang_select_field/simple_dart_multilang_select_field.dart';

import '../simple_dart_starter_multilang.dart';

class LangDropdown extends Dropdown {
  final displayLabel = MultilangLabel()
    ..langKey = lkLanguage
    ..fullWidth()
    ..fillContent = true
    ..wrap = true;
  final headerLabel = MultilangLabel()..langKey = lkLanguage;
  MultilangSelectField<String> selectField = MultilangSelectField<String>()..fillContent = true;

  LangDropdown() : super() {
    onTop = true;
    shading = 0.5;
    add(displayLabel);
    dropPanel
      ..spacing = '5px'
      ..padding = '5px'
      ..addAll([headerLabel, selectField]);
    selectField.onValueChange.listen((value) {
      multilangController.lang = value.newValue.first;
      refreshDisplay();
    });
  }

  void refreshDisplay() {
    displayLabel.langKey = '$lkLanguage - ${multilangController.lang}';
  }

  @override
  void beforeShowDropPanel() {
    dropPanel.width = '${element.offsetWidth}px';
    selectField
      ..initOptions(multilangController.languages)
      ..size = multilangController.languages.length
      ..value = [multilangController.lang];
  }
}
