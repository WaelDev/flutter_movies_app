import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/modules/settings/presentation/screens/settings_screen.dart';

import '../../../../core/services/services_locator.dart';
import '../../../movies/presentation/screens/movies_screen.dart';
import '../../../tvs/presentation/screens/tv_screen.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Widget> _screens = [
    const MoviesScreen(),
    const TvScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..checkConnection(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.internetState) {
            case InternetState.connected:
              return Scaffold(
                bottomNavigationBar: _buildBottomNavigationBar(
                    state.selectedTabNavigation, context),
                body: _screens[state.selectedTabNavigation],
              );
            case InternetState.notConnected:
              return Scaffold(
                body: Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(
      int index, BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (index) =>
          BlocProvider.of<HomeCubit>(context).changeTabNavigationItem(index),
      items: [
        _buildBottomNavigationBarItem(icon: Icons.movie, label: 'Movie'),
        _buildBottomNavigationBarItem(icon: Icons.tv, label: 'Tv'),
        _buildBottomNavigationBarItem(icon: Icons.settings, label: 'Settings'),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
