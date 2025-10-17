// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final phoneController = TextEditingController();
  final countryController = TextEditingController(text: 'United States');

  @override
  void initState() {
    super.initState();
    updatePlaceholderHint();
  }

  /// Result when we call the parse method.
  String? parsedData;

  /// Used to format numbers as mobile or land line
  var _globalPhoneType = PhoneNumberType.mobile;

  /// Use international or national phone format
  var _globalPhoneFormat = PhoneNumberFormat.international;

  /// Current selected country
  var _currentSelectedCountry = const CountryWithPhoneCode.us();

  var _placeholderHint = '';

  var _inputContainsCountryCode = true;

  /// Keep cursor on the end
  var _shouldKeepCursorAtEndOfInput = true;

  void updatePlaceholderHint() {
    late String newPlaceholder;

    if (_globalPhoneType == PhoneNumberType.mobile) {
      if (_globalPhoneFormat == PhoneNumberFormat.international) {
        newPlaceholder =
            _currentSelectedCountry.exampleNumberMobileInternational;
      } else {
        newPlaceholder = _currentSelectedCountry.exampleNumberMobileNational;
      }
    } else {
      if (_globalPhoneFormat == PhoneNumberFormat.international) {
        newPlaceholder =
            _currentSelectedCountry.exampleNumberFixedLineInternational;
      } else {
        newPlaceholder = _currentSelectedCountry.exampleNumberFixedLineNational;
      }
    }

    /// Strip country code from hint
    if (!_inputContainsCountryCode) {
      newPlaceholder = newPlaceholder.substring(
        _currentSelectedCountry.phoneCode.length + 2,
      );
    }

    setState(() => _placeholderHint = newPlaceholder);
  }

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<void>(
        future: init(),
        builder: (final context, final snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(title: const Text('flutter_libphonenumber')),
              body: Center(child: Text('error: ${snapshot.error}')),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: AppBar(title: const Text('flutter_libphonenumber')),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: max(
                        0,
                        24 - MediaQuery.of(context).padding.bottom,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),

                        /// Get all region codes
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  /// Print region data
                                  ElevatedButton(
                                    child: const Text('Print all region data'),
                                    onPressed: () async {
                                      final res =
                                          await getAllSupportedRegions();
                                      print(res['IT']);
                                      print(res['US']);
                                      print(res['BR']);
                                    },
                                  ),

                                  /// Spacer
                                  const SizedBox(height: 12),

                                  /// Country code input
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    child: TextField(
                                      controller: countryController,
                                      keyboardType: TextInputType.phone,
                                      onChanged: (final v) {
                                        setState(() {});
                                      },
                                      textAlign: TextAlign.center,
                                      onTap: () async {
                                        final sortedCountries =
                                            CountryManager().countries..sort(
                                              (final a, final b) =>
                                                  (a.countryName ?? '')
                                                      .compareTo(
                                                        b.countryName ?? '',
                                                      ),
                                            );
                                        final res =
                                            await showModalBottomSheet<
                                              CountryWithPhoneCode
                                            >(
                                              context: context,
                                              isScrollControlled: false,
                                              builder: (final context) {
                                                return ListView.builder(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        vertical: 16,
                                                      ),
                                                  itemBuilder: (final context, final index) {
                                                    final item =
                                                        sortedCountries[index];
                                                    return GestureDetector(
                                                      behavior: HitTestBehavior
                                                          .opaque,
                                                      onTap: () {
                                                        Navigator.of(
                                                          context,
                                                        ).pop(item);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              horizontal: 24,
                                                              vertical: 16,
                                                            ),
                                                        child: Row(
                                                          children: [
                                                            /// Phone code
                                                            Expanded(
                                                              child: Text(
                                                                '+${item.phoneCode}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                              ),
                                                            ),

                                                            /// Spacer
                                                            const SizedBox(
                                                              width: 16,
                                                            ),

                                                            /// Name
                                                            Expanded(
                                                              flex: 8,
                                                              child: Text(
                                                                item.countryName ??
                                                                    '',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  itemCount:
                                                      sortedCountries.length,
                                                );
                                              },
                                            );

                                        print('New country selection: $res');

                                        if (res != null) {
                                          setState(() {
                                            _currentSelectedCountry = res;
                                          });

                                          updatePlaceholderHint();

                                          countryController.text =
                                              res.countryName ??
                                              '+ ${res.phoneCode}';
                                        }
                                      },
                                      readOnly: true,
                                      inputFormatters: const [],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// Spacer
                            const SizedBox(width: 20),

                            Expanded(
                              child: Column(
                                children: [
                                  /// Mobile or land line toggle
                                  Row(
                                    children: [
                                      Switch(
                                        value:
                                            _globalPhoneType ==
                                                PhoneNumberType.mobile
                                            ? true
                                            : false,
                                        onChanged: (final val) {
                                          setState(
                                            () =>
                                                _globalPhoneType = val == false
                                                ? PhoneNumberType.fixedLine
                                                : PhoneNumberType.mobile,
                                          );
                                          updatePlaceholderHint();
                                        },
                                      ),

                                      /// Spacer
                                      const SizedBox(width: 5),

                                      Flexible(
                                        child:
                                            _globalPhoneType ==
                                                PhoneNumberType.mobile
                                            ? const Text('Format as Mobile')
                                            : const Text('Format as FixedLine'),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Switch(
                                        value:
                                            _globalPhoneFormat ==
                                                PhoneNumberFormat.national
                                            ? true
                                            : false,
                                        onChanged: (final val) {
                                          setState(
                                            () => _globalPhoneFormat =
                                                val == false
                                                ? PhoneNumberFormat
                                                      .international
                                                : PhoneNumberFormat.national,
                                          );
                                          updatePlaceholderHint();
                                        },
                                      ),

                                      /// Spacer
                                      const SizedBox(width: 5),

                                      Flexible(
                                        child:
                                            _globalPhoneFormat ==
                                                PhoneNumberFormat.national
                                            ? const Text('National')
                                            : const Text('International'),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Switch(
                                        value: _inputContainsCountryCode,
                                        onChanged: (final val) {
                                          setState(
                                            () => _inputContainsCountryCode =
                                                !_inputContainsCountryCode,
                                          );
                                          updatePlaceholderHint();
                                        },
                                      ),
                                      const SizedBox(width: 5),

                                      Flexible(
                                        child: _inputContainsCountryCode
                                            ? const Text('With country code')
                                            : const Text('No country code'),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Switch(
                                        value: _shouldKeepCursorAtEndOfInput,
                                        onChanged: (final val) {
                                          setState(
                                            () => _shouldKeepCursorAtEndOfInput =
                                                !_shouldKeepCursorAtEndOfInput,
                                          );
                                          updatePlaceholderHint();
                                        },
                                      ),

                                      /// Spacer
                                      const SizedBox(width: 5),

                                      const Flexible(
                                        child: Text('Force cursor to end'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),

                        const Text(
                          'Format as you type (synchronous using masks)',
                        ),

                        /// Phone input
                        SizedBox(
                          width: 160,
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            decoration: InputDecoration(
                              hintText: _placeholderHint,
                            ),
                            inputFormatters: [
                              LibPhonenumberTextFormatter(
                                phoneNumberType: _globalPhoneType,
                                phoneNumberFormat: _globalPhoneFormat,
                                country: _currentSelectedCountry,
                                inputContainsCountryCode:
                                    _inputContainsCountryCode,
                                shouldKeepCursorAtEndOfInput:
                                    _shouldKeepCursorAtEndOfInput,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          'If country code is not empty, phone number will format expecting no country code.',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(title: const Text('flutter_libphonenumber')),
              body: const Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
