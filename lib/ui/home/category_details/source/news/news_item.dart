import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';

import '../../../../../model/NewsResponces.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).indicatorColor,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.grayColor,
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error_outline,
                color: AppColors.grayColor,
              ),
            ),
          ),
          SizedBox(height: height*0.02,),
          Text(
            news.title ?? '',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(height: height*0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'By: ${news.author?.substring(0,6) ?? ''}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              SizedBox(width: width*0.02,),
              Text(
                ' ${news.publishedAt?.substring(0,7) ?? ''}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
