import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/api_layer/models/repos_list_model.dart';

class ReposMobileWidget extends StatefulWidget {
  const ReposMobileWidget({super.key});

  @override
  State<ReposMobileWidget> createState() => _ReposMobileWidgetState();
}

class _ReposMobileWidgetState extends State<ReposMobileWidget> {

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
    return Container(
        margin: const EdgeInsets.only(bottom: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Latest Commits',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 1.05,
            width: MediaQuery.of(context).size.width*.95,
            child: _reposListModel != null ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
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
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * 0.3 ,
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
