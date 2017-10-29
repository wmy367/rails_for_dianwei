module CommentsHelper

    def curr_comment_user(comment)
        user = User.find(comment.user_id)
    end
end
