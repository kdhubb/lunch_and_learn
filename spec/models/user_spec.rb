require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do 
    it { should validate_uniqueness_of :email }
  end
end
