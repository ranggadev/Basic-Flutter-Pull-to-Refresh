//--- Github : https://github.com/ranggadev
//--- Let's visit My Github and give me your star and questions
//--- Code with ❤ by Rangga Saputra from Indonesia


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> items = ["Rangga", "Saputra", "Nickname", "rangga.dev", "Mobile", "Developer", "From West Borneo", "Indonesia"];
  // List<String> items = [];
  RefreshController refreshController = RefreshController(initialRefresh: false);
  bool loading = true;

  @override
  void initState() {
    onRefresh();
    super.initState();
  }
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Best Way to Show Data"),
      ),
      body: (loading) ?
      Center(
        child: CircularProgressIndicator(),
      ) :
      SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        onRefresh: onRefresh,
        child: (items.length == 0) ?
        Center(
          child: Text(
            "Empty Data",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40
            ),
          ),
        ) : 
        ListView.builder(
          itemCount: items.length,
          itemExtent: 100.0,
          itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
        ),
      ),
    );
  }

  void onRefresh() async{
    setState(() {
      loading = true;
    });

    // Think of it as monitoring network fetch
    await Future.delayed(Duration(milliseconds: 1000));

    setState(() {
      loading = false;
    });
    
    // if completed then use refreshCompleted()
    // if failed,use refreshFailed()
    // etc...
    refreshController.refreshCompleted();
  }
}