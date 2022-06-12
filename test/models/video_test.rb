# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  visible     :boolean          default(FALSE)
#  duration    :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer          not null
#
require "test_helper"

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
