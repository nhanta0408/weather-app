import 'package:flutter/material.dart';

class DropdownOnClassWidget extends StatefulWidget {
  const DropdownOnClassWidget({super.key});

  @override
  State<DropdownOnClassWidget> createState() => _DropdownOnClassWidgetState();
}

class _DropdownOnClassWidgetState extends State<DropdownOnClassWidget> {
  String selectedCity = 'ha_noi';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Select City',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        DropdownButton<String>(
          items: const [
            DropdownMenuItem<String>(
              value: 'tp_hcm',
              child: Text('Thành phố Hồ Chí Minh'),
            ),
            DropdownMenuItem<String>(
              value: 'ha_noi',
              child: Text('Thủ đô Hà Nội'),
            ),
          ],
          value: selectedCity,
          onChanged: (selected) {
            setState(() {
              selectedCity = selected ?? 'ha_noi';
            });
          },
        ),
      ],
    );
  }
}
