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
