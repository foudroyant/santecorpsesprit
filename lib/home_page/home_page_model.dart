import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<dynamic> menu = [];
  void addToMenu(dynamic item) => menu.add(item);
  void removeFromMenu(dynamic item) => menu.remove(item);
  void removeAtIndexFromMenu(int index) => menu.removeAt(index);
  void insertAtIndexInMenu(int index, dynamic item) => menu.insert(index, item);
  void updateMenuAtIndex(int index, Function(dynamic) updateFn) =>
      menu[index] = updateFn(menu[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
