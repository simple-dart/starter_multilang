import 'package:simple_dart_multilang_controller/simple_dart_multilang_controller.dart';

const String lkLanguage = '^Language';
const String lkMonospace = '^Monospace';
const String lkSelectTheme = '^lkSelectTheme';
const String lkTheme = '^Theme';
const String lkDefault = '^Default';
const String lkLight = '^Light';
const String lkDark = '^Dark';
const String lkBlue = '^Blue';

void loadMultilangThemeSelectTranslations() {
  multilangController.loadTranslations({
    lkLanguage: {
      EN: 'Language',
      ES: 'Idioma',
      PT: 'Idioma',
      RU: 'Язык',
      FR: 'Langue',
      DE: 'Sprache',
      IT: 'Lingua',
      NL: 'Taal',
      PL: 'Język',
      SV: 'Språk',
      TR: 'Dil',
    },
    lkMonospace: {
      EN: 'Monospace',
      ES: 'Monoespaciado',
      PT: 'Monoespaçado',
      RU: 'Моноширинный',
      FR: 'Monospace',
      DE: 'Monospace',
      IT: 'Monospace',
      NL: 'Monospace',
      PL: 'Monospace',
      SV: 'Monospace',
      TR: 'Monospace',
    },
    lkSelectTheme: {
      EN: 'Select Theme',
      ES: 'Seleccionar tema',
      PT: 'Selecionar tema',
      RU: 'Выбрать тему',
      FR: 'Sélectionner le thème',
      DE: 'Thema auswählen',
      IT: 'Seleziona tema',
      NL: 'Selecteer thema',
      PL: 'Wybierz motyw',
      SV: 'Välj tema',
      TR: 'Tema seç',
    },
    lkTheme: {
      EN: 'Theme',
      ES: 'Tema',
      PT: 'Tema',
      RU: 'Тема',
      FR: 'Thème',
      DE: 'Thema',
      IT: 'Tema',
      NL: 'Thema',
      PL: 'Motyw',
      SV: 'Tema',
      TR: 'Tema',
    },
    lkDefault: {
      EN: 'Default',
      ES: 'Por defecto',
      PT: 'Padrão',
      RU: 'По-умолчанию',
      FR: 'Défaut',
      DE: 'Standard',
      IT: 'Predefinito',
      NL: 'Standaard',
      PL: 'Domyślny',
      SV: 'Standard',
      TR: 'Varsayılan',
    },
    lkLight: {
      EN: 'Light',
      ES: 'Claro',
      PT: 'Claro',
      RU: 'Светлая',
      FR: 'Lumière',
      DE: 'Licht',
      IT: 'Luce',
      NL: 'Licht',
      PL: 'Jasny',
      SV: 'Ljus',
      TR: 'Işık',
    },
    lkDark: {
      EN: 'Dark',
      ES: 'Oscuro',
      PT: 'Escuro',
      RU: 'Темная',
      FR: 'Sombre',
      DE: 'Dunkel',
      IT: 'Scuro',
      NL: 'Donker',
      PL: 'Ciemny',
      SV: 'Mörk',
      TR: 'Karanlık',
    },
    lkBlue: {
      EN: 'Blue',
      ES: 'Azul',
      PT: 'Azul',
      RU: 'Синяя',
      FR: 'Bleu',
      DE: 'Blau',
      IT: 'Blu',
      NL: 'Blauw',
      PL: 'Niebieski',
      SV: 'Blå',
      TR: 'Mavi',
    },
  });
}
