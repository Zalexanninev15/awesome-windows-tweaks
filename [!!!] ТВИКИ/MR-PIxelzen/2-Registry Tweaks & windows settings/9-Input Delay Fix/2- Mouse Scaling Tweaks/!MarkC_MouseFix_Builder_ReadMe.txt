The MarkC Windows 10 & 8.1 & 8 & 7 & Vista & XP Mouse Acceleration Fix Builder
==============================================================================

http://donewmouseaccel.blogspot.com/2010/04/markc-mouse-acceleration-fix-builder.html

WHAT IS IT?

It is a VBS script program that creates a registry .REG file that removes
Windows' mouse acceleration, or emulates Windows 2000 or Windows 9X acceleration.

Fix Builder can build .REG files for Windows 10 or 8.1 or 8 or 7 or Vista or XP.

The registry fix created works like the CPL and Cheese and MarkC fixes,
but is customized for your specific desktop display text size (DPI),
your specific mouse pointer speed slider setting, your specific refresh rate
and has any in-game pointer scaling/sensitivity factor you want (see note).

Fix Builder can create a fix that emulates Windows 2000 or Windows 9X acceleration.

WARNING:
 On Windows 10 x64, when using fixes that emulate Windows 2000 or Windows 9X 
 acceleration, only fixes with a single threshold can be used.
 Using a 2 threshold emulation fix will cause BugChecks / Blue Screen of Death (BSOD)!

For older games that turn acceleration on, it gives the same response as position
6/11 does (1-to-1), without having to move the pointer speed slider to 6/11.
(Yeah, I know : "Whoop-de-do...")

Exactly 1-to-1 means no discarded or delayed mouse input while game playing.

Other Registry fixes need the pointer speed slider set to 6/11 (middle) to get
exactly 1-to-1 in-game mouse to pointer response, but this script can create 
a registry fix that gives exact 1-to-1 in-game response for non-6/11 settings.

Other registry fixes only provide files for some pre-defined display DPI
values: 100%, 125%..., but this script can create a fix for any DPI setting.

The Cheese registry fixes only provides files for some pre-defined monitor
refresh rate values: 60Hz, 70Hz, but this script can create a fix for any
refresh rate setting.

This script can create a fix with any in-game mouse-to-pointer scaling factor
you want (see note).

NOTE: ALL registry based mouse fixes, INCLUDING this one, ONLY work when the
Control Panel > Mouse > 'Enhance pointer precision' option is ON (OR when an
older game forces 'Enhance pointer precision' to ON), AND your game does not
use DirectInput and does not use Raw Input for mouse input.


EH? WHAT IS IT AGAIN?

A mostly pointless sledgehammer solution to the problem of having to change
your Control Panel > Mouse > pointer speed slider to 6/11 before you play an
older game that needs a registry fix so you can avoid at most a single pixel
of discarded or delayed mouse input while game playing...

A way to emulate Windows 2000 or Windows 9X acceleration.

An interesting programming exercise!


HOW DO YOU USE IT?

- In Windows Explorer, double-click MarkC_Windows_10+8+7+Vista+XP_MouseFix_Builder.vbs,
  or double-click MarkC_Windows_10+8+7+Vista+XP_MouseFix_Builder.CMD.

- Verify or edit the suggested settings, clicking OK as you go.

- Add/Merge the created fix to the registry.
  (See below for non-Administrator account use.)

- Reboot or Log off to apply the fix (you have to reboot or Log off).

- Enjoy exactly 1-to-1 mouse to pointer response for your custom desktop settings!
  (Or enjoy Windows 2000-like or Windows 9X-like acceleration!)
  (If you applied one of the Windows 2000 or Windows 98/95 Acceleration fixes,
   then 'Enhance pointer precision' must be checked ON to enable it.)


WHY DO YOU NEED A FIX?

Some older games turn Windows mouse acceleration on when you don't want them to.
See for more details:
http://donewmouseaccel.blogspot.com/2010/03/markc-windows-7-mouse-acceleration-fix.html#why

You prefer the mouse acceleration that Windows 2000 or Windows 9X had.


HOW DOES THE FIX WORK?

The current system is queried, and you can change the values and tune the
registry fix file created.

The result is saved to a file and can optionally be imported into the registry.

