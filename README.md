# tree-sitter-unreal-cpp

[](https://opensource.org/licenses/MIT)

A [Tree-sitter](https://tree-sitter.github.io/tree-sitter/) parser for Unreal Engine C++.

This parser is a fork of [tree-sitter-cpp](https://github.com/tree-sitter/tree-sitter-cpp) extended to accurately parse the major reflection macros used by the Unreal Header Tool (UHT), such as `UCLASS`, `UPROPERTY`, `UFUNCTION`, and more.

[English](./README.md) [日本語](./README_ja.md)  
[Original](./README.orig.md)

## ✨ Features

  * **Accurate Parsing of Unreal Engine Macros**: Recognizes `UCLASS`, `USTRUCT`, `UENUM`, `UPROPERTY`, `UFUNCTION`, `GENERATED_BODY`, and more as unique nodes.
  * **Highlighting for Special Keywords**: Identifies special keywords within macros like `Blueprintable`, `EditAnywhere`, and `Category`, allowing for distinct highlighting.
  * **API Macro Support**: Supports DLL export macros like `MYPROJECT_API`.
  * **Foundation for Advanced Tooling**: Generates an accurate syntax tree, enabling the development of future tools for completion, code navigation, and refactoring.

-----

## 🚀 Installation (Neovim & nvim-treesitter)

Use `nvim-treesitter` to install this custom parser as your `cpp` parser in Neovim.

### 1\. `lazy.nvim` Configuration

If you use `lazy.nvim`, add the following configuration.

```lua
-- e.g., in plugins/treesitter.lua

return {
  {
    "taku25/tree-sitter-unreal-cpp",
    opts={},
    config = function()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, 
    build = ":TSUpdate",
    opts = {
    --...
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
      callback = function()
        require('nvim-treesitter.parsers').cpp = {
          install_info = {
            url  = 'https://github.com/taku25/tree-sitter-unreal-cpp',
            revision  = '04ee0a7bbb303940e89e446e710192651ae14965',
          },
        }

      end})
      require("nvim-treesitter").setup(opts)
    end,
  },
}
```

### 2\. Install the Parser

Restart Neovim and run the following command:

```vim
:TSInstall cpp
```

### 3\. Verify the Installation

Open an Unreal Engine header file and run the `:InspectTree` command. If you see nodes like `unreal_class_declaration`, you're all set\!

-----

## 🎨 Highlighting

This parser only analyzes the syntax. To apply colors, you need to define highlights in a `queries/highlights.scm` file. Basic highlights are included in this repository, but you can customize them to match your color scheme.

**Example (`queries/highlights.scm`):**

```scheme
; Highlight macros like UPROPERTY, UFUNCTION as keywords
(uproperty_macro) @keyword
(ufunction_macro) @keyword

; Highlight special keywords like Blueprintable as built-in constants
(unreal_specifier_keyword) @constant.builtin
```

-----

## 🛠️ Ecosystem Integration

This parser is the core of the following suite of Neovim plugins for Unreal Engine development:

  * [`UBT.nvim`](https://www.google.com/search?q=%5Bhttps://github.com/taku25/UBT.nvim%5D\(https://github.com/taku25/UBT.nvim\)): A plugin to run the Unreal Build Tool asynchronously.
  * [`UEP.nvim`](https://www.google.com/search?q=%5Bhttps://github.com/taku25/UEP.nvim%5D\(https://github.com/taku25/UEP.nvim\)): A file management plugin for Unreal Engine projects.
  * [`UCM.nvim`](https://www.google.com/search?q=%5Bhttps://github.com/taku25/UCM.nvim%5D\(https://github.com/taku25/UCM.nvim\)): A module management tool for Unreal Engine.
  * [`ULG.nvim`](https://www.google.com/search?q=%5Bhttps://github.com/taku25/ULG.nvim%5D\(https://github.com/taku25/ULG.nvim\)): A log viewer plugin for Unreal Engine.
  * [`neo-tree-unl.nvim`](https://www.google.com/search?q=%5Bhttps://github.com/taku25/neo-tree-unl.nvim%5D\(https://github.com/taku25/neo-tree-unl.nvim\)): A specialized `neo-tree` source for Unreal Engine projects.

-----

## 🙏 Acknowledgements

This parser is based on the fantastic work of the [tree-sitter/tree-sitter-cpp](https://github.com/tree-sitter/tree-sitter-cpp) project. The original documentation can be found in [`README.orig.md`](https://www.google.com/search?q=./README.orig.md).

## 📄 License

[MIT](./LICENSE)
