import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponces.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/category_details/source/news/news_item.dart';

import '../../../../../utils/app_colors.dart';

class NewsWidget extends StatelessWidget {
  Source source;

  NewsWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return FutureBuilder<NewsResponces?>(
      future: ApiManager.getNewsBySourceId(source.id ?? ''),
      builder: (context, snapshot) {
//todo:loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.grayColor,
            ),
          );
        }
        //todo: error => client
        else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Something went Wrong',
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getNewsBySourceId(source.id ?? '');
                },
                child: Text(
                  'Try Again',
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium,
                ),
              ),
            ],
          );
        }
        //todo: server=> response=>success,error
        //todo: server=> error
        if (snapshot.data?.status != 'ok') {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                snapshot.data!.message!,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grayColor,

                  ),
                  onPressed: () {
                    ApiManager.getNewsBySourceId(source.id ?? '');
                  },
                  child: Text(
                    'Try Again',
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelMedium,
                  ))
            ],
          );
        }
        //todo: server=> response=>success
        var newsList = snapshot.data?.articles ?? [];
        return ListView.separated(
          itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);
          },
          itemCount:newsList.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: height*0.02,);
          },);
      },);
  }
}
