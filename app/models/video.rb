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

  before_create  :puts_description, if has_description?
  before_save :send_notification
  after_save :send_mail

  scope :has_duration, -> { where('durarion >= ?', 0) }

  def has_description?
    !description.nil? && !description.empty?
  end
  
  private

  def puts_description
    puts "Desciption: description"
  end

  def send_notification
    puts ">>>>> Nuevo video!!!!"
  end

  def send_mail
    puts ">>>>> Enviar correo!!!"
  end

  def custom_title
    erros.add(:title, 'No es posible usar ese título.') if title == '1234'
  end

end
