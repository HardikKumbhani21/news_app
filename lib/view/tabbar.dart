import 'package:flutter/material.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({Key? key}) : super(key: key);

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.grey),
        toolbarHeight: height * 0.150,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
        title: Image.network(
          "https://surveymonkey-assets.s3.amazonaws.com/survey/160356619/a5adf590-ed84-46df-8170-77ef562bb8fa.jpg",
          width: width * 0.4,
        ),
        bottom: TabBar(
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: width * 0.04),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.black, width: 2)),
            controller: tabController,
            tabs: [
              Text("HOME", style: TextStyle(color: Colors.grey)),
              Text("NEWS", style: TextStyle(color: Colors.grey)),
              Text("SHOWBIZ", style: TextStyle(color: Colors.grey)),
              Text("EXTRA", style: TextStyle(color: Colors.grey)),
              Text("STYLE", style: TextStyle(color: Colors.grey)),
            ]),
      ),
      body: TabBarView(children: [
        Center(child: Text("HOME", style: TextStyle(color: Colors.grey))),
        Center(child: Text("NEWS", style: TextStyle(color: Colors.grey))),
        Center(child: Text("SHOWBIZ", style: TextStyle(color: Colors.grey))),
        Center(child: Text("EXTRA", style: TextStyle(color: Colors.grey))),
        Center(child: Text("STYLE", style: TextStyle(color: Colors.grey))),
      ], controller: tabController),
      drawer: Drawer(),
    );
  }
}
