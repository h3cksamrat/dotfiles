;; extends

(call_expression
    (identifier) @function_name (#eq? @function_name "sql")
    (template_string
      (string_fragment) @injection.content
      (#set! injection.content.type "sql")
    )
)

(
  (
   expression_statement
    (assignment_expression
      right: (template_string
        (string_fragment) @injection.content
        (#set! injection.language "sql")
      )
    )
  )
. (comment) @comment (#match? @comment "//sql")
)

;; Normal string (single or double quotes) with //sql comment
(
  (expression_statement
    (assignment_expression
      right: (string
               (string_fragment) @injection.content
               )
      (#set! injection.language "sql")
    )
  )
  . (comment) @comment
  (#match? @comment "//sql")
)


(call_expression
  (member_expression
    (identifier) @function.name (#match? @function.name "db|tx|t")
  )
  (arguments
    (template_string
      (string_fragment) @injection.content
    )
  )
  (#set! injection.language "sql")
)


(call_expression
  (member_expression
    (identifier) @function.name (#match? @function.name "db|tx|t")
  )
  (arguments
    (string
      (string_fragment) @injection.content
    )
  )
  (#set! injection.language "sql")
)
