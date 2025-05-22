import 'package:delayed_display/delayed_display.dart';
import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/apis_commons.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/CustomTextFields.dart';
import 'package:dmax_app/commons/common_widgets/animated_container.dart';
import 'package:dmax_app/commons/common_widgets/custom_button.dart';
import 'package:dmax_app/commons/common_widgets/show_toast.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/features/splash/controller/share_pref_controller.dart';
import 'package:dmax_app/routes/route_manager.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInfoScreen extends ConsumerStatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  ConsumerState<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends ConsumerState<PersonalInfoScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  int selectedAge = 28;
  int selectedTargetGroup = 1;
  int selectedSomethingElse = 0;
  final List<String> genderList = ['Homme', 'Femme', 'Autre'];
  int genderIndex = -1;
  final List<String> socialList = [
    'Instagram',
    'Snapchat',
    'Whatsapp',
    'Tinder',
    'Bumble',
    'TikTok'
  ];
  int socialIndex = -1;

  final List<String> intrestList = [
    "Musique",
    "Sport",
    "Cinéma & séries",
    "Voyages",
    "Jeux vidéo",
    "Mode & Lifestyle",
    "Lecture & écriture",
    "Art",
    "Technologie",
    "Mèmes & humour"
  ];

  final List<String> tensList = [
    "Attirer & captiver.\n(Flirt & Séduction)",
    "Créer du lien & gérer son cercle.\n(Amitié & Social)",
    "Déclencher des réactions & tester\nles limites. (Humour & Fun)"
  ];

  final List<String> tensIcons = [
    AppAssets.Fire,
    AppAssets.shake,
    AppAssets.joy
  ];
  final List<String> signatureIcons = [AppAssets.sad, AppAssets.love];

  int selectedTensIndex = -1;

  final List<String> signatureList = [
    "Provocation. (Tu chauffes, tu\njoues, tu fais vriller.)",
    "Love game. (You're smooth, well-\ncalibrated, always effective.)",
  ];

  int signatureIndex = -1;

  final List<String> intrestIcons = [
    AppAssets.musicSvg,
    AppAssets.sportSvg,
    AppAssets.cinemaSvg,
    AppAssets.travelSvg,
    AppAssets.gameSvg,
    AppAssets.emojiSvg,
    AppAssets.readingSvg,
    AppAssets.artSvg,
    AppAssets.technologySvg,
    AppAssets.regularSvg
  ];

  Set<String> selectedInterests = {};

  final List<String> socialIcons = [
    AppAssets.instagramSvg,
    AppAssets.snapchatSvg,
    AppAssets.whatsappSvg,
    AppAssets.tinderSvg,
    AppAssets.bumbleSvg,
    AppAssets.tiktokSvg,
  ];

  final List<int> ages = List.generate(35, (index) => index + 1);
  final List<String> targetAgeGroups = ['18–22', '23–27', '28–35'];
  final List<String> optionsForPage3 = ['Option A', 'Option B', 'Option C'];

  double _dragValue = 3;
  final List<double> barHeights = [200, 160, 120, 80, 120, 160, 200];
  late double trackWidth;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    trackWidth = screenWidth * 0.8;
    final stepWidth = (trackWidth - 40) / (barHeights.length - 1);
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5EC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.padding),
          child: Column(
            children: [
              const SizedBox(height: 10),
              currentPage == 3 ? Container() : _buildProgressBar(),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() => currentPage = index);
                  },
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return _buildGenderSelectionPage();
                      case 1:
                        return _buildTargetAgePage();
                      case 2:
                        return _buildAboutPage();
                      case 3:
                        return _buildPage4();
                      case 4:
                        return _buildSocialPage();
                      case 5:
                        return _buildIntrestPage();
                      case 6:
                        return _buildTensPage();
                      case 7:
                        return _buildSignaturePage();
                      case 8:
                        return _buildPage9(
                          barHeights,
                          trackWidth,
                          stepWidth,
                        );
                      case 9:
                        return _buildPage10(
                          barHeights,
                          trackWidth,
                          stepWidth,
                        );
                      default:
                        return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              _buildNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  // PAGE 1
  Widget _buildGenderSelectionPage() {
    return _buildPageContent(
      title: "Comment\nt’identifies-tu ?",
      subtitle:
          "Les réponses sont confidentielles et permettront de personnaliser au mieux les DM",
      child: BlurAnimatedList(
          texts: genderList,
          selectIndex: genderIndex,
          onChange: (val) {
            setState(() {
              genderIndex = val;
            });
          }),
    );
  }

  // PAGE 2
  Widget _buildTargetAgePage() {
    return _buildPageContent(
      title: "Sélection de l’âge et\nde l’âge cible",
      subtitle:
          "Les réponses sont confidentielles et permettront de personnaliser au mieux les DM",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quel est ton âge?',
            style: getMediumStyle(
              color: context.secondary,
              fontSize: MyFonts.size18,
            ),
          ),
          padding8,
          Container(
            height: 128.h,
            color: context.secondary.withOpacity(0.02),
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                  initialItem: ages.indexOf(selectedAge)),
              itemExtent: 42.h,
              onSelectedItemChanged: (index) {
                setState(() => selectedAge = ages[index]);
              },
              children: ages
                  .map((age) => Column(
                        children: [
                          selectedAge == age
                              ? Container(
                                  height: 1.h,
                                  width: 50.w,
                                  color: context.secondary,
                                )
                              : Container(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(age.toString(),
                                style: selectedAge == age
                                    ? getSemiBoldStyle(
                                        color: context.secondary,
                                        fontSize: MyFonts.size22)
                                    : getMediumStyle(color: context.secondary)),
                          ),
                          selectedAge == age
                              ? Container(
                                  height: 1.h,
                                  width: 50.w,
                                  color: context.secondary,
                                )
                              : Container(),
                        ],
                      ))
                  .toList(),
            ),
          ),
          padding32,
          Text(
            'Quel âge ont les personnes à qui tu envoies des messages ?',
            style: getMediumStyle(
              color: context.secondary,
              fontSize: MyFonts.size18,
            ),
          ),
          padding8,
          Container(
            height: 128.h,
            color: context.secondary.withOpacity(0.02),
            child: CupertinoPicker(
              scrollController:
                  FixedExtentScrollController(initialItem: selectedTargetGroup),
              itemExtent: 42,
              onSelectedItemChanged: (index) {
                setState(() => selectedTargetGroup = index);
              },
              children: targetAgeGroups
                  .map((group) => Column(
                        children: [
                          selectedTargetGroup == targetAgeGroups.indexOf(group)
                              ? Container(
                                  height: 1.h,
                                  width: 50.w,
                                  color: context.secondary,
                                )
                              : Container(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(group.toString(),
                                style: targetAgeGroups.contains(group)
                                    ? getSemiBoldStyle(
                                        color: context.secondary,
                                        fontSize: MyFonts.size22)
                                    : getMediumStyle(color: context.secondary)),
                          ),
                          selectedTargetGroup == targetAgeGroups.indexOf(group)
                              ? Container(
                                  height: 1.h,
                                  width: 50.w,
                                  color: context.secondary,
                                )
                              : Container(),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

// Page 3
  Widget _buildAboutPage() {
    return _buildPageContent(
        title: "Quel surnom veux-tu utiliser ?",
        subtitle:
            "Les réponses sont confidentielles et permettront de personnaliser au mieux les DM",
        child: CustomTextField(
          controller: TextEditingController(),
          hintText: "Écrire...",
          fillColor: context.lightContainerColor,
          borderColor: context.lightContainerColor,
        ));
  }

// Page 4
  Widget _buildPage4() {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 60,
          child: DelayedDisplay(
            slidingCurve: Curves.easeInExpo,
            fadeIn: true,
            delay: const Duration(seconds: 1),
            child: Image.asset(AppAssets.oneImage, height: 75.h, width: 180.w),
          ),
        ),
        Positioned(
          top: 40,
          left: 120,
          child: DelayedDisplay(
            slidingCurve: Curves.bounceInOut,
            fadeIn: true,
            delay: const Duration(seconds: 2),
            child: Image.asset(AppAssets.twoImage, height: 100.h, width: 180.w),
          ),
        ),
        Positioned(
          top: 91,
          left: 10,
          child: DelayedDisplay(
            slidingCurve: Curves.decelerate,
            fadeIn: true,
            delay: const Duration(seconds: 3),
            child:
                Image.asset(AppAssets.threeImage, height: 100.h, width: 180.w),
          ),
        ),
        Positioned(
          top: 130,
          left: 135,
          child: DelayedDisplay(
            slidingCurve: Curves.easeInBack,
            fadeIn: true,
            delay: const Duration(seconds: 4),
            child:
                Image.asset(AppAssets.fourImage, height: 100.h, width: 180.w),
          ),
        ),
        Positioned(
            top: 220,
            right: 0,
            left: 0,
            child: DelayedDisplay(
              slidingCurve: Curves.easeInExpo,
              fadeIn: true,
              delay: const Duration(seconds: 5),
              child: SizedBox(
                width: 1.sw,
                child: Text(
                  'mehdi, prêt à \ndevenir imbattable \nen DM ? 😈',
                  textAlign: TextAlign.center,
                  style: getSemiBoldStyle(
                      color: context.secondary, fontSize: MyFonts.size34),
                ),
              ),
            )),
        Positioned(
          top: 340,
          left: 0,
          child: DelayedDisplay(
            slidingCurve: Curves.easeInBack,
            fadeIn: true,
            delay: const Duration(seconds: 6),
            child: Image.asset(AppAssets.fiveImage, height: 60.h, width: 180.w),
          ),
        ),
        Positioned(
          top: 372,
          right: 15,
          child: DelayedDisplay(
            slidingCurve: Curves.easeInBack,
            fadeIn: true,
            delay: const Duration(seconds: 7),
            child: Image.asset(AppAssets.sixImage, height: 53.h, width: 180.w),
          ),
        ),
        Positioned(
          top: 425,
          left: 10,
          child: DelayedDisplay(
            slidingCurve: Curves.easeInBack,
            fadeIn: true,
            delay: const Duration(seconds: 8),
            child:
                Image.asset(AppAssets.sevenImage, height: 70.h, width: 180.w),
          ),
        ),
        Positioned(
          top: 550,
          left: 70,
          child: DelayedDisplay(
            slidingCurve: Curves.easeInBack,
            fadeIn: true,
            delay: const Duration(seconds: 9),
            child:
                Image.asset(AppAssets.eightImage, height: 55.h, width: 180.w),
          ),
        ),
      ],
    );
  }

// Page 5
  Widget _buildSocialPage() {
    return _buildPageContent(
      title: "Sur quelles applis discutes-tu le plus ?",
      subtitle:
          "Les réponses sont confidentielles et permettront de personnaliser au mieux les DM",
      child: BlurAnimatedList(
        texts: socialList,
        onChange: (val) {
          setState(() {
            socialIndex = val;
          });
        },
        selectIndex: socialIndex,
        icons: socialIcons,
      ),
    );
  }

  // Page 6
  Widget _buildIntrestPage() {
    return _buildPageContent(
      title: "Quels sont tes centres d’intérêt ?",
      subtitle:
          "Les réponses sont confidentielles et permettront de personnaliser au mieux les DM",
      child: BlurAnimatedMap(
        selected: selectedInterests,
        texts: intrestList,
        onChange: (selectedIndex) {
          setState(() {
            if (selectedInterests.contains(intrestList[selectedIndex])) {
              selectedInterests.remove(intrestList[selectedIndex]);
            } else {
              selectedInterests.add(intrestList[selectedIndex]);
            }
          });
        },
        icons: intrestIcons,
      ),
    );
  }

  // Page 7
  Widget _buildTensPage() {
    return _buildPageContent(
        title: "Comment tu fais monter la tension en DM?",
        subtitle:
            "Les réponses sont confidentielles et permettront de personnaliser au mieux les DM",
        child: BlurAnimatedList(
          selectIndex: selectedTensIndex,
          isPng: true,
          texts: tensList,
          onChange: (selectedIndex) {
            setState(() {
              selectedTensIndex = selectedIndex;
            });
          },
          icons: tensIcons,
        ));
  }

  // Page 8
  Widget _buildSignaturePage() {
    return _buildPageContent(
        title: "C’est quoi ta signature ?",
        subtitle:
            "Les réponses sont confidentielles et permettront de personnaliser au mieux les DM",
        child: BlurAnimatedList(
          selectIndex: signatureIndex,
          isPng: true,
          texts: signatureList,
          onChange: (selectedIndex) {
            setState(() {
              signatureIndex = selectedIndex;
            });
          },
          icons: signatureIcons,
        ));
  }

  // Page 9
  Widget _buildPage9(
    final List<double> barHeights,
    final double trackWidth,
    final double stepWidth,
  ) {
    return _buildPageContent(
      title: "Tu joues la carte du mystère ou tu préfères faire rire ?",
      subtitle:
          "Les réponses sont confidentielles et permettront de personnaliser au mieux les DM",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Bar Chart
          SizedBox(
            height: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(barHeights.length, (index) {
                final isSelected = index == _dragValue.round();
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 19.w),
                  width: 10.h,
                  height: barHeights[index],
                  decoration: BoxDecoration(
                    color:
                        isSelected ? context.primary : const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            ),
          ),
          padding26,
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              final localDx =
                  details.localPosition.dx.clamp(0.0, trackWidth - 40);
              final index =
                  (localDx / stepWidth).round().clamp(0, barHeights.length - 1);
              setState(() {
                _dragValue = index.toDouble();
              });
            },
            child: SizedBox(
              height: 36.h,
              width: trackWidth,
              child: Stack(
                children: [
                  Positioned(
                    top: 5,
                    child: Container(
                      width: trackWidth,
                      height: 26.h,
                      decoration: BoxDecoration(
                        color: context.lightContainerColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                    left: stepWidth * _dragValue,
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundColor: context.primary,
                      child:
                          const Icon(Icons.code, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          padding32,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Mystérieux(se)',
                      style: TextStyle(
                        fontSize: MyFonts.size16,
                        fontFamily: AppConstants.fontFamily,
                      )),
                  padding3,
                  Image.asset(AppAssets.serious, height: 20.h, width: 20.w),
                ],
              ),
              Row(
                children: [
                  Text('Drôle',
                      style: TextStyle(
                        fontSize: MyFonts.size16,
                        fontFamily: AppConstants.fontFamily,
                      )),
                  padding3,
                  Image.asset(AppAssets.joy, height: 20.h, width: 20.w),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Page 10
  Widget _buildPage10(
    final List<double> barHeights,
    final double trackWidth,
    final double stepWidth,
  ) {
    return _buildPageContent(
      title:
          "T’es plutôt discret·e ou t’aimes mettre un peu de piment dans les DM ?",
      subtitle:
          "Les réponses sont confidentielles et permettront de personnaliser au mieux les DM",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Bar Chart
          SizedBox(
            height: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(barHeights.length, (index) {
                final isSelected = index == _dragValue.round();
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 19.w),
                  width: 10.h,
                  height: barHeights[index],
                  decoration: BoxDecoration(
                    color:
                        isSelected ? context.primary : const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            ),
          ),
          padding26,
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              final localDx =
                  details.localPosition.dx.clamp(0.0, trackWidth - 40);
              final index =
                  (localDx / stepWidth).round().clamp(0, barHeights.length - 1);
              setState(() {
                _dragValue = index.toDouble();
              });
            },
            child: SizedBox(
              height: 36.h,
              width: trackWidth,
              child: Stack(
                children: [
                  Positioned(
                    top: 5,
                    child: Container(
                      width: trackWidth,
                      height: 26.h,
                      decoration: BoxDecoration(
                        color: context.lightContainerColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Positioned(
                    left: stepWidth * _dragValue,
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundColor: context.primary,
                      child:
                          const Icon(Icons.code, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          padding32,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Introverti(e)',
                      style: TextStyle(
                        fontSize: MyFonts.size16,
                        fontFamily: AppConstants.fontFamily,
                      )),
                  padding3,
                  Image.asset(AppAssets.shamee, height: 20.h, width: 20.w),
                ],
              ),
              Row(
                children: [
                  Text('Joueur(se)',
                      style: TextStyle(
                        fontSize: MyFonts.size16,
                        fontFamily: AppConstants.fontFamily,
                      )),
                  padding3,
                  Image.asset(AppAssets.Fire, height: 20.h, width: 20.w),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent({
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        padding16,
        Text(title,
            style: getSemiBoldStyle(
                color: context.secondary, fontSize: MyFonts.size38)),
        padding8,
        Text(subtitle,
            style: getRegularStyle(
                color: MyColors.secondaryColor.withOpacity(0.7),
                fontSize: MyFonts.size16)),
        currentPage == 0 || currentPage == 1 || currentPage == 2
            ? padding56
            : padding24,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(child: child),
          ),
        ),
      ],
    );
  }

  Widget _buildNextButton() {
    return CustomButton(
      onPressed: () async {
        if (currentPage < 9) {
          if (currentPage == 0 && genderIndex == -1) {
            showToast(msg: "Sélectionnez votre sexe");
          } else if (currentPage == 4 && socialIndex == -1) {
            showToast(msg: "Sélectionnez votre sexe");
          } else if (currentPage == 5 && selectedInterests.isEmpty) {
            showToast(msg: "Sélectionnez votre sexe");
          } else if (currentPage == 6 && selectedTensIndex == -1) {
            showToast(msg: "Sélectionnez votre sexe");
          } else if (currentPage == 7 && signatureIndex == -1) {
            showToast(msg: "Sélectionnez votre sexe");
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            setState(() {
              currentPage++;
            });
          }
        } else {
          final info = [
            genderList[genderIndex],
            selectedAge.toString(),
            targetAgeGroups[selectedTargetGroup],
            selectedSomethingElse.toString(),
            socialList[socialIndex],
            selectedInterests.toString(),
            tensList[selectedTensIndex],
            signatureList[signatureIndex],
          ];
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.dangerScreen, (route) => false);
          await ref.watch(sharePrefProvider).setProfileInfo(info: info);
        }
      },
      buttonText: "Suivant",
      backColor: currentPage == 0 && genderIndex == -1 ||
              currentPage == 4 && socialIndex == -1 ||
              currentPage == 5 && selectedInterests.isEmpty ||
              currentPage == 6 && selectedTensIndex == -1 ||
              currentPage == 7 && signatureIndex == -1
          ? Colors.grey.shade300
          : context.secondary,
      buttonHeight: 58.h,
      buttonWidth: 361.w,
      borderRadius: 12.r,
      isShadow: true,
    );
  }

  Widget _buildProgressBar() {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.playbackSvg, width: 6, height: 11),
        padding8,
        Expanded(
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(4.r),
            value: (currentPage + 1) / 10,
            backgroundColor: Colors.grey[300],
            color: Colors.deepOrangeAccent,
            minHeight: 4,
          ),
        ),
      ],
    );
  }
}
