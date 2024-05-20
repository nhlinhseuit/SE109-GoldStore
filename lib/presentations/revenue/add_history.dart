import 'package:flutter/material.dart';
import 'package:se109_goldstore/presentations/common/components/custom_text_form_field.dart';

class AddHistory extends StatefulWidget {
  const AddHistory({super.key});

  @override
  State<AddHistory> createState() => _AddHistoryState();
}

class _AddHistoryState extends State<AddHistory> {
  final formKey = GlobalKey<FormState>();

  final firstNameTC = TextEditingController();
  final lastNameTC = TextEditingController();
  final emailTC = TextEditingController();
  final organizationTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'Họ',
                    prefix: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.home),
                    ),
                    fillColor: Colors.white,
                    radius: 12,
                    controller: lastNameTC,
                    margin: const EdgeInsets.only(top: 16),
                    textInputAction: TextInputAction.next,
                    // validator: (value) {
                    //   if (value == null || value?.isEmpty == true) {
                    //     return 'Vui lòng nhập Họ';
                    //   }
                    //   return null;
                    // },
                  ),
                  CustomTextFormField(
                    hintText: 'Tên',
                    prefix: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.home),
                    ),
                    fillColor: Colors.white,
                    radius: 12,
                    controller: firstNameTC,
                    margin: const EdgeInsets.only(top: 16),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty == true) {
                        return 'Vui lòng nhập Tên';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    prefix: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.home),
                    ),
                    hintText: 'Tên cơ quan',
                    fillColor: Colors.white,
                    radius: 12,
                    controller: organizationTC,
                    margin: const EdgeInsets.only(top: 16),
                    textInputAction: TextInputAction.next,
                  ),
                  CustomTextFormField(
                    prefix: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.home),
                    ),
                    hintText: 'Địa chỉ email',
                    fillColor: Colors.white,
                    radius: 12,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailTC,
                    margin: const EdgeInsets.only(top: 16),
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
