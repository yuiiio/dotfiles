return {
{
  "barreiroleo/callgraph.nvim",
  opts = {},
  keys = {
    { '<leader>ci', function() require("callgraph").run({ direction = "in" }) end,  desc = 'Callgraph: incoming calls' },
    { '<leader>co', function() require("callgraph").run({ direction = "out" }) end, desc = 'Callgraph: outgoing calls' },
    { '<leader>cm', function() require("callgraph").run({ direction = "mix" }) end, desc = 'Callgraph: mixed calls' },
  },
}
}
