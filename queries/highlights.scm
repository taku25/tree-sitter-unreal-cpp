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



; Unreal Engine macros

; GENERATED_BODY()
(unreal_body_macro "GENERATED_BODY" @function.macro)
(unreal_body_macro ["(" ")"] @punctuation.special)

; Macro heads as attributes (capture only the macro name token)
(uclass_macro     "UCLASS"     @attribute)
(ustruct_macro    "USTRUCT"    @attribute)
(uenum_macro      "UENUM"      @attribute)
(uproperty_macro  "UPROPERTY"  @attribute)
(ufunction_macro  "UFUNCTION"  @attribute)

; Parentheses of macros
(uclass_macro     ["(" ")"] @punctuation.special)
(ustruct_macro    ["(" ")"] @punctuation.special)
(uenum_macro      ["(" ")"] @punctuation.special)
(uproperty_macro  ["(" ")"] @punctuation.special)
(ufunction_macro  ["(" ")"] @punctuation.special)

; Unreal API specifier (e.g. MYPROJECT_API)
(unreal_api_specifier (identifier) @type.qualifier)

; Unreal specifiers
; `Blueprintable` のような単体の指定子を @property としてハイライトします。
; 汎用的なC++のルールに負けないよう、priorityを設定します。
((unreal_specifier (unreal_specifier_keyword) @property)
 (#set! "priority" 101))
((unreal_specifier (identifier) @property)
 (#set! "priority" 101))

; key = "value" (direct)
; `Category = "Config"` の `Category` 部分を @property としてハイライトします。
((unreal_specifier
  key: (unreal_specifier_keyword) @property
  value: (string_literal) @string)
 (#set! "priority" 101))
((unreal_specifier
  key: (identifier) @property
  value: (string_literal) @string)
 (#set! "priority" 101))

; key = number / true / false / identifier
(unreal_specifier value: (number_literal) @number)
(unreal_specifier value: (true) @boolean)
(unreal_specifier value: (false) @boolean)
(unreal_specifier value: (identifier) @constant)

; meta=(DisplayName="...") and similar parenthesized assignments
; このセクションは既に @property を使っているので、そのままでOKです。
(unreal_specifier
  key: (unreal_specifier_keyword) @property
  value: (parenthesized_expression
           (assignment_expression
             left: (identifier) @property
             right: (string_literal) @string)))
