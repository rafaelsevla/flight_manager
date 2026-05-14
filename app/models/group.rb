class Group < ApplicationRecord
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  has_many :group_permissions, dependent: :destroy
  has_many :permissions, through: :group_permissions

  before_create :set_uuid

  private

  def set_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
