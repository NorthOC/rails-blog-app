module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  class_methods do
    def public_count
      where.not(commenter: nil).count
    end
  end
end