import 'package:flutter/material.dart';
import 'package:himanshuproject/analysis.dart';
import 'package:himanshuproject/breach.dart';
import 'home.dart';
import 'breach.dart';
//void main() {
  //runApp(const MyApp());
//}

class MyDashboard extends StatelessWidget {
  const MyDashboard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Futura',
        primarySwatch: Colors.teal,
      ),
      home: DefaultTabController(
        length: 4,
        child: Home(),
      ),
    );
  }
}













class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final TextEditingController _searchText = TextEditingController();
  NotificationServices notificationServices=NotificationServices();
  @override
  void initState(){
    notificationServices.intialiseNotifications();
    //super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: TabBarView(
          children: [
            _tabBarViewItem(Icons.home, 'Temperature Breach Detection '),
            _tabBarViewItem_graph(Icons.auto_graph_sharp, 'Graphs'),
            _tabBarViewItem(Icons.notifications, 'Notifications'),
            _tabBarViewItem_analysis(Icons.analytics_outlined, 'Analysis'),
            //_tabBarViewItem(Icons.menu, 'Menu'),
          ],
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(135),
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: _boxDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              _topBar(),
              const SizedBox(height: 3),
             // _searchBox(),
              _tabBar(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(15),
      ),
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.blue],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  Widget _topBar() {
    return Row(
      children: [
        // Image.asset(
        //   'assets/logo.png',
        //   scale: 75,
        // ),
        // ElevatedButton(onPressed:(){
        //   notificationServices.sendNotification('Breach Detected', 'breach');
        // },

        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/logo.png'),
        ),
        const Expanded(
          child: Text(
            'Dashboard',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/profile.jpeg'),
        )
      ],
    );
  }

  /*Widget _searchBox() {
    return SizedBox(
      height: 35,
      child: TextFormField(
        textAlign: TextAlign.start,
        controller: _searchText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: InkWell(
            child: const Icon(Icons.close),
            onTap: () {
              _searchText.clear();
            },
          ),
          hintText: 'Search...',
          contentPadding: const EdgeInsets.all(0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
*/
  Widget _tabBar() {
    return TabBar(
      labelPadding: const EdgeInsets.all(0),
      labelColor: Colors.white,
      indicatorColor: Colors.white,
      unselectedLabelColor: Colors.teal.shade800,
      tabs:  [
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.home),
          text: 'Temperature Breach Detection of Reefer Container',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.auto_graph_sharp),
          text: 'Graphs',
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.notifications),
          text: 'Notifications',
          
          
        ),
        Tab(
          iconMargin: EdgeInsets.all(0),
          icon: Icon(Icons.analytics_outlined),
          text: 'Analysis',
        ),

      ],
    );
  }

  Widget _tabBarViewItem(IconData icon, String name) {
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          icon,
          size: 100,
          
        ),
       Text(
         name,

        style: const TextStyle(fontSize: 25),
        ),
      ],
    );
  }
  Widget _tabBarViewItem_graph(IconData icon, String name) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Flexible(child: MyHome())
      ],
    );
  }
  Widget _tabBarViewItem_analysis(IconData icon, String name) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: MyAnalysis())
      ],
    );
  }
}