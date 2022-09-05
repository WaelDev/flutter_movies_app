import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/global/theme/app_themes.dart';
import '../../../../core/global/theme/bloc/theme_bloc.dart';

class SwitchDark extends StatelessWidget {
  const SwitchDark({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Dark Mode'),
            Switch(
              activeColor: Theme.of(context).colorScheme.secondary,
              value: state.theme == AppTheme.dark ? true : false,
              onChanged: (bool value) {
                BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(
                  theme: value ? AppTheme.dark : AppTheme.light,
                ));
              },
            ),
          ],
        );
      },
    );
  }
}
