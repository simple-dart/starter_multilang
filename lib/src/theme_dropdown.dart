import 'package:simple_dart_dropdown/simple_dart_dropdown.dart';
import 'package:simple_dart_multilang_checkbox/simple_dart_multilang_checkbox.dart';
import 'package:simple_dart_multilang_controller/simple_dart_multilang_controller.dart';
import 'package:simple_dart_multilang_label/simple_dart_multilang_label.dart';
import 'package:simple_dart_multilang_select_field/simple_dart_multilang_select_field.dart';
import 'package:simple_dart_theme_controller/simple_dart_theme_controller.dart';

import '../simple_dart_starter_multilang.dart';

class ThemeDropdown extends Dropdown {
  final displayLabel = MultilangLabel()
    ..langKey = lkSelectTheme
    ..wrap = true
    ..fullWidth()
    ..fillContent = true;
  final headerLabel = MultilangLabel()..langKey = lkTheme;
  final MultilangCheckbox monoSpaceFontCheckbox = MultilangCheckbox()..langKey = lkMonospace;
  MultilangSelectField<String> selectField = MultilangSelectField<String>()..fillContent = true;

  ThemeDropdown() : super() {
    onTop = true;
    shading = 0.5;
    add(displayLabel);
    dropPanel
      ..spacing = '5px'
      ..padding = '5px'
      ..addAll([headerLabel, selectField, monoSpaceFontCheckbox]);
    selectField.onValueChange.listen((value) {
      themeController.theme = multilangController.removePrefix(value.newValue.first);
      refreshDisplay();
    });
    monoSpaceFontCheckbox.onValueChange.listen((value) {
      themeController.monoSpaceFont = value.newValue;
      refreshDisplay();
    });
  }

  void refreshDisplay() {
    displayLabel.langKey =
        '$lkTheme - ${multilangController.addPrefix(themeController.theme)} ${(themeController.monoSpaceFont) ? lkMonospace : ''}';
  }

  @override
  void beforeShowDropPanel() {
    dropPanel.width = '${element.offsetWidth}px';
    selectField
      ..initOptions(themeController.themeList.map((e) => multilangController.addPrefix(e)).toList())
      ..size = themeController.themeList.length
      ..value = [multilangController.addPrefix(themeController.theme)];
    monoSpaceFontCheckbox.value = themeController.monoSpaceFont;
  }
}
