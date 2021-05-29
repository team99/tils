# Finding Out the Most Used Commands

If we wanna know which commands we run often, we can use the following commands.

```bash
history | awk '{print $2}' | sort | uniq -c | sort -rn | head.
```

To see which flag of the command did what, check out [explainshell.com](https://explainshell.com/)

[https://explainshell.com/explain?cmd=history+%7C+awk+%27%7Bprint+%242%7D%27+%7C+sort+%7C+uniq+-c+%7C+sort+-rn+%7C+head](https://explainshell.com/explain?cmd=history+%7C+awk+%27%7Bprint+%242%7D%27+%7C+sort+%7C+uniq+-c+%7C+sort+-rn+%7C+head)
