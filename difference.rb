require_relative "binary_operation"
class Subtraction < BinaryOperation
	def execute
		@result = @operand_1 - @operand_2
	end
end