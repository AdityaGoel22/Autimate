const answers1 = [
  {'text': '\n Yes\n', 'score': 1},
  {'text': '\n No\n', 'score': 0},
  {'text': '\nNot Sure or NA\n', 'score': 0},
];

const answers2 = [
  {'text': '\n Yes\n', 'score': 0},
  {'text': '\n No\n', 'score': 1},
  {'text': '\nNot Sure or NA\n', 'score': 0},
];
const answers3 = [
  {'text': '\n Yes\n', 'score': 10},
  {'text': '\n No\n', 'score': 0},
  {'text': '\nNot Sure or NA\n', 'score': 0},
];

const answers4 = [
  {'text': '\n Yes\n', 'score': 0},
  {'text': '\n No\n', 'score': 10},
  {'text': '\nNot Sure or NA\n', 'score': 0},
];
const answers5 = [
  {'text': '\n Yes\n', 'score': 100},
  {'text': '\n No\n', 'score': 0},
  {'text': '\nNot Sure or NA\n', 'score': 0},
];

const questionsi = [
  {
    'questionText':
        '1)i. For children aged less than 4 years: Does your child usually enjoy being taken in the lap or hugged?\nFor children aged 4 years or more: When your child was a baby/toddler, did he/she enjoy being taken in the lap or hugged?',
    'answers': answers2,
  },
  {
    'questionText':
        'ii. Does your child usually make eye contact with you or other people? E.g. While playing, asking for things, talking to you.',
    'answers': answers2,
  },
  {
    'questionText':
        'iii. Does your child usually use various gestures appropriately during social interactions?\nE.g. Namaste, Salaam, waving bye-bye, hello, touching feet, etc.',
    'answers': answers2,
  },
  {
    'questionText':
        'iv. Does your child usually show appropriate facial expressions according to the situation? E.g. being happy, sad, afraid etc.',
    'answers': answers2,
  },
  {
    'questionText':
        '2)i. Does your child usually enjoy the company of other children?',
    'answers': answers2,
  },
  {
    'questionText':
        'ii. For children aged 4 years or more: Does your child have friends of his/her age (In school and neighbor-hood) with whom he/she loves to chat, share food or play together?',
    'answers': answers2,
  },
  {
    'questionText':
        'iii. For children aged 4 years or more: Does your child play mostly with children who are much older or much younger than him/her?',
    'answers': answers1,
  },
  {
    'questionText':
        '3)i. For children aged less than 4 years: Does/did your child ever point with his/her index finger to bring your attention to show the things that interest him/her ? E.g. kite, plane flying in the sky, cow/dog on the road etc.\nFor children aged 4 years or more: Does your child usually bring things to show you on his/her own he/she has made painted or new toy/gift? ',
    'answers': answers2,
  },
  {
    'questionText':
        'ii. For children aged 4 years or more, and are able to speak: Does your child talk to you about things he/she likes or has achieved without being asked about them?',
    'answers': answers2,
  },
  {
    'questionText':
        '4)i.  Does your child usually prefer to play alone and gets irritated/moves away when his/her sibs or other kids try to play with him/her?',
    'answers': answers1,
  },
  {
    'questionText':
        'ii. Does your child play games involving turn taking or rule based with other children properly? E.g. Cricket, Hide and Seek/I-spy, Ludo, Stapoo, Ring-a-ring-a-roses, etc.',
    'answers': answers2,
  },
  {
    'questionText':
        'iii.  Does your child usually share his/her happiness with you or come to you for comfort when hurt or upset?',
    'answers': answers2,
  },
  {
    'questionText':
        'iv. For children aged 4 years or more: Does your child usually share your happiness or try to comfort you when you are upset / sad?',
    'answers': answers2,
  },
  {
    'questionText':
        '5) For children aged 4 years or more: Does your child speak normally for his/her age? If the child cannot speak normally: Can he/she communicate with you by using gestures? E.g. pointing with index finger, nodding/shaking head for yes/no etc',
    'answers': answers4,
  },
  //pop up - Ask 6) only if child is speaking at 2-3 word sentences level
  //Ask 7) only if the child is speaking at few words level
  {
    'questionText': '6)i. Does your child initiate a conversation with you',
    'answers': answers4,
  },
  {
    'questionText':
        'ii. For children aged 4 years or more: Can you have conversation with your child during which he/she not only answers your questions, but also adds something new to continue the conversation? ',
    'answers': answers4,
  },
  {
    'questionText':
        "7)i. Does your child usually repeat words or phrases regardless of meaning (in part or whole) that he/she has heard? E.g. If you say ‘toffee’ he will also say ‘toffee’ if you say ‘come’ he will also say ‘come’ and if you ask “what is your name”, he/she also says “what is your name”. ",
    'answers': answers3,
  },
  {
    'questionText':
        'ii. Does he/she incessantly repeat things/T.V. serial dialogue regardless of meaning/context, whatever he/she has heard later on?',
    'answers': answers3,
  },
  {
    'questionText':
        'iii. For children aged 4 years or more: Does your child usually use “I for me” and “me for you” incorrectly? E.g., when you ask “do you want milk?” he/she says “yes, you want milk” or “Rohit wants milk” (referring to him self).',
    'answers': answers3,
  },
  {
    'questionText':
        'iv. For children aged 4 years or more: During conversation does your child often speak ‘out of context’ or irrelevantly? ',
    'answers': answers3,
  },
  {
    'questionText':
        'v. For children aged 6 years or more: Does your child understand that somebody is making fun of him/her or can he/she understands jokes? ',
    'answers': answers4,
  },
  {
    'questionText':
        '8) Does your child participate in games like “Pat-a-cake”, “Peek-a-boo”, “Ring-aring rose”, “Akkad bakkad bambe po”, “Posam paa”, “Chal chameli baag mein” and “Totaa ud-maina ud” etc.?\n OR \nDoes your child play variable imaginative play with toys like For girls:- kitchen set/ dolls/clay or dough For boys:- telephone/ toy gun/motor car? \n OR \nHas your child played different games like “ghar-ghar”, “teacher-student” (schoolschool), “chor-police” etc. with other kids interactively',
    'answers': answers4,
  },
  //if any one is true mark as yes
  {
    'questionText':
        '9)i. Does your child have excessive interest in odd things/activities which other children do not have? E.g., collecting toffee wrappers, polythene bags, piece of string or rope, pulling thread and rubber band etc.',
    'answers': answers5,
  },
  {
    'questionText':
        'ii. Does your child have excessive interest in typical things but the interest is so all encompassing that it interferes his/her activities? (Excluding T.V watching) ',
    'answers': answers5,
  },
  {
    'questionText':
        'iii. Does your child like lining or stacking objects/toys excessively? (Excluding blocks)',
    'answers': answers5,
  },
  {
    'questionText':
        '10) Does your child unreasonably insist on doing things in a particular way and/or become upset if there is any change in the daily routine?\nE.g., Taking exactly the same route to the school or market, insisting on food being served in the same pattern or sequence etc',
    'answers': answers5,
  },
  {
    'questionText':
        '11)i. Does your child keep on repeating any of the followings like\n1. flapping hands\n2. hand wringing\n3. toe-walking\n4. rocking or spining\n5. making unusual finger or hand movements near his/her face',
    'answers': answers5,
  },
  {
    'questionText':
        'ii. Does your child have inappropriate fascination with movement? E.g. spinning wheels, opening and closing of doors, electric fan, running water and any other revolving object etc. ',
    'answers': answers5,
  },
  {
    'questionText':
        '12) Does your child prefer to play with a particular part of a toy/object rather than the whole toy/object? E.g. wheels of a toy rather than the whole toy',
    'answers': answers5,
  },
];
// point change kr sakte hai 1, 10, 100
