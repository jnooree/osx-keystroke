/*
 * This code is originated from https://apple.stackexchange.com/a/289046.
 * Modified slightly by @jnooree.
 *
 * Licensed under CC-BY-SA 3.0 Unported.
 */

#include <CoreGraphics/CoreGraphics.h>
#include <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
  @autoreleasepool {
    CGEventRef keyEvent = CGEventCreateKeyboardEvent(nil, 0, true);
    unichar uChars[20];

    for (int argi = 1; argi < argc; argi++) {
      const NSString *theString = [NSString stringWithUTF8String:argv[argi]];
      const NSUInteger len = [theString length];
      NSUInteger n, i = 0;

      while (i < len) {
        n = i + 20;
        if (n > len)
          n = len;

        [theString getCharacters:uChars range:NSMakeRange(i, n - i)];
        CGEventKeyboardSetUnicodeString(keyEvent, n - i, uChars);
        CGEventPost(kCGHIDEventTap, keyEvent); // key down
        CGEventSetType(keyEvent, kCGEventKeyUp);
        CGEventPost(kCGHIDEventTap, keyEvent); // key up
        CGEventSetType(keyEvent, kCGEventKeyDown);
        i = n;

        // wait 4/1000 of second, 0.002 it's OK on my computer, I use
        // 0.004 to be safe, increase it if you still have issues
        [NSThread sleepForTimeInterval:0.004];
      }
    }

    CFRelease(keyEvent);
  }
}
