$("#comment-<%=@comment.id %>").fadeOut()
$("#comments a").text "Comments (<%= @post.comments.count %>)"
