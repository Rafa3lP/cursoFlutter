import 'package:flutter/material.dart';

import 'difficulty.dart';

class Task extends StatefulWidget {
  final String name;
  final String image;
  final int difficultyLevel;

  const Task(this.name, this.image, this.difficultyLevel, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  int maestry = 0;
  Map<int, Color> maestryColors = {
    0: Colors.blue,
    1: Colors.green,
    2: Colors.yellow,
    3: Colors.orange,
    4: Colors.red,
    5: Colors.purple,
    6: Colors.black
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                color: maestryColors[maestry],
                borderRadius: BorderRadius.circular(4)),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 72,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(4)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(widget.name,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      overflow: TextOverflow.ellipsis))),
                          Difficulty(
                            difficultyLevel: widget.difficultyLevel,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                level++;
                                if(level > (widget.difficultyLevel * 10) && maestry < (maestryColors.length - 1)) {
                                  level = 1;
                                  maestry++;
                                }
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  'UP',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )),
                      )
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.difficultyLevel > 0)
                            ? (level / widget.difficultyLevel) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nível: $level',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
