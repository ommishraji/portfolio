import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/api_layer/models/repos_list_model.dart';

class ReposDesktopWidget extends StatefulWidget {
  const ReposDesktopWidget({super.key});

  @override
  State<ReposDesktopWidget> createState() => _ReposDesktopWidgetState();
}

class _ReposDesktopWidgetState extends State<ReposDesktopWidget> {

  List<ReposListModel?>? _reposListModel;
  List<ReposListModel?>? get reposListModel => _reposListModel;
  Future<List<ReposListModel?>?> getRepos() async {
    var dio = Dio();
    var response = await dio.request(
      'https://api.github.com/users/ommishraji/repos?sort=updated&direction=desc',
      options: Options(
        method: 'GET',
      ),
    );
    if (response.statusCode == 200) {
      setState(() {
        _reposListModel = (response.data as List)
            .map((repoJson) => ReposListModel.fromJson(repoJson))
            .toList();
      });
    }
    else {
      if (kDebugMode) {
        print(response.statusMessage);
      }
    }
    return _reposListModel;
  }

  @override
  void initState() {
    super.initState();
      getRepos();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        margin: const EdgeInsets.only(bottom: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Latest Commits',
            style: TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: width > 1200 ? height * .68 : width > 1000 ? height * .64 : height * .68,
            width: MediaQuery.of(context).size.width*.95,
            child: _reposListModel != null ? GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 450,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: width > 1200 ? 8 : 6,
                itemBuilder: (context, index){
                 return repoContainer("${_reposListModel?[index]?.ogImage}",
                     "${_reposListModel?[index]?.name}",
                     '${_reposListModel?[index]?.htmlUrl}');
                }
            ): const Center(child: CircularProgressIndicator()),
          ),
        ]));
  }

  Widget repoContainer(String imageUrl, String title, String repoLink) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(repoLink));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 338,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // width: MediaQuery.of(context).size.width * .4,
              height: width > 1116 ? height * 0.26 : height * 0.22 ,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)
              ),
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
