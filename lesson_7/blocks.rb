def m(call, &block)
  yield(call)
end

# l = lambda { |msg| p msg + "," + " " + "ya nihuya ne ponimayu"}

m("Hello World") { |msg| p msg + "," + " " + "ya nihuya ne ponimayu" }

