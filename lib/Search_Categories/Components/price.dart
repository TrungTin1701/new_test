//Slider
// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceSlider extends StatefulWidget {
  const PriceSlider({Key? key}) : super(key: key);

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  RangeValues _currentSliderValue = RangeValues(0, 60);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            '${_currentSliderValue.start.round()}000000 - ${_currentSliderValue.end.round()}000000',
            style: TextStyle(fontSize: 20),
          ),
        ),
        RangeSlider(
          labels: RangeLabels('${_currentSliderValue.start.round()}000000',
              '${_currentSliderValue.end.round()}000000'),
          values: _currentSliderValue,
          max: 60,
          onChanged: (RangeValues value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BoxTextField(name: "0 VNĐ"),
            BoxTextField(name: "60000000 VNĐ"),
          ],
        )
      ],
    );
  }
}

class BoxTextField extends StatefulWidget {
  late String name;
  BoxTextField({required this.name, Key? key}) : super(key: key);

  @override
  State<BoxTextField> createState() => _BoxTextFieldState();
}

class _BoxTextFieldState extends State<BoxTextField> {
  ValueChanged<String>? onSubmitted;

  final TextEditingController _controler = TextEditingController();

  void check() {
    var val = _controler.text;
    int val1 = int.tryParse(val) ?? 0;
    if (1000000 <= val1 && val1 <= 60000000) {
      var val2 = val1 % 500000;
      val1 = val2 < 500000 ? val1 = val1 - val2 : val1 - val2 + 1000000;
      setState(() {
        _controler.text = '$val1';
      });
    }
    if (val1 < 500000) {
      val1 = 500000;
    }
    if (val1 < 1000000) {
      var val2 = val1 % 50000;
      val1 = val2 < 50000 ? val1 = val1 - val2 : val1 - val2 + 100000;
      setState(() {
        _controler.text = '$val1';
      });
    }
    if (val1 < 0) {
      _controler.text = "0";
    }
    if (val1 > 6000000) {
      setState(() {
        _controler.text = "60000000";
      });
    }
  }

  String result = '';
  @override
  Widget build(BuildContext context) {
    var name = widget.name;
    return SizedBox(
      width: 135,
      height: 45,
      child: Center(
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.number,
          autocorrect: false,
          controller: _controler,
          onSubmitted: (String str) {
            check();
            setState(() {
              result = str;
            });
          },
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            hintText: name,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
