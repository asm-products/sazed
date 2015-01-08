---
---

repo = "{{site.repo}}"

$ = require 'jquery'
# TODO: Load Marked from Github or elsewhere
marked = require 'marked'
EpicEditor = require 'EpicEditor/src/editor'

editor = new EpicEditor
  container: 'editor'
  parser: marked,
  # TODO: Figure out how to use the System path translater
  # basePath: System.translate 'EpicEditor/epiceditor'
  basePath: '/js/lib/github/OscarGodson/EpicEditor@0.2.3/epiceditor',
  localStorageName: 'sazed:editor',
  file:
    autosave: false,
  theme:
    editor: '/themes/editor/epic-light.css',
  autogrow: true

editor.load ->
  console.log "Loaded Editor"

#console.log editor

$(document).ready ->
  if $(".content").length
    
    # Add Bootstrap styling to tables
    $(".content table").addClass "table"

module.exports = {

}