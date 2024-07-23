# == Schema Information
#
# Table name: roadmaps
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Roadmap < ApplicationRecord
end
