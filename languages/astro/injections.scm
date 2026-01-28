(frontmatter
  (frontmatter_js_block) @injection.content
  (#set! injection.language "typescript"))

(attribute_interpolation
  (attribute_js_expr) @injection.content
  (#set! injection.language "typescript"))

(html_interpolation
  (permissible_text) @injection.content
  (#set! injection.language "typescript"))

(script_element
  (raw_text) @injection.content
  (#set! injection.language "typescript"))

(style_element
  (start_tag
    (attribute
      (attribute_name) @_scss_attr
      (quoted_attribute_value
        (attribute_value) @_scss_value)))
  (raw_text) @injection.content
  (#eq? @_scss_attr "lang")
  (#eq? @_scss_value "scss")
  (#set! injection.language "scss"))

(style_element
  (start_tag
    (attribute
      (attribute_name) @_less_attr
      (quoted_attribute_value
        (attribute_value) @_less_value)))
  (raw_text) @injection.content
  (#eq? @_less_attr "lang")
  (#eq? @_less_value "less")
  (#set! injection.language "less"))

(style_element
  (start_tag
    (attribute
      (attribute_name) @_css_attr
      (quoted_attribute_value
        (attribute_value) @_css_value)))
  (raw_text) @injection.content
  (#eq? @_css_attr "lang")
  (#eq? @_css_value "css")
  (#set! injection.language "css"))

(style_element
  (start_tag) @_start_tag
  (raw_text) @injection.content
  (#not-match? @_start_tag "lang=")
  (#set! injection.language "css"))
