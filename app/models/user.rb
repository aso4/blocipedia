class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_create :default_user_role_standard
  # before_show :default_user_role_standard
  # before_index :default_user_role_standard

  has_many :wikis

  after_update :publicize_wikis_if_standard

  def standard?
    role == 'standard'
  end

  def premium?
    role == 'premium'
  end

  def admin?
    role == 'admin'
  end

  def publicize_wikis_if_standard
    if standard?
      wikis.each do |wiki|
        wiki.private = false
        wiki.save
      end
    end
  end

  private

  def default_user_role_standard
    self.role ||= 'standard'
  end
end
