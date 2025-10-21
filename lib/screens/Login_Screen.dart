// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: Colors.blue.shade50,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Column(
//               children: [
//                 // Custom Back Button with better design
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     margin: const EdgeInsets.only(bottom: 20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 8,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_back, color: Colors.blue.shade700),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: size.height * 0.1),

//                 // Welcome Section with improved design
//                 FadeInWidget(
//                   delay: const Duration(milliseconds: 300),
//                   child: Column(
//                     children: [
//                       Container(
//                         width: 80,
//                         height: 80,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.blue.shade200.withOpacity(0.3),
//                               blurRadius: 15,
//                               offset: const Offset(0, 5),
//                             ),
//                           ],
//                         ),
//                         child: Icon(
//                           Icons.lock_person,
//                           size: 40,
//                           color: Colors.blue.shade700,
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       Text(
//                         'Welcome Back!',
//                         style: TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue.shade900,
//                           letterSpacing: -0.5,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         'Sign in to continue your journey',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.blue.shade600,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 60),

//                 // Main Google Sign In Button with improved design
//                 FadeInWidget(
//                   delay: const Duration(milliseconds: 500),
//                   child: _buildGoogleSignInButton(context),
//                 ),

//                 const SizedBox(height: 20),

//                 // Divider with "or" text
//                 FadeInWidget(
//                   delay: const Duration(milliseconds: 600),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: Colors.grey.shade400,
//                           thickness: 1,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: Text(
//                           'or',
//                           style: TextStyle(
//                             color: Colors.grey.shade600,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Divider(
//                           color: Colors.grey.shade400,
//                           thickness: 1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Alternative Sign In Options
//                 FadeInWidget(
//                   delay: const Duration(milliseconds: 700),
//                   child: _buildAlternativeSignInOptions(context),
//                 ),

//                 const SizedBox(height: 40),

//                 // Terms and Conditions with improved styling
//                 FadeInWidget(
//                   delay: const Duration(milliseconds: 900),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey.shade600,
//                               height: 1.5,
//                             ),
//                             children: [
//                               const TextSpan(
//                                 text: 'By continuing, you agree to our ',
//                               ),
//                               TextSpan(
//                                 text: 'Terms of Service',
//                                 style: TextStyle(
//                                   color: Colors.blue.shade700,
//                                   fontWeight: FontWeight.w600,
//                                   decoration: TextDecoration.underline,
//                                 ),
//                               ),
//                               const TextSpan(text: ' and '),
//                               TextSpan(
//                                 text: 'Privacy Policy',
//                                 style: TextStyle(
//                                   color: Colors.blue.shade700,
//                                   fontWeight: FontWeight.w600,
//                                   decoration: TextDecoration.underline,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       // Additional info
//                       Text(
//                         'Your privacy and security are important to us',
//                         style: TextStyle(
//                           fontSize: 10,
//                           color: Colors.grey.shade500,
//                           fontStyle: FontStyle.italic,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Guest Option
//                 FadeInWidget(
//                   delay: const Duration(milliseconds: 1000),
//                   child: TextButton(
//                     onPressed: () {
//                       _handleGuestLogin(context);
//                     },
//                     child: Text(
//                       'Continue as Guest',
//                       style: TextStyle(
//                         color: Colors.blue.shade700,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildGoogleSignInButton(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 56,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [Colors.white, Colors.grey.shade50],
//         ),
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 12,
//             offset: const Offset(0, 4),
//           ),
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//         border: Border.all(color: Colors.grey.shade300, width: 1.5),
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(16),
//           onTap: () {
//             _handleGoogleSignIn(context);
//           },
//           onHover: (hovering) {
//             // Hover effect can be implemented here
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Google icon with better styling
//               Container(
//                 width: 28,
//                 height: 28,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(
//                       'https://cdn-icons-png.flaticon.com/512/2991/2991148.png',
//                     ),
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Text(
//                 'Sign in with Google',
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey.shade800,
//                   letterSpacing: -0.2,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildAlternativeSignInOptions(BuildContext context) {
//     return Column(
//       children: [
//         // Email option
//         Container(
//           width: double.infinity,
//           height: 50,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: Colors.grey.shade300),
//           ),
//           child: Material(
//             color: Colors.transparent,
//             child: InkWell(
//               borderRadius: BorderRadius.circular(12),
//               onTap: () {
//                 _showEmailLoginOption(context);
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.email_outlined,
//                     color: Colors.blue.shade700,
//                     size: 20,
//                   ),
//                   const SizedBox(width: 12),
//                   Text(
//                     'Continue with Email',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.grey.shade800,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 12),

//         // Phone option
//         Container(
//           width: double.infinity,
//           height: 50,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: Colors.grey.shade300),
//           ),
//           child: Material(
//             color: Colors.transparent,
//             child: InkWell(
//               borderRadius: BorderRadius.circular(12),
//               onTap: () {
//                 _showPhoneLoginOption(context);
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.phone_android_outlined,
//                     color: Colors.blue.shade700,
//                     size: 20,
//                   ),
//                   const SizedBox(width: 12),
//                   Text(
//                     'Continue with Phone',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.grey.shade800,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _handleGoogleSignIn(BuildContext context) {
//     // Show beautiful loading dialog
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           child: Container(
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.2),
//                   blurRadius: 20,
//                   offset: const Offset(0, 10),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                   strokeWidth: 3,
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   'Signing in with Google...',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.grey.shade700,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );

//     // Simulate Google Sign In process
//     Future.delayed(const Duration(seconds: 2), () {
//       // Remove loading indicator
//       Navigator.pop(context);

//       // Navigate to home screen after successful login
//       Navigator.pushReplacementNamed(context, '/home');

//       // Show beautiful success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Row(
//             children: [
//               Icon(Icons.check_circle, color: Colors.white, size: 20),
//               const SizedBox(width: 8),
//               const Expanded(
//                 child: Text('Successfully signed in with Google!'),
//               ),
//             ],
//           ),
//           backgroundColor: Colors.green.shade600,
//           behavior: SnackBarBehavior.floating,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           duration: const Duration(seconds: 3),
//         ),
//       );
//     });
//   }

//   void _handleGuestLogin(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             'Continue as Guest?',
//             style: TextStyle(
//               color: Colors.blue.shade800,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           content: Text(
//             'You can always sign in later to access all features and sync your data.',
//             style: TextStyle(color: Colors.grey.shade700),
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.grey.shade600),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 Navigator.pushReplacementNamed(context, '/home');
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue.shade600,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text(
//                 'Continue',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showEmailLoginOption(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: const Text('Email login option coming soon!'),
//         backgroundColor: Colors.blue.shade600,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//     );
//   }

//   void _showPhoneLoginOption(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: const Text('Phone login option coming soon!'),
//         backgroundColor: Colors.blue.shade600,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//     );
//   }
// }

// // FadeInWidget class remains the same
// class FadeInWidget extends StatefulWidget {
//   final Widget child;
//   final Duration delay;

//   const FadeInWidget({
//     super.key,
//     required this.child,
//     this.delay = Duration.zero,
//   });

//   @override
//   _FadeInWidgetState createState() => _FadeInWidgetState();
// }

// class _FadeInWidgetState extends State<FadeInWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
//     Future.delayed(widget.delay, () {
//       if (mounted) {
//         _controller.forward();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(opacity: _animation, child: widget.child);
//   }
// }
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Custom Back Button with better design
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.blue.shade700),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.05),

                // Welcome Section with improved design
                FadeInWidget(
                  delay: const Duration(milliseconds: 300),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade200.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.lock_person,
                          size: 40,
                          color: Colors.blue.shade700,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Sign in to continue your journey',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Email and Password Form
                FadeInWidget(
                  delay: const Duration(milliseconds: 500),
                  child: _buildEmailPasswordForm(),
                ),

                const SizedBox(height: 20),

                // Forgot Password
                FadeInWidget(
                  delay: const Duration(milliseconds: 600),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        _handleForgotPassword(context);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Sign In Button
                FadeInWidget(
                  delay: const Duration(milliseconds: 700),
                  child: _buildSignInButton(context),
                ),

                const SizedBox(height: 30),

                // Divider with "or" text
                FadeInWidget(
                  delay: const Duration(milliseconds: 800),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade400,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'or',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade400,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Google Sign In Button
                FadeInWidget(
                  delay: const Duration(milliseconds: 900),
                  child: _buildGoogleSignInButton(context),
                ),

                const SizedBox(height: 40),

                // Terms and Conditions with improved styling
                FadeInWidget(
                  delay: const Duration(milliseconds: 1000),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                              height: 1.5,
                            ),
                            children: [
                              const TextSpan(
                                text: 'By continuing, you agree to our ',
                              ),
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Additional info
                      Text(
                        'Your privacy and security are important to us',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Guest Option
                FadeInWidget(
                  delay: const Duration(milliseconds: 1100),
                  child: TextButton(
                    onPressed: () {
                      _handleGuestLogin(context);
                    },
                    child: Text(
                      'Continue as Guest',
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailPasswordForm() {
    return Column(
      children: [
        // Email Field
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.grey.shade600),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.blue.shade700,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
          ),
        ),

        const SizedBox(height: 16),

        // Password Field
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.grey.shade600),
              prefixIcon: Icon(Icons.lock_outline, color: Colors.blue.shade700),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.visibility_outlined,
                  color: Colors.grey.shade500,
                ),
                onPressed: () {
                  // Toggle password visibility
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            obscureText: true,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade600, Colors.blue.shade800],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade300.withOpacity(0.4),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            _handleEmailSignIn(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.login, color: Colors.white, size: 20),
              const SizedBox(width: 12),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Colors.grey.shade50],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            _handleGoogleSignIn(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Google icon with better styling
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://drive.google.com/uc?export=view&id=1PN2VDmdS_1NPzFYwGpBGfyiCsIqwWIeV',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleEmailSignIn(BuildContext context) {
    // Show beautiful loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  strokeWidth: 3,
                ),
                const SizedBox(height: 16),
                Text(
                  'Signing in...',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    // Simulate email sign in process
    Future.delayed(const Duration(seconds: 2), () {
      // Remove loading indicator
      Navigator.pop(context);

      // Navigate to home screen after successful login
      Navigator.pushReplacementNamed(context, '/home');

      // Show beautiful success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              const Expanded(child: Text('Successfully signed in!')),
            ],
          ),
          backgroundColor: Colors.green.shade600,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    });
  }

  void _handleGoogleSignIn(BuildContext context) {
    // Show beautiful loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  strokeWidth: 3,
                ),
                const SizedBox(height: 16),
                Text(
                  'Signing in with Google...',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    // Simulate Google Sign In process
    Future.delayed(const Duration(seconds: 2), () {
      // Remove loading indicator
      Navigator.pop(context);

      // Navigate to home screen after successful login
      Navigator.pushReplacementNamed(context, '/home');

      // Show beautiful success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              const Expanded(
                child: Text('Successfully signed in with Google!'),
              ),
            ],
          ),
          backgroundColor: Colors.green.shade600,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    });
  }

  void _handleForgotPassword(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Password reset feature coming soon!'),
        backgroundColor: Colors.blue.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _handleGuestLogin(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Continue as Guest?',
            style: TextStyle(
              color: Colors.blue.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'You can always sign in later to access all features and sync your data.',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

// FadeInWidget class remains the same
class FadeInWidget extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const FadeInWidget({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  _FadeInWidgetState createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
