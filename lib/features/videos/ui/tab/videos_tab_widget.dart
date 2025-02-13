import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/api_layer/models/repos_list_model.dart';

class ReposTabWidget extends StatefulWidget {
  const ReposTabWidget({super.key});

  @override
  State<ReposTabWidget> createState() => _ReposTabWidgetState();
}

class _ReposTabWidgetState extends State<ReposTabWidget> {

  late List<ReposListModel?> _reposListModel;
  List<ReposListModel?> get reposListModel => _reposListModel;
  Future<List<ReposListModel?>> getRepos() async {
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
    return Container(
        margin: const EdgeInsets.only(bottom: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Latest Commits',
            style: TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: MediaQuery.of(context).size.width > 735 ? MediaQuery.of(context).size.height * .8 : MediaQuery.of(context).size.height * .85,
            width: MediaQuery.of(context).size.width*.95,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: MediaQuery.of(context).size.width > 735 ? 4 : 6,
                itemBuilder: (context, index){
                  return repoContainer("${_reposListModel[index]?.ogImage}",
                      "${_reposListModel[index]?.name}",
                      '${_reposListModel[index]?.htmlUrl}');
                }
            ),
          ),
        ]));
  }

  Widget repoContainer(String imageUrl, String title, String repoLink) {
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
              width: MediaQuery.of(context).size.width * .45,
              height: MediaQuery.of(context).size.width > 735 ? MediaQuery.of(context).size.height * .24 : MediaQuery.of(context).size.height * .18,
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
