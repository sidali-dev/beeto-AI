import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart' as http;
import 'package:translator_plus/translator_plus.dart';

class APIs {
  //get answer from google gemini ai
  static Future<String> getAnswer(String question) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-2.0-flash-lite',
        apiKey: dotenv.get("GEMINI_API_KEY"),
      );

      final content = [Content.text(question)];
      final res = await model.generateContent(content, safetySettings: [
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
      ]);

      log('res: ${res.text}');

      return res.text!;
    } catch (e) {
      log('getAnswerGeminiE: $e');
      if (e.toString().contains("overload")) {
        return 'Beeto is overloaded (Try again in sometime)';
      } else {
        return 'Something went wrong (Try again in sometime)';
      }
    }
  }

  //get image from google gemini ai
  static Future<Uint8List?> generateImageFromApi(String prompt) async {
    final String apiKey = dotenv.get("GEMINI_API_KEY");
    const String geminiModel = "gemini-2.0-flash-preview-image-generation";
    const String geminiEndPoint =
        "https://generativelanguage.googleapis.com/v1beta/models/";

    // Construct the API endpoint URL
    final String apiUrl =
        "$geminiEndPoint$geminiModel:generateContent?key=$apiKey";

    // Prepare the request body for Gemini API
    final Map<String, dynamic> requestBody = {
      "contents": [
        {
          "parts": [
            {"text": prompt}
          ]
        }
      ],
      "generationConfig": {
        "responseModalities": ["IMAGE", "TEXT"]
      }
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['candidates'] != null &&
            jsonResponse['candidates'].isNotEmpty &&
            jsonResponse['candidates'][0]['content'] != null &&
            jsonResponse['candidates'][0]['content']['parts'] != null) {
          List<dynamic> parts =
              jsonResponse['candidates'][0]['content']['parts'];
          bool imageFound = false;
          for (var part in parts) {
            if (part['inlineData'] != null &&
                (part['inlineData']['mimeType'] == 'image/png' ||
                    part['inlineData']['mimeType'] == 'image/jpeg')) {
              final String base64Image = part['inlineData']['data'];
              imageFound = true;
              return base64Decode(base64Image);
            }
          }
          if (!imageFound) {
            throw Exception(
                'Image data not found in Gemini API response parts.');
          }
        } else {
          throw Exception(
              'Unexpected Gemini API response structure or no image generated.');
        }
      } else {
        throw Exception(
            'Failed to generate image with Gemini: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  //get translation from google translate
  static Future<String> googleTranslate(
      {required String from, required String to, required String text}) async {
    try {
      final res = await GoogleTranslator().translate(text, from: from, to: to);

      return res.text;
    } catch (e) {
      log('googleTranslateE: $e ');
      return 'Something went wrong!';
    }
  }
}
