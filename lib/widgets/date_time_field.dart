import 'package:flutter/material.dart';
import '../theme/colors.dart';

class DateField extends StatefulWidget {
  final ValueChanged<String> onDateSelected;
  const DateField({super.key, required this.onDateSelected});
  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formatted = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      setState(() {
        _dateController.text = formatted;
      });
      widget.onDateSelected(formatted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      readOnly: true,
      onTap: _pickDate,
      decoration: InputDecoration(
        labelText: "Expense Date",
        prefixIcon: Icon(Icons.calendar_month_outlined, color: AppColors.darkGreen),
        labelStyle: TextStyle(color: AppColors.darkGreen),
        border: const OutlineInputBorder(),
      ),
      style: TextStyle(color: AppColors.lightGreen),
    );
  }
}
