import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/user_controller.dart';

class EditProfileFieldScreen extends StatefulWidget {
  const EditProfileFieldScreen({
    super.key,
    required this.title,
    required this.label,
    required this.fieldKey,
    required this.initialValue,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.options,
    this.useDatePicker = false,
  });

  final String title;
  final String label;
  final String fieldKey;
  final String initialValue;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final List<String>? options;
  final bool useDatePicker;

  @override
  State<EditProfileFieldScreen> createState() => _EditProfileFieldScreenState();
}

class _EditProfileFieldScreenState extends State<EditProfileFieldScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _textController;
  final RxnString _selectedOption = RxnString();
  final Rxn<DateTime> _selectedDate = Rxn<DateTime>();

  bool get _useDropdown =>
      widget.options != null && widget.options!.isNotEmpty;

  bool get _useDatePicker => widget.useDatePicker;

  List<String> get _dropdownOptions {
    final options = List<String>.from(widget.options ?? const []);
    final initial = widget.initialValue.trim();
    if (initial.isNotEmpty && !options.contains(initial)) {
      options.insert(0, initial);
    }
    return options;
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.initialValue);
    if (_useDropdown) {
      final initial = widget.initialValue.trim();
      _selectedOption.value = initial.isEmpty ? null : initial;
    }

    if (_useDatePicker) {
      _selectedDate.value = DateTime.tryParse(widget.initialValue.trim());
    }
  }

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final initialDate =
        _selectedDate.value ?? DateTime(now.year - 18, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (pickedDate != null) {
      _selectedDate.value = pickedDate;
      _textController.text = _formatDate(pickedDate);
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _saveField() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();

    final value = _useDropdown
        ? (_selectedOption.value ?? '').trim()
        : _textController.text.trim();
    await UserController.instance.updateSingleProfileField(
      fieldKey: widget.fieldKey,
      value: value,
      successMessage: '${widget.title} has been updated.',
    );

    if (mounted) {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YAppBar(
        showBackArrow: true,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(YSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update your ${widget.label.toLowerCase()} information below.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: YSizes.spaceBtwItems),
            Form(
              key: _formKey,
              child: _useDropdown
                  ? Obx(
                      () => DropdownButtonFormField<String>(
                        initialValue: _selectedOption.value,
                        items: _dropdownOptions
                            .map(
                              (option) => DropdownMenuItem<String>(
                                value: option,
                                child: Text(option),
                              ),
                            )
                            .toList(),
                        onChanged: (value) => _selectedOption.value = value,
                        validator: widget.validator ??
                            (value) {
                              if ((value ?? '').trim().isEmpty) {
                                return '${widget.label} is required.';
                              }
                              return null;
                            },
                        decoration: InputDecoration(labelText: widget.label),
                      ),
                    )
                  : TextFormField(
                      controller: _textController,
                      keyboardType: _useDatePicker
                          ? TextInputType.none
                          : widget.keyboardType,
                      readOnly: _useDatePicker,
                      onTap: _useDatePicker ? _pickDate : null,
                      validator: widget.validator,
                      decoration: InputDecoration(
                        labelText: widget.label,
                        suffixIcon: _useDatePicker
                            ? IconButton(
                                onPressed: _pickDate,
                                icon: const Icon(Icons.calendar_today),
                              )
                            : null,
                      ),
                    ),
            ),
            const SizedBox(height: YSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveField,
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

