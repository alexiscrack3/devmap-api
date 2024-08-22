# frozen_string_literal: true

# == Schema Information
#
# Table name: steps
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  roadmap_id :bigint           not null
#
class Step < ApplicationRecord
  belongs_to :roadmap
end
