//Slider
// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names

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
  // final RangeValues rangePrice;

  @override
  void didUpdateWidget(covariant PriceSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    _rangePrice = widget.rangePrice;
  }

  @override
  void initState() {
    _currentSliderValue;
    super.initState();
  }

  double checkvalue(String value) {
    var start = double.parse(value);
    if (start < 500000) {
      start = 5;
    } else if (500000 < start && start < 1000000) {
      start = start / 100000;
    } else if (start > 60000000) {
      start = 60;
    } else if (1000000 <= start && start <= 10000000) {
      start = start / 100000;
    } else if (10000000 < start && start < 60000000) {
      start = start / 1000000;
    }
    return start;
  }

  late RangeValues? rangeValues1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            '${_rangePrice?.start.round() ?? '0'}00000 - ${_rangePrice?.end.round() ?? '60'}00000',
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
                  _rangePrice = value;
                  widget.onChanged?.call(value);
                })),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BoxTextField(
              key: UniqueKey(),
              name: "0 VNĐ",
              onSubmit: (value) {
                setState(() {
                  var start = checkvalue(value);
                  _rangePrice = RangeValues(start, _rangePrice?.end ?? 60);
                });
              },
              inputext: '${_rangePrice?.start.round() ?? '0'}000000',
            ),
            BoxTextField(
                key: UniqueKey(),
                name: "60.000.000 VNĐ",
                inputext: '${_rangePrice?.end.round() ?? '60'}000000',
                onSubmit: (value) {
                  setState(() {
                    var end = checkvalue(value);
                    _rangePrice = RangeValues(_rangePrice?.start ?? 0, end);
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
  BoxTextField({
    required this.name,
    this.inputext,
    this.onChanged,
    Key? key,
    this.onSubmit,
  }) : super(key: key);
  late final String? inputext;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  @override
  State<BoxTextField> createState() => _BoxTextFieldState();
}

class _BoxTextFieldState extends State<BoxTextField> {
  ValueChanged<String>? onSubmitted;

  final TextEditingController _controler = TextEditingController();
  @override
  void initState() {
    _controler.text = widget.inputext ?? '0';
    super.initState();
  }

  int count_zero(int value) {
    var count = 0;
    while (value > 0) {
      value = value ~/ 10;
      count++;
    }
    return count;
  }

  void onChanged(String value) {
    int val = int.tryParse(value) ?? 0;
    val = val ~/ 1000000;
    _controler.text = value;
    widget.onChanged?.call(value);
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
          onSubmitted: widget.onSubmit,
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
