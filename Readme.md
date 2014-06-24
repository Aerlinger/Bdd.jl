## BDD testing framework for Julia


### Syntax:
```julia
describe("Some spec") do
  @before do
    a = 5
  end

  @it begin
    expect(a, eq(5))
  end
end
```

### Mocking and Stubbing

You can stub out a function with the `stub` function:

```julia
  stub(:function_name, arg1, arg2, result, result2) do
    "return value"
  end
```

`mock` works the same way but ensures that the method gets called


```julia
describe("Some spec") do
  @before do

    mock(:some_function) do
      5
    end

  end

  @it begin
    expect(some_function(), eq(5))
  end
end
```

TODO: Work in progress
