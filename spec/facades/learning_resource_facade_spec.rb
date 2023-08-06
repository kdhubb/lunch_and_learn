require "rails_helper" 

RSpec.describe LearningResourceFacade do 
  describe "instance methods" do 
    it "#learning_resource_by_country" do
      params = { country: "Laos"}
      learning_resource = LearningResourceFacade.new(params).learning_resource_by_country

      require 'pry'; binding.pry
    end
  end
end