import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flt_telephony_info/flt_telephony_info.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      supportedLocales: [
        Locale('en'),
        Locale('it'),
        Locale('fr'),
        Locale('es'),
        Locale('de'),
        Locale('pt'),
        Locale('ko'),
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('CountryPicker Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 400,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CountryCodePicker(
                    onChanged: print,
                    hideMainText: true,
                    showFlagMain: true,
                    showFlag: false,
                    initialSelection: "",
                    hideSearch: true,
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: true,
                    alignLeft: true,
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CountryCodePicker(
                    onChanged: (e) => print(e.toLongString()),
                     initialSelection: "",
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: false,
                    favorite: ['+39', 'FR'],
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CountryCodePicker(
                    enabled: false,
                    onChanged: (c) => c.name,
                    initialSelection: "",
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: true,
                    favorite: ['+39', 'FR'],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
