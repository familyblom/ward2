$("body .container").append("<%= escape_javascript(render 'projects/modal', project: @project) %>")
$("#project-<%= @project.id %>").modal()
$('#project-<%= @project.id %>').on 'hidden.bs.modal', ->
  $(this).remove()
$(".gallery-item").on "click", ->
  $(this).closest(".media-items").find(".main-gallery-image").attr("src", $(this).attr("data-img-lg"))
  $(this).closest(".media-items").find(".high-res-image").attr("href", $(this).attr("data-img-original"))

