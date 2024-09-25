import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_page.dart';
import 'package:movie_app/screens/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        bottomNavigationBar: Container(
          color: Colors.black,
          height: screenHeight * 0.08,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),
            ],
            unselectedLabelColor: Color(0xFF999999),
            labelColor: Colors.white,
            indicatorColor: Colors.transparent,
          ),
        ),
        body: TabBarView(
          children: [
            HomePage(),
            SearchScreen(),
          ],
        ),
      ),
    );
  }
}
