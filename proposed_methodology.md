# Methodology (Proposed)

We will be encoding in pursuit of two different things about each story:

The first is the _agency_ of a given character, as measured by the amount 
of actions they perform and the amount of words they say. This will be 
measured by:
* Searching and tagging all characters in the story, including Holmes, 
Watson, and other repeat characters, by searching for all instances of their names. Tag name TBA at Rory’s convenience, but something like `<char>` with attributes denoting their FULL NAME and GENDER.
* Identifying nicknames/allusions for these characters (i.e. “The Woman” 
or “the Doctor”) and finding all of those with regex, tagging them with 
the same character tag and attributes as above
* Searching all he/she/they etc, figuring out who the pronoun refers to, 
and tagging it with the character tag if the sentence should be included 
in our data (ie we don’t necessarily want a sentence that says “she had 
brown hair” because that’s descriptive and not active)

The second is the _alignment_ of a character, as decided by their overall 
behavior in the story. Are they with or against Sherlock when all is said 
and done?
* Each character with a character tag in the text should have a section in the header/metadata section of the text. This metadata will encode who they are and their alignment as decided by the reader, in a style to be decided by Sean.

Finally, the text should have structural tagging for paragraphs, titles, chapters, and quotes.












