---
---

$ = require 'jquery'
editor = require 'EpicEditor/epiceditor/js/epiceditor.min'

$(document).ready ->
  if $(".content").length
    
    # Add Bootstrap styling to tables
    $(".content table").addClass "table"