# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  title      :string
#  visible    :boolean          default(FALSE)
#  duration   :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer          not null
#
class Video < ApplicationRecord

  belongs_to :course

  validates :title, presence: true, message: 'El título es requerido.'
  validates :title, uniqueness: true
  validates :title, length: { maximus: 200, minimun: 2 }

  validate :custome_title
  
  private

  def custom_title
    erros.add(:title, 'No es posible usar ese título.') if title == '1234'
  end

end
