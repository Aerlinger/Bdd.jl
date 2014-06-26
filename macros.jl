function echo(arg)
  println("ECHO: $arg")
end

expr = :(echo("in expr"))
var  = echo("outside expr")

@which echo("in expr")


omg = :(z = 5)
wtf = :(z + 1)

macro lol(expr::Expr)
  esc(:(z + $expr))
end

macro wut(expr::Expr)
  esc(:(b + z + $expr))
end

res = quote
  $omg
  $wtf
  @lol begin
    a = 10
    z = 20
    # Returns 20
  end

  @wut begin
    b = 5
  end
end
macroexpand(res)

eval(res)


function f1(ex::Expr)
  println(ex.head)
  println(ex.args[1])
end

f1(:(sin(2)))

macro t1(ex)
    #apply(f1, :($ex))
    :($(expr(:quote,ex)))
end

r = @t1 sin(x)

x = 5
eval(r)


