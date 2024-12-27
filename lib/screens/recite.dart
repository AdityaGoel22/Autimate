import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ReciteWithBeepApp extends StatefulWidget {
  const ReciteWithBeepApp({super.key});

  @override
  _ReciteWithBeepAppState createState() => _ReciteWithBeepAppState();
}

class _ReciteWithBeepAppState extends State<ReciteWithBeepApp> {
  final FlutterTts _flutterTts = FlutterTts();
  final stt.SpeechToText _speech = stt.SpeechToText();
  final AudioPlayer _audioPlayer = AudioPlayer();

  // English sentences
  final List<String> englishSentences = [
    "The sun is shining brightly today.",
    "I love to play with my friends.",
    "The cat is sleeping under the tree.",
    "Can you count to ten?",
    "The dog barked loudly at the stranger.",
    "I read a storybook before going to bed.",
    "The apple is red and juicy.",
    "My favorite color is blue.",
    "We go to the park every weekend.",
    "The stars twinkle in the night sky.",
    "The bird sang a sweet song.",
    "She has a big balloon that is yellow.",
    "I have a new pencil for my homework.",
    "The fish swims in the clear water.",
    "The car is driving down the road.",
    "I enjoy eating ice cream in summer.",
    "The flowers are blooming in the garden.",
    "My school bag is heavy with books.",
    "I saw a butterfly flying in the park.",
    "We love to eat pizza on Fridays.",
    "The baby laughs when I tickle her.",
    "The train goes very fast on the tracks.",
    "I saw a rainbow after the rain.",
    "The clock ticks loudly in the room.",
    "We played football in the playground.",
    "The milk is in the blue jug.",
    "I brush my teeth every morning.",
    "My teacher reads a story to us.",
    "The lion roared in the zoo.",
    "I like to drink orange juice.",
    "The stars are bright at night.",
    "The rabbit jumps fast in the field.",
    "I found a shiny coin on the ground.",
    "The snow is white and cold.",
    "We planted a tree in the backyard.",
    "The plane is flying high in the sky.",
    "The cake has candles on top.",
    "I drew a picture of a house.",
    "The frog is green and small.",
    "The moon is round and bright.",
    "I wear a jacket when it's cold.",
    "The sheep are eating grass in the field.",
    "I hear the birds chirping in the morning.",
    "The candy is sweet and colorful.",
    "I ride my bicycle after school.",
    "The chair is made of wood.",
    "The snake crawls on the ground.",
    "We bake cookies in the oven.",
    "The kite flies high in the sky.",
    "I love listening to music on my headphones.",
    "The water is clean and fresh to drink.",
    "I wrote a letter to my grandmother.",
    "The horse runs fast in the race.",
    "The ball is round and bounces high.",
    "I helped my mother in the kitchen.",
    "The baby sleeps in the crib.",
    "The train whistles loudly at the station.",
    "The fox is clever and fast.",
    "I can count up to twenty.",
    "The ice melts in the warm sun.",
    "We sang songs at the campfire.",
    "The tiger has sharp claws and teeth.",
    "I ate a delicious sandwich for lunch.",
    "The fish swims gracefully in the pond.",
    "The leaves fall from the trees in autumn.",
    "The frog leaps from one rock to another.",
    "The wind blows softly through the trees.",
    "I saw a spider weaving its web.",
    "The clock shows the time in numbers.",
    "I like to drink milk every morning.",
    "The bicycle has two big wheels.",
    "The stars shine brightly at night.",
    "I saw a squirrel climbing a tree.",
    "We go to the beach to build sandcastles.",
    "The rooster crows in the early morning.",
    "I play chess with my brother on weekends.",
    "The train chugs along the railway tracks.",
    "I picked fresh fruits from the garden.",
    "The snake slithered silently through the grass.",
    "I like to read books about animals.",
    "The rainbow has seven beautiful colors.",
    "I saw an elephant at the zoo.",
    "The fire burns brightly in the fireplace.",
    "I drink water when I feel thirsty.",
    "The dog wags its tail when it's happy.",
    "I saw a lizard crawling on the wall.",
    "The wind makes the leaves dance.",
    "The clouds are white and fluffy.",
    "I like to draw with crayons.",
    "The puppy is soft and playful.",
    "I like to eat a sandwich for lunch.",
    "The bee buzzes around the flowers.",
    "The duck swims in the pond.",
    "I ride a scooter in the park.",
  ];

