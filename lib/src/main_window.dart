import 'dart:html';

import 'package:simple_dart_modal_controller/simple_dart_modal_controller.dart';
import 'package:simple_dart_multilang_checkbox/simple_dart_multilang_checkbox.dart';
import 'package:simple_dart_multilang_controller/simple_dart_multilang_controller.dart';
import 'package:simple_dart_multilang_label/simple_dart_multilang_label.dart';
import 'package:simple_dart_multilang_link/simple_dart_multilang_link.dart';
import 'package:simple_dart_multilang_select_field/simple_dart_multilang_select_field.dart';
import 'package:simple_dart_select_field/simple_dart_select_field.dart';
import 'package:simple_dart_theme_controller/simple_dart_theme_controller.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';
import 'package:simple_dart_view_controller/simple_dart_view_controller.dart';

import '../simple_dart_starter_multilang.dart';
import 'nav_bar.dart';
import 'path_bar.dart';
import 'translations.dart';

class MainWindow extends PanelComponent {
  Panel display = Panel()
    ..varName = 'display'
    ..vertical = true
    ..fillContent = true
    ..fullSize()
    ..element.style.overflow = 'auto';

  Panel horizontalPanel = Panel()
    ..fullSize()
    ..fillContent = true;
  MultilangLink homeLink = MultilangLink()
    ..addCssClass('MainWindowHomeLink')
    ..wrap = true
    ..width = '200px'
    ..hAlign = Align.center
    ..vAlign = Align.center;
  NavBar navBar = NavBar()..width = '200px';
  PathBar pathBar = PathBar()..height = '40px';
  SelectField langSelect = SelectField();
  MultilangSelectField themeSelect = MultilangSelectField();
  MultilangCheckbox monospaceCheckbox = MultilangCheckbox();

  MainWindow() : super('MainWindow') {
    fullSize();
    fillContent = true;
    vertical = true;
    pathBar.leftPanel.visible = true;
    pathBar.leftPanel.add(homeLink);
    add(pathBar);
    add(horizontalPanel);
    horizontalPanel.addAll([navBar, display]);
  }

  void insertToPage({String nodeSelector = 'body'}) {
    querySelector(nodeSelector)!.children.add(element);
  }

  void start() {
    viewController.views.forEach((key, view) {
      navBar.addView(view as View);
    });
    viewController.onViewChange.listen((currentView) {
      if (currentView is View) {
        display
          ..clear()
          ..add(currentView);
        navBar.refresh(currentView);
        pathBar.refresh(currentView);
      }
    });
    loadMultilangThemeSelectTranslations();
    langSelect
      ..initOptions(multilangController.languages)
      ..value = [multilangController.lang];
    langSelect.onValueChange.listen((valueChangeEvent) {
      multilangController.lang = valueChangeEvent.newValue.first;
    });
    multilangController.onLangChange.listen((langChangeEvent) {
      navBar.reRender();
      pathBar.reRender();
      for (final view in viewController.views.values) {
        if (view is View) {
          view.reRender();
        }
      }
    });

    themeSelect
      ..initOptions(themeController.themeList.map(multilangController.addPrefix).toList())
      ..value = [multilangController.addPrefix(themeController.theme)];
    themeSelect.onValueChange.listen((valueChangeEvent) {
      themeController.theme = multilangController.removePrefix(valueChangeEvent.newValue.first);
    });
    themeController.onThemeChange.listen((themeChangeEvent) {
      navBar.reRender();
      pathBar.reRender();
      for (final view in viewController.views.values) {
        if (view is View) {
          view.reRender();
        }
      }
    });
    monospaceCheckbox
      ..langKey = lkMonospace
      ..value = themeController.monoSpaceFont
      ..onValueChange.listen((valueChangeEvent) {
        themeController.monoSpaceFont = valueChangeEvent.newValue;
      });
    themeController.onMonoSpaceFontChange.listen((monoSpaceFontChangeEvent) {
      navBar.reRender();
      pathBar.reRender();
      for (final view in viewController.views.values) {
        if (view is View) {
          view.reRender();
        }
      }
    });

    homeLink
      ..langKey = viewController.homeView.caption
      ..href = '#${viewController.homeView.id}';
    insertToPage();
  }
}

@override
String showError(Object errObj) {
  final errText = convertError(errObj);
  modalController.showComponentModal(MultilangLabel()..langKey = errText);
  return errText;
}

@override
void showFatalError(Object errObj) {
  final errText = convertError(errObj);
  modalController.onClick.listen((event) {
    window.location.assign('/');
  });
  modalController.showComponentModal(MultilangLabel()..langKey = errText);
  throw Exception(errObj);
}

String convertError(Object e) {
  if (e is String) {
    return e;
  } else if (e is ProgressEvent) {
    final t = e.target;
    if (t is HttpRequest) {
      return t.response;
    }
    return t.toString();
  } else {
    return e.toString();
  }
}