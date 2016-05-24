require_relative "operation"
class BinaryOperation < Operation
	attr_accessor :operand_1, :operand_2
	def add_operand (operand)
		if @operand_1.nil?  @operand_1 = operand
		else @operand_2 = operand
		end
	end

end
