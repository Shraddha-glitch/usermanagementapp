import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:usermanagementapp/bloc/create_user/create_user_bloc.dart';
import 'package:usermanagementapp/repositories/users.dart';
import 'package:usermanagementapp/theme.dart';

class CreateUserFormPagee extends StatefulWidget {
  const CreateUserFormPagee({super.key});

  @override
  State<CreateUserFormPagee> createState() => _CreateUserFormPageeState();
}

class _CreateUserFormPageeState extends State<CreateUserFormPagee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create new user',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (context) => CreateUserBloc(
                    userRepository: RepositoryProvider.of<UserRepository>(
                      context,
                    ),
                  ),
            ),
          ],
          child: CreateUserFormPage(),
        ),
      ),
    );
  }
}

class CreateUserFormPage extends StatefulWidget {
  const CreateUserFormPage({super.key});

  @override
  State<CreateUserFormPage> createState() => _CreateUserFormPageState();
}

class _CreateUserFormPageState extends State<CreateUserFormPage> {
  File? file;
  String? fileType;
  String photoUrl = "https://via.placeholder.com/150";

  Future getImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        file = File(pickedFile.path);
      });
    }
  }

  FormGroup buildForm() => fb.group({
    'name': FormControl<String>(value: '', validators: [Validators.required]),
    'job': FormControl<String>(value: '', validators: [Validators.required]),
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: buildForm,
      builder: (context, form, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: getImage,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                    image:
                        file != null
                            ? DecorationImage(
                              image: FileImage(file!),
                              fit: BoxFit.cover,
                            )
                            : null,
                    color: Colors.grey[200],
                  ),
                  child:
                      file == null
                          ? const Center(
                            child: Icon(
                              Icons.add,
                              size: 40,
                              color: Colors.black,
                            ),
                          )
                          : null,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: ReactiveTextField<String>(
                      formControlName: 'name',

                      decoration: InputDecoration(
                        hintText: 'Enter full name',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // --------- Job ---------
              ReactiveTextField<String>(
                formControlName: 'job',

                decoration: InputDecoration(
                  hintText: 'Enter your Job',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  filled: true,
                  fillColor: Colors.grey[100],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // --------- Submit Button ---------
              SizedBox(
                child: BlocConsumer<CreateUserBloc, CreateUserState>(
                  listener: (context, state) {
                    if (state is CreateUserSuccessState) {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text(
                                'Success !!',
                                style: TextStyle(color: Colors.black),
                              ),
                              content: Text(
                                'New user created Successfully',
                                style: const TextStyle(color: Colors.black),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pushNamedAndRemoveUntil(
                                      '/',
                                      (route) => false,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'Okay!',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      );
                    } else if (state is CreateUserErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Error: User was not added"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    final Widget wid =
                        (state == CreateUserLoadingState())
                            ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: kPrimaryColor,
                              ),
                            )
                            : const Text('Create');
                    final color =
                        (state == CreateUserLoadingState())
                            ? Colors.grey
                            : Colors.blue;
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        minimumSize: const Size.fromHeight(45),
                      ),
                      onPressed:
                          state == CreateUserLoadingState()
                              ? null
                              : () {
                                if (form.valid) {
                                  final name = form.control('name').value;
                                  final job = form.control('job').value;
                                  if (name != null && job != null) {
                                    context.read<CreateUserBloc>().add(
                                      CreateUserPressedEvent(
                                        name: form.control('name').value,
                                        job: form.control('job').value,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Enter All fields'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              },
                      child: wid,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
