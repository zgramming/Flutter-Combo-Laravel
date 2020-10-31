import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// In rare case , this variable usefull when context on widget is dispose
/// Usually initialize this variable in screen after login [WelcomeScreen/HomeScreen]
final globalContext = StateProvider<BuildContext>((ref) => null);

/// For loading builder in ProviderListener
final globalLoading = StateProvider.autoDispose<bool>((ref) => false);

/// For easy parsing id to another screen
// final globalIdProduct = StateProvider<int>((ref) => null);