  // Punjabi sentences
  final List<String> punjabiSentences = [
    "ਸੂਰਜ ਅੱਜ ਚਮਕ ਰਿਹਾ ਹੈ।",
    "ਮੈਨੂੰ ਆਪਣੇ ਦੋਸਤਾਂ ਨਾਲ ਖੇਡਣਾ ਚੰਗਾ ਲੱਗਦਾ ਹੈ।",
    "ਬਿੱਲੀ ਰੁੱਖ ਹੇਠ ਸੁੱਤੀ ਪਈ ਹੈ।",
    "ਕੀ ਤੁਸੀਂ ਦਸ ਤੱਕ ਗਿਣ ਸਕਦੇ ਹੋ?",
    "ਕੁੱਤਾ ਬਾਹਰਲੇ ਬੰਦੇ ਉੱਤੇ ਭੌਂਕ ਰਿਹਾ ਸੀ।",
    "ਮੈਂ ਸੋਣ ਤੋਂ ਪਹਿਲਾਂ ਕਹਾਣੀ ਦੀ ਕਿਤਾਬ ਪੜ੍ਹਦਾ ਹਾਂ।",
    "ਸੇਬ ਲਾਲ ਤੇ ਰਸਦਾਰ ਹੈ।",
    "ਮੇਰਾ ਮਨਪਸੰਦ ਰੰਗ ਨੀਲਾ ਹੈ।",
    "ਅਸੀਂ ਹਰ ਹਫਤੇ ਬਾਗ ਵਿੱਚ ਜਾਂਦੇ ਹਾਂ।",
    "ਰਾਤ ਦੇ ਆਸਮਾਨ ਵਿੱਚ ਤਾਰੇ ਚਮਕਦੇ ਹਨ।",
    "ਪੰਛੀ ਮਿੱਠੀ ਧੁਨ ਗਾ ਰਹੇ ਹਨ।",
    "ਉਸ ਕੋਲ ਪੀਲੇ ਰੰਗ ਦਾ ਵੱਡਾ ਗੁਬਾਰਾ ਹੈ।",
    "ਮੇਰੇ ਕੋਲ ਮੇਰੇ ਹੋਮਵਰਕ ਲਈ ਨਵੀਂ ਪੈਂਸਲ ਹੈ।",
    "ਮੱਛੀ ਸਾਫ਼ ਪਾਣੀ ਵਿੱਚ ਤਰਦੀ ਹੈ।",
    "ਕਾਰ ਸੜਕ 'ਤੇ ਚੱਲ ਰਹੀ ਹੈ।",
    "ਮੈਨੂੰ ਗਰਮੀ ਵਿੱਚ ਆਈਸਕ੍ਰੀਮ ਖਾਣਾ ਪਸੰਦ ਹੈ।",
    "ਬਾਗ ਵਿੱਚ ਫੁੱਲ ਖਿੜ ਰਹੇ ਹਨ।",
    "ਮੇਰਾ ਸਕੂਲ ਬੈਗ ਕਿਤਾਬਾਂ ਨਾਲ ਭਾਰਾ ਹੈ।",
    "ਮੈਂ ਬਾਗ ਵਿੱਚ ਤਿਤਲੀ ਉੱਡਦੀ ਦੇਖੀ।",
    "ਅਸੀਂ ਸ਼ੁੱਕਰਵਾਰ ਨੂੰ ਪੀਜ਼ਾ ਖਾਂਦੇ ਹਾਂ।",
    "ਬੱਚਾ ਹੱਸਦਾ ਹੈ ਜਦੋਂ ਮੈਂ ਉਸਨੂੰ ਗੁਦਗੁਦੀ ਕਰਦਾ ਹਾਂ।",
    "ਟ੍ਰੇਨ ਪਟੜੀਆਂ 'ਤੇ ਤੇਜ਼ੀ ਨਾਲ ਚੱਲਦੀ ਹੈ।",
    "ਮੈਂ ਮੀਂਹ ਤੋਂ ਬਾਅਦ ਇੱਕ ਇੰਦਰਧਨੁਸ਼ ਦੇਖਿਆ।",
    "ਘੜੀ ਕਮਰੇ ਵਿੱਚ ਜ਼ੋਰ ਨਾਲ ਟਿਕ-ਟਿਕ ਕਰਦੀ ਹੈ।",
    "ਅਸੀਂ ਖੇਤ ਵਿੱਚ ਫੁਟਬਾਲ ਖੇਡਦੇ ਹਾਂ।",
    "ਦੂਧ ਨੀਲੇ ਜੱਗ ਵਿੱਚ ਹੈ।",
    "ਮੈਂ ਹਰ ਸਵੇਰ ਆਪਣੇ ਦੰਦ ਸਾਫ਼ ਕਰਦਾ ਹਾਂ।",
    "ਮੇਰੀ ਅਧਿਆਪਕ ਸਾਨੂੰ ਕਹਾਣੀ ਪੜ੍ਹਦੀ ਹੈ।",
    "ਸ਼ੇਰ ਜੂ ਵਿੱਚ ਗੱਜ ਰਿਹਾ ਸੀ।",
    "ਮੈਨੂੰ ਸੰਤਰੇ ਦਾ ਰਸ ਪੀਣਾ ਪਸੰਦ ਹੈ।",
    "ਤਾਰੇ ਰਾਤ ਨੂੰ ਚਮਕਦੇ ਹਨ।",
    "ਖਰਗੋਸ਼ ਖੇਤ ਵਿੱਚ ਤੇਜ਼ੀ ਨਾਲ ਕੁੱਦਦਾ ਹੈ।",
    "ਮੈਂ ਜ਼ਮੀਨ 'ਤੇ ਇੱਕ ਚਮਕਦਾਰ ਸਿੱਕਾ ਲੱਭਿਆ।",
    "ਬਰਫ਼ ਚਿੱਟੀ ਅਤੇ ਠੰਡੀ ਹੈ।",
    "ਅਸੀਂ ਪਿਛਲੇ ਬਾਗ ਵਿੱਚ ਇੱਕ ਰੁੱਖ ਲਗਾਇਆ।",
    "ਪਲੇਨ ਆਸਮਾਨ ਵਿੱਚ ਉੱਚਾ ਉੱਡ ਰਿਹਾ ਹੈ।",
    "ਕੇਕ ਦੇ ਉੱਤੇ ਮੋਮਬੱਤੀਆਂ ਹਨ।",
    "ਮੈਂ ਇੱਕ ਘਰ ਦੀ ਤਸਵੀਰ ਬਣਾਈ।",
    "ਮੇਡਕ ਹਰਾ ਅਤੇ ਛੋਟਾ ਹੈ।",
    "ਚੰਦ ਗੋਲ ਅਤੇ ਚਮਕਦਾਰ ਹੈ।",
    "ਮੈਂ ਠੰਢ ਦੇ ਸਮੇਂ ਜੈਕਟ ਪਹਿਨਦਾ ਹਾਂ।",
    "ਭੇਡ ਖੇਤ ਵਿੱਚ ਘਾਹ ਖਾ ਰਹੀਆਂ ਹਨ।",
    "ਮੈਂ ਸਵੇਰ ਨੂੰ ਪੰਛੀਆਂ ਦੀ ਚੀਕ ਸੁਣਦਾ ਹਾਂ।",
    "ਕੈਂਡੀ ਮਿੱਠੀ ਅਤੇ ਰੰਗ ਬਿਰੰਗੀ ਹੈ।",
    "ਮੈਂ ਸਕੂਲ ਤੋਂ ਬਾਅਦ ਸਾਈਕਲ ਚਲਾਉਂਦਾ ਹਾਂ।",
    "ਕੁਰਸੀ ਲੱਕੜ ਦੀ ਬਣੀ ਹੈ।",
    "ਸੱਪ ਜ਼ਮੀਨ 'ਤੇ ਰਿੰਗਦਾ ਹੈ।",
    "ਅਸੀਂ ਓਵਨ ਵਿੱਚ ਬਿਸਕਟ ਬਣਾਉਂਦੇ ਹਾਂ।",
    "ਪਤੰਗ ਆਸਮਾਨ ਵਿੱਚ ਉੱਚੀ ਉੱਡਦੀ ਹੈ।",
    "ਮੈਨੂੰ ਆਪਣੇ ਹੈੱਡਫੋਨ 'ਤੇ ਮਿਊਜ਼ਿਕ ਸੁਣਨਾ ਪਸੰਦ ਹੈ।",
    "ਪਾਣੀ ਪੀਣ ਲਈ ਸਾਫ਼ ਅਤੇ ਤਾਜ਼ਾ ਹੈ।",
    "ਮੈਂ ਆਪਣੀ ਦਾਦੀ ਨੂੰ ਇੱਕ ਚਿੱਠੀ ਲਿਖੀ।",
    "ਘੋੜਾ ਦੌੜ ਵਿੱਚ ਤੇਜ਼ ਦੌੜਦਾ ਹੈ।",
    "ਗੇਂਦ ਗੋਲ ਹੈ ਅਤੇ ਉੱਚੀ ਉਛਲਦੀ ਹੈ।",
    "ਮੈਂ ਆਪਣੀ ਮੰਮੀ ਨੂੰ ਰਸੋਈ ਵਿੱਚ ਮਦਦ ਕੀਤੀ।",
    "ਬੱਚਾ ਪਿੰਜਰੇ ਵਿੱਚ ਸੋ ਰਿਹਾ ਹੈ।",
    "ਸਟੇਸ਼ਨ 'ਤੇ ਟ੍ਰੇਨ ਜ਼ੋਰ ਨਾਲ ਸਿਟੀ ਮਾਰਦੀ ਹੈ।",
    "ਲੋਮੜੀ ਚੁਸਤ ਅਤੇ ਤੇਜ਼ ਹੈ।",
    "ਮੈਂ ਵੀਹ ਤੱਕ ਗਿਣ ਸਕਦਾ ਹਾਂ।",
    "ਬਰਫ਼ ਗਰਮੀ ਦੇ ਸੂਰਜ ਵਿੱਚ ਪਿਘਲਦੀ ਹੈ।",
    "ਅਸੀਂ ਅੱਗੇ 'ਤੇ ਗੀਤ ਗਾਏ।",
    "ਬਾਗ ਵਿੱਚ ਵਾਘ ਦੇ ਤਿੱਖੇ ਪੰਜੇ ਹਨ।",
    "ਮੈਂ ਦੁਪਹਿਰ ਨੂੰ ਸੁਆਦੀ ਸੈਂਡਵਿਚ ਖਾਈ।",
    "ਤਲਾਬ ਵਿੱਚ ਮੱਛੀ ਸੁੰਦਰ ਤਰਦੀ ਹੈ।",
    "ਪੱਤੇ ਪਤਝੜ ਵਿੱਚ ਰੁੱਖ ਤੋਂ ਡਿੱਗਦੇ ਹਨ।",
    "ਮੇਡਕ ਇੱਕ ਪੱਥਰ ਤੋਂ ਦੂਜੇ 'ਤੇ ਕੁੱਦਦਾ ਹੈ।",
    "ਹਵਾ ਰੁੱਖਾਂ ਵਿੱਚ ਹੌਲੀ ਹੌਲੀ ਵੱਗਦੀ ਹੈ।",
    "ਮੈਂ ਜਾਲ ਬੁਣਦੀ ਮਕੜੀ ਦੇਖੀ।",
    "ਘੜੀ ਸਮਾਂ ਨੰਬਰਾਂ ਵਿੱਚ ਦਿਖਾਉਂਦੀ ਹੈ।",
    "ਮੈਂ ਹਰ ਸਵੇਰ ਦੂਧ ਪੀਦਾ ਹਾਂ।",
    "ਸਾਈਕਲ ਦੇ ਦੋ ਵੱਡੇ ਪਹੀਏ ਹਨ।",
    "ਤਾਰੇ ਰਾਤ ਨੂੰ ਚਮਕਦੇ ਹਨ।",
    "ਮੈਂ ਗੀਦੜ ਨੂੰ ਰੁੱਖ 'ਤੇ ਚੜ੍ਹਦੇ ਦੇਖਿਆ।",
    "ਅਸੀਂ ਸਮੁੰਦਰ ਤਟ 'ਤੇ ਰੇਤ ਨਾਲ ਕਿਲ੍ਹੇ ਬਣਾਉਂਦੇ ਹਾਂ।",
    "ਮੁਰਗਾ ਸਵੇਰੇ ਜਾਗਦਾ ਹੈ।",
    "ਮੈਂ ਹਫ਼ਤੇ ਅੰਤ ਨੂੰ ਆਪਣੇ ਭਰਾ ਨਾਲ ਸ਼ਤਰੰਜ ਖੇਡਦਾ ਹਾਂ।",
    "ਟ੍ਰੇਨ ਪਟੜੀ 'ਤੇ ਚਲਦੀ ਹੈ।",
    "ਮੈਂ ਬਾਗ ਤੋਂ ਤਾਜ਼ਾ ਫਲ ਚੁੱਕੇ।",
    "ਸੱਪ ਘਾਹ ਵਿੱਚ ਚੁਪਚਾਪ ਰੀਂਗਦਾ ਹੈ।",
    "ਮੈਨੂੰ ਜਾਨਵਰਾਂ ਦੀਆਂ ਕਹਾਣੀਆਂ ਪੜ੍ਹਨੀਆਂ ਪਸੰਦ ਹਨ।",
    "ਇੰਦਰਧਨੁਸ਼ ਵਿੱਚ ਸੱਤ ਸੁੰਦਰ ਰੰਗ ਹੁੰਦੇ ਹਨ।",
    "ਮੈਂ ਜੂ ਵਿੱਚ ਹਾਥੀ ਦੇਖਿਆ।",
    "ਅੱਗ ਚੁੱਲ੍ਹੇ ਵਿੱਚ ਤੇਜ਼ੀ ਨਾਲ ਸੜਦੀ ਹੈ।",
    "ਮੈਨੂੰ ਤ੍ਰਿੱਸ਼ਨ ਜਦੋਂ ਪਾਣੀ ਪੀਣਾ ਪਸੰਦ ਹੈ।",
    "ਕੁੱਤਾ ਖੁਸ਼ ਹੋਣ 'ਤੇ ਆਪਣੀ ਪੂੰਛ ਹਲਾਉਂਦਾ ਹੈ।",
    "ਮੈਂ ਕੰਧ 'ਤੇ ਲਿਜ਼ਰਡ ਰੀਂਗਦੇ ਵੇਖੀ।",
    "ਹਵਾ ਪੱਤਿਆਂ ਨੂੰ ਨਚਾਉਂਦੀ ਹੈ।",
    "ਬੱਦਲ ਚਿੱਟੇ ਅਤੇ ਮੋਮਸਮਾਨ ਹਨ।",
    "ਮੈਨੂੰ ਪੈਂਸਲਾਂ ਨਾਲ ਰੰਗ ਬਣਾਉਣਾ ਪਸੰਦ ਹੈ।",
    "ਪੱਲਾ ਮਿੱਠਾ ਅਤੇ ਖੇਡਣ ਵਾਲਾ ਹੈ।",
    "ਮੈਨੂੰ ਦੁਪਹਿਰ ਲਈ ਸੈਂਡਵਿਚ ਖਾਣਾ ਪਸੰਦ ਹੈ।",
    "ਭੰਨ੍ਹਰ ਫੁੱਲਾਂ ਦੇ ਆਲੇ ਦੁਆਲੇ ਗੂੰਜਦਾ ਹੈ।",
    "ਬੱਤਖ ਤਲਾਬ ਵਿੱਚ ਤਰਦੀ ਹੈ।",
    "ਮੈਂ ਬਾਗ ਵਿੱਚ ਸਕੂਟਰ ਚਲਾਉਂਦਾ ਹਾਂ।",
  ];

