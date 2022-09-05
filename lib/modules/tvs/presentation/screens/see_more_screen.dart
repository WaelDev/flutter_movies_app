import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/modules/tvs/domain/entities/tv.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/constants.dart';
import 'tv_details_screen.dart';

class SeeMoreScreen extends StatelessWidget {
  final String title;
  final List<Tv> tvs;

  const SeeMoreScreen({Key? key, required this.title, required this.tvs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('$title Tvs')),
      ),
      body: _buildbody(),
    );
  }

  _buildbody() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: tvs.length,
      itemBuilder: (context, index) => _buildTvItem(index, context),
    );
  }

  Widget _buildTvItem(int index, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TvDetailsScreen(tvId: tvs[index].id),
          ),
        );
      },
      child: FadeInUp(
        from: 20,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    width: 110,
                    height: 150,
                    fit: BoxFit.cover,
                    imageUrl: AppConstants.imageUrl(tvs[index].posterPath),
                    placeholder: (_, url) => Shimmer.fromColors(
                      child: Container(
                        height: 170,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tvs[index].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          height: 22,
                          width: 50,
                          child: Center(
                              child: Text(
                            tvs[index].releaseDate.split('-')[0],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(tvs[index].voteAverage.toString())
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      child: Text(
                        tvs[index].overview,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
