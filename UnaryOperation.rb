class UnaryOperation < Operation
	attr_accessor :operand

	def add_operand(operand)
		@operand = operand
	end
end