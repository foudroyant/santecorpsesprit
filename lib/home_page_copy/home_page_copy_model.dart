import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageCopyModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> menu = [];
  void addToMenu(dynamic item) => menu.add(item);
  void removeFromMenu(dynamic item) => menu.remove(item);
  void removeAtIndexFromMenu(int index) => menu.removeAt(index);
  void updateMenuAtIndex(int index, Function(dynamic) updateFn) =>
      menu[index] = updateFn(menu[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
