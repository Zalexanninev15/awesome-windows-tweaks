The MarkC Windows Mouse Acceleration Fix Builder can create a fix that 
emulates Windows 2000 or Windows 98 or Windows 95 acceleration.

This ReadMe file gives guidance on how to choose the acceleration zone thresholds, and what to
try if your mouse has a custom polling rate.


HOW DOES MOUSE ACCELERATION WORK ON WINDOWS 2000/98/95?

Prior to Windows XP, mouse acceleration and pointer-speed was calculated using two thresholds.
The thresholds define up to 3 acceleration zones. Each zone has a different pointer-speed factor.
At mouse speeds higher than one mouse-speed threshold the pointer-speed would suddenly double,
and at the next threshold the pointer-speed would suddenly quadruple.

Unlike Windows 10/8.x/7/Vista/XP acceleration (which is continuously, smoothly variable),
acceleration was more predictable for some people, because for mouse speeds between the 
thresholds, pointer response was linear (but doubled or quadrupled).

In Windows 95 and 98, the Windows Control Panel allowed you to set the "mouse speed" and 
acceleration using a 7 position slider.
The Windows 95/98 "mouse speed" slider was not like we have now: it actually set acceleration. 
At the left-most 'Slow' setting, there was no acceleration and pointer response was 1-to-1.
As you moved the slider to the right, acceleration is turned on and the thresholds were changed 
so they cut in earlier.

In Windows 2000, the Windows Control Panel mouse pointer speed was changed.
The existing acceleration was moved from the 95/98 slider to a new 'Acceleration' section, with 
4 option buttons: None, Low, Medium, High. The new replacement pointer speed slider was an 11 
position slider which did actually control speed only.


CAN A REGISTRY MOUSE FIX ON WINDOWS 10/8.x/7/VISTA/XP EMULATE WINDOWS 2000/98/95 MOUSE ACCELERATION?

Yes, a registry mouse fix on Windows 10/8.x/7/Vista/XP can reasonably closely emulate Windows 2000/98/95 mouse acceleration.

A Windows 10/8.x/7/Vista/XP 'Smooth' acceleration curve can be made that is not smooth, but has 
sudden speed step-ups, just like Windows 2000/98/95 has.
(Using sneaky tricks, even a 3 acceleration zone curve with 2 step-up thresholds can be built...)

WARNING:
 On Windows 10 x64, when using fixes that emulate Windows 2000 or Windows 9X 
 acceleration, only fixes with a single threshold can be used.
 Using a 2 threshold emulation fix will cause BugChecks / Blue Screen of Death (BSOD)!

There are some differences between how Windows 10/8.x/7/Vista/XP with a registry mouse fix behaves, 
compared to Windows 2000/98/95 (see below).


BUILD YOUR OWN THRESHOLD ACCELERATION FIX!

You can build a fix with your own custom thresholds, and your own custom pointer-speed factors.
For example, a fix where the highest pointer-speed factor is × 3.0 (rather than × 4.0).
Or set the thresholds higher than standard, or lower than standard.

Experiment until you find a fix that is just right for you.


DIFFERENT MOUSE UPDATE/POLLING RATES

A standard USB mouse sends movement data 125 times a second.
Some gaming mice can send movement data 250, 500, or 1000 times a second, and there are programs 
that can change the polling rate for any USB mouse.

If your current mouse has a different update rate than the mouse you used with your old version of 
Windows, then you will need a custom registry mouse fix to emulate Windows 2000/98/95 acceleration.

If your new mouse can be set to a higher DPI (resolution) than your old mouse, THEN it should be 
possible to create a custom fix that closely matches the old mouse on the old Windows:

- Calculate dpi_factor = new_mouse_update_rate / old_mouse_update_rate
  (e.g., for a new 1000Hz gaming mouse and an old 125Hz mouse, dpi_factor = 1000/125 = 8)
- Set your new mouse resolution (DPI) to : dpi_factor × old_mouse_DPI
  (e.g., for an old 400 DPI mouse, set the new mouse to 8 × 400 = 3200 DPI)
- Calculate scaling = old_mouse_DPI / new_mouse_DPI
  (e.g. scaling = 400 / 3200 = 0.125)
- Build a custom fix, and when first asked for 'Pointer speed scaling ... when the pointer is not accelerated',
  calculate and enter scaling
  (e.g. 1/8 = 0.125 so enter 0.125 when first asked for 'Pointer Speed Scaling')
- When next asked for 'Pointer speed scaling ... when the mouse is faster than ...', accept the automatic values.
  (e.g. Accept 0.25 and then accept 0.5, which correspond to 0.125×2 and 0.125×4)

If you can't set your new mouse DPI high enough to use the suggestion above, then possibly adjusted thresholds
might give vaguely similar response:

- Set your new mouse resolution (DPI) to as close as : dpi_factor × old_mouse_resolution as you can
- Calculate scaling = old_mouse_DPI / new_mouse_DPI
  (e.g. for an old 400 DPI mouse, and a new mouse that can use 1600 DPI, scaling = 400 / 1600 = 0.25)
