; Functions

(call_expression
  function: (qualified_identifier
    name: (identifier) @function))

(template_function
  name: (identifier) @function)

(template_method
  name: (field_identifier) @function)

(template_function
  name: (identifier) @function)

(function_declarator
  declarator: (qualified_identifier
    name: (identifier) @function))

(function_declarator
  declarator: (field_identifier) @function)

; Types

((namespace_identifier) @type
 (#match? @type "^[A-Z]"))

(auto) @type

; Constants

(this) @variable.builtin
(null "nullptr" @constant)

; Modules
(module_name
  (identifier) @module)

; Keywords

[
 "catch"
 "class"
 "co_await"
 "co_return"
 "co_yield"
 "constexpr"
 "constinit"
 "consteval"
 "delete"
 "explicit"
 "final"
 "friend"
 "mutable"
 "namespace"
 "noexcept"
 "new"
 "override"
 "private"
 "protected"
 "public"
 "template"
 "throw"
 "try"
 "typename"
 "using"
 "concept"
 "requires"
 "virtual"
 "import"
 "export"
 "module"
] @keyword

; Strings

(raw_string_literal) @string


; START UNREAL ENGINE 

; --- マクロ自体のハイライト ---
(uproperty_macro) @keyword
(ufunction_macro) @keyword
(uclass_macro) @keyword
(ustruct_macro) @keyword
(uenum_macro) @keyword
(unreal_body_macro) @keyword

; --- クラス名とプロパティ名のハイライト ---
(unreal_class_declaration name: (type_identifier) @type.definition)
(field_declaration (uproperty_macro) declarator: (field_identifier) @property)

; --- 指定子 (Specifiers) のハイライト ---

; 1. 単体の指定子 (Blueprintable, EditAnywhere など)
(unreal_specifier (unreal_specifier_keyword) @property)
(unreal_specifier (identifier) @property) ; タイプミスや未知の指定子用

; 2. キー・バリューペアの「キー」部分 (Category, meta など)
(unreal_specifier key: (_) @property)

; 3. キー・バリューペアの「バリュー」部分 ("Input" など)
(unreal_specifier value: (string_literal) @string)

; --- アクセス指定子 (public:, protected:) のハイライト ---

; メンバーのアクセス指定子 (public: など)
; "field_declaration_list" の中にある "access_specifier" を探す
(field_declaration_list (access_specifier) @keyword)

; 基底クラスの継承指定子 (: public など)
(base_class_clause (access_specifier) @keyword)

; END UNREAL ENGINE
