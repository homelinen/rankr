require 'spec_helper'

describe Match do

  describe "competition outcome" do

    before(:each) do
      @match = FactoryGirl.create(:match)
    end

    it "has no winner" do
      @match.winner.should be_nil
    end

    it "has a clear winner" do
      FactoryGirl.create_list(:award, 3, :match => @match, :amount => rand(5))
      winner = FactoryGirl.create(:award, :match => @match, :amount => 10).username


      @match.winner.should eq([winner])
    end

    it "has a draw" do

      winners = ["graeme", "larry"]

      winners.each do |name|

        FactoryGirl.create_list(:award, 2, :match => @match, :amount => 2, :username => name)
      end

      @match.winner.should eq(winners)
    end
  end
end
