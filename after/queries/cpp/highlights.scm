;; extends

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
(unreal_specifier (unreal_specifier_keyword) @variable.parameter)
(unreal_specifier (identifier) @variable.parameter) ; allow non-keyword identifiers as specifiers too

; key = "value" (direct)
(unreal_specifier
  key: (unreal_specifier_keyword) @variable.parameter
  value: (string_literal) @string)
(unreal_specifier
  key: (identifier) @variable.parameter
  value: (string_literal) @string)

; key = number / true / false / identifier
(unreal_specifier value: (number_literal) @number)
(unreal_specifier value: (true) @boolean)
(unreal_specifier value: (false) @boolean)
(unreal_specifier value: (identifier) @constant)

; meta=(DisplayName="...") and similar parenthesized assignments
(unreal_specifier
  key: (unreal_specifier_keyword) @property
  value: (parenthesized_expression
           (assignment_expression
             left: (identifier) @property
             right: (string_literal) @string)))
