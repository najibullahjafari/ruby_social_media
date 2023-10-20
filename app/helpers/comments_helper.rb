module CommentsHelper
  def delete_comment(comment)
    return unless can? :destroy, comment

    button_to 'Delete', comment_path(comment), method: :delete, class: 'btn btn-danger'
  end
end