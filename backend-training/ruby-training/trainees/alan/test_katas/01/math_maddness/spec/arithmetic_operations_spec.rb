require 'rspec/autorun'
require '../arithmetic_operations.rb'

describe ArithmeticOperations do
    describe ".add" do
        it "should return the sum of the two numbers given" do
             calculus = ArithmeticOperations.add(12, 4)
            expect(calculus).to eq(16)
        end
    end

    describe ".subtraction" do
        it "should return the subtraction of the two numbers given" do
            calculus = ArithmeticOperations.subtraction(15, 5)
            expect(calculus).to eq(10)
        end
    end

    describe ".multiply" do
        it "should return the product of the two numbers given" do
            calculus = ArithmeticOperations.multiply(8, 6)
            expect(calculus).to eq(48)
        end
    end

    describe ".division" do
        it "should return the division of the two numbers given" do
            calculus = ArithmeticOperations.divide(16, 4)
            expect(calculus).to eq(4)
        end

        it "should return a error message that a number can't be divided by zero" do
            calculus = ArithmeticOperations.divide(12, 0)
            expect(calculus).to eq("A number can't be divided by zero")
        end
    end
end

