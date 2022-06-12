# == Schema Information
#
# Table name: video_categories
#
#  id          :integer          not null, primary key
#  video_id    :integer          not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class VideoCategory < ApplicationRecord
  belongs_to :video
  belongs_to :category
end
