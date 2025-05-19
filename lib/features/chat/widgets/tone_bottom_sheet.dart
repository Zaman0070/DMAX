import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/bottom_indicator.dart';
import 'package:dmax_app/commons/common_widgets/custom_button.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/model/tone_option.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:info_popup/info_popup.dart';

class ToneBottomSheet extends StatefulWidget {
  const ToneBottomSheet({super.key, required this.onSelectTone});
  final Function(ToneOption) onSelectTone;

  @override
  State<ToneBottomSheet> createState() => _ToneBottomSheetState();
}

class _ToneBottomSheetState extends State<ToneBottomSheet> {
  List<String> toneTitleList = [
    "Provocant",
    "Désinvolte",
    "Drôle",
    "Spicy",
    "Taquin",
    "Intelligent",
    "Chill",
    "WTF / Détourné / Absurde",
    "Classe",
    "Sincère"
  ];

  List<String> toneEmoji = [
    AppAssets.Smiling,
    AppAssets.HeartOnFire,
    AppAssets.Laughing,
    AppAssets.HotPepper,
    AppAssets.SmirkingFace,
    AppAssets.Brain,
    AppAssets.RelievedFace,
    AppAssets.Orangutan,
    AppAssets.Crown,
    AppAssets.WhiteHeart
  ];

  List<String> toneDefinition = [
    "Confiant, un brin insolent. Ce ton joue sur la provocation légère, sans jamais être agressif. Il titille, il pousse l’autre à réagir, comme un défi amusé.",
    "Détaché, cool, presque indifférent… mais avec une touche de charme naturel. C’est le ton de quelqu’un qui n’a rien à prouver, qui reste toujours au-dessus de la mêlée.",
    "Répliques qui font sourire ou rire. Ce ton joue sur l’humour bien placé, jamais lourd, avec une bonne dose d’autodérision ou de punchlines bien senties.",
    "Flirt assumé, sous-entendus maîtrisés. L’idée est de créer une tension légère, piquante mais élégante, sans jamais tomber dans le lourd.",
    "Jeu subtil, petites piques affectueuses. Ce ton repose sur l’humour complice et les mini-défis qui créent de l’attirance sans pression.",
    "Réponses fines, cultivées, avec une touche de profondeur. C’est séduisant sans être prétentieux, ça élève la conversation avec style.",
    "Posé, sans pression. C’est le ton de la personne avec qui on se sent bien, qui ne force rien, et qui laisse la conversation respirer.",
    "Inattendu, original, parfois carrément absurde. Ce ton crée la surprise, fait sourire, et montre une personnalité créative, un peu décalée.",
    "Charme discret, langage fluide et raffiné. Rien de trop, juste ce qu’il faut pour laisser une impression marquante et élégante.",
    "Authentique, vrai, sans artifices. Ce ton va droit au but avec émotion, en étant touchant sans être gênant ou trop intense.",
  ];

  List<String> toneExample = [
    "Tu devrais pas me répondre aussi vite… tu vas finir accro.",
    "Je te laisse croire que t’as l’avantage, c’est mignon.",
    "Je suis à deux messages de te facturer mon charme.",
    "Fais pas genre, il est 00h00 si tu dors pas c'est que t'aime bien la conv.",
    "T'as toujours cette répartie… ou c'était un coup de chance ?",
    "Ce que tu dis est intéressant. Mais j’suis sûr qu’on peut aller plus loin que ça.",
    "Y a pas de pression. Juste deux personnes qui parlent, c’est déjà bien.",
    "Si tu me réponds pas dans 5 min, je mange une pizza sans toi. Voilà.",
    "Tu sais quoi dire, mais c’est la façon dont tu le dis qui me plaît.",
    "J’vais pas faire genre. J’te trouve vraiment cool, et j’avais envie de te le dire.",
  ];

  int selectedTone = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: BottomIndicator()),
          padding12,
          Text(
            "Sélectionnez la tonalité",
            style: TextStyle(
                fontSize: MyFonts.size16,
                fontWeight: FontWeight.w600,
                color: context.secondary,
                fontFamily: AppConstants.fontFamily),
          ),
          padding12,
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: toneTitleList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 130.h),
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    // ignore: deprecated_member_use
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: () {
                      setState(() {
                        selectedTone = index;
                      });
                      widget.onSelectTone(
                        ToneOption(
                          label: toneTitleList[index],
                          definition: toneDefinition[index],
                          example: toneExample[index],
                          emoji: toneEmoji[index],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: context.whiteColor,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                              color: selectedTone == index
                                  ? context.primary
                                  : context.whiteColor),
                          boxShadow: [
                            BoxShadow(
                              color: context.secondary.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: const Offset(0, 1),
                            ),
                          ]),
                      child: Column(
                        children: [
                          padding8,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InfoPopupWidget(
                                contentTitle: toneDefinition[index],
                                child: SvgPicture.asset(
                                  AppAssets.infosSvg,
                                  height: 16.h,
                                  width: 16.w,
                                  colorFilter: ColorFilter.mode(
                                      context.secondary.withOpacity(0.3),
                                      BlendMode.srcIn),
                                ),
                              ),
                              padding12,
                            ],
                          ),
                          padding8,
                          Image.asset(
                            toneEmoji[index],
                            height: 40.h,
                            width: 40.w,
                            fit: BoxFit.cover,
                          ),
                          padding12,
                          Text(
                            toneTitleList[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: MyFonts.size12,
                                fontWeight: FontWeight.w400,
                                color: context.bodyTextColor,
                                fontFamily: AppConstants.fontFamily),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          padding12,
          CustomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            buttonText: 'Continuer',
            backColor: context.secondary,
            buttonHeight: 58.h,
            buttonWidth: 361.w,
            borderRadius: 12.r,
            isShadow: true,
          ),
          padding12,
        ],
      ),
    );
  }
}
