import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopee_seller_app/views/utils/app_extensions/app_extensions.dart';
import 'package:shopee_seller_app/views/utils/app_widgets/buttons/custome_button/custome_button.dart';
import 'package:shopee_seller_app/views/utils/app_widgets/text_form_field/text_form_filed.dart';
import '../../../../controllers/banner_controller.dart';
class UpdateTabBarWidget extends StatefulWidget {
  var data;
   UpdateTabBarWidget({Key? key, required this.data}) : super(key: key);

  @override
  _UpdateTabBarWidgetState createState() => _UpdateTabBarWidgetState();
}

class _UpdateTabBarWidgetState extends State<UpdateTabBarWidget> {
  File? _updateImageForMobile;
  File? _updateImageForDesktop;
  final TextEditingController _updateNavigateToLinkMobile = TextEditingController();
  final TextEditingController _updateNavigateToLinkDesktop = TextEditingController();
  final TextEditingController _updateSearchBannerItemsForMobile = TextEditingController();
  final TextEditingController _searchBannerItemsForDesktop = TextEditingController();
  bool _updateSwitchValueForMobile = false;
  bool _updateSwitchValueForDesktop = false;

  Future<void> _pickImageForMobile(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _updateImageForMobile = File(pickedImage.path);
      });
    }
  }

  Future<void> _pickImageForDesktop(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _updateImageForDesktop = File(pickedImage.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update',
              style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Mobile'),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Desktop'),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                children: [
                  10.height,
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      // _bottomSheetForMobile();
                    },
                    child: Container(
                      width: context.screenWidth,
                      height: context.screenHeight / 4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: _updateImageForMobile == null
                          ? const Center(child: Text("No Image Selected"))
                          : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            _updateImageForMobile!,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Open link on click",
                        style: TextStyle(fontSize: 20),
                      ),
                      CupertinoSwitch(
                        value: _updateSwitchValueForMobile,
                        onChanged: (value) {
                          setState(() {
                            _updateSwitchValueForMobile = value;
                          });
                        },
                      ),
                    ],
                  ),
                  20.height,
                  _updateSwitchValueForMobile
                      ? Column(
                    children: [
                      TextFormFieldWidget(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return null;
                          } else {
                            return "Please Add Link";
                          }
                        },
                        controller: _updateNavigateToLinkMobile,
                        keyboardType: TextInputType.text,
                        labelText: "Navigate to link",
                        obscureText: false,
                        textInputAction: TextInputAction.next,
                      ),
                      20.height,
                      const Text("Provided link will be opened when user clicks on banner")

                    ],
                  )
                      : const SizedBox(),
                  100.height,
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButtonWidget(
                        text: "Save",
                        onTap: () {

                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // for Desktop
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                children: [
                  10.height,
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      // _bottomSheetForDesktop();
                    },
                    child: Container(
                      width: context.screenWidth,
                      height: context.screenHeight / 4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: _updateImageForDesktop == null
                          ? const Center(child: Text("No Image Selected"))
                          : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            _updateImageForDesktop!,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Open link on click",
                        style: TextStyle(fontSize: 20),
                      ),
                      CupertinoSwitch(
                        value: _updateSwitchValueForDesktop,
                        onChanged: (value) {
                          setState(() {
                            _updateSwitchValueForDesktop = value;
                          });
                        },
                      ),
                    ],
                  ),
                  20.height,
                  _updateSwitchValueForDesktop
                      ? Column(
                    children: [
                      TextFormFieldWidget(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return null;
                          } else {
                            return "Please Add Link";
                          }
                        },
                        controller: _updateNavigateToLinkDesktop,
                        keyboardType: TextInputType.text,
                        labelText: "Navigate to link",
                        obscureText: false,
                        textInputAction: TextInputAction.next,
                      ),
                      20.height,
                      const Text("Provided link will be opened when user clicks on banner")

                    ],
                  )
                      : const SizedBox(),
                  100.height,
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButtonWidget(
                        text: "Save",
                        onTap: () {
                          // BannerController(context: context).uploadBanner(_imageForDesktop!);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _bottomSheetForMobile() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           ListTile(
  //             onTap: () => _searchMobileBottomSheet(),
  //             leading: const Icon(Icons.search),
  //             title: const Text("Search Images"),
  //           ),
  //           ListTile(
  //             onTap: () => context.push(BannerLibraryScreen()),
  //             leading: Icon(Icons.library_add),
  //             title: Text("Banner Library"),
  //           ),
  //
  //           ListTile(
  //             onTap: () => _pickImageForMobile(ImageSource.camera),
  //             leading: const Icon(Icons.camera_alt_outlined),
  //             title: const Text("Camera"),
  //           ),
  //           ListTile(
  //             onTap: () => _pickImageForMobile(ImageSource.gallery),
  //             leading: const Icon(Icons.photo_library_outlined),
  //             title: const Text("Gallery"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  // void _bottomSheetForDesktop() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           ListTile(
  //             onTap: () => _searchDesktopBottomSheet(),
  //             leading: const Icon(Icons.search),
  //             title: const Text("Search Images"),
  //           ),
  //           ListTile(
  //             onTap: () => context.push(BannerLibraryScreen()),
  //             leading: const Icon(Icons.library_add),
  //             title: const Text("Banner Library"),
  //           ),
  //
  //           ListTile(
  //             onTap: () => _pickImageForDesktop(ImageSource.camera),
  //             leading: const Icon(Icons.camera_alt_outlined),
  //             title: const Text("Camera"),
  //           ),
  //           ListTile(
  //             onTap: () => _pickImageForDesktop(ImageSource.gallery),
  //             leading: const Icon(Icons.photo_library_outlined),
  //             title: const Text("Gallery"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  // void _searchMobileBottomSheet() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Padding(
  //         padding: const EdgeInsets.only(top: 18.0,bottom: 20,left: 10,right: 10),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             const Text("Search images"),
  //             const SizedBox(height: 20,),
  //             TextFormFieldWidget(validator: (value){}, controller: _searchBannerItemsForMobile, keyboardType: TextInputType.text, labelText: "Search images", textInputAction: TextInputAction.next, obscureText: false),
  //             const SizedBox(height: 20,),
  //             CustomButtonWidget(text: "Search", onTap: (){})
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  // void _searchDesktopBottomSheet() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Padding(
  //         padding: const EdgeInsets.only(top: 18.0,bottom: 20,left: 10,right: 10),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             const Text("Search images"),
  //             const SizedBox(height: 20,),
  //             TextFormFieldWidget(validator: (value){}, controller: _searchBannerItemsForMobile, keyboardType: TextInputType.text, labelText: "Search images", textInputAction: TextInputAction.next, obscureText: false),
  //             const SizedBox(height: 20,),
  //             CustomButtonWidget(text: "Search", onTap: (){})
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
