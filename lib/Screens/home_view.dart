import 'package:animated_theme_switcher/animated_theme_switcher.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_animation/theme/bloc/app_theme_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: AppBar(
                leading: ThemeSwitcher(
                  clipper: const ThemeSwitcherCircleClipper(),
                  builder: (context) {
                    return IconButton(
                      icon: Icon(
                        ThemeModelInheritedNotifier.of(context)
                                    .theme
                                    .brightness ==
                                Brightness.light
                            ? Icons.dark_mode
                            : Icons.light_mode,
                      ),
                      onPressed: () {
                        BlocProvider.of<AppThemeBloc>(context)
                            .add(ThemeColorChangeEvent(context: context));
                      },
                    );
                  },
                ),
              ),
            )
    );
  }
}
