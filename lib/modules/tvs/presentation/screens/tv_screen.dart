import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/services_locator.dart';
import '../bloc/tvs/tvs_bloc.dart';
import '../bloc/tvs/tvs_events.dart';
import '../components/on_the_air_component.dart';
import '../components/popular_component.dart';
import '../components/top_rated_component.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<TvsBloc>()
          ..add(GetOnTheAirTvsEvent())
          ..add(GetPopularTvsEvent())
          ..add(GetTopRatedTvsEvent()),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: const [
              OnTheAirComponent(),
              PopularComponent(),
              TopRatedComponent()
            ],
          ),
        ),
      ),
    );
  }
}
