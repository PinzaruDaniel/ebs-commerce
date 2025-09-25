# e_commerce_ebs

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

####  Localizations Integration:
This project uses flutter easy__localization pub in order to localize the app https://pub.dev/packages/easy_localization

in order to add new localization key:

- add the key-value pair for english language into 'res/assets/localization/localization_en.json';
    - run **flutter pub run easy_localization:generate  -S lib/util/resources/localization/ -s localization_en.json  -f keys  -O lib/localization/generated_keys/ -o locale_keys.loc.dart **  to generate the key-constants;
 
