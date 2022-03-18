import 'package:flutter/material.dart';

class AdditionalInformationCard extends StatelessWidget {
  const AdditionalInformationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 170,
        child: Row(
          children: [
            Container(
              width: 10,
              color: const Color.fromRGBO(
                2,
                39,
                108,
                1,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(
                  10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Additional Information',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      color: Colors.grey[500],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Terms Of Payment: 3 Days',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      'Special Instruction / Remarks:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Special Instruction HJASKDHASD iqwueiwqe kasjd qwoiueuwiq ogfklg skdjkskj iuereiu tiurin kdjfjkfdkjd jrieur sdhjsh jdhshjs hjsdywe ueue iwiw usjdjd sjsj wuwuew hfhhhd ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
