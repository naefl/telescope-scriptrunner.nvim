local builtins = require'telescope._extensions.builtins'

return require'telescope'.register_extension{
  exports = {
    list = builtins.list,
  },
}
