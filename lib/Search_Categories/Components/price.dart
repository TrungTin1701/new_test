//Slider
// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceSlider extends StatefulWidget {
  const PriceSlider({Key? key, this.onChanged, this.rangePrice})
      : super(key: key);
  final Function(RangeValues)? onChanged;
  final RangeValues? rangePrice;
  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  final RangeValues _currentSliderValue = RangeValues(0, 60);
  late RangeValues? _rangePrice = widget.rangePrice;

  @override
  void initState() {
    // TODO: implement initState
    _currentSliderValue;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            '${_rangePrice?.start.round() == null ? '0' : _rangePrice?.start.round()}00000 - ${_rangePrice?.end.round() == null ? '60' : _rangePrice?.end.round()}00000',
            style: TextStyle(fontSize: 16),
          ),
        ),
        RangeSlider(
            activeColor: Colors.lightBlue.shade500,
            inactiveColor: Colors.lightBlue.shade100,
            labels: RangeLabels('${_rangePrice?.start.round()}000000',
                '${_rangePrice?.end.round()}000000'),
            values: _rangePrice ?? _currentSliderValue,
            max: _currentSliderValue.end,
            min: _currentSliderValue.start,
            onChanged: (RangeValues value) => setState(() {
                  widget.onChanged?.call(value);
                  _rangePrice = value;
                })),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BoxTextField(
                name: "0 VNĐ",
                onChanged1: (value) {
                  setState(() {
                    var dou1 = double.tryParse(value) ?? 0;
                    _rangePrice?.start == dou1;
                    widget.onChanged?.call(RangeValues(dou1, 60));
                  });
                }),
            BoxTextField(
                name: "60.000.000 VNĐ",
                onChanged1: (value) {
                  setState(() {
                    var dou1 = double.tryParse(value) ?? 0;
                    _rangePrice?.end == dou1;
                    widget.onChanged?.call(RangeValues(0, dou1));
                  });
                }),
          ],
        )
      ],
    );
  }
}

class BoxTextField extends StatefulWidget {
  late String name;
  BoxTextField({required this.name, Key? key, this.onChanged1})
      : super(key: key);
  final Function(String)? onChanged1;
  @override
  State<BoxTextField> createState() => _BoxTextFieldState();
}

class _BoxTextFieldState extends State<BoxTextField> {
  ValueChanged<String>? onSubmitted;

  final TextEditingController _controler = TextEditingController();

  void onChanged(String value) {
    setState(() {
      _controler.addListener(() {
        widget.onChanged1?.call(_controler.text);
      });
    });
  }

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
        _controler.text = "60.000.000";
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
            setState(() {});
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
