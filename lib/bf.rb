require 'English'

# BrainFuck interpreter.
class Bf
  METHODS = {
    '>' => :right,
    '<' => :left,
    '+' => :increment,
    '-' => :decrement,
    '.' => :output,
    ',' => :input,
    '[' => :jump,
    ']' => :jump_back,
  }

  def run(user_input)
    init
    code = user_input.tr('^' + valid_commands.join, '')
    read(code[@ip].chr) while @ip < code.size
  end

  private

  def init
    @ip = 0
    @pointer = 0
    @cells = Array.new(30_000, 0)
    @jump_ip_stack = []
    @jump = nil
  end

  def valid_commands
    METHODS.keys
  end

  def read(command)
    method = METHODS[command]
    __send__(method) if method =~ /^jump/ || !(method =~ /^jump/) && !@jump
    @ip += 1
  end

  def right
    @pointer += 1
  end

  def left
    @pointer -= 1
  end

  def increment
    @cells[@pointer] += 1
  end

  def decrement
    @cells[@pointer] -= 1
  end

  def output
    print @cells[@pointer].chr
  end

  def input
    @cells[@pointer] = $stdin.getc
  end

  def jump
    @jump_ip_stack << @ip - 1
    return if @jump
    @jump = @jump_ip_stack.size if @cells[@pointer] == 0
  end

  def jump_back
    @jump = nil if @jump == @jump_ip_stack.size
    ip = @jump_ip_stack.pop
    @ip = ip if @cells[@pointer] != 0
  end
end
