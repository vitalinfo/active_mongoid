require 'spec_helper'

describe ActiveMongoid::Associations::ActiveRecord::Builders do

  describe "#build_#\{name}" do

    context "when the relation is a has_one" do

      let(:player) do
        Player.new
      end

      let!(:person) do
        player.build_person
      end

      it "builds the document" do
        expect(player.person).to eq(person)
      end

      # it "sets the inverse" do
      #   expect(person.player).to eq(player)
      # end

      it "does not save the document" do
        expect(person).to_not be_persisted
      end

    end

    context "when the relation is a belongs to" do

      context "when the inverse is a has one" do

        let(:division) do
          Division.new
        end

        let!(:league) do
          division.build_league
        end

        it "builds the document" do
          expect(division.league).to eq(league)
        end

        xit "sets the inverse" do
          expect(league.division).to eq(division)
        end

        it "does not save the document" do
          expect(league).to_not be_persisted
        end
      end
    end


  end

end