  // Hindi sentences
  final List<String> hindiSentences = [
    "आज सूरज चमक रहा है।",
    "मुझे अपने दोस्तों के साथ खेलना अच्छा लगता है।",
    "बिल्ली पेड़ के नीचे सो रही है।",
    "क्या तुम दस तक गिन सकते हो?",
    "कुत्ता अजनबी पर जोर से भौंक रहा था।",
    "मैं सोने से पहले कहानी की किताब पढ़ता हूँ।",
    "सेब लाल और रसीला है।",
    "मेरा पसंदीदा रंग नीला है।",
    "हम हर सप्ताहांत पार्क जाते हैं।",
    "रात के आकाश में तारे चमकते हैं।",
    "पक्षी मीठा गीत गा रहा है।",
    "उसके पास पीला बड़ा गुब्बारा है।",
    "मेरे पास होमवर्क के लिए नई पेंसिल है।",
    "मछली साफ पानी में तैर रही है।",
    "कार सड़क पर चल रही है।",
    "गर्मी में मुझे आइसक्रीम खाना पसंद है।",
    "बगीचे में फूल खिल रहे हैं।",
    "मेरा स्कूल बैग किताबों से भारी है।",
    "मैंने पार्क में एक तितली उड़ते हुए देखी।",
    "हम शुक्रवार को पिज्जा खाते हैं।",
    "बच्चा हंसता है जब मैं उसे गुदगुदी करता हूँ।",
    "ट्रेन पटरियों पर तेज़ी से चलती है।",
    "बारिश के बाद मैंने इंद्रधनुष देखा।",
    "घड़ी कमरे में जोर से टिक-टिक करती है।",
    "हमने मैदान में फुटबॉल खेला।",
    "दूध नीले जग में है।",
    "मैं हर सुबह अपने दांत साफ करता हूँ।",
    "मेरी अध्यापिका हमें कहानी सुनाती है।",
    "शेर चिड़ियाघर में गरज रहा था।",
    "मुझे संतरे का जूस पीना पसंद है।",
    "तारे रात में चमकते हैं।",
    "खरगोश मैदान में तेज़ी से कूदता है।",
    "मुझे ज़मीन पर एक चमकीला सिक्का मिला।",
    "बर्फ सफेद और ठंडी होती है।",
    "हमने पिछवाड़े में एक पेड़ लगाया।",
    "हवाई जहाज आसमान में ऊँचा उड़ रहा है।",
    "केक पर मोमबत्तियाँ हैं।",
    "मैंने एक घर की तस्वीर बनाई।",
    "मेंढक हरा और छोटा है।",
    "चाँद गोल और चमकीला है।",
    "मैं सर्दी में जैकेट पहनता हूँ।",
    "भेड़ें मैदान में घास खा रही हैं।",
    "मैं सुबह पक्षियों की चहचहाहट सुनता हूँ।",
    "कैंडी मीठी और रंग-बिरंगी है।",
    "मैं स्कूल के बाद साइकिल चलाता हूँ।",
    "कुर्सी लकड़ी की बनी है।",
    "साँप ज़मीन पर रेंगता है।",
    "हम ओवन में बिस्कुट बनाते हैं।",
    "पतंग आसमान में ऊँची उड़ती है।",
    "मुझे अपने हेडफोन पर संगीत सुनना पसंद है।",
    "पानी पीने के लिए साफ और ताज़ा है।",
    "मैंने अपनी दादी को एक चिट्ठी लिखी।",
    "घोड़ा दौड़ में तेज़ दौड़ता है।",
    "गेंद गोल है और ऊँची उछलती है।",
    "मैंने अपनी माँ की रसोई में मदद की।",
    "बच्चा झूले में सो रहा है।",
    "ट्रेन स्टेशन पर ज़ोर से सीटी बजाती है।",
    "लोमड़ी चालाक और तेज़ होती है।",
    "मैं बीस तक गिन सकता हूँ।",
    "बर्फ गर्मी की धूप में पिघलती है।",
    "हमने अलाव पर गीत गाए।",
    "बाघ के नुकीले पंजे होते हैं।",
    "मैंने दोपहर के भोजन में स्वादिष्ट सैंडविच खाई।",
    "तालाब में मछली सुंदरता से तैरती है।",
    "पतझड़ में पेड़ से पत्ते गिरते हैं।",
    "मेंढक पत्थर से पत्थर पर कूदता है।",
    "हवा पेड़ों के बीच हल्की-हल्की चलती है।",
    "मैंने मकड़ी को जाल बुनते हुए देखा।",
    "घड़ी समय को संख्याओं में दिखाती है।",
    "मैं हर सुबह दूध पीता हूँ।",
    "साइकिल के दो बड़े पहिए होते हैं।",
    "तारे रात को चमकते हैं।",
    "मैंने गिलहरी को पेड़ पर चढ़ते देखा।",
    "हम समुद्र तट पर रेत के किले बनाते हैं।",
    "मुर्गा सुबह जल्दी बांग देता है।",
    "मैं सप्ताहांत में अपने भाई के साथ शतरंज खेलता हूँ।",
    "ट्रेन रेलवे ट्रैक पर चलती है।",
    "मैंने बगीचे से ताज़े फल तोड़े।",
    "साँप घास में चुपचाप रेंगता है।",
    "मुझे जानवरों की किताबें पढ़ना पसंद है।",
    "इंद्रधनुष में सात सुंदर रंग होते हैं।",
    "मैंने चिड़ियाघर में हाथी देखा।",
    "अलाव में आग जल रही है।",
    "मुझे प्यास लगने पर पानी पीना पसंद है।",
    "कुत्ता खुश होने पर अपनी पूँछ हिलाता है।",
    "मैंने दीवार पर छिपकली को रेंगते देखा।",
    "हवा पत्तों को नचाती है।",
    "बादल सफेद और फूले हुए हैं।",
    "मुझे रंगीन क्रेयॉन्स से चित्र बनाना पसंद है।",
    "पिल्ला नरम और खेलता-कूदता है।",
    "मुझे दोपहर के भोजन में सैंडविच पसंद है।",
    "मधुमक्खी फूलों के चारों ओर भिनभिनाती है।",
    "बत्तख तालाब में तैर रही है।",
    "मैं पार्क में स्कूटर चलाता हूँ।",
  ];

