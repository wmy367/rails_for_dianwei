class Item < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates_presence_of :name,message:"物品名字必须提供"
    validates_presence_of :phone,message:"物主电话必须提供"
    validates_presence_of :user,message:"记录必须有记录人"
    # validates_presence_of :status,message:"物品状态必须有"
    validates_inclusion_of :status,in: ['新报修',"维修中","已修好","无法修复"],message: "状态描述不对"
end
