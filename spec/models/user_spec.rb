require 'spec_helper'

describe User do

  before(:each) do
    @user = FactoryGirl.build :user
  end

  describe "username" do

    it { should validate_uniqueness_of(:username).case_insensitive  }
    it { should validate_presence_of(:username) }

    describe "valid" do
      it { @user.should allow_value("calumgilchrist").for(:username) }
      it { @user.should allow_value("calumgilchrist67").for(:username) }
      it { @user.should allow_value("6calumgilchrist").for(:username) }
      it { @user.should allow_value("CaLuMGiLcHriST").for(:username) }
    end

    describe "invalid" do
      before(:all) do
        @username = ["calum", "gilchrist"]
      end

      it { @user.should_not allow_value(@username.join(' ')).for(:username) }
      it { @user.should_not allow_value(@username.join('-')).for(:username) }
      it { @user.should_not allow_value(@username.join('_')).for(:username) }
      it { @user.should_not allow_value("").for(:username) }
    end
  end
end
