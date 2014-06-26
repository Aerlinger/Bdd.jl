module Spec
  export @describe, @before, @it, println

  type Example
    context::Expr
  end

  type ExampleGroup
    description::String
    #examples::Array{Example}
    examples::Array{Expr}
  end

  type SpecSuite
    example_groups::Array{ExampleGroup}
  end

  suite = SpecSuite([])

  push_describe!(example_group::ExampleGroup) = Base.push!(suite.example_groups, example_group)
  push!(example_group::ExampleGroup, example::Example) = Base.push!(suite.example_groups, example_group)

  println(suite::SpecSuite) = begin
    for example_group in suite.example_groups
      Base.println(example_group.description)
    end

  end

  macro before(ex::Expr)
    # Define a new before
    esc(
      :($(expr(:quote,ex)))
    )
  end

  # An alias
  macro before_each()
  end

  macro before_all()
  end

  macro it(ex::Expr)
    # Define a new example
    esc(
      quote
        $(expr(:quote,ex))

        #push!(lol.example_groups)
      end
    )
  end

  macro describe(desc::String, context::Expr)
    # define a new context:
    esc(
      quote
        ex = Spec.ExampleGroup($desc, [$context])

        push_describe!(ex)
        #example    = Spec.Example($ex)
        #context    = $context
        #definition = Spec.SpecDefinitions($desc, [example])
      end
    )
  end
end

using Spec

lol = Spec.suite


Spec.suite



#@describe "A simple example" begin
#   @before begin
#     before_var = 180
#   end

#   @it begin
#     it_var = 87
#     before_var + it_var
#   end
#end

#println(what)

#println(Spec.suite)


