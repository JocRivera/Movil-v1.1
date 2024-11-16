import 'package:flutter/material.dart';

class SearchFilterBar extends StatelessWidget {
  final Function(String) onSearchChanged;
  final Function(String) onFilterChanged;
  final String filterType;
  final List<Map<String, String>> filterOptions;

  const SearchFilterBar({
    super.key,
    required this.onSearchChanged,
    required this.onFilterChanged,
    required this.filterType,
    required this.filterOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            onChanged: onSearchChanged,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: filterType,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: filterOptions
                .map((option) => DropdownMenuItem(
                      value: option['value'],
                      child: Text(option['label'] ?? 'All'),
                    ))
                .toList(),
            onChanged: (value) => onFilterChanged(value ?? 'all'),
          ),
        ],
      ),
    );
  }
}
