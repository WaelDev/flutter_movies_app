// import 'package:animate_do/animate_do.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shimmer/shimmer.dart';

// import '../../../../core/utils/constants.dart';
// import '../../../../core/utils/enum.dart';
// import '../../../../core/utils/string.dart';
// import '../bloc/tv_details/tv_details_bloc.dart';
// import '../bloc/tv_details/tv_details_state.dart';
// import '../screens/tv_details_screen.dart';

// class TvRecommendationComponent extends StatelessWidget {
//   const TvRecommendationComponent({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TvDetailsBloc, TvDetailsState>(
//         builder: (context, state) {
//       switch (state.tvRecommendationState) {
//         case RequestState.loaded:
//           return _buildGrid(state, context);
//         case RequestState.loading:
//           return const SizedBox();
//         case RequestState.error:
//           return const SizedBox();
//       }
//     });
//   }

//   Widget _buildGrid(TvDetailsState state, BuildContext context) {
//     return FadeInUp(
//       from: 20,
//       child: Column(
//         children: [
//           const SizedBox(height: 20),
//           SizedBox(
//             height: 20,
//             child: AppBar(
//               bottom: TabBar(
//                 tabs: [
//                   Tab(
//                     child: Text(
//                       'Episodes'.toUpperCase(),
//                       style: const TextStyle(
//                         fontSize: 17.0,
//                         fontWeight: FontWeight.w500,
//                         letterSpacing: 1.2,
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     child: Text(
//                       AppString.moreLikeThis.toUpperCase(),
//                       style: const TextStyle(
//                         fontSize: 17.0,
//                         fontWeight: FontWeight.w500,
//                         letterSpacing: 1.2,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Expanded(
//             child: TabBarView(
//               children: [
//                 _buildMoreLikeThis(),
//                 _buildRecommendationTab(state, context),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMoreLikeThis() {
//     return Container(
//       child: Text('Episodes'),
//     );
//   }

//   GridView _buildRecommendationTab(TvDetailsState state, BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       scrollDirection: Axis.vertical,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         mainAxisSpacing: 8.0,
//         crossAxisSpacing: 8.0,
//         childAspectRatio: 0.7,
//       ),
//       itemCount: state.tvRecommendation.length,
//       itemBuilder: (contex, index) => FadeInUp(
//         from: 20,
//         duration: const Duration(milliseconds: 500),
//         child: InkWell(
//           onTap: () {
//             Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                     builder: (_) => TvDetailsScreen(
//                         tvId: state.tvRecommendation[index].id)));
//           },
//           child: ClipRRect(
//             borderRadius: const BorderRadius.all(Radius.circular(4.0)),
//             child: CachedNetworkImage(
//               imageUrl: AppConstants.imageUrl(
//                   state.tvRecommendation[index].posterPath!),
//               placeholder: (context, url) => Shimmer.fromColors(
//                 baseColor: Colors.grey[850]!,
//                 highlightColor: Colors.grey[800]!,
//                 child: Container(
//                   height: 170.0,
//                   width: 120.0,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//               ),
//               errorWidget: (context, url, error) => const Icon(Icons.error),
//               height: 180.0,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
