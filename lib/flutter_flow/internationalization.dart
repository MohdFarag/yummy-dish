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
  // Onboarding
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
    '83em2p5p': {
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
      'en': 'Confirm Password',
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
  // ForgotPassword
  {
    'w1ikdch8': {
      'en': 'Back',
      'ar': '',
    },
    'yhfdu78q': {
      'en': 'Forgot Password',
      'ar': '',
    },
    't4pjxn6u': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ar': '',
    },
    'mm4h5t7f': {
      'en': 'Your email address...',
      'ar': '',
    },
    'x6uyesxu': {
      'en': 'Enter your email...',
      'ar': '',
    },
    'qkab616f': {
      'en': 'Send Link',
      'ar': '',
    },
    'i32b485h': {
      'en': 'Home',
      'ar': '',
    },
  },
  // UserProfile
  {
    '81y41i4i': {
      'en': 'Logout',
      'ar': '',
    },
    '8rw1usxe': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ViewRecipe
  {
    'iuhglh4z': {
      'en': 'Ingredients',
      'ar': '',
    },
    'vqayui8d': {
      'en': 'Steps',
      'ar': '',
    },
    'vp6w5m2y': {
      'en': 'Comments',
      'ar': '',
    },
    'mb877xzk': {
      'en': 'Home',
      'ar': '',
    },
  },
  // AboutUs
  {
    '28be3r1c': {
      'en': 'Yummy Dish',
      'ar': '',
    },
    'zbz7tcxq': {
      'en': 'Our Story',
      'ar': '',
    },
    'a20ji9pn': {
      'en':
          'Founded in 2023, Yummy Dish was born from a simple idea: everyone deserves to cook with confidence. We believe that cooking should be accessible, enjoyable, and rewarding for all, regardless of experience level.',
      'ar': '',
    },
    'dxbrjip5': {
      'en': 'Our Mission',
      'ar': '',
    },
    'bkk1i6r1': {
      'en':
          'To empower home cooks with carefully curated recipes, expert tips, and a supportive community that celebrates the joy of cooking.',
      'ar': '',
    },
    'h78mke1u': {
      'en': 'What We Offer',
      'ar': '',
    },
    'ja3exdym': {
      'en': '1000+ Recipes',
      'ar': '',
    },
    '436sed8j': {
      'en': 'Active Community',
      'ar': '',
    },
    'utrxdi3i': {
      'en': 'Expert Tips',
      'ar': '',
    },
    's28reu42': {
      'en': 'Join Our Community',
      'ar': '',
    },
    'g73zp4c3': {
      'en':
          'Connect with fellow food enthusiasts, share your culinary creations, and embark on a flavorful journey with Yummy Dish.',
      'ar': '',
    },
    '0a7ib1vd': {
      'en': 'Get Started',
      'ar': '',
    },
  },
  // test
  {
    's99b6a7p': {
      'en': 'Page Title',
      'ar': '',
    },
    'frng7m4o': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CreateRecipe
  {
    '2rkm4jsd': {
      'en': 'Create Recipe',
      'ar': '',
    },
    '50vwp2qu': {
      'en': 'Recipe Details',
      'ar': '',
    },
    'tq2sgc0q': {
      'en': 'Recipe Title',
      'ar': '',
    },
    '1elc8c5n': {
      'en': 'Short Description',
      'ar': '',
    },
    't1zhsgan': {
      'en': 'Chicken',
      'ar': '',
    },
    'zsxc11tw': {
      'en': 'Option 2',
      'ar': '',
    },
    '0am13soq': {
      'en': 'Option 3',
      'ar': '',
    },
    '9iqjggrl': {
      'en': 'Select Category...',
      'ar': '',
    },
    'mk0f36pl': {
      'en': 'Search...',
      'ar': '',
    },
    'rs0l01og': {
      'en': 'Ingredients',
      'ar': '',
    },
    'u2g49w4l': {
      'en': '+ Add Ingredient',
      'ar': '',
    },
    'tfcd12w7': {
      'en': 'Preparation Steps',
      'ar': '',
    },
    'us1csitl': {
      'en': '+ Add Step',
      'ar': '',
    },
    'cd4nmsjt': {
      'en': 'Create Recipe',
      'ar': '',
    },
    'qjwqmq21': {
      'en': 'Recipe Title is required',
      'ar': '',
    },
    'i54cswx5': {
      'en': 'Minimum required characters is 3',
      'ar': '',
    },
    'wk2v1n9x': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ou0o5zjt': {
      'en': 'Short Description is required',
      'ar': '',
    },
    '6hwdun0j': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // CommentOnRecipe
  {
    '2nzjrpjh': {
      'en': 'Share your thoughts',
      'ar': '',
    },
    '1t6td5lx': {
      'en': 'Write your comment here...',
      'ar': '',
    },
    'wsz4k7h1': {
      'en': 'Post Comment',
      'ar': '',
    },
    '8ct369py': {
      'en': 'Add Comment',
      'ar': '',
    },
  },
  // UserFavourites
  {
    'kl3h7u6n': {
      'en': 'Favourites',
      'ar': '',
    },
    'ifcjc739': {
      'en': 'Home',
      'ar': '',
    },
  },
  // UserLikes
  {
    'ysc2gila': {
      'en': 'Likes',
      'ar': '',
    },
    'jres9zpz': {
      'en': 'Home',
      'ar': '',
    },
  },
  // UserRecipes
  {
    '8frgsaxk': {
      'en': 'Recipes',
      'ar': '',
    },
    '6k0u54nc': {
      'en': 'Home',
      'ar': '',
    },
  },
  // NotificationBadge
  {
    'xlisc1fw': {
      'en': '1',
      'ar': '',
    },
  },
  // ImagePickerComponent
  {
    'h1716c99': {
      'en': 'Add Recipe Photo',
      'ar': '',
    },
  },
  // PreperationStepInputComponent
  {
    '3mj2wp9k': {
      'en': 'Step Description',
      'ar': '',
    },
  },
  // IngredientInput
  {
    '0szxn964': {
      'en': 'Amount',
      'ar': '',
    },
    'q728t1e2': {
      'en': 'Unit',
      'ar': '',
    },
    'n0o4mk48': {
      'en': 'Ingredient',
      'ar': '',
    },
  },
  // RatingBarComponent
  {
    'ei1jmheo': {
      'en': 'Rate this recipe',
      'ar': '',
    },
    'ku31mfjg': {
      'en': 'Rate',
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
