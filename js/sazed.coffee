---
---

System.import 'jquery', ($)->

  System.import 'masonry'

  $(document).ready ->
    if $(".content").length
      
      # Add Bootstrap styling to tables
      $(".content table").addClass "table"
      
      # FitVids
      $(".content").fitVids()
    if $(".home-categories").length
      $(".home-categories").masonry
        columnWidth: ".col"
        itemSelector: ".col"
        transitionDuration: 0