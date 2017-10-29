class User < ApplicationRecord
    has_many :items
    has_many :comments

    mount_uploader :avatar,AvatarUploader
    attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
    after_update :crop_avatar
    before_save { self.email = email.downcase }

    validates :name,length:{maximum: 50 },uniqueness:{case_sensitive:false}
    validates_presence_of :name,:message => "名字不能为空"

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,format:{with:VALID_EMAIL_REGEX},uniqueness:{case_sensitive:false}
    validates_presence_of :email,message: '邮箱不能为空'

    has_secure_password
    validates :password,length:{minimum:6,too_short: '密码太短'}
    validates_presence_of :password,message: "密码不能为空" ,if: :password
    validates_presence_of :password_confirmation,message: "密码验证不能为空",if: :password_confirmation


    VALID_SCH_REGEX = /20[0-9]{2}1120[1-4][0-9]{2}/
    validates :school_serial,presence: true ,length: {in: 11..12 },uniqueness: true,format:{with:VALID_SCH_REGEX}
    validates :phone,length:{maximum: 24}

    validates :gender,presence: true

    before_create :create_remember_token

    def crop_avatar
        avatar.recreate_versions! if crop_x.present?
    end

    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    private
        def create_remember_token
            self.remember_token = User.encrypt(User.new_remember_token)
        end
end
