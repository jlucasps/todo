class List < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :private

  # Validations
  validates :name, :presence => true, :allow_blank => false
  validates :user_id, :presence => true

  # Associations
  belongs_to :user
  has_many :favorites, :dependent => :destroy
  has_many :tasks, :dependent => :destroy

  # Scopes
  default_scope order("lists.created_at DESC")
  scope :public, where(:private => false)

  # Public methods
  def is_the_owner?(user)
    self.user == user
  end

end