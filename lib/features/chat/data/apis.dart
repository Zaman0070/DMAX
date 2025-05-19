// import 'dart:convert';
// import 'package:dmax_app/model/message_model.dart';
// import 'package:dmax_app/utils/constants/app_constants.dart';
// import 'package:http/http.dart' as http;

// class GeminiApiServices {
//   static const String apiUrl =
//       "https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent?key=${AppConstants.geminiApiKey}";

//   Future<List<MessageModel>> sendCustomPromptToGemini({
//     required List<String> conversationHistory,
//     required String question,
//     required String toneLabel,
//     required String toneDefinition,
//     required String toneExample,
//     String? base64Image,
//     required int count,
//     required List<String> userInfo,
//   }) async {
//     try {
//       const fewShotExamples = '''
// Example 1:
// User: Hey what's up 😏
// Bot: Just chillin’ and trying to figure out if your vibe matches your playlist 😎

// Example 2:
// User: You travel a lot?
// Bot: I like to say my suitcase gets more action than I do 👀✈️

// ''';

//       final fullPrompt = '''
// You are a genius at crafting smooth, witty, and stylish DM replie. Match the user’s style exactly (tone, punctuation, emojis, slang, humor). Analyze the following conversation and write short replie** to the **last** message, helping move the chat toward this goal (but don't mention it directly): "$question".

// Tone Style: $toneLabel
// Definition: $toneDefinition
// Example: "$toneExample"

// User Info: ${userInfo.join(', ')}

// $fewShotExamples

// Chat History:
// ${conversationHistory.join('\n')}

// ✦ Keep the response **concise and in one paragraph**.
// ✦ Do not include "User:" or "Bot:" or any explanation.
// ✦ Only return a single, clear reply.
// ''';

//       final body = {
//         "contents": [
//           {
//             "role": "user",
//             "parts": [
//               {"text": fullPrompt}
//             ]
//           }
//         ],
//         "generationConfig": {
//           "temperature": 0.9,
//           "topK": 40,
//           "topP": 0.95,
//           "candidateCount": count,
//           "maxOutputTokens": 400,
//         }
//       };

//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(body),
//       );

//       if (response.statusCode == 200) {
//         final decoded = jsonDecode(response.body);
//         final candidates = decoded['candidates'] as List;

//         return candidates.map((candidate) {
//           final content = candidate['content']['parts'][0]['text'] ?? '';
//           print("Gemini response: $content");
//           return MessageModel(
//             message: content.trim(),
//             type: "bot",
//           );
//         }).toList();
//       } else {
//         return [
//           MessageModel(
//             message: "Error: ${response.statusCode} - ${response.body}",
//             type: "error",
//           ),
//         ];
//       }
//     } catch (e) {
//       return [MessageModel(message: e.toString(), type: "error")];
//     }
//   }
// }

import 'dart:convert';
import 'package:dmax_app/model/message_model.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class GeminiApiServices {
  static const String apiUrl =
      "https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent?key=${AppConstants.geminiApiKey}";

  Future<List<MessageModel>> sendCustomPromptToGemini({
    required List<String> conversationHistory,
    required String question,
    required String toneLabel,
    required String toneDefinition,
    required String toneExample,
    String? base64Image,
    required List<String> userInfo,
    required int count,
  }) async {
    try {
      const fewShotExamples = '''

Example 1:
User: Ce soir c’est dîner avec les copines  
Bot: ah super ! j’espère que t’as prévu un peu d’énergie pour la suite ou madame dodo à 22h ?


Example 2:
User: J’adore la musique live, ça me fait vraiment kiffer  
Bot: Si t’es chaud·e, je connais un petit bar avec de la bonne vibe, ça te dit ?

Example 3:
User: Ce week-end, je veux rien faire, juste me poser  
Bot:Bon ben je réserve un petit salon de massage alors 

Example 4:
User: J’ai envie de découvrir un truc nouveau en ville  
Bot: Ben figure toi que je connais des coins que tu pourrais bien aimé…

Exemple 5:
User: Tu prends trop de temps à répondre c’est relouuu
Bot: Depuis 2 jours je suis à deux doigts de te facturer mon temps là je peux plus bouger.

Exemple 6:
User: Alors là je te reonds juste par respect sinon jme fais chier 🙂
Bot: Fais pas genre, il est minuit et tu dors pas encore donc bon je pense que t’aime bienla conv…
''';

      final fullPrompt = '''
Tu es un expert des messages privés, comme un pote de 22 ans qui parle naturellement. Ton but est d’écrire des réponses stylées, fluides, simples, jamais gênantes, ni bizarres, ni exagérées. Tu aides l’utilisateur à atteindre son objectif (proposer un verre, revoir la personne, créer du lien…) sans jamais être direct ou insistant.

Par exemple, si l’objectif est "proposer un verre", ta réponse pourrait être : "Tu fais quoi ce week-end ?"  
On ne dit *jamais* l’objectif en clair : on avance subtilement, en plusieurs étapes, pour amener le sujet doucement. Le but est d’avoir un message qui ouvre la conversation vers ce thème sans le stipuler directement.

Priorité numéro 1 : *ne jamais être gênant, ni maladroit*.  
La réponse doit sonner naturelle, normale, comme une vraie discussion entre potes.  
Tu écris comme un mec sympa, chill, avec une petite touche de flirt légère et bien placée, jamais lourde.  
Respecte le ton choisi par l’utilisateur, sa façon de parler, le rythme, la ponctuation, le langage.  
Évite les émoticônes à la fin des phrases, surtout quand ça fait forcé ou pas naturel.

Analyse la conversation et écris $count réponses courtes au dernier message.

$question correspond à l’objectif de fond ou au contexte de la conversation, vers lequel il faut orienter subtilement la réponse.

Ton sélectionné : $toneLabel  
Définition : $toneDefinition  
Exemple : "$toneExample"

Infos utilisateur : ${userInfo.join(', ')}

$fewShotExamples

Historique de la conversation :  
${conversationHistory.join('\n')}

✦ Donne exactement $count réponses, chacune sur une nouvelle ligne  
✦ N’écris jamais "Utilisateur :" ou "Bot :" — uniquement les réponses  
✦ Les réponses doivent être naturelles, fluides, jamais gênantes ni robotiques  
✦ Reste dans la vibe de la conversation, simple et stylé  
✦ Chaque réponse doit ouvrir la discussion vers l’objectif sans forcer  
''';

      final body = {
        "contents": [
          {
            "role": "user",
            "parts": [
              {"text": fullPrompt}
            ]
          }
        ],
        "generationConfig": {
          "temperature": 0.9,
          "topK": 40,
          "topP": 0.95,
          "candidateCount": 1,
          "maxOutputTokens": 400,
        }
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final candidates = decoded['candidates'] as List;

        final content =
            (candidates.first['content']['parts'][0]['text'] ?? '') as String;

        final lines = content
            .trim()
            .split('\n')
            .where((line) => line.trim().isNotEmpty)
            .toList();

        return lines.map<MessageModel>((reply) {
          return MessageModel(message: reply.trim(), type: "bot");
        }).toList();
      } else {
        print("Error: ${response.statusCode} - ${response.body}");

        return [
          MessageModel(
            message: "Error: ${response.statusCode} - ${response.body}",
            type: "error",
          ),
        ];
      }
    } catch (e) {
      print("Exception: $e");
      return [
        MessageModel(message: e.toString(), type: "error"),
      ];
    }
  }
}
