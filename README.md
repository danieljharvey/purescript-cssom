# Purescript CSSOM

The `CSSOM` is the CSS Object Model. It's like the DOM, but for Stylesheets etc, and reading/manipulating them, doing so which is the basis behind many CSS-in-JS libraries. This is a basic set of types and low-level FFI functions for doing this. For a better idea of how the CSSOM works - check out the [Mozilla CSSOM docs]( https://developer.mozilla.org/en-US/docs/Web/API/CSS_Object_Model). Tldr - inspecting what is there is quite nice, but new stuff has to be stuffed in as big strings.

For an example of this library in use - I am using it to create [Purescript Styles](https://github.com/danieljharvey/purescript-styles) - thus I have only implemented here what I need for that (styles and media queries so far). Please feel free to PR more parts if you find them useful, hopefully the patterns I have used are reasonably clear. Furthermore - I have put some higher level bits in there to make this stuff more usable - am still undecided about whether to bring that stuff into here and open to ideas if this is a thing anybody uses for anything.

Docs can be found on [Pursuit](https://pursuit.purescript.org/packages/purescript-cssom/0.0.2)
