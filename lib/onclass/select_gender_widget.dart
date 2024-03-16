import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
  other;

  String get title {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.other:
        return 'Other';
    }
  }

//Enhance Enum
  Color get color {
    switch (this) {
      case Gender.male:
        return Colors.blue;
      case Gender.female:
        return Colors.pink;
      case Gender.other:
        return Colors.green;
    }
  }
}

class SelectGenderWidget extends StatefulWidget {
  const SelectGenderWidget({super.key});

  @override
  State<SelectGenderWidget> createState() => _SelectGenderWidgetState();
}

class _SelectGenderWidgetState extends State<SelectGenderWidget> {
  Gender selectedGender = Gender.male;

  @override
  void initState() {
    super.initState();
    selectedGender = Gender.other;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildGenderItem(Gender.male),
            _buildGenderItem(Gender.female),
            _buildGenderItem(Gender.other),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderItem(Gender value) {
    final isSelected = value == selectedGender;
    return GestureDetector(
      onTap: () {
        print('Selected: $value');
        setState(() {
          selectedGender = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: isSelected ? value.color : Colors.grey,
          ),
        ),
        child: Row(
          children: [
            // Custom Widget
            Radio<Gender>(
              value: value,
              groupValue: selectedGender,
              onChanged: (value) {
                if (value != null) {
                  selectedGender = value;
                }
              },
              activeColor: value.color,
            ),
            Text(
              value.title,
              style: TextStyle(
                color: isSelected ? value.color : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
} // WidgetSelectGender => setState

// class GenderItemWidget extends StatelessWidget {
//   final Gender value;
//   final Gender selectedValue;
//   final Function(Gender) onTap;
//   const GenderItemWidget({
//     super.key,
//     required this.value,
//     required this.selectedValue,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isSelected = value == selectedValue; // cơ chế check isSelected
//     return GestureDetector(
//       onTap: () {
//         print('Selected: $value');
//         onTap(value); // Callback
//       },
//       child: Container(
//         padding: const EdgeInsets.only(right: 16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             width: 1,
//             color: isSelected ? value.color : Colors.grey,
//           ),
//         ),
//         child: Row(
//           children: [
//             Radio<Gender>(
//               value: value,
//               groupValue: selectedValue,
//               onChanged: (_) {},
//               activeColor: value.color,
//             ),
//             Text(
//               value.title,
//               style: TextStyle(
//                 color: isSelected ? value.color : Colors.grey,
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
