# tree-sitter-unreal-cpp

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Unreal Engine C++向けの [Tree-sitter](https://tree-sitter.github.io/tree-sitter/) パーサーです。

このパーサーは、[tree-sitter-cpp](https://github.com/tree-sitter/tree-sitter-cpp) をフォークし、Unreal Engineのヘッダーツール（UHT）が使用する主要なリフレクションマクロ (`UCLASS`, `UPROPERTY`, `UFUNCTION` など) を正確に解析できるように拡張したものです。

[English](./README.md) [日本語](./README_ja.md)  
[Original](./README.orig.md)

## ✨ 特徴

* **Unreal Engineマクロの正確な解析**: `UCLASS`, `USTRUCT`, `UENUM`, `UPROPERTY`, `UFUNCTION`, `GENERATED_BODY` などを固有のノードとして認識します。
* **専用キーワードのハイライト**: `Blueprintable`, `EditAnywhere`, `Category` のようなマクロ内の特別なキーワードを識別し、個別のハイライトを可能にします。
* **APIマクロのサポート**: `MYPROJECT_API` のようなDLLエクスポートマクロに対応しています。
* **高度なツール連携の基盤**: 正確な構文木を生成することで、補完、コードナビゲーション、リファクタリングなど、将来的な高機能ツールの開発を可能にします。

---

## 🚀 インストール方法 (Neovim & nvim-treesitter)

`nvim-treesitter` を利用して、このカスタムパーサーを `cpp` パーサーとしてNeovimにインストールします。

### 1. `lazy.nvim` の設定

`lazy.nvim` をお使いの場合、以下のように設定を追加してください。

```lua
-- plugins/treesitter.lua など

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    -- ensure_installed から "cpp" を削除、または含めないようにする
    ensure_installed = { "c", "lua", "vim" },

    -- ... 他の設定 ...

    parsers = {
      cpp = {
        install_info = {
          -- 【重要】あなたのリポジトリのURLに書き換えてください
          url = "[https://github.com/taku25/tree-sitter-unreal-cpp](https://github.com/taku25/tree-sitter-unreal-cpp)", 
          files = {"src/parser.c", "src/scanner.cc"},
          branch = "main", -- または master
        },
        filetype = "cpp",
      },
    },
  },
}
```

### 2. パーサーのインストール

Neovimを再起動し、以下のコマンドを実行してください。

```vim
:TSInstall cpp
```

### 3. 動作確認

Unreal Engineのヘッダーファイルを開き、`:InspectTree` コマンドで `unreal_class_declaration` などのノードが表示されれば成功です。

---

## 🎨 ハイライト設定

このパーサーは構文を解析するだけです。実際に色を付けるには、`queries/highlights.scm` ファイルでハイライトを定義する必要があります。基本的なハイライトはこのリポジトリに含まれていますが、お使いのカラーテーマに合わせてカスタマイズすることもできます。

**例 (`queries/highlights.scm`):**
```scheme
; UPROPERTY, UFUNCTION などのマクロ自体をキーワードとしてハイライト
(uproperty_macro) @keyword
(ufunction_macro) @keyword

; Blueprintable などの特別なキーワードを定数としてハイライト
(unreal_specifier_keyword) @constant.builtin
```

---

## 🛠️ エコシステム連携

このパーサーは、以下のUnreal Engine開発支援Neovimプラグイン群の中核を担っています。

* [`UBT.nvim`](https://github.com/taku25/UBT.nvim): Unreal Build Toolを非同期で起動するプラグイン。
* [`UEP.nvim`](https://github.com/taku25/UEP.nvim): Unreal Engineプロジェクトのファイル管理プラグイン。
* [`UCM.nvim`](https://github.com/taku25/UCM.nvim): Unreal Engineのモジュール管理ツール。
* [`ULG.nvim`](https://github.com/taku25/ULG.nvim): Unreal Engineのログビューアプラグイン。
* [`neo-tree-unl.nvim`](https://github.com/taku25/neo-tree-unl.nvim): Unreal Engineプロジェクトに特化した`neo-tree`ソース。

---

## 🙏謝辞 (Acknowledgements)

このパーサーは [tree-sitter/tree-sitter-cpp](https://github.com/tree-sitter/tree-sitter-cpp) の素晴らしい成果を元に作成されています。オリジナルのドキュメントは [`README.orig.md`](./README.orig.md) を参照してください。

## 📄 ライセンス

[MIT](./LICENSE)
