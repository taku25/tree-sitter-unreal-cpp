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

; UPROPERTY, UFUNCTION などのマクロ自体を紫色 (keyword) にする
(uproperty_macro) @keyword
(ufunction_macro) @keyword
(uclass_macro) @keyword
(ustruct_macro) @keyword
(uenum_macro) @keyword
(unreal_body_macro) @keyword

; UCLASS() class MyActor の MyActor の部分を型名 (type) の色にする
(unreal_class_declaration
  name: (type_identifier) @type.definition)

; UPROPERTY(...) int32 Health の Health の部分をプロパティの色にする
(field_declaration
  (uproperty_macro)
  declarator: (field_identifier) @property)



; 新しく定義したノードに、特別なハイライトグループを割り当てる
(unreal_class_declaration body: (field_declaration_list (access_specifier) @constant.builtin))
(unreal_struct_declaration body: (field_declaration_list (access_specifier) @constant.builtin))

; Category="Value" のValueの部分は通常の文字列の色にする
(unreal_specifier
  key: (_)
  value: (string_literal) @string)

; END UNREAL ENGINE
