; extends
(call_expression
  function: (_) @_name
  (#match? @_name "\<\(sql\|tx\)\>")
  arguments: [
    (arguments
      (template_string) @injection.content)
    (template_string) @injection.content
  ]
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "sql"))
