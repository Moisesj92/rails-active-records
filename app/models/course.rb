# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Course < ApplicationRecord

  has_many :videos
  has_many :categories, through: :videos, source: :categories
  has_many :comments, as: :commentable

  enum status: [:draft, :published]

  def self.has_videos
    join(:videos)
  end

  def self.has_videos_with_duration
    join(:videos).where("videos.duration > 10")
  end

  def all_duration_videos
    videos.sum('vidoes.duration')
  end

  def all_comnents
    comments.count
  end

end
