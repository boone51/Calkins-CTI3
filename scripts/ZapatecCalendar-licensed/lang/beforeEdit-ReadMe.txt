01/19/2009
G. LaPinsky
Note on Zapatec calendar language files.

Pay attention to the encoding that is specified at the top of the Zapatec calendar language files.

For example the norwegian language file, calendar-no.js, specifies it was utf-8 encoded as per the following comments:
    // Calendar NO language
    // Author: Daniel Holmen, <daniel.holmen@ciber.no>
    // Encoding: UTF-8


I ran into a problem where the Norwegian language file had been edited (see source safe version v2) and it caused the file to produce a javascript error (ie untermintated string in the lines of code that had been modidified) and therefore not work in my test scenario. If the file was viewed with an editor it did not appear to have an unterminated string so this error was VERY HARD to find. Apparently the file had been modified, but NOT saved as UTF-8 and the resultant file had a mix of encodings (multibyte vs non-multibyte). The calendar-no.js file has been fixed in source safe version v3.

If the file is UTF-8 encoded please make your mods with the file opened as UTF-8 and save with that encoding (or convert everything to a different encoding, but don't mix them).

