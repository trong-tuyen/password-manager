import 'package:flutter_practice/gen/assets.gen.dart';
import 'package:flutter_practice/core/models/card_password.dart';
import 'package:flutter_practice/core/models/user.dart';
import 'package:flutter_practice/core/themes/theme.dart';

// Define a User object with an email and password, and an array of users with one sample user
User user = User(email: '', password: '');
List<User> users = [User(email: 'tuyen@gmail.com', password: '123456')];

// Define a list of apps and categories, and a map with descriptions for each app
final List<String> listApp = <String>[
  'Twitter',
  'Media',
  'Facebook',
  'Gmail',
  'Paypal',
  'Quora',
  'Basecamp',
  'Upwork',
];
final List<String> listCategory = ['Softwares', 'Credit Card'];
Map<String, Map<String, dynamic>> listDescription = {
  'Twitter': {
    'color': MPTheme.cardTwitterColor,
    "assetPath": Assets.images.twitter.path,
    'url': 'https://twitter.com/?lang=vi',
  },
  'Media': {
    'color': MPTheme.cardMediaColor,
    "assetPath": Assets.images.media.path,
    'url': 'https://twitter.com/?lang=vi',
  },
  'Gmail': {
    'color': MPTheme.cardGmailColor,
    "assetPath": Assets.images.gmailCard.path,
    'url': 'https://www.google.com/intl/vi/gmail/about/',
  },
  'Facebook': {
    'color': MPTheme.cardTwitterColor,
    "assetPath": Assets.images.facebookCard.path,
    'url': 'https://www.facebook.com/',
  },
  'Paypal': {
    'color': MPTheme.cardTwitterColor,
    "assetPath": Assets.images.paypal.path,
    'url': 'https://www.paypal.com/vn/home',
  },
  'Quora': {
    'color': MPTheme.cardGmailColor,
    "assetPath": Assets.images.quora.path,
    'url': 'https://www.quora.com/',
  },
  'Basecamp': {
    'color': MPTheme.cardBaseCampColor,
    "assetPath": Assets.images.basecamp.path,
    'url': 'https://basecamp.com/',
  },
  'Upwork': {
    'color': MPTheme.cardUpworkColor,
    "assetPath": Assets.images.upwork.path,
    'url': 'https://www.upwork.com/',
  },
};

// Define CardPassword objects with empty values, and arrays to store them
CardPassword cardPassword = CardPassword(
  id: '',
  name: '',
  username: '',
  password: '',
  category: '',
);
List<CardPassword> cardPasswords = [];
List<CardPassword> cardPasswordsTemp = [];
List<CardPassword> cardPasswordsFilter = [];

// Define some variables for UI state
String appSelected = 'Twitter';
String categorySelected = 'Credit Card';
List<bool> visibilityTag = <bool>[
  for (var i = 0; i <= cardPasswordsTemp.length; i++) true
]; // the not occupy the physical space and invisible,
List<bool> showPassword = <bool>[
  for (var i = 0; i <= cardPasswordsTemp.length; i++) false
];
const String applicationPassword = '123456';
bool isApplicationPasswordCorrect = false;
bool showPasswordListFirst = false;
// A map indicating which items are selected in the filter menu
Map<String, bool> selectItem = {
  'Favorites': true,
  'Softwares': true,
  'Credit Card': true
};

// A boolean indicating whether the app is currently loading data or not
bool isLoading = true;

// A boolean indicating whether text fields should be disabled or not
bool disableTextField = false;

// A map containing the user's email and password after registration, to be used for logging in
Map<String, String> loginInfo = {'Email': '', 'Password': ''};

// A boolean indicating whether button should be disabled or not
bool disableButton = true;


