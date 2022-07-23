import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../providers/auth_provider.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light ? Theme.of(context).colorScheme.surface : Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(child: Consumer(builder: (context, ref, _) {
          final auth = ref.watch(authenticationProvider);
          return Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    constraints: const BoxConstraints(minWidth: 100, maxWidth: 800),
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 16.0),
                          child: const Text('Sign in', textAlign: TextAlign.start, style: TextStyle(fontSize: 32)),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(color: const Color(0xffebebeb), borderRadius: BorderRadius.circular(8)),
                          child: TextFormField(
                            controller: emailController,
                            autocorrect: true,
                            enableSuggestions: true,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {},
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.black54),
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(color: const Color(0xffebebeb), borderRadius: BorderRadius.circular(8)),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'Password is too short!';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black54),
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 24.0),
                          width: double.infinity,
                          child: MaterialButton(
                            color: const Color(0xff5B027A),
                            onPressed: () => auth.signIn(email: emailController.text, password: passwordController.text),
                            textColor: Colors.white,
                            textTheme: ButtonTextTheme.primary,
                            minWidth: 100,
                            padding: const EdgeInsets.all(24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Text(
                              'Sign in',
                            ),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account?"),
                                TextButton(
                                  onPressed: () {
                                    print('sign up pressed');
                                  },
                                  child: Text('Sign up', style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                                ),
                              ],
                            )),
                        Row(children: <Widget>[
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(right: 20.0),
                                child: Divider(
                                  color: Theme.of(context).colorScheme.onBackground,
                                  height: 36,
                                )),
                          ),
                          const Text(
                            "or",
                            style: TextStyle(fontSize: 16),
                          ),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(left: 20.0),
                                child: Divider(
                                  color: Theme.of(context).colorScheme.onBackground,
                                  height: 36,
                                )),
                          ),
                        ]),
                        Container(
                          padding: const EdgeInsets.only(top: 32.0),
                          width: double.infinity,
                          child: MaterialButton(
                            color: const Color(0xffebebeb),
                            onPressed: () => auth.signInWithGoogle(),
                            textColor: Colors.black,
                            textTheme: ButtonTextTheme.primary,
                            minWidth: 100,
                            padding: const EdgeInsets.all(18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //  A google icon here
                                //  an External Package used here
                                //  Font_awesome_flutter package used
                                // FaIcon(FontAwesomeIcons.google, size: 12),
                                Image.asset(
                                  'assets/icons8-google.png',
                                  height: 24,
                                  width: 24,
                                ),
                                const Text(
                                  ' Continue with Google',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ]))));
        })));
  }
}
