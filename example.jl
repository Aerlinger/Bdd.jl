module Spec
  export @wrapper, @before, @it

  type Example
    context::Expr
  end

  type SpecDefinitions
    description::String
    examples::Array{Example}
  end

  function add(example::Example)
  end

  macro before(exp)
    # Define a new before

    esc(exp)
  end

  # An alias
  macro before_each()
  end

  macro before_all()
  end

  macro it(exp)
    # Define a new example

    esc(exp)
  end

  macro wrapper(desc::String, ex::Expr)
    # define a new context:

    example = Spec.Example(ex)
    definition = Spec.SpecDefinitions(desc, [example])

    eval(Spec, ex)
  end
end

using Spec

@wrapper "A simple example" begin
  @before begin
    some_var = 90
  end

  @it begin
    another_var = 87
    some_var + another_var
  end
end

