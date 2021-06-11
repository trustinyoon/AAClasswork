# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  long_url   :string           not null
#  short_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
  validates :user_id, presence: true
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true

  
end
