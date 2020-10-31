import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../../../functions/functions.dart';
import '../../../../providers/providers.dart';

import '../../login/login_screen.dart';

class DrawerSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: globalLoading,
      onChange: (context, loading) async {
        if (loading.state) {
          await GlobalFunction.showDialogLoading(context);
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Drawer(
        child: Column(
          children: [
            Flexible(
              child: Consumer(
                builder: (context, watch, _) {
                  final user = watch(userProvider.state);
                  Widget image;
                  if (user.idUser == null) {
                    return SizedBox();
                  }
                  if (user.imageUser == null) {
                    image = ShowImageAsset(
                      imageUrl: appConfig.urlImageAsset + '/' + 'drawer_background.png',
                      imageSize: 10,
                      isCircle: true,
                      fit: BoxFit.cover,
                    );
                  }
                  return UserAccountsDrawerHeader(
                    currentAccountPicture: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ActionModalBottomSheet(
                              typeAction: TypeAction.None,
                              align: WrapAlignment.center,
                              children: [
                                ActionCircleButton(
                                  icon: Icons.camera_alt,
                                  backgroundColor: colorPallete.primaryColor,
                                  foregroundColor: colorPallete.white,
                                  onTap: () async => await RequestFunction.updateProfilImage(
                                    context,
                                    isCameraSource: true,
                                  ),
                                ),
                                ActionCircleButton(
                                  icon: Icons.photo,
                                  backgroundColor: colorPallete.accentColor,
                                  foregroundColor: colorPallete.white,
                                  onTap: () async => await RequestFunction.updateProfilImage(
                                    context,
                                    isCameraSource: false,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: user.imageUser == null
                          ? image
                          : ShowImageNetwork(
                              imageSize: 10,
                              isCircle: true,
                              fit: BoxFit.cover,
                              imageUrl: appConfig.baseImageURL + '/user/' + user.imageUser,
                            ),
                    ),
                    accountName: Text('${user.nameUser}'),
                    accountEmail: Text('${user.emailUser}'),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                        image: AssetImage(
                          appConfig.urlImageAsset + '/' + 'drawer_background.png',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    DrawerMenu(
                      title: 'Keluar',
                      showDivider: true,
                      icon: Icons.logout,
                      onTap: () async {
                        await context.read(userProvider).deleteSessionUser();
                        Navigator.of(context).pushReplacementNamed(LoginScreen.routeNamed);
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
