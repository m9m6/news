import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/category_details/source/source_tab_widget.dart';
import 'package:news/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(),
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
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.grayColor,

                ),
                  onPressed: () {
                    ApiManager.getSources();
                    setState(() {

                    });
                  },
                  child: Text(
                    'Try Again',
                    style: Theme.of(context).textTheme.labelMedium,
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
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.grayColor,

                ),
                  onPressed: () {
                  ApiManager.getSources();
                  setState(() {

                  });
                  },
                  child: Text(
                    'Try Again',
                    style: Theme.of(context).textTheme.labelMedium,
                  ))
            ],
          );
        }
        //todo: server=> response=>success
        var sourcesList = snapshot.data?.sources ?? [];
        return SourceTabWidget(sourcesList: sourcesList);
      },
    );
  }
}
