require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #let(:user) { User.new(name: 'York') }
  describe User do
      it { should validate_presence_of(:name) }
      #it { should validate_uniqueness_of(:name) }

      let(:York) {User.new(name: 'York')}
      it "should find user by name" do
        expect(User.find_by_credentials('York')).to eq :York
      end 
  end
end
