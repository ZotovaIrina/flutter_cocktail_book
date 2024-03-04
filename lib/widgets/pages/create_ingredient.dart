import 'package:cocktail_book/widgets/app_page_wrapper.dart';
import 'package:cocktail_book/widgets/ingredients/Ingredient.dart';
import 'package:flutter/material.dart';

class CreateIngredient extends StatelessWidget {
  const CreateIngredient({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageWrapper(
        page: SafeArea(
            child: Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: CreateIngredientForm(),
      ),
    )));
  }
}

class CreateIngredientForm extends StatefulWidget {
  const CreateIngredientForm({super.key});

  @override
  State<CreateIngredientForm> createState() => _CreateIngredientFormState();
}

class _CreateIngredientFormState extends State<CreateIngredientForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ingredient = Ingredient('', '');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (val) {
                if (val?.isNotEmpty == true) {
                  setState(() => ingredient.name = val.toString());
                } else {
                  setState(() => ingredient.name = '');
                }
              }),
          TextFormField(
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              onSaved: (val) {
                if (val?.isNotEmpty == true) {
                  setState(() => ingredient.description = val.toString());
                } else {
                  setState(() => ingredient.description = '');
                }
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ingredient.save();
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
