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

  #validates son metodos predefinidos por ruby
  validates :title, presence: true
  validates :title, uniqueness: true
  

  #El metodo para saber si un elemento es valido o no para persistirse es 
  #elemento.valid?
  
  #para ver los errores elemento.errors
  #para mas detalles elemento.errors.message


  private

  def send_email
    pusts ">>>>> Send Email"
  end

  daniela noguera

end
