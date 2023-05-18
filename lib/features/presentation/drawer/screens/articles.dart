import 'package:flutter/material.dart';
import 'package:mentasia/features/core/config/global_variables.dart';
import 'package:mentasia/features/data/services/article.dart';
import 'package:provider/provider.dart';

class Articles extends StatefulWidget {
  static String route = "articlesScreen";
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    final ArticleServices articleServices = context.watch<ArticleServices>();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Text(
            "Articles",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          articleServices.isFetched
              ? Consumer<ArticleServices>(
                  builder: (context, value, child) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: value.articleList.length,
                        itemBuilder: (context, index) {
                          final data = value.articleList[index];
                          final String title = data["title"] ?? "";
                          final String author = data["author"] ?? "";
                          final dynamic image = data["urlToImage"];

                          return Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: tPrimaryColor.withOpacity(0.4),
                              boxShadow: [
                                BoxShadow(
                                  color: tPrimaryColor.withOpacity(0.1),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(20),
                              title: Text(title),
                              subtitle: Text("by: $author"),
                              leading: SizedBox(
                                height: 100,
                                width: 100,
                                child: image == null
                                    ? FittedBox(
                                        child: Image.asset(tLogo),
                                      )
                                    : FittedBox(
                                        fit: BoxFit.contain,
                                        child: Image.network(image),
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }
}