The script asks for:
- Operating system that the fix will be used for.
- The desktop Control Panel, Display, text size (DPI) that will be used.
- The in-game monitor refresh rate that will be used (XP and Vista only).
- The Control Panel, Mouse, pointer speed slider position that will be used.
- Windows-2000+98+95-style acceleration thresholds (optional).
- The pointer speed scaling (sensitivity) factor for that pointer speed setting.
- Where you want to save the fix to and what name.

It creates a registry .reg file with the settings entered, and
optionally lets you merge / apply it into the registry.


HOW DO YOU KNOW THE FIX IS WORKING?

You can test if it is working by temporarily turning on the 'Enhance
pointer precision' feature and see how the mouse responds.
(NOTE: Unless you applied one of the Windows 2000 or Windows 98/95
 Acceleration fixes, only turn 'Enhance pointer precision' on for
 testing: it should normally be set OFF.)

If you have 'Enhance pointer precision' OFF, then the fix will not be active
(but it will be waiting to be activated when needed).
Just as some games turn it on when you don't want them to, we can turn it on
manually to test that the fix is working properly.

- Go to Control Panel, and select Hardware and Sound, then click Mouse.
  Select 'Pointer options' and check-ON/enable the 'Enhance pointer
  precision' option.

- See how the mouse responds.

