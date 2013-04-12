require 'spec_helper'

describe Tournament do

  before(:each) do
    @tournament = FactoryGirl.create :tournament
  end

  it "should initially have no participants" do
    @tournament.participants.length.should eq(0)
  end

  describe "with multiple participants" do

    before(:each) do

      @match = FactoryGirl.create(:match, :tournament => @tournament)
    end

    it "should have one participant" do
      FactoryGirl.create(:award, :match => @match, :username => "richardnixon")
      @tournament.participants.length.should eq(1)
    end

    it "should not double up duplicate names, even across multiple matches" do

      matches = FactoryGirl.create_list(:match, 2, :tournament => @tournament)

      num = 10

      num.times do |i|
        
        # Put the first half in match 1
        if i < num / 2
          FactoryGirl.create(:award, :match => matches[0], :username => 'richardnixon')
        
        # And the rest in match 2
        else
          FactoryGirl.create(:award, :match => matches[1], :username => 'richardnixon')
        end
      end

      # No matter how many awards are added, only one should be counted
      @tournament.participants.length.should eq(1)
    end

    describe "with results" do

      it "should have no winners with no awards" do
        @tournament.results.should eq([])
      end

      it "should give a winning point to the highest awarded player" do
        FactoryGirl.create(:award, :match => @match, :username => "richardnixon")

        @tournament.results[0].should eq ["richardnixon", 1]
      end

      it "should show winners across multiple matches" do
        matches = FactoryGirl.create_list(:match, 2, :tournament => @tournament)

        matches.each do |match|
          FactoryGirl.create(:award, :match => match)
        end

        @tournament.results.count.should eq(2)
      end

      it "should sum up wins across matches" do

        num = 10
        matches = FactoryGirl.create_list(:match, num, :tournament => @tournament)


        matches.each do |match|
          FactoryGirl.create(:award, :match => match, :username => "richardnixon")
        end

        @tournament.results[0][1].should eq(num)
      end
    end
  end
end
