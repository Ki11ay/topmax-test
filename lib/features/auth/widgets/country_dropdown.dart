import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

class CountryDropdown extends StatelessWidget {
  final List<Map<String, dynamic>> countries;
  final int? selectedCountryId;
  final Function(int?) onChanged;
  final bool enabled;

  const CountryDropdown({
    super.key,
    required this.countries,
    required this.selectedCountryId,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: selectedCountryId,
      decoration: const InputDecoration(
        labelText: 'Country',
        prefixIcon: Icon(Icons.flag),
      ),
      items: countries.map((country) {
        return DropdownMenuItem<int>(
          value: country['id'],
          child: Row(
            children: [
              if (country['flag'] != null)
                Image.network(
                  country['flag'],
                  width: 24,
                  height: 24,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.flag, size: 24);
                  },
                ),
              const SizedBox(width: AppConstants.paddingSmall),
              Text('${country['name']} (${country['code']})'),
            ],
          ),
        );
      }).toList(),
      onChanged: enabled ? onChanged : null,
      validator: (value) {
        if (value == null) {
          return 'Please select a country';
        }
        return null;
      },
    );
  }
}

