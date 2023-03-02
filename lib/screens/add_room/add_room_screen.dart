import 'package:chat/base.dart';
import 'package:chat/models/category.dart';
import 'package:chat/screens/add_room/add_room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_room_navigator.dart';

class AddRoomScreen extends StatefulWidget {
  static const String routeName = 'add-room';

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends BaseView<AddRoomScreen, AddRoomViewModel>
    implements AddRoomNavigator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var categories = RoomCategory.getCategories();
  late RoomCategory selectedCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
    selectedCategory = categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
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
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  'Add Room',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              body: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .65,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.height * .05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Form(
                      key: formKey,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .01),
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Create New Room",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                ),
                                Image.asset('assets/images/group.png'),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                ),
                                TextFormField(
                                  controller: titleController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  validator: (text) {
                                    if (text!.trim() == "") {
                                      return "Please Enter Room Title";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      label: Text(
                                        "Title",
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                            color: Colors.blue),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              color: Colors.blue))),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .025,
                                ),
                                TextFormField(
                                  controller: descriptionController,
                                  validator: (text) {
                                    if (text!.trim() == "") {
                                      return "Please Enter Room Description";
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                      label: const Text("Description"),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                            color: Colors.blue),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              color: Colors.blue))),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .025,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: DropdownButton<RoomCategory>(
                                      value: selectedCategory,
                                      items: categories
                                          .map(
                                            (cat) =>
                                                DropdownMenuItem<RoomCategory>(
                                              value: cat,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Image.asset(cat.image),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3,
                                                  ),
                                                  Text(
                                                    cat.name,
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (category) {
                                        if (category == null) {
                                          return;
                                        } else {
                                          selectedCategory = category;
                                        }
                                        setState(() {});
                                      }),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .025,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * .06,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      elevation: 10.0,
                                    ),
                                    onPressed: () {
                                      validateForm();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          "CREATE ROOM",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.blue),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.blue,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateForm() {
    if (formKey.currentState!.validate()) {
      //Create Room
      viewModel.addRoomToDb(titleController.text, descriptionController.text,
          selectedCategory.id);
    }
  }

  @override
  AddRoomViewModel initViewModel() {
    // TODO: implement initViewModel
    return AddRoomViewModel();
  }
}
