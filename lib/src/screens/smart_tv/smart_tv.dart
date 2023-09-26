import 'package:smarthome/provider/base_view.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smarthome/src/screens/smart_tv/components/expandable_bottom_sheet.dart';
import 'package:smarthome/view/smart_tv_view_model.dart';
import 'components/body.dart';

class SmartTV extends StatelessWidget {
  static String routeName = '/smart-tv';
  const SmartTV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SmartTvViewModel>(
        onModelReady: (model) => {},
        builder: (context, model, child) {
          return Material(
            child: SlidingUpPanel(
              controller: model.pc,
              backdropEnabled: true,
              boxShadow: const [],
              body: Scaffold(
                backgroundColor: const Color(0xFFF2F2F2),
                body: Body(
                  model: model,
                ),
              ),
              panel: ExpandableBottomSheet(model: model),
            ),
          );
        });
  }
}