- Calculate threshold_factor = new_mouse_DPI / (dpi_factor × old_mouse_DPI)
  (e.g. threshold_factor = 1600 / (8 × 400) = 1600 / 3200 = 0.5
- Build a custom fix, and when first asked for 'Pointer speed scaling ... when the pointer is not accelerated',
  calculate and enter the scaling value
  (e.g. Enter 0.25 when first asked for 'Pointer Speed Scaling')
- When asked to 'Enter ... acceleration threshold', take the threshold displayed by the fix builder
  and calculate : threshold × threshold_factor, round up and use that value instead
  (e.g. Windows 2000 Low accel has threshold=7, 7×0.5 = 3.5, round up to 4 and enter 4)
- When next asked for 'Pointer speed scaling ... when the mouse is faster than ...', accept the automatic values.
  (e.g. Accept 0.5 and then accept 1, which correspond to 0.25×2 and 0.25×4)


MOUSE MOVEMENTS THAT ARE DIAGONAL OR AT AN ANGLE

For the default fix builder fixes, acceleration will most closely match your old version of 
Windows for movements that are mainly horizontal or mainly vertical.
If your mouse movements are often diagonal or at an angle, then the thresholds may need to be 
increased by 10% to 30% before mouse response will be similar.

This is because of differences in how Windows 10/8.x/7/Vista/XP and Windows 2000/98/95 compare the 
mouse speed to the thresholds.

In Windows 2000/98/95, each movement axis (X/Y) is compared separately, and has its own 
pointer-speed factor applied.
If X_Movement > threshold then use higher speed-factor for X; otherwise use lower speed-factor for X.
If Y_Movement > threshold then use higher speed-factor for Y; otherwise use lower speed-factor for Y.

In Windows 10/8.x/7/Vista/XP, the X axis and Y axis movements are combined, and both have the same 
pointer-speed factor applied.
(Very approximately)
If X_Movement + Y_Movement/2 >= threshold+1 then use higher speed-factor; otherwise use lower speed-factor.

Examples for a threshold of 7:
For Windows 2000/98/95:
	X	Y	X factor	Y factor
	6	3	× 1.0   	× 1.0
	6	4	× 1.0   	× 1.0
	7	1	× 1.0   	× 1.0
	7	2	× 1.0   	× 1.0
	8	1	× 2.0   	× 1.0
	8	2	× 2.0   	× 1.0
	10	4	× 2.0   	× 1.0
For Windows 10/8.x/7/Vista/XP:
	X	Y	X factor	Y factor
	6	3	× 1.0   	× 1.0
	6	4	× 2.0   	× 2.0
	7	1	× 1.0   	× 1.0
	7	2	× 2.0   	× 2.0
	8	1	× 2.0   	× 2.0
	8	2	× 2.0   	× 2.0
	10	4	× 2.0   	× 2.0
(Note that for these at-an-angle movements, Windows 10/8.x/7/Vista/XP generally uses higher speed-factors.)

If the threshold is increased to 8, then examples for Windows 10/8.x/7/Vista/XP:
	X	Y	X factor	Y factor
	6	3	× 1.0   	× 1.0
	6	4	× 1.0   	× 1.0
	7	1	× 1.0   	× 1.0
	7	2	× 1.0   	× 1.0
	8	1	× 1.0   	× 1.0
	8	2	× 2.0   	× 2.0
	10	4	× 2.0   	× 2.0
(Note that for these at-an-angle movements, the speed-factors used are perhaps now closer to Windows 2000/98/95.)


CROSSING A THRESHOLD, AKA TRANSITION STEEPENING

If you sweep your mouse from slow to faster, from 5 counts-per-update to 10 counts-per-update, 
you might cause these mouse counts:
+5 +6 +7 +8 +9 +10

On Windows 2000, Low acceleration, mouse speeds greater than 7 cause doubled pointer movement, 
so the pointer movements would be:
+5 +6 +7 +16 +18 +20

On Windows 10/8.x/7/Vista/XP with a W2K_Low mouse fix, the pointer movements would be:
+5 +6 +7 +12 +18 +20

As the mouse speed transitions over the threshold, the first movement greater than the threshold isn't DOUBLED.
The speed-factor used is an average of the previous zone (×1) and the current zone (×2), or ×1.5.  8×1.5 = 12.

This is normal and expected and GOOD! (Trust me!)

Don't worry about it.


REVERSING DIRECTION LEFT/RIGHT OR UP/DOWN

If you move the mouse in one direction, slow down, stop, and reverse the mouse, you might cause these mouse movements:
+3 +2 +1 -1 -2 -3

On Windows 2000/98/95, the pointer movements would be:
+3 +2 +1 -1 -2 -3

On Windows 10/8.x/7/Vista/XP with a threshold acceleration mouse fix, the pointer movements will sometimes be:
+3 +2 +1 +0 -2 -3

When the mouse reverses direction, a single pointer-pixel will sometimes be missed or discarded.

This sometimes happens, and can't be fixed.
Live with it; it's only a single pixel!