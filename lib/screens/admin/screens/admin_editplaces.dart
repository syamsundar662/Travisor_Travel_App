import 'package:flutter/material.dart';
import 'package:trivo/database/models/fb_model.dart';
import 'package:trivo/helper/helper_size.dart';
import 'package:trivo/lists/list_categories.dart';
import 'package:trivo/lists/list_districts.dart';
import 'package:trivo/database/functions/Firebase/db_repository.dart';

class EditPlaces extends StatefulWidget {
  const EditPlaces({Key? key, required this.destination}) : super(key: key);

  final DestinationFB destination;

  @override
  EditPlacesState createState() => EditPlacesState();
}

class EditPlacesState extends State<EditPlaces> {
  final formkey = GlobalKey<FormState>();
  String? selectedDistrictvalue;
  String? selectedCategoryvalue;

  late TextEditingController placeNameController;
  late TextEditingController descriptionController;
  late TextEditingController locationController;
  late TextEditingController reachthereController;
  late TextEditingController latcontroler;
  late TextEditingController longitude;

  @override
  void initState() {
    super.initState();
    placeNameController =TextEditingController(text: widget.destination.placeName);
    descriptionController =TextEditingController(text: widget.destination.description);
    locationController =TextEditingController(text: widget.destination.location);
    reachthereController =TextEditingController(text: widget.destination.reachthere);
    latcontroler = TextEditingController(text: widget.destination.latitude);
    longitude = TextEditingController(text: widget.destination.longitude);
    selectedDistrictvalue = widget.destination.district;
    selectedCategoryvalue = widget.destination.category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit places'),
      ),
      body: SafeArea(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalGap2,
                TextFormField(
                  controller: placeNameController,
                  decoration: InputDecoration(
                      hintText: 'Place name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        // borderSide: BorderSide.,
                      ),
                      filled: true),
                ),
                verticalGap1,
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    hintText: 'Location(Link)',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                //drop do
                verticalGap1,
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: 'Select district',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  value: selectedDistrictvalue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDistrictvalue = newValue;
                    });
                  },
                  items: districts.map((String district) {
                    return DropdownMenuItem<String>(
                      value: district,
                      child: Text(district),
                    );
                  }).toList(),
                ),

                //district dropdown

                //category dropdown
                verticalGap1,
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: 'Select category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  value: selectedCategoryvalue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategoryvalue = newValue;
                    });
                  },
                  items: categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                ),
                verticalGap1,
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                verticalGap1,
                TextField(
                  controller: reachthereController,
                  decoration: InputDecoration(
                    hintText: 'Other info',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                TextField(
                  controller: latcontroler,
                  decoration: InputDecoration(
                    hintText: 'latitude',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                TextField(
                  controller: longitude,
                  decoration: InputDecoration(
                    hintText: 'Longitude',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      updateDestination(widget.destination);
                      Repository().getalldatas();
                      // ignore: avoid_print
                      print("SUBMITTED");
                    },
                    child: const Text('submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateDestination(DestinationFB destinationFB) {
    Repository().getalldatas();
    final name = placeNameController.text;
    final district = selectedDistrictvalue;
    final locate = locationController.text;
    final category = selectedCategoryvalue;
    final discription = descriptionController.text;
    final reach = reachthereController.text;
    final lat = latcontroler.text;
    final long = longitude.text; 
    destinationFB.placeName = name;
    destinationFB.district = district!;
    destinationFB.location = locate;
    destinationFB.category = category!;
    destinationFB.description = discription;
    destinationFB.reachthere = reach;
    destinationFB.latitude =lat;
    destinationFB.longitude=long; 

    Repository().editData(destinationFB);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Edited successfully')));
  }
}
