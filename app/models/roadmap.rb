# frozen_string_literal: true

# == Schema Information
#
# Table name: roadmaps
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#
class Roadmap < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
