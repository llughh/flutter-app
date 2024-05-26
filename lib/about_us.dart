import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   child: Text('Home'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.green,
            //   ),
            // ),
            // SizedBox(height: 20),
            Text(
              'About US',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nullam dignissim vestibulum tortor vel convallis. Integer congue justo ut tellus placerat, eget ullamcorper velit rutrum. Integer orci orci, ut nulla consequat ullamcorper sit amet nec tortor. Nunc scelerisque, mi id fringilla consectetur, felis arcu semper metus, in pulvinar odio tortor vel justo. Vivamus blandit ipsum at massa scelerisque, ut sodales.',
            ),
            SizedBox(height: 20),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Sed et aliquam mi. Quisque sodales, dolor id facilisis faucibus, leo justo suscipit felis, non mattis risus lacus non libero. Vivamus ornare tortor vitae justo tristique, nec hendrerit enim lobortis. Fusce ac nulla nec velit convallis consequat id id libero.',
            ),
            SizedBox(height: 20),
            Text(
              '¿Cuándo llevaremos vuestras leyes al congreso?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sed fermentum convallis massa, id rutrum magna aliquet a. Etiam ultrices ipsum at mauris pellentesque, sit amet fermentum mi convallis. Sed et lorem consequat, consequat odio sed, condimentum enim.',
            ),
            SizedBox(height: 20),
            Text(
              'Maecenas tempor turpis vitae arcu blandit congue. Sed interdum dolor quis felis tincidunt condimentum.',
            ),
            Spacer(),
            Container(
              color: Colors.green,
              height: 50,
              child: Center(
                child: Text(
                  'ads',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
