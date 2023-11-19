import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data_provider/login_data_provider.dart';

class {{screen_name.pascalCase()}}Screen extends StatefulWidget {
  const {{screen_name.pascalCase()}}Screen({Key? key}) : super(key: key);

  @override
  State<{{screen_name.pascalCase()}}Screen> createState() => _{{screen_name.pascalCase()}}ScreenState();
}

class _{{screen_name.pascalCase()}}ScreenState extends State<{{screen_name.pascalCase()}}Screen> {
  late LoginDataProvider dataProvider;

  @override
  void initState() {
    super.initState();
    dataProvider = Provider.of<{{data_provider_name.pascalCase()}}>(
      context,
      listen: false,
    );
    dataProvider.initState();
    _observeAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: secondaryAppColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Consumer<{{data_provider_name.pascalCase()}}>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //TODO add image here,
                      Text(
                        'Authenticate',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        'Tork Tunisie',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          child: Text(
                            'Enter below your credentials',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: AppTextField(
                          controller: provider.usernameController,
                          label: 'Email',
                          error: 'Verify your email adress',
                          displayError: provider.state.emailError,
                          onEdit: provider.updateEmail,
                        ),
                      ),
                      AppTextField.password(
                        controller: provider.passwordController,
                        label: 'Password',
                        error: 'Verify your password',
                        displayError: provider.state.passwordError,
                        onEdit: provider.updatePassword,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: AppButton(
                          buttonText: 'Authenticate',
                          onPress: provider.onSubmitPressed,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: InkWell(
                          onTap: () {/* TODO navigate to reset password */},
                          child: Text(
                            'Password forgotten',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'App version 1.0.0',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: textSecondaryColor,
                        ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  _observeAuthentication() {
    dataProvider.state.apiStream.stream.listen(
      (result) {},
    );
  }

  @override
  void dispose() {
    dataProvider.state.apiStream.close();
    super.dispose();
  }
}
