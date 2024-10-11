# == Schema Information
#
# Table name: sub_sections
#
#  id         :bigint           not null, primary key
#  title      :string
#  section_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SubSection < ApplicationRecord
  belongs_to :section
end
