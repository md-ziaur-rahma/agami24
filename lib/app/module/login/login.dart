import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agami24/app/core/utils/keys.dart';
import 'package:agami24/app/core/values/colors.dart';
import 'package:agami24/app/module/login/login_controller.dart';
import 'package:agami24/app/routes/routes.dart';
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller){
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.mainColor
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Image(
                          image: AssetImage("assets/images/logo.webp"),
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text("Login",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w600,fontSize: 24),),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Sign in to Continue",
                          style: TextStyle(color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.normal,fontSize: 14),),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  sliver: SliverToBoxAdapter(
                    child: Form(
                      key: AppKeys.loginKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: controller.userController,
                            validator: controller.validationUser,
                            textInputAction: TextInputAction.next,
                            onChanged: (value){
                              controller.user = value;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person_outline),
                              hintText: "Mobile/Email",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: controller.passwordController,
                            validator: controller.validationPassword,
                            textInputAction: TextInputAction.done,
                            onChanged: (value){
                              controller.password = value;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.vpn_key_rounded),
                              hintText: "Password",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 30,),
                            decoration: const ShapeDecoration(
                              shape: StadiumBorder(),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(shape: const StadiumBorder(),primary: AppColors.mainColor),
                              onPressed: (){
                                if (AppKeys.loginKey.currentState!.validate()) {
                                  AppKeys.loginKey.currentState!.save();
                                  Get.offAllNamed(Routes.HOME);
                                  // controller.login();
                                }
                              },
                              child: controller.isLoading.value ? const CircularProgressIndicator() : const Text("LOGIN",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: (){
                              // Get.toNamed(Routes.FORGOT_PASS);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text("Forgot Password",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500),),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              // Get.toNamed(Routes.SIGNUP);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text("Don't you have any account? Signup",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500),),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
