class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true

  before_create :default_wiki_to_public

  private

  def default_wiki_to_public
    self.private ||= false
  end
end
