class Taco < ApplicationRecord
  def by_json
    {name: self.name, description: self.description}
  end
end