- If you want, you can run the MouseMovementRecorder.exe program that is
  included in the ZIP file to see that the mouse and pointer movements are
  1-to-1 and always the same (or are whatever custom scaling you entered).
  (For a 'No acceleration' fix, the numbers in the MOUSE MOVEMENT column 
   should be the same as the numbers in the POINTER MOVEMENT column.
   Any differences will appear in green or red.
   If you do see differences, also test with 'Enhance pointer precision' 
   OFF, in case the problem is with Windows or MouseMovementRecorder.exe 
   rather than a problem with the fix:
   - Press the A key on the keyboard while MouseMovementRecorder is running
     until EnPtPr Accel is Off. Press A TWICE if EnPtPr is already Off!
   - When EnPtPr Accel is OFF, if there is a lot of red and green, press the
     '+' key on the keyboard and move the mouse.
   - Repeat '+' and move the mouse until most of the red and green disappears.
   - Press the A key on the keyboard to toggle EnPtPr Accel and move the mouse.
   - If the amount of red and green is roughly the same when EnPtPr Accel is ON
     as when EnPtPr Accel is Off, then the fix is working.) 
  (NOTE: If you use Windows 10, & scaling of items is not 100%, see below.)
  (NOTE: If you use Windows 8.1 and have too much green and red, see below.)
  (NOTE: While running a game, you may see many red and green lines. Games
   that need a fix usually frequently re-position the pointer and this
   confuses MouseMovementRecorder.exe but DOES NOT mean acceleration.
   See http://www.esreality.com/?a=post&id=1846538#pid1927879)

- If you have built a Windows 2000 or Windows 9X fix, you should see that
  acceleration varies depending upon how fast the mouse is, compared to the
  thresholds, but is linear (a constant sensitivity) between thresholds.
  (NOTE: See file !Threshold_Acceleration_ReadMe.txt for more info.)

- Turn the 'Enhance pointer precision' option OFF when you have finished testing.
  (If you applied one of the Windows 2000 or Windows 98/95 Acceleration fixes,
   then leave 'Enhance pointer precision' checked ON to enable it.)


HOW DO YOU REMOVE IT?

- Open the ZIP file at the link above.
- If you use Windows 7 or Vista or XP:
	Select 'Windows_7+Vista+XP_Default.reg' and Double-click it.
- If you use Windows 8 or Windows 8.1 or Windows 10:
	Select 'Windows_10+8.x_Default.reg' and Double-click it.
- Answer Yes, OK to the prompts that appear.
- Reboot or Log off.


I USE WINDOWS 10 AND SCALING OF TEXT, APPS AND OTHER ITEMS IS NOT 100%

In later versions of Windows 10, Microsoft changed how the mouse pointer
is moved in response to mouse input, when scaling of text, apps and other
items is not 100%, and Enhance pointer precision is OFF.

Mouse pointer movements when Enhance pointer precision is OFF, are now
scaled according to the per-monitor scaling of items setting.

When Enhance pointer precision is OFF, and the Control Panel pointer speed
slider is set to 6/11, MouseMovementRecorder will not show all-black, exact
1-to-1, but instead Pointer Movement will be multiplied by the same scaling
factor applied to text, apps and other items.

Games may also see this difference, or not, depending on their "DPI Awareness".


I USE WINDOWS 8.1 AND SEE TOO MUCH GREEN AND/OR RED IN MouseMovementRecorder

Windows 8.1 introduced changes to mouse input processing to reduce power used 
and improve battery life:
Windows 8.1 delays and coalesces (merges) mouse input for programs, causing 
the effective mouse polling rate to be as low as 62 Hz in some cases (even 
for gaming mice with a higher polling rate).

This new processing can affect some games (games that don't use Raw Input and 
don't use DirectInput). Microsoft have a fix for those games, see here:
http://support.microsoft.com/kb/2908279

The new processing can also affect MouseMovementRecorder and cause it to show 
red and green (with the mouse delays, MouseMovementRecorder sees a mouse movement 
from DirectInput, but doesn't see the pointer move until MUCH MUCH later and 
can't figure out what's going on and displays red and green).

If the KB2908279 update fix is installed, MouseMovementRecorder will activate it
to give more responsive mouse pointer movement and stop the red and green.

Otherwise, while running MouseMovementRecorder, select it and press the '+' key 
on the keyboard a until the red and green stops.

If Control Panel, Appearance and Personalization, Display shows a 'Smaller...Larger' 
slider, high DPI monitors might need a custom size and/or a fix-builder fix to get 
exact 1-to-1.
See this blog article:
http://blogs.windows.com/windows/b/extremewindows/archive/2013/07/15/windows-8-1-dpi-scaling-enhancements.aspx
The new multi-monitor DPI scaling in Windows 8.1 is a good thing if you have multiple
monitors with different pixels-per-inch values, BUT it might make it harder to find 
the correct Item Size percentage when choosing which MarkC fix to use to get exact 1-to-1.
Try clicking the 'Let me choose one scaling level for all my displays' checkbox and 
then find the percentage needed so that your main (gaming) monitor looks the same as 
it did when using the 'Smaller...Larger' slider (this may require some reboots).
When you have the right percentage value, click '...one scaling level...' OFF
(so that you get the benefit of the new Multi-monitor DPI scaling - if you need it)
and use the percentage value to choose which fix you need, or to create a Fix-Builder fix.


LOADING THE FIX WITH A NON-ADMINISTRATOR ACCOUNT

When adding the mouse acceleration fix to the registry, you may get this error message:

"Cannot import (filename).reg: Not all data was successfully written to the registry."

"Part of the mouse acceleration fix can't be applied,
 because you are not logged in as an Administrator."

This error happens because part of the fix turns off acceleration for the
Welcome screen (the log on screen).
If you use the Welcome screen (or the Windows Log in dialog) and acceleration
is NOT turned off for the Welcome screen, then the MarkC fixes have a 1 pixel
/ 1 mouse count error when the mouse changes direction left/right or up/down.

You can remove this 1 mouse count error by any of these methods:

- Run Disable_WelcomeScreen+Login_Accel.CMD as Administrator
  (Right-click > Run as administrator).
- Run MarkC_Windows_10+8+7+Vista+XP_MouseFix_Builder.CMD as Administrator.
- Add/Merge Disable_WelcomeScreen+Login_Accel.reg to the registry
  while logged in as an administrator.
- Run RegEdit.exe and edit 'HKEY_USERS\.DEFAULT\Control Panel\Mouse\MouseSpeed'
  to 0 (zero), while logged in as an administrator.
- Not moving or touching the mouse while using the Welcome screen
  (use arrow keys to select the user and Enter key to log in).
- Ignoring the 1 mouse count error! It's only a single count: You won't notice it.


Credits:
  hoppan and scandalous for debugging and testing,
  jaclaz for wondering if there might be 6 curve points (rather than 5),
  Microsoft for inspiration.

Version 1.4, fix a problem with Vista / Multiple video controllers.
Version 2.0, Create Windows 2000 and earlier 'step-up'/threshold style acceleration curves.
Version 2.1, Windows 8.
Version 2.2, Fix problem with threshold guidance text.
Version 2.3, Windows 8.1
Version 2.4, Windows 10
Version 2.5, Windows 10 pointer movement scaled by DPI