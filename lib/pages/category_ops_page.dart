import 'package:flutter/material.dart';
import 'package:flutter_application_6/helpers/SqlHelper.dart';
import 'package:flutter_application_6/pages/widgets/app_elevated_buttn.dart';
import 'package:flutter_application_6/pages/widgets/app_text_formfield.dart';
import 'package:get_it/get_it.dart';

class CategoryOpsPage extends StatefulWidget {
  const CategoryOpsPage({super.key});

  @override
  State<CategoryOpsPage> createState() => _CategoryOpsState();
}

class _CategoryOpsState extends State<CategoryOpsPage> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var descraotionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                AppTextFormfield(
                    Controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'name is required';
                      }
                      return null;
                    },
                    lable: 'Name'),
                const SizedBox(
                  height: 20,
                ),
                AppTextFormfield(
                    Controller: descraotionController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'descraption is required';
                      }
                      return null;
                    },
                    lable: 'Descraption'),
                const SizedBox(
                  height: 20,
                ),
                AppElevatedButtn(
                    onPressed: () async {
                      await onSubmite();
                    },
                    lable: 'Submit')
              ],
            )),
      ),
    );
  }

  Future<void> onSubmite() async {
    try {
      if (formKey.currentState!.validate()) {
        var sqlHelper = GetIt.I.get<SqlHelper>();
        await sqlHelper.db!.insert('Categerase', {
          'name': nameController.text,
          'descraption': descraotionController.text
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Catogerey Saved Successfully')));
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Errot in Created Catogerey ')));
    }
  }
}
