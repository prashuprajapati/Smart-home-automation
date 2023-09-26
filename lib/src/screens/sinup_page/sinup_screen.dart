import 'package:smarthome/src/screens/sinup_page/component/body.dart';
import 'package:flutter/material.dart';

class SignScreen  extends StatelessWidget {
	static String routeName = '/login-screen';
	const SignScreen({Key? key}) : super(key: key);

	@override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset:false,
	    body: Body(),
    );
  }
}
