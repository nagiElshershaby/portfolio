import 'package:flutter/material.dart';

/// ViewModel for the Home screen.
/// Currently holds no mutable state — static content is sourced from
/// AppStrings. This class acts as the MVVM boundary for the screen and
/// can be extended when dynamic data (e.g. fetched resume, blog posts)
/// is added in the future.
class HomeViewModel extends ChangeNotifier {
  // No mutable state yet.
}
