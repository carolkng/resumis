# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ($) ->
  "use strict"
  resumis =
    selectors:
      filters:
        all: "#all"
        categories: ".js-filter"
      nav:
        active: "active"
        current: ".nav li:has(a[href=\"" + window.location.pathname + "\"])"
      projectPanel: ".panel-project"

    states:
      selected: "btn-primary"
      unselected: "btn-default"

    registerProjectFilterEvents: ->
      $(resumis.selectors.filters.all).on "click", ->
        $(resumis.selectors.filters.categories).removeClass(resumis.states.selected).addClass resumis.states.unselected
        $(this).addClass resumis.states.selected
        $(resumis.selectors.projectPanel).show
          easing: "swing"
          duration: 400

        false

      $(resumis.selectors.filters.categories).on "click", ->
        filterClass = "." + $(this).attr("id")
        $(resumis.selectors.filters.all).removeClass(resumis.states.selected).addClass resumis.states.unselected
        $(resumis.selectors.filters.categories).removeClass(resumis.states.selected).addClass resumis.states.unselected
        $(resumis.selectors.projectPanel).not(filterClass).hide
          easing: "swing"
          duration: 400

        $(filterClass).show
          easing: "swing"
          duration: 400

        $(this).removeClass(resumis.states.unselected).addClass resumis.states.selected
        false

      return

    populateLatestProject: ->
      $lp = $("#latest-project")
      if $lp.length > 0
        $.get "/projects.json", (data) ->
          proj = data[0]
          $lp.find(".project-title a").text(proj.name).prop "href", "/projects/#project_" + proj.id
          $lp.find(".project-shortdesc").text proj.short_description
    init: ->
      # Highlight current nav item
      $(resumis.selectors.nav.current).addClass "active"
      resumis.registerProjectFilterEvents()
      resumis.populateLatestProject()

  resumis.init()
