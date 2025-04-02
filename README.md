# 🚀 JetBrains to Cursor: Transition Guide

This documentation provides valuable insights, tips, and workarounds from my personal experience transitioning from [JetBrains PyCharm](https://www.jetbrains.com/pycharm/)—my primary IDE for the past five years—to [Cursor](https://www.cursor.com/). It's designed to help Python developers navigate this shift smoothly while maintaining productivity.

---

## Installation

If you're working on Linux (Ubuntu in my case), I recommend you to follow [this tutorial](https://forum.cursor.com/t/tutorial-install-cursor-permanently-when-appimage-install-didnt-work-on-linux/7712) to install Cursor effectively on your machine.

## 🐍 Setup for Python Developers

### One-Click Setup (Recommended)

For the easiest possible setup experience:

1. **Clone this project**

    ```bash
    git clone git@github.com:lucasalvarezlacasa/jetbrains_to_cursor.git
    ```

2. **Run the setup script**

   ```bash
   cd /folder/where/jetbrains_to_cursor/was/cloned
   bash setup.sh --path /path/to/your/project

   # If you use "fish" run:
   # "bass source setup.sh --path /path/to/your/project"
   ```

   This script will:
   - Create all necessary configuration files in the target project, including:
     - [Rules](.cursor/rules/)
     - [Settings](.vscode/settings.json)
     - [Recommended extensions](.vscode/extensions.json)
     - [Launch config](.vscode/launch.json)
   - Configure the `PYTHONPATH` in a `.env` file
   - Validate the setup to ensure everything is properly installed

3. **Install recommended extensions**
   - Open your target project in Cursor
   - After running the script, open the Extensions panel (`Ctrl+Shift+X`)
   - Type `@recommended` in the search bar
   - Click 'Install All' to install the full suite of recommended extensions

4. **Restart Cursor** for all settings to take effect

5. There are some minor configurations you cannot set programatically. Find them in
   [editor-customization](#editor-customization)

### Alternative: Manual Setup

If you prefer to set up manually, follow these steps:

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

*More useful recommendations can be found in the following [link](https://docs.cursor.com/guides/languages/python).*

---

#### Debugging & Environment Variables

Set up run and debugging configurations. Notice that PyCharm by default will prepend the `PYTHONPATH` to the script execution. This is something we have to configure in Cursor.

- Create [.vscode/launch.json](./.vscode/launch.json)
- Create an `.env` file in the project's root with your environment variables:

    ```
    PYTHONPATH=path_to_your_project_root
    ```

- Now you can easily run or debug your code with Cursor.

---

#### Editor Customization

In case you want to use it as a baseline, this are my fine-tuned [settings.json](./.vscode/settings.json) file. Apart from these, tune the following settings:

- **View Optimization:** Go to the top menu, `View → Appearance → Align Panel → Left` to optimize your workspace layout. This will make the Terminal panel extend horizontally, as it does in PyCharm.

- **Large context:** For larger projects, go to `Cursor Settings → Features → Large context` and enable it for improved readability.

---

#### Cursor Rules

[Rules](https://docs.cursor.com/context/rules-for-ai) are key to customize the behavior of the underlying model. They need to be stored un `.cursor/rules`.

Here are the [rules](./.cursor/rules/python_rules.mcd) I'm currently using for Python.

You're all set! Cursor is now optimized to deliver a smooth, productive experience similar to PyCharm. Happy coding!
