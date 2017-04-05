class DynamicDefineMethod
  # dynamic define DynamicDefineMethod#hello
  define_method :hello do |word|
    puts "Hello #{ word } !!"
  end

  # this is a wrong example
  define_method :xhello_with_block do |word|
    begin
      puts "Hello #{word} !!"
      yield
    rescue LocalJumpError => e
      puts 'ERROR!!'
      puts e.message
      puts e.reason
    end
  end
end

DynamicDefineMethod.new.hello('HOGE')
DynamicDefineMethod.new.xhello_with_block('HOGE') do
  puts 'block execute!!'
end # -> LocalJumpError!!
