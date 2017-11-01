class Comment < ApplicationRecord
    belongs_to :items
    belongs_to :users
    
    validates_presence_of :content,message: "评论内容不能为空"
    validates_length_of :content,maximum: 2048,minimum: 10,too_long: '评论不能太长',too_short: '评论不能太短'
end
