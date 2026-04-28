import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class YBillingAddressSection extends StatefulWidget {
  const YBillingAddressSection({super.key});

  @override
  State<YBillingAddressSection> createState() => _YBillingAddressSectionState();
}

class _YBillingAddressSectionState extends State<YBillingAddressSection> {
  String? address;
  String? phoneNumber = '+855-96-280-7801';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _getCurrentAddress() async {
    try {
      // Request location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Reverse geocode to get address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          address =
              '${place.street}, ${place.subLocality}, ${place.locality}, ${place.country}';
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching address: $e');
      setState(() {
        address = 'Unable to fetch address';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {
            // TODO: Navigate to Map Picker if you want editable address
          },
        ),
        isLoading
            ? const CircularProgressIndicator()
            : Text(address ?? '', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: YSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: YSizes.spaceBtwItems),
            Text(
              phoneNumber ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
