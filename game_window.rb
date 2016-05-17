require 'gosu'
require_relative 'calculator_controller'

class GameWindow < Gosu::Window
  def initialize
    super 640, 471
    self.caption = "Calculator"
    @background_image = Gosu::Image.new("assets/images/base.png", tileable: true)
    @font = Gosu::Font.new(20)
    @text = ""
    @write_text = true
    @controller = CalculatorController.new
  end

  def update
    if @write_text && @text.length < 20 && !@reset
      if Gosu::button_down? Gosu::Kb0 || (Gosu::button_down? Gosu::KbNumpad0)
        @text += "0"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/0.png", tileable: true)
      elsif Gosu::button_down? Gosu::Kb1 || (Gosu::button_down? Gosu::KbNumpad1)
        @text += "1"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/1.png", tileable: true)
      elsif Gosu::button_down? Gosu::Kb2 || (Gosu::button_down? Gosu::KbNumpad2)
        @text += "2"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/2.png", tileable: true)
      elsif Gosu::button_down? Gosu::Kb3 || (Gosu::button_down? Gosu::KbNumpad3)
        @text += "3"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/3.png", tileable: true)
      elsif Gosu::button_down? Gosu::Kb4 || (Gosu::button_down? Gosu::KbNumpad4)
        @text += "4"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/4.png", tileable: true)
      elsif Gosu::button_down? Gosu::Kb5 || (Gosu::button_down? Gosu::KbNumpad5)
        @text += "5"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/5.png", tileable: true)
      elsif Gosu::button_down? Gosu::Kb6 || (Gosu::button_down? Gosu::KbNumpad6)
        @text += "6"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/6.png", tileable: true)
      elsif Gosu::button_down? Gosu::Kb7 || (Gosu::button_down? Gosu::KbNumpad7)
        @text += "7"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/7.png", tileable: true)
      elsif Gosu::button_down? Gosu::Kb8 || (Gosu::button_down? Gosu::KbNumpad8)
        @text += "8"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/8.png", tileable: true)
      elsif Gosu::button_down? Gosu::Kb9 || (Gosu::button_down? Gosu::KbNumpad9)
        @text += "9"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/9.png", tileable: true)
      elsif Gosu::button_down? Gosu::KbNumpadAdd
        @text += "+"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/add.png", tileable: true)
      elsif Gosu::button_down? Gosu::KbNumpadDivide
        @text += "/"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/div.png", tileable: true)
      elsif Gosu::button_down? Gosu::KbNumpadMultiply
        @text += "*"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/mul.png", tileable: true)
      elsif Gosu::button_down? Gosu::KbNumpadSubtract
        @text += "-"
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/sub.png", tileable: true)
      elsif Gosu::button_down? Gosu::KbPeriod
        @text += "."
        @write_text = false
        @background_image = Gosu::Image.new("assets/images/point.png", tileable: true)
      elsif Gosu::button_down? Gosu::KbI
        if permit(1)
          @text += "INV"
          @controller.create_operation(@text)
          @text = @controller.execute.to_s
        else
          @text = "ERROR"
        end
        @reset = true
        @background_image = Gosu::Image.new("assets/images/inv.png", tileable: true)
      elsif Gosu::button_down? Gosu::KbS
        if permit(1)
          @text += "SQ"
          @controller.create_operation(@text)
          @text = @controller.execute.to_s
        else
          @text = "ERROR"
        end
        @reset = true
        @background_image = Gosu::Image.new("assets/images/sq.png", tileable: true)
      elsif Gosu::button_down? Gosu::KbR
        if permit(1)
          @text += "SQRT"
          @controller.create_operation(@text)
          @text = @controller.execute.to_s
        else
          @text = "ERROR"
        end
        @reset = true
        @background_image = Gosu::Image.new("assets/images/sqrt.png", tileable: true)
      elsif Gosu::button_down? Gosu::KbC
        @text = ""
        @controller.clear
        @background_image = Gosu::Image.new("assets/images/c.png", tileable: true)
      elsif Gosu::button_down? Gosu::KbEqual || (Gosu::button_down? Gosu::KbEnter)
        if permit
          @controller.create_operation(@text)
          @text = @controller.execute.to_s
        else
          @text = "ERROR"
        end
        @reset = true
        @background_image = Gosu::Image.new("assets/images/eq.png", tileable: true)
      else
        @background_image = Gosu::Image.new("assets/images/base.png", tileable: true)
      end
    elsif @text.length >= 20
      @text = "ERROR"
      @reset = true
      @background_image = Gosu::Image.new("assets/images/base.png", tileable: true)
    elsif @reset && (Gosu::button_down? Gosu::KbC)
      @text = ""
      @reset = false
      @background_image = Gosu::Image.new("assets/images/c.png", tileable: true)
    end
  end

  def draw
    @background_image.draw(0, 0, 0)
    if @text != "ERROR"
      @font.draw(@text, 460 - ((@text.length - 1) * 10), 130, 3, 1, 1, Gosu::Color::BLACK)
    else
      @font.draw(@text, 400, 130, 3, 1, 1, Gosu::Color::BLACK)
    end
  end

  def button_up(id)
    if Gosu::Button::KbC == id
      @reset = false
    end
    @write_text = true
  end

  def permit(operands = 2)
    return true if @text.empty?
    if operands == 2
      !(/[0-9]+[\.]?[0-9]*[+-\/*][0-9]+[\.]?[0-9]*/.match(@text).nil?)
    else
      !(/[0-9]+[\.]?[0-9]*/.match(@text).nil?)
    end
  end
end

window = GameWindow.new
window.show
