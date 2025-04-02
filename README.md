# 🚀 JetBrains to Cursor: Transition Guide

This documentation provides valuable insights, tips, and workarounds from my personal experience transitioning from [JetBrains PyCharm](https://www.jetbrains.com/pycharm/)—my primary IDE for the past five years—to [Cursor](https://www.cursor.com/). It's designed to help Python developers navigate this shift smoothly while maintaining productivity.

---

## Installation

If you're working on Linux (Ubuntu in my case), I recommend you to follow [this tutorial](https://forum.cursor.com/t/tutorial-install-cursor-permanently-when-appimage-install-didnt-work-on-linux/7712) to install Cursor effectively on your machine.

## 🐍 Setup for Python Developers

Follow these quick setup tips to replicate the PyCharm experience effectively in Cursor:

1. **Install the PyCharm Theme**
   - Get the [PyCharm Theme](https://marketplace.visualstudio.com/items?itemName=nicohlr.pycharm) extension.
   - Choose the **Dark+** mode to maintain visual consistency.
   - If some of the colours are still a bit off, you can always tune via the `settings.json` file.

2. **Install the JetBrains Icon Theme**
    - Get the [JetBrains Icon Theme](https://marketplace.visualstudio.com/items?itemName=chadalen.vscode-jetbrains-icon-theme) extension.
    - Choose the **UI Dark** mode to maintain visual consistency.

3. **Preserve Your Shortcuts**
   - Install the [IntelliJ IDEA Keybindings](https://marketplace.visualstudio.com/items?itemName=k--kato.intellij-idea-keybindings) extension. This keeps most familiar shortcuts from JetBrains.

4. **Install Essential Extensions**
    - **Core Python Support**
        - [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python): Core language support from Microsoft.
        - [Python Debugger](https://marketplace.visualstudio.com/items?itemName=ms-python.debugpy): Enhanced debugging capabilities.
        - [Python Test Explorer for VS Code](https://marketplace.visualstudio.com/items?itemName=LittleFoxTeam.vscode-python-test-adapter): Visual interface for testing. You can run Python tests in the Sidebar of Cursor.
        - [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance): Fast Python language server. Enhanced IntelliSense experience.
    - **Code Quality Tools**
        - [Python Docstring Generator](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring): Generate Python docstrings automatically.
        - [Python Path](https://marketplace.visualstudio.com/items?itemName=mgesbert.python-path): Python import utils.
        - [MagicPython](https://marketplace.visualstudio.com/items?itemName=magicstack.MagicPython): Syntax highlighter for Python.
        - [Black Formatter](https://marketplace.visualstudio.com/items?itemName=ms-python.black-formatter): Formatting support for Python files using [black](https://github.com/psf/black) formatter.
    - **Extra**:
        - [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter): Jupyter notebook support, interactive programming and computing that supports IntelliSense, debugging and more.
        - [vscode-pdf](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf): Display "pdf" files in Cursor.
        - [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint): Markdown linting and style checking for Cursor.
        - [Docker](https://code.visualstudio.com/docs/containers/overview): Build, manage and deploy containerized applications in Cursor.
        - [Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml): Fully-featured TOML support.
        - [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens): Supercharge Git within Cursor. Very useful for being able to generate links from specific lines of code (pointing to the server URL) and so on.

Some additional considerations:

- Use [uv](https://github.com/astral-sh/uv) as a modern Python Package Manager.
- Use [ruff](https://github.com/astral-sh/ruff) as a modern Python linter and formatter.
  - Slightly older but still valid options would be [black](https://github.com/psf/black) as a formatter and [pylint](https://pypi.org/project/pylint/) as linter.
- Use [mypy](https://github.com/python/mypy) for type checking.
- In my case, I run validations via [tox](https://tox.wiki/en/latest/installation.html), but consider running these validations every time you save changes into your files with Cursor.

_More useful recommendations can be found in the following [link](https://docs.cursor.com/guides/languages/python)._

---

## Debugging & Environment Variables

Set up run and debugging configurations. Notice that PyCharm by default will prepend the `PYTHONPATH` to the script execution. This is something we have to configure in Cursor.

- Create `.vscode/launch.json`:

    ```json
    {
        "version": "0.2.0",
        "configurations": [
            {
                "name": "Debug Current Python File",
                "type": "debugpy",
                "request": "launch",
                "program": "${file}",
                "envFile": "${workspaceFolder}/.env",
                "console": "integratedTerminal"
            }
        ]
    }
    ```

- Create an `.env` file in the project's root with your environment variables:

    ```
    PYTHONPATH=path_to_your_project_root
    ```

- Now you can easily run or debug your code with Cursor.

---

## Editor Customization

In case you want to use it as a baseline, this is my fine-tuned [settings.json](./.vscode/settings.json) file. Apart from these, tune the following settings:

- **View Optimization:** Go to `View → Appearance → Align Panel → Left` to optimize your workspace layout. This will make the Terminal panel extend horizontally, as it does in PyCharm.

- **Large context:** For larger projects, go to `Cursor Settings → Features → Large context` and enable it for improved readability.

---

## Cursor Rules

[Rules](https://docs.cursor.com/context/rules-for-ai) are key to customize the behavior of the underlying model. They need to be stored un `.cursor/rules`.

Here are the [rules](./.cursor/rules/python_rules.mcd) I'm currently using for Python.

You're all set! Cursor is now optimized to deliver a smooth, productive experience similar to PyCharm. Happy coding!

## Conclusions

After two weeks of extensively using Cursor, here's my personal take on the experience:

### Pros

- **Rapid Development**: The auto-completion suggestions are outstanding, significantly speeding up my workflow. Compared to PyCharm, Cursor is much faster to open and work with, eliminating long indexing times entirely.

- **Testing Efficiency**: Cursor has been a huge time saver for unit testing tasks. It considerably reduced the manual effort required, even though I still needed to fine-tune some generated tests for the best outcomes. I'm confident that, with better-defined rules, this aspect can improve further.

- **Learning and Mastery**: Whether it was mastering familiar technologies or quickly picking up new ones, it felt like working alongside someone who had studied every relevant GitHub repo out there. It definitely made my coding experience more enjoyable.

- **Rapid Project Setup & Refactoring**: I think this tool shines when you want to start a new project or manage small to medium size refactors within existing codebases.

- **Powerful Agent Mode**: Agent mode is fantastic—it executes commands, performs web searches, reviews documentation, debugs issues, and runs linters seamlessly. It genuinely feels like having a highly capable assistant embedded right in the IDE.

- **Flexible Input with Screenshots**: Being able to upload screenshots directly into the chat panel made troubleshooting visual issues or copying UI designs super convenient.

- For complex problems, using `claude-3.7-sonnet-thinking` typically gave me better results.

- **Customization with Rules**: Cursor rules enable precise guidance and constraint management, optimizing the IDE's performance for specific workflows. Without them, the Agent can drift apart and try to perform modifications or refactors on places where is not needed.

- **Ask Mode**: This mode is super helpful for understanding code you haven't produced or for catching up very quickly in a new project. Maybe you don't want to use the Agent mode, you want to discuss how to improve a solution or start developing a new feature. I highly recommend it.

### Cons

- **Initial Learning Curve**: Transitioning from PyCharm to Cursor (a fork of VSCode on steroids) wasn't seamless. The initial days felt frustrating, and there were moments I was lost trying to find my usual workflow. However, once past that initial learning curve, it became difficult to imagine going back.

- **Context is Everything**: The models heavily depend on the context you provide. Without the correct context, suggestions quickly become less helpful, so learning how to properly set up your context becomes critical.

- **Struggles with Large Codebases**: I noticed that Cursor's performance noticeably declines as the codebase grows larger. Finding and accurately modifying specific parts of the code can become increasingly challenging in these scenarios. Same thing happens with code refactors.

- **Knowing When to Reset Context**: Extensive contexts can negatively impact models performance. Recognizing the right moment to start a new chat to maintain efficiency becomes an important skill.

### Additional Notes

At the end of the day, Cursor remains a tool—it won't entirely replace a human (at least for now). It's great for [vibe coding](https://en.wikipedia.org/wiki/Vibe_coding) when you just want to relax or quickly prototype something fun over the weekend. Yet, for professional projects requiring readability, clarity, and maintainability, human intervention and oversight remain crucial.

Overall, Cursor has significantly boosted my productivity and workflow efficiency. Despite some initial hiccups and a few limitations, the benefits far outweigh the downsides. I'm genuinely excited to keep exploring and refining how I use Cursor.
