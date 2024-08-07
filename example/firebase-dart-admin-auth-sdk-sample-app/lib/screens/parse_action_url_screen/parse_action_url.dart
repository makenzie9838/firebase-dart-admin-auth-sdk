import 'dart:developer';

import 'package:firebase_dart_admin_auth_sdk/firebase_dart_admin_auth_sdk.dart';
import 'package:firebase_dart_admin_auth_sdk_sample_app/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../shared/button.dart';
import '../../shared/input_field.dart';

class ParseActionUrl extends StatelessWidget {
  ParseActionUrl({Key? key}) : super(key: key);
  final TextEditingController parseActionUrlController =
      TextEditingController();

  dynamic parseUrlresult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: 20.horizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputField(
                controller: parseActionUrlController,
                label: 'Email Link',
                hint: '',
              ),
              20.vSpace,
              Button(
                onTap: () async {
                  var parseUrlresult = await FirebaseApp.firebaseAuth
                      ?.parseActionCodeUrl(parseActionUrlController.text);

                  log("Parse Action Code Url   $parseUrlresult");
                  log("Parse Action Code Url   ${parseUrlresult?['code']}");
                },
                title: 'Sign In',
              ),
              20.vSpace,
              parseUrlresult == null
                  ? SizedBox()
                  : Column(
                      children: [
                        Row(
                          children: [
                            Text('code'),
                            Text(parseUrlresult['code'])
                          ],
                        ),
                        Row(
                          children: [
                            Text('apiKey'),
                            Text(parseUrlresult['apiKey'])
                          ],
                        ),
                        Row(
                          children: [
                            Text('mode'),
                            Text(parseUrlresult['mode'])
                          ],
                        ),
                        Row(
                          children: [
                            Text('continueUrl'),
                            Text(parseUrlresult['continueUrl'])
                          ],
                        ),
                        Row(
                          children: [
                            Text('languageCode'),
                            Text(parseUrlresult['languageCode'])
                          ],
                        ),
                        Row(
                          children: [
                            Text('clientId'),
                            Text(parseUrlresult['clientId'])
                          ],
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
