import 'dart:math';

import 'package:flutter/material.dart';

// programing related Facts
// Programming related Facts
final List<String> facts = [
  "JavaScript was created in **only 10 days** in May 1995 by Brendan Eich",
  "JavaScript was originally going to be called 'Mocha', then 'LiveScript'",
  "JavaScript has literally **nothing** to do with Java – it was a marketing trick",
  "typeof null === 'object' is the most famous **bug** in JavaScript history (still unfixed)",
  "[] == ![]  →  **true**  (one of the most cursed JavaScript behaviors)",
  "NaN is the **only** value that isn't equal to itself: NaN !== NaN",
  "0.1 + 0.2 === 0.30000000000000004  →  floating point reality check",
  "JavaScript is prototype-based, not class-based (classes are just syntax sugar)",
  "You can crash most browsers with: while(true) document.body.appendChild(document.createElement('div'))",
  "true + true + true === 3  (because true → 1 when coerced to number)",
  "[] + {}  →  '[object Object]'    but    {} + []  →  0",
  "parseInt('08') used to return **0** in old browsers (thought it was octal)",
  "The shortest valid IIFE in JavaScript is: !function(){}()",
  "JavaScript is currently the **most used** language on GitHub for 10+ years",
  "JSON was created by Douglas Crockford – and he now hates parts of it",
  "typeof /regex/ === 'function' in most browsers (ancient artifact)",
  "JavaScript runs natively in **every** major browser, phone, smart TV, and most game consoles",
  "You can write valid JavaScript code using **only emoji** (with enough hacks)",
  "The famous 'Wat' talk by Gary Bernhardt is legendary JavaScript chaos",
  "'use strict' was added in ES5 (2009) – many devs refused to use it for years",
  "Function is both a function **and** a constructor at the same time",
  "new Date(0).toString() changes depending on your timezone (huge bug source)",
  "Almost every value in JavaScript is an object (primitives auto-box)",
  "alert(), confirm(), prompt() were never part of ECMAScript – browser only",
  "JavaScript was the first mainstream language to popularize async/await",
  "You can still extend built-ins: Array.prototype.pizza = () => '🍕'",
  "document.all is falsy but still truthy in some boolean contexts (old bug)",
  "The original proposal for 'let' was 'let mutable' (thankfully rejected)",
  "JavaScript has **two** equality operators (== vs ===) for very good and very bad reasons",
  "As of late 2025, JavaScript is still the **only** language that truly runs everywhere natively",
];

class FactsLoader extends StatelessWidget {
  const FactsLoader({super.key});

  String getRandomFacts() {
    final randInt = Random.secure().nextInt(facts.length);
    final time = DateTime.now().millisecondsSinceEpoch % facts.length;
    final index = (time + randInt) % facts.length;
    return facts[index];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //   Do you Know Title
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.grey[850]!),
          ),
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(Icons.lightbulb_rounded, color: Colors.grey),
              Text("Do you Know?", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        SizedBox(height: 20),

        //   Fact
        Text(
          getRandomFacts(),
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
