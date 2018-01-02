# IOS-Integration-App
Basically, this app will compute:
∫_p^q▒f(x)dx
But assuming the polynomial f(x) is third degree polynomial f(x) = ax3+bx2+cx+d.
The coefficients a, b, c, and d can be zero, positive or negative.

Once you start the app, the cursor will be in the text field corresponding to the value of a and the keyboard is ready to enter the value. When the user enters the correct required values, and adjusts the accuracy of how many trapezoids are used to approximate (1-50), they keyboard will then disappear. Once you push the integrate button, a label will show up on the screen indicating the value of the integral. 
All values that are entered will be in floating point, and it will verify their correctness. It is possible that white spaces may precede a value entered or even follow it. In this case, whitespaces must be ignored when youintegrate. It is also possible that an invalid entry shows up in the text field or no entry at all, if so a pop-up alert error message should indicate that an invalid entry was provide and the integral will not be approximated.
