require_relative 'calculator'
class CalculatorController
  def initialize
    @calculator = Calculator.new
    @op = ''
  end

  def create_operation(op)
    @op = op
    operands = op.split(/[^0-9\.]/)
    operation = op.gsub(/[0-9\.]/, '')

    @calculator.add_operand(operands[0].to_f)
    @calculator.set_operation(operation) unless operation.empty?
    @calculator.add_operand(operands[1].to_f) unless operands[1].nil?
  end

  def execute
    if @op.empty?
      "NO DATA"
    else
      @calculator.execute
    end
  end

  def clear
    @calculator.clear
  end
end
