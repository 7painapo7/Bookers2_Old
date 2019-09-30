class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 	devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
    attachment :profile_image
    has_many :books, dependent: :destroy
    # コメント機能を利用する際のアソシエーション
    has_many :post_comments, dependent: :destroy

    validates :name, presence: true, length: { minimum: 2, maximum: 20 }
    validates :introduction, length: { maximum: 50 }

	# deviseでemailを不必要にする
	def email_required?
	false
	end
	def email_changed?
	false
	end
end
