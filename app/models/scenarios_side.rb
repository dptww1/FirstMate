class ScenariosSide < ActiveRecord::Base
  belongs_to :scenario
  belongs_to :side
end
