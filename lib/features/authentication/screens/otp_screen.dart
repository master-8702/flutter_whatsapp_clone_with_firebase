import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_whatsapp_clone_with_firebase/features/authentication/controller/auth_controller.dart';

class OTPScreen extends ConsumerStatefulWidget {
  final String verificationId;

  const OTPScreen({super.key, required this.verificationId});

  @override
  ConsumerState<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends ConsumerState<OTPScreen> {
  void verifyOTP(BuildContext context, WidgetRef ref, String otp) async {
    ref
        .read(authControllerProvider)
        .verifyOTP(context, widget.verificationId, otp);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Verify your number',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text('We have sent an SMS with a code'),
                SizedBox(
                  width: size.width * 0.5,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        hintText: '- - - - - ',
                        hintStyle: TextStyle(fontSize: 30)),
                    onChanged: (value) {
                      if (value.length == 6) {
                       
                        verifyOTP(context, ref, value.trim());
                      }
                      
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
