import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SeasonDropDownComponent extends StatefulWidget {
  final int numberOfSeason;
  const SeasonDropDownComponent({Key? key, required this.numberOfSeason})
      : super(key: key);

  @override
  _SeasonDropDownComponentState createState() =>
      _SeasonDropDownComponentState();
}

class _SeasonDropDownComponentState extends State<SeasonDropDownComponent> {
  final List<String> items = [
    'Season 1',
    'Season 2',
    'Season 3',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: Center(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: [
                Expanded(
                  child: Text(
                    items[0].toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 25,
            iconEnabledColor: Colors.white,
            iconDisabledColor: Colors.grey,
            buttonHeight: 50,
            buttonWidth: MediaQuery.of(context).size.width * 0.93,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black26,
              ),
              color: Colors.grey.shade800,
            ),
            buttonElevation: 2,
            itemHeight: 40,
            itemPadding: const EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 200,
            dropdownWidth: MediaQuery.of(context).size.width * 0.93,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey.shade800,
            ),
            dropdownElevation: 8,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
            offset: const Offset(-20, 0),
          ),
        ),
      ),
    );
  }
}
