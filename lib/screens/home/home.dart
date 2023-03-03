import 'package:chat/base.dart';
import 'package:chat/screens/home/home_navigator.dart';
import 'package:chat/screens/home/home_view_model.dart';
import 'package:chat/screens/home/room_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../add_room/add_room_screen.dart';
import '../login_screen/login_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
    viewModel.readRooms();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/main_bg.png',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddRoomScreen.routeName);
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
              title: const Text("Chat App"),
              actions: [
                IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
                    },
                    icon: const Icon(Icons.logout))
              ],
            ),
            body: RefreshIndicator(
              onRefresh: refresh,
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              backgroundColor: Colors.white,
              color: Colors.blue,
              displacement: 10,
              edgeOffset: 0,
              strokeWidth: 3,
              child: Consumer<HomeViewModel>(
                builder: (context, homeViewModel, child) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: GridView.builder(
                      itemBuilder: (context, index) {
                        return RoomWidget(homeViewModel.rooms[index]);
                      },
                      itemCount: homeViewModel.rooms.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }

  Future<void> refresh() async {
    setState(() {
      viewModel.readRooms();
    });
  }
}
