import 'package:flutter/cupertino.dart';

class TransparentRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  final WidgetBuilder builder;

  @override
  final String? title;

  /// Builds the primary contents of the route.
  @override
  final bool maintainState;

  final Color backgroundColor;

  TransparentRoute({
    required this.builder,
    required this.backgroundColor,
    this.title,
    RouteSettings? settings,
    this.maintainState = true,
    bool fullscreenDialog = true,
  })  : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  @override
  Duration get transitionDuration => Duration(milliseconds: 250);

  @override
  Duration get reverseTransitionDuration => Duration(milliseconds: 250);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(opacity: animation, child: child);

  @override
  Color get barrierColor => backgroundColor;

  @override
  Widget buildContent(BuildContext context) => builder(context);

  @override
  String get debugLabel => '${super.debugLabel}(${settings.name})';

  @override
  bool get barrierDismissible => true;

  @override
  bool get opaque => false;
}
