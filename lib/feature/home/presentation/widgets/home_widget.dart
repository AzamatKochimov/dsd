import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/feature/home/view_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePageSearchBar extends StatelessWidget {
  const HomePageSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Container(
      width: 280.w,
      height: 42.h,
      decoration: BoxDecoration(
        color: AppColors.greenishblue,
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 15.w,
          ),
          SvgPicture.asset(
            'assets/icons/searchplus.svg',
            width: 20.w,
            height: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 180.w,
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                fillColor: Colors.transparent,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "search",
                hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Spacer(),
          SvgPicture.asset(
            'assets/icons/searchparams.svg',
            width: 20.w,
            height: 20,
          ),
          SizedBox(
            width: 15.w,
          )
        ],
      ),
    );
  }
}

class AllRegionsDropDown extends ConsumerStatefulWidget {
  const AllRegionsDropDown({super.key});

  @override
  ConsumerState<AllRegionsDropDown> createState() => _AllRegionsDropDownState();
}

class _AllRegionsDropDownState extends ConsumerState<AllRegionsDropDown> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ref.watch(homeref);
      return Container(
        width: 120,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.greenishblue),
        child: Center(
          child: DropdownButton(
            style: const TextStyle(color: AppColors.white),
            value: ref.watch(homeref).dropdownvalue,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            dropdownColor: AppColors.backround,
            items: ref.watch(homeref).numberCodes.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              ref.watch(homeref).swapDropdownValue(newValue);
            },
          ),
        ),
      );
    });
  }
}

class CategoriesWidget extends ConsumerStatefulWidget {
  const CategoriesWidget({super.key});

  @override
  ConsumerState<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends ConsumerState<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      itemBuilder: (context, index) {
        return Container(
          height: 75,
          width: 100,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: const Center(
            child: Text(
              "category info",
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}

class ProductGenerator extends ConsumerStatefulWidget {
  const ProductGenerator({super.key});

  @override
  ConsumerState<ProductGenerator> createState() => _ProductGeneratorState();
}

class _ProductGeneratorState extends ConsumerState<ProductGenerator> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.w, // Maximum width of each item
        mainAxisSpacing: 10.0, // Spacing between rows
        crossAxisSpacing: 8.0, // Spacing between columns
        mainAxisExtent: 250.h, // Height of each item
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xff313131),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200.w,
                child: Image.asset(
                  'assets/images/horse.png',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Black hourse 1.5m",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "1.2 mil",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Very smart and big...",
                      style: TextStyle(color: const Color.fromARGB(230, 255, 255, 255)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
