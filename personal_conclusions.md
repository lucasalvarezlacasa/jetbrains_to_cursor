# Conclusions

After two weeks of extensively using Cursor, here's my personal take on the experience:

## Pros

- **Rapid Development**: The auto-completion suggestions are outstanding, significantly speeding up my workflow. Compared to PyCharm, Cursor is much faster to open and work with, eliminating long indexing times entirely.

- **Testing Efficiency**: Cursor has been a huge time saver for unit testing tasks. It considerably reduced the manual effort required, even though I still needed to fine-tune some generated tests for the best outcomes. I'm confident that, with better-defined rules, this aspect can improve further.

- **Learning and Mastery**: Whether it was mastering familiar technologies or quickly picking up new ones, it felt like working alongside someone who had studied every relevant GitHub repo out there. It definitely made my coding experience more enjoyable.

- **Rapid Project Setup & Refactoring**: I think this tool shines when you want to start a new project or manage small to medium size refactors within existing codebases.

- **Powerful Agent Mode**: Agent mode is fantastic—it executes commands, performs web searches, reviews documentation, debugs issues, and runs linters seamlessly. It genuinely feels like having a highly capable assistant embedded right in the IDE.

- **Flexible Input with Screenshots**: Being able to upload screenshots directly into the chat panel made troubleshooting visual issues or copying UI designs super convenient.

- For complex problems, using `claude-3.7-sonnet-thinking` typically gave me better results.

- **Customization with Rules**: Cursor rules enable precise guidance and constraint management, optimizing the IDE's performance for specific workflows. Without them, the Agent can drift apart and try to perform modifications or refactors on places where is not needed.

- **Ask Mode**: This mode is super helpful for understanding code you haven't produced or for catching up very quickly in a new project. Maybe you don't want to use the Agent mode, you want to discuss how to improve a solution or start developing a new feature. I highly recommend it.

## Cons

- **Initial Learning Curve**: Transitioning from PyCharm to Cursor (a fork of VSCode on steroids) wasn't seamless. The initial days felt frustrating, and there were moments I was lost trying to find my usual workflow. However, once past that initial learning curve, it became difficult to imagine going back.

- **Context is Everything**: The models heavily depend on the context you provide. Without the correct context, suggestions quickly become less helpful, so learning how to properly set up your context becomes critical.

- **Struggles with Large Codebases**: I noticed that Cursor's performance noticeably declines as the codebase grows larger. Finding and accurately modifying specific parts of the code can become increasingly challenging in these scenarios. Same thing happens with code refactors.

- **Knowing When to Reset Context**: Extensive contexts can negatively impact models performance. Recognizing the right moment to start a new chat to maintain efficiency becomes an important skill.

# Additional Notes

At the end of the day, Cursor remains a tool—it won't entirely replace a human (at least for now). It's great for [vibe coding](https://en.wikipedia.org/wiki/Vibe_coding) when you just want to relax or quickly prototype something fun over the weekend. Yet, for professional projects requiring readability, clarity, and maintainability, human intervention and oversight remain crucial.

Overall, Cursor has significantly boosted my productivity and workflow efficiency. Despite some initial hiccups and a few limitations, the benefits far outweigh the downsides. I'm genuinely excited to keep exploring and refining how I use Cursor.
