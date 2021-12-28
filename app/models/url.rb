class Url < ApplicationRecord
  validates :long_url, presence: :true, format: { with: URI::regexp(%w[http https]) }
  validates :alias, uniqueness: { allow_blank: true }

  extend FriendlyId
  friendly_id :slug_name, use: :slugged

  def slug_name
    self.alias.blank? ? SecureRandom.hex(4).to_s : self.alias
  end
end
