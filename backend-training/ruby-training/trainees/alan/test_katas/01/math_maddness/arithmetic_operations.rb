
class ArithmeticOperations
    
    def self.add(left_operand, rigth_operand)
       left_operand +  rigth_operand
    end
    
    def self.subtraction(left_operand, rigth_operand)
        left_operand - rigth_operand
    end

    def self.multiply(left_operand, rigth_operand)
        left_operand * rigth_operand
    end

    def self.divide(left_operand, rigth_operand)
        return left_operand / rigth_operand unless rigth_operand == 0
        "A number can't be divided by zero"
    end
end

