import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usermanagementapp/bloc/bloc/delete_user_bloc.dart';
import 'package:usermanagementapp/bloc/users_lists/users_lists_bloc.dart';
import 'package:usermanagementapp/models/model.dart';
import 'package:usermanagementapp/repositories/users.dart';
import 'package:usermanagementapp/repositories/users_lists.dart';
import 'package:usermanagementapp/theme.dart';
import 'package:usermanagementapp/views/screens/profile_page.dart';
import 'package:usermanagementapp/views/widgets/create_user_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => UsersListsBloc(
                viewUsersListsRepository:
                    RepositoryProvider.of<ViewUsersListsRepository>(context),
              )..add(ViewUsersListsPressedEvent()),
        ),
        BlocProvider(
          create:
              (context) => DeleteUserBloc(
                userRepository: RepositoryProvider.of<UserRepository>(context),
              ),
        ),
      ],
      child: UsersListsPage(),
    );
  }
}

class UsersListsPage extends StatefulWidget {
  const UsersListsPage({super.key});

  @override
  State<UsersListsPage> createState() => _UsersListsPageState();
}

class _UsersListsPageState extends State<UsersListsPage> {
  bool hasMore = true;
  final controller = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';
  List<UsersList> userss = [];

  @override
  void initState() {
    super.initState();
    controller.addListener(_controller);
  }

  @override
  Widget build(BuildContext context) {
    String selectedAction = "Cancel";

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        title: const Text(
          'Users Lists',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search users by name',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  suffixIcon:
                      _searchController.text.isNotEmpty
                          ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _searchController.clear();
                                searchQuery = '';
                              });
                            },
                            child: const Icon(Icons.clear, color: Colors.grey),
                          )
                          : null,
                ),
              ),
            ),
            const SizedBox(height: 16),
            BlocListener<DeleteUserBloc, DeleteUserState>(
              listener: (context, state) {
                if (state is DeleteUserSuccessState) {
                  setState(() {
                    print(
                      "Before removal: ${userss.map((user) => user.id).toList()}",
                    );
                    userss.removeWhere((user) => user.id == state.id);
                    print(
                      "After removal: ${userss.map((user) => user.id).toList()}",
                    );
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("User deleted successfully"),
                      backgroundColor:
                          Colors.red, // Change background color to red
                    ),
                  );
                } else if (state is DeleteUserErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to delete user")),
                  );
                }
              },
              child: BlocConsumer<UsersListsBloc, UsersListsState>(
                listener: (context, state) {
                  if (state is UsersListsLoadedState) {
                    if (userss.isEmpty) {
                      userss = List.from(state.data);
                    }
                  }
                },
                builder: (context, state) {
                  if (state is UsersListsLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UsersListsLoadedState) {
                    List<UsersList> users = state.data;
                    int pages = state.page;
                    String query = _searchController.text.toLowerCase();
                    List<UsersList> userss = List.from(users);
                    List<UsersList> filteredUsersLists =
                        users.where((userss) {
                          return 'G-${userss.first_name}'
                              .toLowerCase()
                              .contains(query);
                        }).toList();
                    if (userss.isNotEmpty) {
                      return Expanded(
                        child: ListView.builder(
                          controller: controller,
                          itemCount:
                              pages == 1
                                  ? filteredUsersLists.length + 1
                                  : filteredUsersLists.length,
                          itemBuilder: (_, index) {
                            if (index < filteredUsersLists.length) {
                              var userss = filteredUsersLists[index];

                              return Card(
                                color: Colors.grey.shade200,
                                elevation: 2,
                                margin: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                        ) {
                                          return ProfilePage(usersList: userss);
                                        },
                                        transitionsBuilder: (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                          child,
                                        ) {
                                          const begin = Offset(1.0, 0.0);
                                          const end = Offset.zero;
                                          const curve = Curves.easeInOut;
                                          var tween = Tween(
                                            begin: begin,
                                            end: end,
                                          ).chain(CurveTween(curve: curve));
                                          var offsetAnimation = animation.drive(
                                            tween,
                                          );
                                          return SlideTransition(
                                            position: offsetAnimation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 35,
                                          backgroundImage: NetworkImage(
                                            userss.avatar,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${userss.first_name} ${userss.last_name}',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                userss.email,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.blue,
                                              ),
                                              onPressed: () async {
                                                final Map<String, String>?
                                                updatedUser =
                                                    await updateDialog(
                                                      context,
                                                      userss,
                                                    );

                                                if (updatedUser != null) {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        "User updated successfully!",
                                                      ),
                                                      backgroundColor:
                                                          Colors.green,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                              onPressed: () async {
                                                final result =
                                                    await deleteConfirmDialog(
                                                      context,
                                                    );
                                                setState(() {
                                                  selectedAction = result!;
                                                });

                                                selectedAction == "OK"
                                                    ? context
                                                        .read<DeleteUserBloc>()
                                                        .add(
                                                          DeleteUserPressedEvent(
                                                            id: userss.id,
                                                          ),
                                                        )
                                                    : null;
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 32),
                              child: Center(
                                child:
                                    hasMore
                                        ? const CircularProgressIndicator()
                                        : const Text('No more data to load'),
                              ),
                            );
                          },
                        ),
                      );
                    } else if (users.isEmpty) {
                      return const Center(
                        child: Text(
                          'No data available',
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }
                  } else if (state is UsersListsLoadingErrorState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: CreateUserButton(scrollController: controller),
    );
  }

  void _controller() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      context.read<UsersListsBloc>().add(LoadMoreUsersListsPressedEvent());
    }
  }

  Future<String?> deleteConfirmDialog(BuildContext context) async {
    return await showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder:
          (BuildContext context) => AlertDialog(
            title: const Text('Delete user?'),
            content: const Text('Are you sure you want to delete this user?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Cancel');
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                },
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  Future<Map<String, String>?> updateDialog(
    BuildContext context,
    UsersList userss,
  ) async {
    TextEditingController firstNameController = TextEditingController(
      text: userss.first_name,
    );
    TextEditingController lastNameController = TextEditingController(
      text: userss.last_name,
    );
    TextEditingController emailController = TextEditingController(
      text: userss.email,
    );
    return await showDialog<Map<String, String>>(
      barrierDismissible: false,
      context: context,
      builder:
          (BuildContext context) => AlertDialog(
            title: const Text('Update User'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(labelText: "First Name"),
                ),
                TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(labelText: "Last Name"),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
              ],
            ),

            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("User updated successfully"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text("Update"),
              ),
            ],
          ),
    );
  }
}
