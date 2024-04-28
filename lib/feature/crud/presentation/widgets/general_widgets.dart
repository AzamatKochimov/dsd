import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/feature/crud/view_model/add_item_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget spaceWidget({required bool isHeight, required double size}) {
  return isHeight
      ? SizedBox(
          height: size,
        )
      : SizedBox(
          width: size,
        );
}

class CurrenciesDropDown extends ConsumerStatefulWidget {
  const CurrenciesDropDown({super.key});

  @override
  ConsumerState<CurrenciesDropDown> createState() => _CurrenciesDropDownState();
}

class _CurrenciesDropDownState extends ConsumerState<CurrenciesDropDown> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ref.watch(createref);
      return Container(
        width: 66,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Center(
          child: DropdownButton(
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
            value: ref.watch(createref).dropdownvalue,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            dropdownColor: AppColors.white,
            items: ref.watch(createref).numberCodes.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              ref.watch(createref).swapDropdownValue(newValue);
            },
          ),
        ),
      );
    });
  }
}

class StateWidget extends ConsumerStatefulWidget {
  const StateWidget({super.key});

  @override
  ConsumerState<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends ConsumerState<StateWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        ref.watch(createref);

        return Row(
          children: [
            Container(
              width: 85,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 5,
                color: ref.read(createref).isNew
                    ? AppColors.greenishBlue
                    : AppColors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    ref.read(createref).toNew();
                  },
                  child: SizedBox(
                    height: 55,
                    width: 150.w,
                    child: Center(
                      child: Text(
                        "New",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ref.read(createref).isNew
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              width: 85,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 5,
                color: ref.read(createref).isNew
                    ? AppColors.white
                    : AppColors.greenishBlue,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    ref.read(createref).toUsed();
                  },
                  child: SizedBox(
                    height: 55,
                    width: 150.w,
                    child: Center(
                      child: Text(
                        "Used",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ref.read(createref).isNew
                              ? AppColors.black
                              : AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class CentralAsianDropdown extends StatefulWidget {
  @override
  _CentralAsianDropdownState createState() => _CentralAsianDropdownState();
}

class _CentralAsianDropdownState extends State<CentralAsianDropdown> {
  // Data for regions based on republic selection
  Map<String, List<String>> regionsByRepublic = {
    'Kazakhstan': ['Almaty', 'Nur-Sultan', 'Shymkent', 'Karaganda', 'Aktobe'],
    'Kyrgyzstan': ['Bishkek', 'Osh', 'Jalal-Abad', 'Issyk-Kul'],
    'Tajikistan': ['Dushanbe', 'Khujand', 'Kulob', 'Khorugh'],
    'Turkmenistan': ['Ashgabat', 'Turkmenabat', 'Dashoguz', 'Mary'],
    'Uzbekistan': ['Tashkent', 'Samarkand', 'Bukhara', 'Andijan','Namangan', 'Fergana', 'Jizzakh', 'Navoi'],
  };

  late String selectedRepublic;
  late String selectedRegion;

  @override
  void initState() {
    super.initState();
    selectedRepublic = regionsByRepublic.keys.first;
    selectedRegion = regionsByRepublic[selectedRepublic]![0];
  }

  void _onRepublicChanged(String newValue) {
    setState(() {
      selectedRepublic = newValue;
      // Reset selected region to the first region of the newly selected republic
      selectedRegion = regionsByRepublic[selectedRepublic]![0];
    });
  }

  void _onRegionChanged(String newValue) {
    setState(() {
      selectedRegion = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: 150.w,
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
            ),
            isExpanded: true,
            value: selectedRepublic,
            onChanged: (value) {
              _onRepublicChanged(value!);
            },
            items: regionsByRepublic.keys.map((String republic) {
              return DropdownMenuItem<String>(
                value: republic,
                child: Text(republic),
              );
            }).toList(),
            icon: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          width: 150.w,
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
            ),
            isExpanded: true,
            value: selectedRegion,
            icon: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
              size: 30,
            ),
            onChanged: (value) {
              _onRegionChanged(value!);
            },
            items: regionsByRepublic[selectedRepublic]!.map((String region) {
              return DropdownMenuItem<String>(
                value: region,
                child: Text(region),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

Widget contactInfofield(String title, bool isText, String hintText,
    TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      SizedBox(
        child: TextField(
          style: const TextStyle(color: Colors.black),
          controller: controller,
          keyboardType:
              isText ? TextInputType.text : TextInputType.phone,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 16,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.white.withOpacity(0.5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.white.withOpacity(0.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: AppColors.white),
            ),
          ),
        ),
      ),
    ],
  );
}


class ColorChangeButton extends StatefulWidget {
  final String text;

  const ColorChangeButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  _ColorChangeButtonState createState() => _ColorChangeButtonState();
}

class _ColorChangeButtonState extends State<ColorChangeButton> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: _isActive ? AppColors.greenishBlue : Colors.white,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 5,
        color: AppColors.greenishBlue,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            setState(() {
              _isActive = true;
            });
          },
          child: SizedBox(
            height: 55,
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: _isActive ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  final String text;
  final double height;
  bool isActive;

  CustomButton({
    Key? key,
    required this.text,
    required this.height,
    required this.isActive,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.isActive ? Colors.greenAccent : Colors.white,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 5,
        color: widget.isActive ? Colors.greenAccent : Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            setState(() {
              widget.isActive = !widget.isActive; // Toggle isActive
            });
          },
          child: SizedBox(
            height: widget.height,
            child: Center(
              child: Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
