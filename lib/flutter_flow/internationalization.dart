import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // onBoarding01
  {
    'gt6sejnb': {
      'en': 'Personalized recipe discovery',
      'ar': '',
    },
    'nlc3hxqz': {
      'en': 'I have some great food options here!! Yum yum!!',
      'ar': '',
    },
    '6ms0cu6q': {
      'en': 'Awesome Recipes',
      'ar': '',
    },
    '0vjn6oun': {
      'en': 'I have some great food options here!! Yum yum!!',
      'ar': '',
    },
    't7bj4g8d': {
      'en': 'Personalized recipe discovery',
      'ar': '',
    },
    '4m54luna': {
      'en': 'I have some great food options here!! Yum yum!!',
      'ar': '',
    },
    'h49hi2cy': {
      'en': 'Next',
      'ar': '',
    },
    'lnrf481n': {
      'en': 'Skip',
      'ar': '',
    },
    'vefmd0t7': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Onboarding02
  {
    'ev5ruulj': {
      'en': 'Join us & cook with confidence',
      'ar': '',
    },
    '2bgoqqsd': {
      'en': 'Sign up with e-mail',
      'ar': '',
    },
    'lhmg8hiz': {
      'en': 'Or use social media',
      'ar': '',
    },
    '68zluknv': {
      'en': 'Sign up with Google',
      'ar': '',
    },
    'a3xaem9h': {
      'en': 'Sign up with Apple',
      'ar': '',
    },
    'mdtd1bym': {
      'en': 'Already have an account?',
      'ar': '',
    },
    '6cxic90t': {
      'en': ' Log In!',
      'ar': '',
    },
    '6fbb0ncz': {
      'en': 'Home',
      'ar': '',
    },
  },
  // feed
  {
    'r2ya93rg': {
      'en': 'Yummy Dish',
      'ar': '',
    },
    'p8cwjriq': {
      'en': 'Search...',
      'ar': '',
    },
    'i32b485h': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Authorization
  {
    '6i7ekq81': {
      'en': 'Yummy Dish',
      'ar': '',
    },
    '2j5k3lnx': {
      'en': 'Create Account',
      'ar': '',
    },
    '1gvfjfhe': {
      'en': 'Create Account',
      'ar': '',
    },
    't71ssyr6': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': '',
    },
    'hgkxs3ub': {
      'en': 'Email',
      'ar': '',
    },
    'i9vs8f5p': {
      'en': 'Password',
      'ar': '',
    },
    '4nrdqeor': {
      'en': 'Password',
      'ar': '',
    },
    '0az6bh0o': {
      'en': 'Get Started',
      'ar': '',
    },
    'nwz6eri5': {
      'en': 'Or sign up with',
      'ar': '',
    },
    'mxvm95ff': {
      'en': 'Continue with Google',
      'ar': '',
    },
    'o7qlahnj': {
      'en': 'Continue with Apple',
      'ar': '',
    },
    'b45j31oa': {
      'en': 'Log In',
      'ar': '',
    },
    '0kfq13rf': {
      'en': 'Welcome Back',
      'ar': '',
    },
    'blgz707w': {
      'en': 'Fill out the information below in order to access your account.',
      'ar': '',
    },
    '6umiw8fi': {
      'en': 'Email',
      'ar': '',
    },
    'nr861hht': {
      'en': 'Password',
      'ar': '',
    },
    'fczcjm1w': {
      'en': 'Sign In',
      'ar': '',
    },
    '5iknzdqk': {
      'en': 'Or sign in with',
      'ar': '',
    },
    '4h26r252': {
      'en': 'Continue with Google',
      'ar': '',
    },
    'ocx6pre7': {
      'en': 'Continue with Apple',
      'ar': '',
    },
    'wryja1ea': {
      'en': 'Forgot Password?',
      'ar': '',
    },
    '1hml7ahu': {
      'en': 'Home',
      'ar': '',
    },
  },
  // EmptyWidget
  {
    'uig3ff8g': {
      'en': 'No Content',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    '10828neq': {
      'en': '',
      'ar': '',
    },
    'o4txw0bx': {
      'en': '',
      'ar': '',
    },
    '9vynzswa': {
      'en': '',
      'ar': '',
    },
    '6sp5tzbf': {
      'en': '',
      'ar': '',
    },
    'yoc93g5g': {
      'en': '',
      'ar': '',
    },
    'c3s2d4qb': {
      'en': '',
      'ar': '',
    },
    'vc3sz4ah': {
      'en': '',
      'ar': '',
    },
    'ipz3xk8f': {
      'en': '',
      'ar': '',
    },
    'av3n7rvm': {
      'en': '',
      'ar': '',
    },
    'jbjw4370': {
      'en': '',
      'ar': '',
    },
    'o4mmdgeb': {
      'en': '',
      'ar': '',
    },
    'kq88ka7p': {
      'en': '',
      'ar': '',
    },
    'dyzxohh7': {
      'en': '',
      'ar': '',
    },
    'e7sz3aos': {
      'en': '',
      'ar': '',
    },
    'emw9q7z6': {
      'en': '',
      'ar': '',
    },
    '5sit7h2n': {
      'en': '',
      'ar': '',
    },
    'bpc4dl9n': {
      'en': '',
      'ar': '',
    },
    'j1291brm': {
      'en': '',
      'ar': '',
    },
    '5tb4nxfz': {
      'en': '',
      'ar': '',
    },
    'mnndblyn': {
      'en': '',
      'ar': '',
    },
    'rju80ldj': {
      'en': '',
      'ar': '',
    },
    '1on3u78l': {
      'en': '',
      'ar': '',
    },
    'mwtjkmmb': {
      'en': '',
      'ar': '',
    },
    'yu3ahnq6': {
      'en': '',
      'ar': '',
    },
    'rl152h9f': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
