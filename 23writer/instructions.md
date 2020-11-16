# Writer

Your task is to write the program `writer.rb` that take 2 command line arguments and perform a task.

The command line arguments come in the form of:

```bash
$ ruby writer.rb option filename
```

Where `option` could be: `write`, `read`, `add`, `size`, `lines_count` or `words_count`.

And `filename` is the name of a text file (for example `test.txt`).

When `option` is `write`:

- `puts` the text "Ready to write to file [filename]. Input ':end' to exit."
- Let the user write as many lines of text they like.
- When the user input `:exit`, take all the previously input text and write it into the file named `filename`. This action override the previous content of the file if it already exists.

When `option` is `read`:

- `puts` the file content.

When `option` is `add`:

- `puts` the text "Ready to write to file [filename]. Input ':end' to exit."
- Let the user write as many lines of text they like.
- When the user input `:exit`, take all the previously input text and write it into the file named `filename`. This action shouldn't override the previous content of the file but add it as new lines.

When `option` is `size`:

- `puts` "[filename] size: [size] bytes"

When `option` is `lines_count`:

- `puts` "[filename] has [number of lines] lines"

When `option` is `words_count`:

- `puts` "[filename] has [number of words] words"

You should use the `Document` class created on the previous exercise. Require it with `require_relative`.
