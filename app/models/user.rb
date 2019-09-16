class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 	devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
    # バリデーションチェック
	# validates :name, presence: true, length: { in: 2..20 }
	# validates :introduction, presence: true
	# validates :profile_image_id, presence: true
end
