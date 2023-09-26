import 'package:flutter/material.dart';
import 'package:smarthome/config/size_config.dart';

import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: Body(),
    );
  }
}
