// import 'package:dsd/common/styles/colors.dart';
// import 'package:dsd/feature/crud/presentation/pages/add_item_home_page.dart';
// import 'package:dsd/feature/crud/presentation/pages/create_part/extra_later_will_be_deleted/model.dart';
// import 'package:dsd/feature/crud/presentation/widgets/general_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// class CreateChildrenProduct extends ConsumerStatefulWidget {
//   const CreateChildrenProduct({super.key});
//
//   @override
//   ConsumerState<CreateChildrenProduct> createState() =>
//       _CreateChildrenProductState();
// }
//
// class _CreateChildrenProductState extends ConsumerState<CreateChildrenProduct> {
//   @override
//   Widget build(BuildContext context) {
//     final categoryData = ModalRoute.of(context)?.settings.arguments as CategoryModel;
//     TextEditingController nameController = TextEditingController();
//     TextEditingController descController = TextEditingController();
//     TextEditingController priceController = TextEditingController();
//     TextEditingController sizeController = TextEditingController();
//     TextEditingController contactController = TextEditingController();
//     TextEditingController emailController = TextEditingController();
//     TextEditingController phoneController = TextEditingController();
//     return Scaffold(
//       backgroundColor: AppColors.backround,
//       appBar: AppBar(
//         backgroundColor: AppColors.backround,
//         leading: const CustomArrowBackButton(),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(left: 22, right: 22),
//             child: GestureDetector(
//               child: const Text(
//                 "save as draft",
//                 style: TextStyle(color: Color.fromARGB(229, 255, 255, 255)),
//               ),
//               onTap: () {
//                 /// go somewhere
//               },
//             ),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Column(
//             children: [
//               /// widgets that has padding
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Add a photo. The weight of the object should be visible in the photo.",
//                       style: TextStyle(
//                           color: Color.fromARGB(178, 255, 255, 255),
//                           fontSize: 18,
//                           fontWeight: FontWeight.w300),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const Text(
//                       "Photo",
//                       style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w300),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       height: 140,
//                       decoration: const BoxDecoration(
//                           color: AppColors.greenishblue,
//                           borderRadius: BorderRadius.all(Radius.circular(15))),
//                       child: Center(
//                           child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset('assets/icons/camera.svg'),
//                           const Text(
//                             "add a photo",
//                             style: TextStyle(color: Colors.white),
//                           )
//                         ],
//                       )),
//                     ),
//                   ],
//                 ),
//               ),
//
//               /// widgets that has no padding
//               Container(
//                 padding: const EdgeInsets.only(right: 5, left: 5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(top: 10),
//                       width: double.infinity,
//                       height: 80.h,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(8)),
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             width: 60,
//                             height: 60,
//                             decoration: const BoxDecoration(
//                                 color: Colors.red,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(5))),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                            Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 categoryData.categoryName,
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black),
//                               ),
//                               Text(
//                                 "Baby strollers",
//                                 style: TextStyle(
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.black),
//                               ),
//                             ],
//                           ),
//                           const Spacer(),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: const Text(
//                               "Change",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.normal,
//                                   color: const Color.fromARGB(148, 0, 0, 0)),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 30,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//
//                     /// product name
//                     const Text(
//                       "Product name",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(5))),
//                       height: 50,
//                       child: TextField(
//                         style: const TextStyle(color: Colors.black),
//                         controller: nameController,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "For example, product name...",
//                           contentPadding: EdgeInsets.only(left: 15),
//                           hintStyle: TextStyle(
//                               color: Color.fromARGB(112, 0, 0, 0),
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//
//                     /// product description
//                     const Text(
//                       "Description",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(5))),
//                       height: 50,
//                       child: TextField(
//                         style: const TextStyle(color: Colors.black),
//                         controller: descController,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Think of description",
//                           contentPadding: EdgeInsets.only(left: 15),
//                           hintStyle: TextStyle(
//                               color: Color.fromARGB(112, 0, 0, 0),
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16),
//                         ),
//                       ),
//                     ),
//
//                     /// price
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Text(
//                       "Price",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           width: 250.w,
//                           decoration: const BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.all(Radius.circular(5))),
//                           height: 50,
//                           child: TextField(
//                             style: const TextStyle(color: Colors.black),
//                             controller: priceController,
//                             keyboardType: TextInputType.numberWithOptions(),
//                             decoration: const InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.only(left: 15),
//                             ),
//                           ),
//                         ),
//                         const Spacer(),
//                         const CurrenciesDropDown(),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                       ],
//                     ),
//
//                     /// product state
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Text(
//                       "State",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     const StateWidget(),
//
//                     /// product state
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Text(
//                       "Size",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(5))),
//                       height: 50,
//                       child: TextField(
//                         style: const TextStyle(color: Colors.black),
//                         controller: sizeController,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.only(left: 15),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               /// product Location
//               Container(
//                 margin: const EdgeInsets.only(right: 25, left: 25, top: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Product location",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     CentralAsianDropdown()
//                   ],
//                 ),
//               ),
//
//               /// contact
//               Container(
//                 margin: const EdgeInsets.only(right: 5, left: 5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     contactInfofield(
//                         "The contact person", true, "Name", contactController),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     contactInfofield(
//                         "Available email", true, "Email", emailController),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     contactInfofield(
//                         "Phone number", false, "Phone number", phoneController),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Text(
//                       'Contact me',
//                       style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
//                     )
//                   ],
//                 ),
//               ),
//
//               /// buttons
//               Container(
//                 margin: const EdgeInsets.only(left: 26, right: 26),
//                 child: Column(
//                   children: [
//                     ColorChangeButton(
//                       text: 'Via phone call',
//                     ),
//                     SizedBox(height: 20.h),
//                     ColorChangeButton(
//                       text: 'Via text message',
//                     ),
//                     SizedBox(height: 20.h),
//                     ColorChangeButton(
//                       text: 'Via Email',
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
