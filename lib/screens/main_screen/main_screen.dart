import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test1011/screens/forgot_password/forgot_password_screen.dart';
import 'package:test1011/screens/main_screen/main_screen_vm.dart';
import 'package:test1011/screens/widgets/custom_textfield_widget.dart';
import 'package:test1011/themes/app_colors.dart';
import 'package:test1011/themes/text_styles.dart';
import 'package:test1011/ui/app_images.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenViewModel viewModel = MainScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: SafeArea(
        child: ChangeNotifierProvider<MainScreenViewModel>(
          create: (_) => viewModel..init(),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    SvgPicture.asset(
                      AppImages.logo,
                      height: 136,
                      width: 115,
                    ),
                    const SizedBox(
                      height: 44,
                    ),
                    Text(
                      viewModel.signInText,
                      style: TextStyles.titleFont,
                    ),
                    const SizedBox(
                      height: 41,
                    ),
                    viewModel.selector<MainScreenViewModel, bool?>(
                      selector: () => viewModel.isLoginCorrect,
                      builder: (ctx, _) {
                        return CustomTextField(
                          label: viewModel.loginText,
                          controller: viewModel.loginController,
                          onChanged: viewModel.changeLogin,
                          obscureText: false,
                          icon: viewModel.isLoginCorrect
                              ? const Icon(
                                  Icons.check,
                                  color: AppColors.mainBlue,
                                )
                              : null,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    viewModel.selector<MainScreenViewModel, bool?>(
                      selector: () => viewModel.hidePassword,
                      builder: (ctx, _) {
                        return viewModel.selector<MainScreenViewModel, bool?>(
                          selector: () => viewModel.isEyeIconActive,
                          builder: (ctx, _) {
                            return CustomTextField(
                              label: viewModel.passwordText,
                              controller: viewModel.passwordController,
                              onChanged: viewModel.changePassword,
                              obscureText: viewModel.hidePassword,
                              icon: viewModel.isEyeIconActive
                                  ? IconButton(
                                      onPressed: viewModel.onEyeTap,
                                      icon: viewModel.hidePassword
                                          ? const Icon(
                                              Icons.visibility_off,
                                              color: AppColors.mainBlack,
                                            )
                                          : const Icon(
                                              Icons.visibility,
                                              color: AppColors.mainBlack,
                                            ),
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: AppColors.hide,
                                    ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: viewModel.selector<MainScreenViewModel, bool?>(
                          selector: () => viewModel.canProceed,
                          builder: (ctx, _) {
                            return ElevatedButton(
                              onPressed: viewModel.canProceed
                                  ? () => viewModel.tryLogin(context)
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainBlue,
                                disabledBackgroundColor:
                                    AppColors.mainBlue.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                viewModel.buttonTitle,
                                style: TextStyles.buttonLabelStyle,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    InkWell(
                      child: Text(
                        viewModel.forgotPasswordText,
                        style: TextStyles.labelStyle.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
