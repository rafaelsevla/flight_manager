class Permission < ApplicationRecord
  has_many :group_permissions, dependent: :destroy
  has_many :groups, through: :group_permissions

  validates :resource, :action, presence: true
  validates :action, inclusion: { in: %w[write read] }
end
