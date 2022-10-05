find & replace with &amp;
replace `\n{3,} `with `\n\n`

Use regex: `( ){2,}` to remove multiple consecutive space characters to leave only single spaces. replace with `_` single space character, represented as an underline here. turns all spaces of two or more into a single space character. capture group used for readability.

find `^ +` and replace with `` the empty string

search for `(.+(\n?))*` and replace with `<p>\n\0</p>\n`manually tab the last p tag. and manually delete the first 6 tags

replace `^\s*([ICDVMXL]{1,6}\..+)` with `<title>\1</title>`

next turn on 'dot matches all and input the regex' `".+?"` and replace it with `<quote>\0</quote>` keep dot matches all on for now.