  // Current dataset and sentence
  List<String> _currentSentences = [];
  String _currentSentence = 'Press the button to start!';
  String _language = "en-US"; // Default language: English

  // Dropdown menu values
  String _selectedLanguage = "English";

  String _recognizedText = "";
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _setLanguage("English");
    _flutterTts.setSpeechRate(0.4); // Set speech rate
    _initSpeech();
  }

  void _initSpeech() async {
    bool available = await _speech.initialize();
    if (!available) {
      print("Speech Recognition is not available");
    }
  }

  // Function to set sentences and language
  void _setLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
      switch (language) {
        case "English":
          _currentSentences = englishSentences;
          _language = "en-US";
          break;
        case "Punjabi":
          _currentSentences = punjabiSentences;
          _language = "pa-IN";
          break;
        case "Hindi":
          _currentSentences = hindiSentences;
          _language = "hi-IN";
          break;
      }
      _flutterTts.setLanguage(_language);
      _currentSentence = "Press the button to start!";
    });
  }

  // Function to recite a random sentence with a beep
  Future<void> reciteWithBeep() async {
    // Select a random sentence
    String sentence =
        _currentSentences[Random().nextInt(_currentSentences.length)];

    // Update UI with the current sentence
    setState(() {
      _currentSentence = sentence;
    });

    // Speak the sentence
    await _flutterTts.speak(sentence);

    // Play the beep sound
    // await _audioPlayer.play(AssetSource('assets/beep.mp3'));
  }

  Future<void> _startListening() async {
    setState(() {
      _recognizedText = "";
    });

    await _speech.listen(
      onResult: (result) {
        setState(() {
          _recognizedText = result.recognizedWords;
        });
      },
      localeId: _language,
    );

    setState(() {
      _isListening = true;
    });
  }

  // Function to stop speech recognition
  void _stopListening() {
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  // Function to calculate accuracy
  String _calculateAccuracy() {
    if (_recognizedText.isEmpty) {
      return "Please say the sentence.";
    }

    int matchedWords = 0;
    List<String> originalWords = _currentSentence.split(" ");
    List<String> userWords = _recognizedText.split(" ");

    for (int i = 0; i < originalWords.length; i++) {
      if (i < userWords.length &&
          originalWords[i].toLowerCase() == userWords[i].toLowerCase()) {
        matchedWords++;
      }
    }

    double accuracy = (matchedWords / originalWords.length) * 100;
    return "Accuracy: ${accuracy.toStringAsFixed(2)}%";
  }

  @override
  void dispose() {
    _flutterTts.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Recite",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 5, 63, 1),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image or visual
                  Image.asset(
                    'assets/recite_bg.jpg',
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),

                  // Sentence display
                  Text(
                    "Current Sentence:",
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      _currentSentence,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 28.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue[900],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Recite button
                  ElevatedButton(
                    onPressed: reciteWithBeep,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      "Recite Sentence",
                      style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Text(
                    "Select Language:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    value: _selectedLanguage,
                    items:
                        ["English", "Punjabi", "Hindi"].map((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(
                          language,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newLanguage) {
                      if (newLanguage != null) {
                        _setLanguage(newLanguage);
                      }
                    },
                    dropdownColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    icon: const Icon(
                      Icons.language,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: _isListening ? _stopListening : _startListening,
                  //   child: Text(
                  //       _isListening ? "Stop Listening" : "Start Listening"),
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: _isListening ? Colors.red : Colors.green,
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  // const Text(
                  //   "Recognized Speech:",
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  // ),
                  // const SizedBox(height: 10),
                  // Text(
                  //   _recognizedText.isEmpty
                  //       ? "No speech detected yet."
                  //       : _recognizedText,
                  //   style: const TextStyle(fontSize: 20, color: Colors.black),
                  //   textAlign: TextAlign.center,
                  // ),
                  // const SizedBox(height: 20),
                  // Text(
                  //   _calculateAccuracy(),
                  //   style: TextStyle(
                  //       fontSize: 22,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.green[800]),
                  // ),
                  // const SizedBox(height: 20),
                  // Quit button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      "Quit",
                      style: TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
