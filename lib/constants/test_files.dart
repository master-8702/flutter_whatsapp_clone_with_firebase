import 'package:flutter_whatsapp_clone_with_firebase/models/message_model.dart';
import 'package:flutter_whatsapp_clone_with_firebase/models/user_model.dart';

// sample current user
final User currentUser = User(
  id: 0,
  name: 'Abebe Kebede',
  imageUrl: 'assets/images/abebe.jpg',
);


// other users
final User abe = User(id: 1, name: 'Abe', imageUrl: 'assets/images/abe.jpg');
final User tony = User(id: 1, name: 'Tony', imageUrl: 'assets/images/tony.jpg');
final User kebe = User(id: 2, name: 'Kebe', imageUrl: 'assets/images/kebe.jpg');
final User gete = User(id: 3, name: 'Gete', imageUrl: 'assets/images/gete.jpg');
final User ali = User(id: 4, name: 'Ali', imageUrl: 'assets/images/ali.jpg');
final User chaltu =
    User(id: 5, name: 'Chaltu', imageUrl: 'assets/images/chaltu.jpg');
final User shifa =
    User(id: 6, name: 'Shifa', imageUrl: 'assets/images/shifa.jpg');
final User birhan =
    User(id: 7, name: 'Birhan', imageUrl: 'assets/images/birhan.jpg');
final User mustefa =
    User(id: 8, name: 'Mustefa', imageUrl: 'assets/images/mustefa.jpg');
final User biruk =
    User(id: 9, name: 'Biruk', imageUrl: 'assets/images/biruk.jpg');
final User muke =
    User(id: 10, name: 'Muke', imageUrl: 'assets/images/muke.jpg');

// sample chat list
List<Message> chatList = [
  Message(
      sender: abe,
      time: '03:34 PM',
      text: "Woah, hold on, did you say food?",
      unread: true),
  Message(
      sender: tony,
      time: '03:15 PM',
      text:
          "Hey buddy! Just finished conquering Mount Laundry, what's your weekend warrior mission?",
      unread: true),
  Message(
      sender: kebe, time: '02:30 PM', text: "You up for a walk?", unread: true),
  Message(
      sender: gete,
      time: '01:12 PM',
      text: "Just saw the funniest meme ever, gotta send it your way.",
      unread: true),
  Message(
      sender: ali,
      time: '12:06 PM',
      text: "My brain is officially on vacation mode.",
      unread: true),
  Message(sender: chaltu, time: '10:00 AM', text: "Guess what?", unread: true),
  Message(
      sender: shifa,
      time: '09:53 AM',
      text: "Any words of wisdom or just a listening ear?",
      unread: true),
  Message(
      sender: birhan,
      time: '09:20 AM',
      text: "Heard you got tickets",
      unread: true),
  Message(
      sender: mustefa,
      time: '07:48 AM',
      text: "You need to tag along!",
      unread: true),
  Message(
      sender: biruk,
      time: '07:00 AM',
      text: "That is the funniest meme ever",
      unread: true),
  Message(
      sender: muke,
      time: '05:20 AM',
      text: "Any genius ideas about that?",
      unread: true),
];



// sample conversation
List<Message> messages = [
  Message(sender: currentUser, time: '03:50 PM', text: "see ya", unread: true),
  Message(
      sender: tony,
      time: '03:50 PM',
      text: "You had me at chili dip. See you then, buddy!",
      unread: true),
  Message(
      sender: currentUser,
      time: '03:49 PM',
      text:
          "You read my mind. Be there or be square! And I'm bringing the legendary chili dip.",
      unread: true),
  Message(
      sender: tony,
      time: '03:48 PM',
      text:
          "Both amazing options! Let's brainstorm over beers tonight? My place after work?",
      unread: true),
  Message(
      sender: tony,
      time: '03:46 PM',
      text:
          "Yeah, I did. Jelly doesn't even cut it. Maybe we should plan a weekend getaway soon. Any ideas?",
      unread: true),
  Message(
      sender: currentUser,
      time: '03:45 PM',
      text:
          "Speaking of drool, did you see the photos Sarah posted from her beach vacation? Talk about paradise!",
      unread: true),
  Message(
      sender: tony,
      time: '03:41 PM',
      text:
          "Oh, you're on! Bring it on! I'll have extra napkins ready for the drool factor.",
      unread: true),
  Message(
      sender: currentUser,
      time: '03:40 PM',
      text:
          "Deal! And maybe we can finally settle that age-old debate about which pizza place has the best pepperoni once and for all.",
      unread: true),
  Message(
      sender: tony,
      time: '03:39 PM',
      text:
          "Now you're talking! But seriously, just grab lunch with me next week, my treat. We haven't caught up in ages.",
      unread: true),
  Message(
      sender: currentUser,
      time: '03:38 PM',
      text:
          "You name it, buddy. Speaking of, how about I buy you that you've been eyeing at the shop? To make it even?",
      unread: true),
  Message(
      sender: currentUser,
      time: '03:38 PM',
      text: "Ha! True story.",
      unread: true),
  Message(
      sender: tony,
      time: '03:37 PM',
      text:
          "No worries, Jemal! That's what friends are for.  Besides, you'd do the same for me, right? Remember when I needed help [fixing a flat tire] on that camping trip? You were up on that spare like a NASCAR pit crew.",
      unread: true),
  Message(
      sender: currentUser,
      time: '03:34 PM',
      text:
          'Thank you very much, i owe you one buddy! That was a lifesaver. My backyard looked like a jungle, and I was about to resort to sheep grazing.',
      unread: true),
];
