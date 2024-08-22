# typed: strict
# frozen_string_literal: true

FrozenRecord::Base.backend = FrozenRecord::Backends::Yaml
FrozenRecord::Base.base_path = Rails.root.join("db", "frozen_records").to_s
