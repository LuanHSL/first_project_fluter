import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/difficulty.dart';

class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int difficulty;
  const Task(this.name, this.photo, this.difficulty, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  int step = 0;

  setColors() {
    final colorStepList = [
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.red,
      Colors.purpleAccent,
      Colors.black,
    ];

    if (step > colorStepList.length - 1) {
      return colorStepList.last;
    }
    return colorStepList[step];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: setColors(),
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          widget.photo,
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
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        Difficulty(difficultyLevel: widget.difficulty,),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: setColors(),
                            ),
                            onPressed: () {
                              setState(() {
                                if (level < (widget.difficulty * 10)) {
                                  level++;
                                } else {
                                  level = 1;
                                  step++;
                                }
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Icon(Icons.arrow_drop_up),
                                Text('UP', style: TextStyle(fontSize: 12),),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: (widget.difficulty > 0) ? (level / widget.difficulty) / 10 : 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Level: $level',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
